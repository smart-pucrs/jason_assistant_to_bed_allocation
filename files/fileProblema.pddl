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
          a42Mm17y5WBLFCZRen0xk - bed 
        awhUpxbb5dAyp2FC4335f - patient 
          aFk9jyUCA8GNDUWjO7fTP - bed 
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
           
          (bedfree a42Mm17y5WBLFCZRen0xk)
          (bedmedicinainterna a42Mm17y5WBLFCZRen0xk)
          (bedspecialty a42Mm17y5WBLFCZRen0xk medicinainterna)
          (bedage a42Mm17y5WBLFCZRen0xk adulto)
          (bedgender a42Mm17y5WBLFCZRen0xk feminino)
          (bedcare a42Mm17y5WBLFCZRen0xk intensivos)
          (bedorigin a42Mm17y5WBLFCZRen0xk agudo)
          (bedroomtype a42Mm17y5WBLFCZRen0xk clinico)
          (bedstay a42Mm17y5WBLFCZRen0xk longapermanencia)
           
          (bedfree aFk9jyUCA8GNDUWjO7fTP)
          (bedmedicinainterna aFk9jyUCA8GNDUWjO7fTP)
          (bedspecialty aFk9jyUCA8GNDUWjO7fTP medicinainterna)
          (bedage aFk9jyUCA8GNDUWjO7fTP adulto)
          (bedgender aFk9jyUCA8GNDUWjO7fTP masculino)
          (bedcare aFk9jyUCA8GNDUWjO7fTP minimos)
          (bedorigin aFk9jyUCA8GNDUWjO7fTP eletivo)
          (bedroomtype aFk9jyUCA8GNDUWjO7fTP clinico)
          (bedstay aFk9jyUCA8GNDUWjO7fTP girorapido)
          
        )
        (:goal (and  (allocated aJM1I2fdsTaMAyNURdQV1)
           (allocated aVpMd32mbbg0RFFCi3vhP)
           (allocated awhUpxbb5dAyp2FC4335f)
          
               )
        )
      )
