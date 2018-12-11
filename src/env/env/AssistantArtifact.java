package env;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.logging.Logger;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import cartago.*;

public class AssistantArtifact extends Artifact {
	

	private static Logger logger = Logger.getLogger(AssistantArtifact.class.getName());
	
	void init(){
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
	
	public void readJson(){		
		JSONParser parser = new JSONParser();		
		File currentDir = new File(".");
		String path = currentDir.getAbsolutePath();		
		try {			
			Object obj = parser.parse(new FileReader(path+"//files//generate.json"));
			System.out.printf("****** FileReader: "+ path+"//files//generate.json");

			JSONObject jsonObject 		= (JSONObject) obj;			
			JSONObject objFacilities 	= (JSONObject) jsonObject.get("facilities");
			JSONObject objWells 		= (JSONObject) objFacilities.get("wells");
						
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
			relatorio.append(path + "//files//relatorio" + "problem1");
			problema.append(path + "//files//problem1.pddl");
			plano.append(path + "//files//problem1_plan.pddl");
			
			defineObsProperty("relatorio", relatorio.toString());
			defineObsProperty("problema", problema.toString());
			defineObsProperty("plano", plano.toString());
			
		} catch (Exception e) {
				e.printStackTrace();
		}
	}
	
	@OPERATION
	void registrar(String nome) {
		System.out.printf("****** agente "+ nome +" Registrado no artefato ****** \n");
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
		System.out.printf("****** comando: "+ validador + " -l -f " + relatorio + " -v " + dominio + " " + problema + " " + plano);
	}

}