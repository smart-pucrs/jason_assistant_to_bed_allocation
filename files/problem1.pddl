(define (problem hospital-problem)
  (:domain hospitaldomain)
  (:objects 
    paciente2uti1 - patient
    ;Isolamento
    pacienteIsolamento - patient
    camaIsolamento - bed
    ;Obstetricia
    PacienteObstetriciaAborto - patient
    PacienteObstetriciaNascimento - patient
    CamaObstetriciaAborto - bed
    CamaObstetriciaNascimento - bed
    ;UCL
    PacienteUCLAdulto - patient
    PacienteUCLCrianca - patient
    CamaUCLAdulto - bed
    CamaUCLCrianca - bed
    ;AVC
    PacienteAVCFeminino - patient
    PacienteAVCMasculino - patient
    CamaAVCFeminino - bed
    CamaAVCMasculino - bed
    ;Psiquiatria
    PacientePsiquiatriaFeminino - patient
    PacientePsiquiatriaMasculino - patient
    CamaPsiquiatriaFeminino - bed
    CamaPsiquiatriaMasculino - bed
    ;Cirurgia Bariátrica
    PacienteCirurgiaBariatricaFeminino - patient
    PacienteCirurgiaBariatricaMasculino - patient
    CamaCirurgiaBariatricaFeminino - bed
    CamaCirurgiaBariatricaMasculino - bed
    ;Ginecologia
    PacienteGinecologiaClinico - patient
    PacienteGinecologiaCirurgico - patient
    CamaGinecologiaClinico - bed
    CamaGinecologiaCirurgico - bed
    ;Geral
    PacienteGeralMinimoLongaPermanencia - patient
    PacienteGeralIntensivoGiroRapido - patient
    camaGeralMinimoLongaPermanencia - bed
    camaGeralIntensivoGiroRapido - bed
    
    ;variacoes possiveis
    minimo - care
    intensivo - care
    semiintensivo - care
    geral - specialty
    cardiologia - specialty
    cirurgiabariatrica - specialty
    cirurgiacardiaca - specialty
    uclunidadedecuidadosespeciais - specialty
    cirurgiadigestiva - specialty
    cirurgiavascular - specialty
    endovascular - specialty
    gastro - specialty
    ginecologia - specialty
    infecto - specialty
    medicinainterna - specialty
    neurologia - specialty
    obstetricia - specialty
    oncologia - specialty
    pneumo - specialty
    psiquiatria - specialty
    uti - specialty
    aborto - birthtype
    nascimento - birthtype
    crianca - age
    adulto - age
    adolescente - age
    masculino - gender
    feminino - gender
    eletivo - origin
    agudo - origin
    clinico - roomtype
    cirurgico - roomtype
    longapermanencia - stay
    girorapido - stay

  )
  (:init
    (patientuti pacienteuti)
    ;Isolamento
    (bedfree camaIsolamento)
    (patientisolation pacienteIsolamento)
    ;Obstetricia
    (bedfree CamaObstetriciaAborto)
    (bedfree CamaObstetriciaNascimento)
    (patientobstetricia PacienteObstetriciaAborto)
    (patientobstetricia PacienteObstetriciaNascimento)
    (bedobstetricia CamaObstetriciaAborto)
    (bedobstetricia CamaObstetriciaNascimento)
    (bedbirthtype CamaObstetriciaAborto aborto)
    (bedbirthtype CamaObstetriciaNascimento nascimento)
    (patientbirthtype PacienteObstetriciaAborto aborto)
    (patientbirthtype PacienteObstetriciaNascimento nascimento)
    ;UCL
    (bedfree CamaUCLAdulto)
    (bedfree CamaUCLCrianca)
    (patientucl PacienteUCLAdulto)
    (patientucl PacienteUCLCrianca)
    (beducl CamaUCLAdulto)
    (beducl CamaUCLCrianca)
    (patientage PacienteUCLAdulto adulto)
    (patientage PacienteUCLCrianca crianca)
    (bedage CamaUCLAdulto adulto)
    (bedage CamaUCLCrianca crianca)
    ;AVC
    (bedfree CamaAVCFeminino)
    (bedfree CamaAVCMasculino)
    (patientavc PacienteAVCFeminino)
    (patientavc PacienteAVCMasculino)
    (bedavc CamaAVCFeminino)
    (bedavc CamaAVCMasculino)
    (patientgender PacienteAVCFeminino feminino)
    (patientgender PacienteAVCMasculino masculino)
    (bedgender CamaAVCFeminino feminino)
    (bedgender CamaAVCMasculino masculino)
    ;Psiquiatria
    (bedfree CamaPsiquiatriaFeminino)
    (bedfree CamaPsiquiatriaMasculino)
    (patientpsiquiatria PacientePsiquiatriaFeminino)
    (patientpsiquiatria PacientePsiquiatriaMasculino)
    (bedpsiquiatria CamaPsiquiatriaFeminino)
    (bedpsiquiatria CamaPsiquiatriaMasculino)
    (patientgender PacientePsiquiatriaFeminino feminino)
    (patientgender PacientePsiquiatriaMasculino masculino)
    (bedgender CamaPsiquiatriaFeminino feminino)
    (bedgender CamaPsiquiatriaMasculino masculino)
    ;CirurgiaBariatrica
    (bedfree CamaCirurgiaBariatricaFeminino)
    (bedfree CamaCirurgiaBariatricaMasculino)
    (patientcirurgiabariatrica PacienteCirurgiaBariatricaFeminino)
    (patientcirurgiabariatrica PacienteCirurgiaBariatricaMasculino)
    (bedcirurgiabariatrica CamaCirurgiaBariatricaFeminino)
    (bedcirurgiabariatrica CamaCirurgiaBariatricaMasculino)
    (patientgender PacienteCirurgiaBariatricaFeminino feminino)
    (patientgender PacienteCirurgiaBariatricaMasculino masculino)
    (bedgender CamaCirurgiaBariatricaFeminino feminino)
    (bedgender CamaCirurgiaBariatricaMasculino masculino)
    ;Ginecologia
    (bedfree CamaGinecologiaClinico) 
    (bedfree CamaGinecologiaCirurgico) 
    (patientginecologia PacienteGinecologiaClinico)
    (patientginecologia PacienteGinecologiaCirurgico)
    (bedginecologia CamaGinecologiaClinico)
    (bedginecologia CamaGinecologiaCirurgico)
    (patientroomtype PacienteGinecologiaClinico clinico)
    (patientroomtype PacienteGinecologiaCirurgico cirurgico)
    (bedroomtype CamaGinecologiaClinico clinico)
    (bedroomtype CamaGinecologiaCirurgico cirurgico)
    ;Geral
    (bedfree camaGeralMinimoLongaPermanencia) 
    (bedfree camaGeralIntensivoGiroRapido) 
    (patientspecialty PacienteGeralMinimoLongaPermanencia geral) 
    (patientspecialty PacienteGeralIntensivoGiroRapido geral) 
    (patientstay PacienteGeralMinimoLongaPermanencia longapermanencia)
    (patientstay PacienteGeralIntensivoGiroRapido girorapido)
    (patientroomtype PacienteGeralMinimoLongaPermanencia clinico)
    (patientroomtype PacienteGeralIntensivoGiroRapido clinico)
    (patientorigin PacienteGeralMinimoLongaPermanencia eletivo)
    (patientorigin PacienteGeralIntensivoGiroRapido eletivo)
    (patientgender PacienteGeralMinimoLongaPermanencia masculino)
    (patientgender PacienteGeralIntensivoGiroRapido masculino)
    (patientage PacienteGeralMinimoLongaPermanencia adulto)
    (patientage PacienteGeralIntensivoGiroRapido adulto)
    (patientcare PacienteGeralMinimoLongaPermanencia minimo)
    (patientcare PacienteGeralIntensivoGiroRapido intensivo)
    (bedspecialty camaGeralMinimoLongaPermanencia geral)
    (bedspecialty camaGeralIntensivoGiroRapido geral)
    (bedstay camaGeralMinimoLongaPermanencia longapermanencia)
    (bedstay camaGeralIntensivoGiroRapido girorapido)
    (bedroomtype camaGeralMinimoLongaPermanencia clinico)
    (bedroomtype camaGeralIntensivoGiroRapido clinico)
    (bedorigin camaGeralMinimoLongaPermanencia eletivo)
    (bedorigin camaGeralIntensivoGiroRapido eletivo)
    (bedgender camaGeralMinimoLongaPermanencia masculino)
    (bedgender camaGeralIntensivoGiroRapido masculino)
    (bedage camaGeralMinimoLongaPermanencia adulto)
    (bedage camaGeralIntensivoGiroRapido adulto)
    (bedcare camaGeralMinimoLongaPermanencia minimo)
    (bedcare camaGeralIntensivoGiroRapido intensivo)
  
  )
  (:goal (and (donotallocate pacienteuti) ;UTI
              (allocated pacienteIsolamento) ;Isolamento
              (allocated PacienteObstetriciaAborto) ;Obstetricia
              ;(allocated PacienteObstetriciaNascimento)
              (allocated PacienteUCLAdulto) ;UCL
              (allocated PacienteUCLCrianca)
              (allocated PacienteAVCFeminino) ;AVC
              (allocated PacienteAVCMasculino)
              (allocated PacientePsiquiatriaFeminino) ;Psiquiatria
              (allocated PacientePsiquiatriaMasculino)
              (allocated PacienteCirurgiaBariatricaFeminino) ;Cirurgia Bariátrica
              (allocated PacienteCirurgiaBariatricaMasculino)
              (allocated PacienteGinecologiaClinico) ;Ginecologia
              (allocated PacienteGinecologiaCirurgico)
              (allocated PacienteGeralMinimoLongaPermanencia) ;Geral
              (allocated PacienteGeralIntensivoGiroRapido)              
         )
  )
)