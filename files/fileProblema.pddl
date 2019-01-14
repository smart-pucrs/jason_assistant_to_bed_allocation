(define (problem hospital-problem)
      (:domain hospitaldomain)
      (:objects
        
        ;variacoes possiveis
        minimos - care
        intensivos - care
        semiintensivos - care
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
        
        
        a9p3dADZjkRI7lIP3ndf1 - patient 
          aFk9jyUCA8GNDUWjO7fTP - bed 
        aJM1I2fdsTaMAyNURdQV1 - patient 
          a3cxyyl1DCgde9mICuYLv - bed 
        acL1Tc3YEF9fNjoTJnRVM - patient 
          a4ItcSDq7KkxexYt48by6 - bed 
        )
        (:init 
           
            (patientmedicinainterna a9p3dADZjkRI7lIP3ndf1)
             (patientspecialty a9p3dADZjkRI7lIP3ndf1 medicinainterna)
             (patientage a9p3dADZjkRI7lIP3ndf1 adulto)
             (patientgender a9p3dADZjkRI7lIP3ndf1 masculino)
             (patientcare a9p3dADZjkRI7lIP3ndf1 intensivos)
             (patientorigin a9p3dADZjkRI7lIP3ndf1 eletivo)
             (patientroomtype a9p3dADZjkRI7lIP3ndf1 clinico)
             (patientstay a9p3dADZjkRI7lIP3ndf1 girorapido)
             
            (patientoncologia aJM1I2fdsTaMAyNURdQV1)
             (patientspecialty aJM1I2fdsTaMAyNURdQV1 oncologia)
             (patientage aJM1I2fdsTaMAyNURdQV1 adulto)
             (patientgender aJM1I2fdsTaMAyNURdQV1 masculino)
             (patientcare aJM1I2fdsTaMAyNURdQV1 minimos)
             (patientorigin aJM1I2fdsTaMAyNURdQV1 eletivo)
             (patientroomtype aJM1I2fdsTaMAyNURdQV1 clinico)
             (patientstay aJM1I2fdsTaMAyNURdQV1 girorapido)
             
            (patientcardiologia acL1Tc3YEF9fNjoTJnRVM)
             (patientspecialty acL1Tc3YEF9fNjoTJnRVM cardiologia)
             (patientage acL1Tc3YEF9fNjoTJnRVM adulto)
             (patientgender acL1Tc3YEF9fNjoTJnRVM feminino)
             (patientcare acL1Tc3YEF9fNjoTJnRVM semiintensivos)
             (patientorigin acL1Tc3YEF9fNjoTJnRVM eletivo)
             (patientroomtype acL1Tc3YEF9fNjoTJnRVM clinico)
             (patientstay acL1Tc3YEF9fNjoTJnRVM longapermanencia)
            
           
          (bedfree aFk9jyUCA8GNDUWjO7fTP)
          (bedmedicinainterna aFk9jyUCA8GNDUWjO7fTP)
          (bedspecialty aFk9jyUCA8GNDUWjO7fTP medicinainterna)
          (bedage aFk9jyUCA8GNDUWjO7fTP adulto)
          (bedgender aFk9jyUCA8GNDUWjO7fTP masculino)
          (bedcare aFk9jyUCA8GNDUWjO7fTP minimos)
          (bedorigin aFk9jyUCA8GNDUWjO7fTP eletivo)
          (bedroomtype aFk9jyUCA8GNDUWjO7fTP clinico)
          (bedstay aFk9jyUCA8GNDUWjO7fTP girorapido)
           
          (bedfree a3cxyyl1DCgde9mICuYLv)
          (bedcardiologia a3cxyyl1DCgde9mICuYLv)
          (bedspecialty a3cxyyl1DCgde9mICuYLv cardiologia)
          (bedage a3cxyyl1DCgde9mICuYLv adulto)
          (bedgender a3cxyyl1DCgde9mICuYLv masculino)
          (bedcare a3cxyyl1DCgde9mICuYLv semiintensivos)
          (bedorigin a3cxyyl1DCgde9mICuYLv eletivo)
          (bedroomtype a3cxyyl1DCgde9mICuYLv clinico)
          (bedstay a3cxyyl1DCgde9mICuYLv girorapido)
           
          (bedfree a4ItcSDq7KkxexYt48by6)
          (bedneurologia a4ItcSDq7KkxexYt48by6)
          (bedspecialty a4ItcSDq7KkxexYt48by6 neurologia)
          (bedage a4ItcSDq7KkxexYt48by6 adulto)
          (bedgender a4ItcSDq7KkxexYt48by6 feminino)
          (bedcare a4ItcSDq7KkxexYt48by6 intensivos)
          (bedorigin a4ItcSDq7KkxexYt48by6 agudo)
          (bedroomtype a4ItcSDq7KkxexYt48by6 cirurgico)
          (bedstay a4ItcSDq7KkxexYt48by6 longapermanencia)
          
        )
        (:goal (and  (allocated a9p3dADZjkRI7lIP3ndf1)
           (allocated aJM1I2fdsTaMAyNURdQV1)
           (allocated acL1Tc3YEF9fNjoTJnRVM)
          
               )
        )
      )
