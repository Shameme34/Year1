
-- /* Assn3 Task 1 Part B Qn(1)		*/

select 
CONCAT ('A patient ', pname, ' who is an outpatient ', OUTPATIENT.DayBedNumber,  ' is also an inpatient ', INPATIENT.WardNumber, ', ', INPATIENT.BedNumber) AS message
from PATIENT JOIN OUTPATIENT
			 ON PATIENT.PatientID = OUTPATIENT.PatientID
			 JOIN INPATIENT
			 ON OUTPATIENT.PatientID = INPATIENT.PatientID
where exists (select *
				from PATIENT
                where PATIENT.PatientID = OUTPATIENT.PatientID AND
                PATIENT.PatientID = INPATIENT.PatientID);