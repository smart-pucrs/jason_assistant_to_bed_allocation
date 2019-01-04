package env;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import cartago.*;

public class AssistantArtifact extends Artifact {

	private static Logger logger = Logger.getLogger(AssistantArtifact.class.getName());

	void init() {
		logger.info("Assistant Artifact has been created!");
		readJson();
	}

	public synchronized String execCommand(final String commandLine) throws IOException {
		boolean success = false;
		String result;
		Process p;
		BufferedReader input;
		StringBuffer cmdOut = new StringBuffer();
		String lineOut = null;
		int numberOfOutline = 0;
		try {
			p = Runtime.getRuntime().exec(commandLine);
			input = new BufferedReader(new InputStreamReader(p.getInputStream()));
			while ((lineOut = input.readLine()) != null) {
				if (numberOfOutline > 0) {
					cmdOut.append("\n");
				}
				cmdOut.append(lineOut);
				numberOfOutline++;
			}
			result = cmdOut.toString();
			success = true;
			input.close();
		} catch (IOException e) {
			result = String.format("Falha ao executar comando %s. Erro: %s", commandLine, e.toString());
		}
		// Se não executou com sucesso, lança a falha
		if (!success) {
			throw new IOException(result);
		}
		return result;
	}

	public void readJson() {
		JSONParser parser = new JSONParser();
		File currentDir = new File(".");
		String path = currentDir.getAbsolutePath();
		try {
			Object obj = parser.parse(new FileReader(path + "//files//generate.json"));
			System.out.printf("****** FileReader: " + path + "//files//generate.json");

			JSONObject jsonObject = (JSONObject) obj;
			JSONObject objFacilities = (JSONObject) jsonObject.get("facilities");
			JSONObject objWells = (JSONObject) objFacilities.get("wells");

			defineObsProperty("conf_baseEfficiencyMin", objWells.get("baseEfficiencyMin"));
			defineObsProperty("conf_baseEfficiencyMax", objWells.get("baseEfficiencyMax"));
			defineObsProperty("conf_efficiencyIncreaseMin", objWells.get("efficiencyIncreaseMin"));
			defineObsProperty("conf_efficiencyIncreaseMax", objWells.get("efficiencyIncreaseMax"));
			defineObsProperty("conf_baseIntegrityMin", objWells.get("baseIntegrityMin"));
			defineObsProperty("conf_baseIntegrityMax", objWells.get("baseIntegrityMax"));
			defineObsProperty("conf_costFactor", objWells.get("costFactor"));

			StringBuilder relatorio = new StringBuilder();
			StringBuilder problema = new StringBuilder();
			StringBuilder plano = new StringBuilder();
			relatorio.append(path + "//files//relatorio");
			problema.append(path + "//files//fileProblema.pddl");
			plano.append(path + "//files//filePlano.pddl");

			defineObsProperty("relatorio", relatorio.toString());
			defineObsProperty("problema", problema.toString());
			defineObsProperty("plano", plano.toString());

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@OPERATION
	public void readLatex(String relatorio) {
		try {
			FileReader arq = new FileReader(relatorio + ".tex");
			BufferedReader lerArq = new BufferedReader(arq);
			String retorno = "";
			String linha = lerArq.readLine(); // lê a primeira linha
			// a variável "linha" recebe o valor "null" quando o processo
			// de repetição atingir o final do arquivo texto

			StringBuilder texto = new StringBuilder();
			texto.append(linha);

			String successful = "{Successful Plans}";
			String failed = "{Failed Plans}";
			String erro = "";
			String reparo = "";
			String tipo = "";
			List<String> arrayReparos = new ArrayList<String>();

			while (linha != null) {
				linha = lerArq.readLine(); // lê da segunda até a última linha
				texto.append("\n");
				texto.append(linha);
			}
			arq.close();

			if (texto.toString().contains(successful)) {
				retorno = "success";
			}
			if (texto.toString().contains(failed)) {				
				if(texto.toString().contains("Plan failed to execute")) {
					retorno = "fail";
					tipo = "execution";
					System.out.printf("Falha na execução do plano\n\n\n\n\n\n\n");
					if(texto.toString().contains("> Plan failed because of unsatisfied precondition in:\\")) {
						System.out.printf("contains(\"> Plan failed because of unsatisfied precondition\n\n");
						erro = texto.toString().substring(texto.indexOf("> Plan failed because of unsatisfied precondition in:\\"), texto.indexOf("Plan failed to execute"));
						System.out.printf("Erro: %s\n\n", erro);
						erro = erro.substring(erro.indexOf("{(")+1, erro.indexOf(")}")+1);
						System.out.printf("Erro Final: %s\n\n", erro);
					}
					if(texto.toString().contains("subsection{Plan Repair Advice}")) {
						System.out.printf("contains(subsection{Plan Repair Advice}\n\n");
						reparo = texto.toString().substring(texto.indexOf("subsection{Plan Repair Advice}"), texto.indexOf("subsection{Gantt Chart}"));
						System.out.printf("reparo: %s\n\n", reparo);
						if(texto.toString().contains("begin{itemize}")) {
							System.out.printf("contains(begin{itemize}\n\n");
							reparo = reparo.substring(reparo.indexOf("begin{itemize}")+14, reparo.indexOf("end{itemize}"));
							System.out.printf("reparo: %s\n\n", reparo);
							String arrayErrosGoals[] = reparo.split("item Set");
							System.out.printf("Passou do split\n\n");
							for (int i = 1; i < arrayErrosGoals.length; i++) {
								System.out.printf("arrayErrosGoals %s\n", arrayErrosGoals[i]);
								arrayReparos.add(arrayErrosGoals[i].substring(arrayErrosGoals[i].indexOf("{(")+1, arrayErrosGoals[i].indexOf(")}")+1));
							}
						} else {
							System.out.printf("Not contains(begin{itemize}\n\n");
							reparo = reparo.substring(reparo.indexOf("begin{enumerate}"), reparo.indexOf("end{enumerate}"));
							System.out.printf("reparo: %s\n\n", reparo);
							reparo = reparo.substring(reparo.indexOf("{(")+1, reparo.indexOf(")}")+1);
							arrayReparos.add(reparo);
							System.out.printf("%% reparo %s\n", reparo);
						}						
					}
				}
				if(texto.toString().contains("Goal not satisfied")) {
					retorno = "failGoal";
					tipo = "goal";
					System.out.printf("Objetivo não satisfeito\n\n\n\n\n\n");
					if(texto.toString().contains("subsection{Plan Repair Advice}")) {
						reparo = texto.toString().substring(texto.indexOf("subsection{Plan Repair Advice}"), texto.indexOf("subsection{Gantt Chart}"));
						if(texto.toString().contains("begin{itemize}")) {
							reparo = reparo.substring(reparo.indexOf("begin{itemize}")+14, reparo.indexOf("end{itemize}"));
							String arrayErrosGoals[] = reparo.split("item Set");
							for (int i = 1; i < arrayErrosGoals.length; i++) {
								System.out.printf("arrayErrosGoals %s\n", arrayErrosGoals[i]);
								arrayReparos.add(arrayErrosGoals[i].substring(arrayErrosGoals[i].indexOf("{(")+1, arrayErrosGoals[i].indexOf(")}")+1));
							}
						} else {
							reparo = reparo.substring(reparo.indexOf("begin{enumerate}"), reparo.indexOf("end{enumerate}"));
							reparo = reparo.substring(reparo.indexOf("{(")+1, reparo.indexOf(")}")+1);
							arrayReparos.add(reparo);
							System.out.printf("%% reparo %s\n", reparo);
						}						
					}
				}				
			}
			defineObsProperty("erro", erro);
			defineObsProperty("reparo", arrayReparos);
			defineObsProperty("retornovalidador", retorno);
			defineObsProperty("tipo", tipo);
		} catch (IOException e) {
			System.err.printf("Erro na abertura do arquivo: %s.\n", e.getMessage());
		}
	}

	@OPERATION
	void registrar(String nome) {
		System.out.printf("****** agente " + nome + " Registrado no artefato ****** \n");
	}

	@OPERATION
	void rodarValidador(String relatorio, String problema, String plano) throws IOException {
		File currentDir = new File(".");
		String path = currentDir.getAbsolutePath();
		StringBuilder comando = new StringBuilder();
		StringBuilder validador = new StringBuilder();
		StringBuilder dominio = new StringBuilder();
		validador.append(path + "//validador//VAL-master/validate");
		dominio.append(path + "//files//hospital.pddl");
		comando.append(validador + " -l -f " + relatorio + " -v " + dominio + " " + problema + " " + plano);
		this.execCommand(comando.toString());
		System.out.printf("****** comando: " + validador + " -l -f " + relatorio + " -v " + dominio + " " + problema
				+ " " + plano);
	}
	
	@OPERATION
	void retornoChatbot(String resultado, String tipo, String erro, String retorno,  List<String> reparo) {
		File currentDir = new File(".");
		String path = currentDir.getAbsolutePath();
		System.out.printf("resultado: %s\n", resultado);
		System.out.printf("tipo: %s\n", tipo);
		System.out.printf("erro: %s\n", erro);
		System.out.printf("retorno: %s\n", retorno);
		System.out.printf("reparo: %s\n", reparo);
		//Cria um Objeto JSON
        JSONObject jsonObject = new JSONObject();
         
        FileWriter writeFile = null;
         
        //Armazena dados em um Objeto JSON
        jsonObject.put("resultado", resultado);
        jsonObject.put("tipo", tipo);
        jsonObject.put("erro", erro);
        jsonObject.put("retorno", retorno);
        jsonObject.put("reparo", reparo);
         
        try{
            writeFile = new FileWriter(path + "//files//saida.json");
            //Escreve no arquivo conteudo do Objeto JSON
            writeFile.write(jsonObject.toJSONString());
            writeFile.close();
        }
        catch(IOException e){
            e.printStackTrace();
        }
         
        //Imprimne na Tela o Objeto JSON para vizualização
        System.out.println(jsonObject);
        System.exit(0);
	}

}
