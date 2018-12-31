// Agent sample_agent in project assistant

/* Initial beliefs and rules */

/* Initial goals */

!start.

/* Plans */

+runValidator
	: true
<-
	!validarPlano
	.

+retornovalidador(Ret)
	: (Ret == "fail") & erro(Erro) & tipo(Tipo)
<-
	.print("================ Retorno do Validador: Há falhas no plano \n Erro: ", Erro);
	retornoChatbot(Ret,Tipo,Erro,"O seu plano de alocação de leitos possui falhas.");
	.
	
+retornovalidador(Ret)
	: (Ret == "success") & erro(Erro)
<-
	.print("================ Retorno do Validador: Plano válido");
	retornoChatbot(Ret,"",Erro,"O seu plano de alocação de leitos não possui nenhuma falha.");
	.
	
+!start 
	: true 
<- 
	.print("Assistant enabled.");
	!registrar.


+!registrar
	: .my_name(Nome)
<- 
	.print("### Registrar Nome: ", Nome)
	registrar(Nome);
	!validarPlano;
	.
	
+!validarPlano
	: relatorio(Relatorio) & problema(Problema) & plano(Plano)
<-
	.print("### Validar: Problema: ", Problema, " Plano: ", Plano, " Relatorio: ", Relatorio);
	rodarValidador(Relatorio, Problema, Plano);
	.print("### ler relatório");
	readLatex(Relatorio);
	.

//+!validarPlano
//	: true
//<-
//	.print("### Validar Palno...");
//	!validarPlano;
//	.

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
//{ include("$moiseJar/asl/org-obedient.asl") }
