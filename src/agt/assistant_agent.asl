// Agent sample_agent in project assistant

/* Initial beliefs and rules */

/* Initial goals */

!start.

/* Plans */

+runValidator
	: true
<-
	runValidator
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
	.
	

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
//{ include("$moiseJar/asl/org-obedient.asl") }
