select DOCTOR.DoctorID,DOCTOR.DName, DOCTOR.SPECIALTY, DOCTOR.YearOfExp  
from DOCTOR LEFT JOIN sdsa947_DOC USING (DoctorID)
where 			DoctorID NOT IN (select DoctorID
				from sdsa947_DOC
                WHERE DOCTOR.DoctorID = sdsa947_DOC.DoctorID);
                
select sdsa947_DOC.DoctorID, sdsa947_DOC.DName, sdsa947_DOC.SPECIALTY, sdsa947_DOC.YearOfExp  
from sdsa947_DOC LEFT JOIN DOCTOR USING (DoctorID)
where 			DoctorID NOT IN (select DoctorID
				from sdsa947_DOC
                WHERE DOCTOR.DoctorID = sdsa947_DOC.DoctorID);


select DOCTOR.DoctorID,DOCTOR.DName, DOCTOR.SPECIALTY, DOCTOR.YearOfExp  
from DOCTOR LEFT OUTER JOIN sdsa947_DOC USING (DoctorID)
where 	(DOCTOR.DoctorID = sdsa947_DOC.DoctorID AND
		DoctorID IN (select DoctorID
				from sdsa947_DOC
                WHERE DOCTOR.DName <> sdsa947_DOC.DName))
		OR
        (DOCTOR.DoctorID = sdsa947_DOC.DoctorID AND
		DoctorID IN (select DoctorID
				from sdsa947_DOC
                WHERE DOCTOR.SPECIALTY <> sdsa947_DOC.SPECIALTY))
		OR
        (DOCTOR.DoctorID = sdsa947_DOC.DoctorID AND
		DoctorID IN (select DoctorID
				from sdsa947_DOC
                WHERE DOCTOR.YearOfExp <> sdsa947_DOC.YearOfExp));
      
