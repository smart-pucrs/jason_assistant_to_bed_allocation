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
        
        
        aJM1I2fdsTaMAyNURdQV1 - patient 
          aF782ck1AdruJpZdi2ySD - bed 
        aVpMd32mbbg0RFFCi3vhP - patient 
          aCA34wn7zCD54iYJkvnzd - bed 
        awhUpxbb5dAyp2FC4335f - patient 
          agzK0isIbXCOI2QeB60W6 - bed 
        )
        (:init 
           
            (patientmedicinainterna aJM1I2fdsTaMAyNURdQV1)
             (patientspecialty aJM1I2fdsTaMAyNURdQV1 medicinainterna)
             (patientage aJM1I2fdsTaMAyNURdQV1 adulto)
             (patientgender aJM1I2fdsTaMAyNURdQV1 masculino)
             (patientcare aJM1I2fdsTaMAyNURdQV1 semiintensivos)
             (patientorigin aJM1I2fdsTaMAyNURdQV1 eletivo)
             (patientroomtype aJM1I2fdsTaMAyNURdQV1 cirurgico)
             (patientstay aJM1I2fdsTaMAyNURdQV1 girorapido)
             
            (patientmedicinainterna aVpMd32mbbg0RFFCi3vhP)
             (patientspecialty aVpMd32mbbg0RFFCi3vhP medicinainterna)
             (patientage aVpMd32mbbg0RFFCi3vhP adulto)
             (patientgender aVpMd32mbbg0RFFCi3vhP feminino)
             (patientcare aVpMd32mbbg0RFFCi3vhP intensivos)
             (patientorigin aVpMd32mbbg0RFFCi3vhP agudo)
             (patientroomtype aVpMd32mbbg0RFFCi3vhP clinico)
             (patientstay aVpMd32mbbg0RFFCi3vhP longapermanencia)
             
            (patientmedicinainterna awhUpxbb5dAyp2FC4335f)
             (patientspecialty awhUpxbb5dAyp2FC4335f medicinainterna)
             (patientage awhUpxbb5dAyp2FC4335f adulto)
             (patientgender awhUpxbb5dAyp2FC4335f masculino)
             (patientcare awhUpxbb5dAyp2FC4335f minimos)
             (patientorigin awhUpxbb5dAyp2FC4335f eletivo)
             (patientroomtype awhUpxbb5dAyp2FC4335f clinico)
             (patientstay awhUpxbb5dAyp2FC4335f girorapido)
            
           
          (bedfree aF782ck1AdruJpZdi2ySD)
          (bedmedicinainterna aF782ck1AdruJpZdi2ySD)
          (bedspecialty aF782ck1AdruJpZdi2ySD medicinainterna)
          (bedage aF782ck1AdruJpZdi2ySD adulto)
          (bedgender aF782ck1AdruJpZdi2ySD masculino)
          (bedcare aF782ck1AdruJpZdi2ySD semiintensivos)
          (bedorigin aF782ck1AdruJpZdi2ySD eletivo)
          (bedroomtype aF782ck1AdruJpZdi2ySD cirurgico)
          (bedstay aF782ck1AdruJpZdi2ySD girorapido)
           
          (bedfree aCA34wn7zCD54iYJkvnzd)
          (bedmedicinainterna aCA34wn7zCD54iYJkvnzd)
          (bedspecialty aCA34wn7zCD54iYJkvnzd medicinainterna)
          (bedage aCA34wn7zCD54iYJkvnzd adulto)
          (bedgender aCA34wn7zCD54iYJkvnzd feminino)
          (bedcare aCA34wn7zCD54iYJkvnzd intensivos)
          (bedorigin aCA34wn7zCD54iYJkvnzd agudo)
          (bedroomtype aCA34wn7zCD54iYJkvnzd clinico)
          (bedstay aCA34wn7zCD54iYJkvnzd longapermanencia)
           
          (bedfree agzK0isIbXCOI2QeB60W6)
          (bedmedicinainterna agzK0isIbXCOI2QeB60W6)
          (bedspecialty agzK0isIbXCOI2QeB60W6 medicinainterna)
          (bedage agzK0isIbXCOI2QeB60W6 adulto)
          (bedgender agzK0isIbXCOI2QeB60W6 masculino)
          (bedcare agzK0isIbXCOI2QeB60W6 semiintensivos)
          (bedorigin agzK0isIbXCOI2QeB60W6 eletivo)
          (bedroomtype agzK0isIbXCOI2QeB60W6 cirurgico)
          (bedstay agzK0isIbXCOI2QeB60W6 girorapido)
          
        )
        (:goal (and  (allocated aJM1I2fdsTaMAyNURdQV1)
           (allocated aVpMd32mbbg0RFFCi3vhP)
           (allocated awhUpxbb5dAyp2FC4335f)
          
               )
        )
      )
