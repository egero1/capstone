SELECT 
	Main_Site_ID
	,Number_of_Program_Sites
	,Number_of_DSC_Certifications
	,Number_of_NonDSC_Certifications
	,COUNT(CASE WHEN Volume_Name = 'Academic' AND Setting = 'Academic' then 1 ELSE NULL END) as Academic
	,COUNT(CASE WHEN Volume_Name = 'Acute Care Only' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Acute_Care
 	,COUNT(CASE WHEN Volume_Name = 'Addiction, Opioid Treatment/Methadone' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addiction_Opiod
 	,COUNT(CASE WHEN Volume_Name = 'Addictions, General' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addictions
 	,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Hospital w/ Hospital - Specialty Cardiac' then 1 ELSE NULL END) as Hosp_Spec_Cardiac
 	,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Specialty Cardiac Hospital' then 1 ELSE NULL END) as Spec_Cardiac
 	,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Hospital w/ Hospital - Childrens' THEN 1 ELSE NULL END) as Hosp_Children
 	,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Pediatric Specialty Hospital' THEN 1 ELSE NULL END) as Spec_Children
	,COUNT(CASE WHEN Volume_Name = 'Eating Disorders' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Eating
	,COUNT(CASE WHEN Volume_Name = 'General' AND Setting = 'General Medical/Surgical Hospital' then 1 ELSE NULL END) as General 
	,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Hospital w/ Hospital - LTAC' then 1 ELSE NULL END) as Hosp_LT_Acute_Care
 	,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Long Term Acute Care Hospital' then 1 ELSE NULL END) as LT_Acute_Care_Hosp
 	,COUNT(CASE WHEN Volume_Name = 'Mental Health' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Mental_Health
 	,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Hospital w/ Hospital - Oncology' then 1 ELSE NULL END) as Hosp_Oncology
 	,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Oncology Specialty Hospital' then 1 ELSE NULL END) as Oncology_Spec
 	,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Hospital w/Hospital-Specialty Orthopedic' then 1 ELSE NULL END) as Hosp_Orthopedic
 	,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Specialty Orthopedic Hospital' then 1 ELSE NULL END) as Spec_Orthopedic
 	,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, Emergency Room' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Emer
 	,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, General' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Gen
 	,COUNT(CASE WHEN Volume_Name = 'Psychiatric' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Psychiatric
 	,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Hospital w/ Hospital - Rehabilitation' then 1 ELSE NULL END) as Hosp_Rehabilitation
 	,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Physical Rehabilitation Hospital' then 1 ELSE NULL END) as Physical_Rehabilitation
 	,COUNT(CASE WHEN Volume_Name = 'Rehabilitation and Physical Medicine' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Rehabilitation_Med
 	,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Hospital w/ Hospital - Specialty Surgery' then 1 ELSE NULL END) as Hosp_Surgical
 	,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Specialty Surgery Hospital' then 1 ELSE NULL END) as Spec_Surgical
 	,COUNT(CASE WHEN Volume_Name = 'Swing' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Swing
 	,COUNT(CASE WHEN Volume_Name = 'Teaching' And Setting = 'Teaching' then 1 ELSE NULL END) as Teaching
FROM Main_Sites
GROUP BY Main_Site_ID, Number_of_Program_Sites

 
# select * from Main_Sites where Main_Site_ID = 16947
 
# select distinct Main_Site_ID from Main_Sites;
SELECT 
	DISTINCT Main_Site_ID
	,MAX(Number_of_Program_Sites)
	,Number_of_DSC_Certifications
	,Number_of_NonDSC_Certifications
	,COUNT(CASE WHEN Volume_Name = 'Academic' AND Setting = 'Academic' then 1 ELSE NULL END) as Academic
	,COUNT(CASE WHEN Volume_Name = 'Acute Care Only' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Acute_Care
 	,COUNT(CASE WHEN Volume_Name = 'Addiction, Opioid Treatment/Methadone' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addiction_Opiod
 	,COUNT(CASE WHEN Volume_Name = 'Addictions, General' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addictions
 	,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Hospital w/ Hospital - Specialty Cardiac' then 1 ELSE NULL END) as Hosp_Spec_Cardiac
 	,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Specialty Cardiac Hospital' then 1 ELSE NULL END) as Spec_Cardiac
 	,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Hospital w/ Hospital - Childrens' THEN 1 ELSE NULL END) as Hosp_Children
 	,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Pediatric Specialty Hospital' THEN 1 ELSE NULL END) as Spec_Children
	,COUNT(CASE WHEN Volume_Name = 'Eating Disorders' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Eating
	,COUNT(CASE WHEN Volume_Name = 'General' AND Setting = 'General Medical/Surgical Hospital' then 1 ELSE NULL END) as General 
	,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Hospital w/ Hospital - LTAC' then 1 ELSE NULL END) as Hosp_LT_Acute_Care
 	,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Long Term Acute Care Hospital' then 1 ELSE NULL END) as LT_Acute_Care_Hosp
 	,COUNT(CASE WHEN Volume_Name = 'Mental Health' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Mental_Health
 	,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Hospital w/ Hospital - Oncology' then 1 ELSE NULL END) as Hosp_Oncology
 	,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Oncology Specialty Hospital' then 1 ELSE NULL END) as Oncology_Spec
 	,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Hospital w/Hospital-Specialty Orthopedic' then 1 ELSE NULL END) as Hosp_Orthopedic
 	,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Specialty Orthopedic Hospital' then 1 ELSE NULL END) as Spec_Orthopedic
 	,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, Emergency Room' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Emer
 	,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, General' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Gen
 	,COUNT(CASE WHEN Volume_Name = 'Psychiatric' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Psychiatric
 	,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Hospital w/ Hospital - Rehabilitation' then 1 ELSE NULL END) as Hosp_Rehabilitation
 	,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Physical Rehabilitation Hospital' then 1 ELSE NULL END) as Physical_Rehabilitation
 	,COUNT(CASE WHEN Volume_Name = 'Rehabilitation and Physical Medicine' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Rehabilitation_Med
 	,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Hospital w/ Hospital - Specialty Surgery' then 1 ELSE NULL END) as Hosp_Surgical
 	,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Specialty Surgery Hospital' then 1 ELSE NULL END) as Spec_Surgical
 	,COUNT(CASE WHEN Volume_Name = 'Swing' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Swing
 	,COUNT(CASE WHEN Volume_Name = 'Teaching' And Setting = 'Teaching' then 1 ELSE NULL END) as Teaching
FROM Main_Sites
GROUP BY Main_Site_ID, Number_of_Program_Sites

 
# select * from Main_Sites where Main_Site_ID = 16947
 
# select distinct Main_Site_ID from Main_Sites;
SELECT 
	Main_Site_ID
	,MAX(Number_of_Program_Sites)
	,Number_of_DSC_Certifications
	,Number_of_NonDSC_Certifications
	,COUNT(CASE WHEN Volume_Name = 'Academic' AND Setting = 'Academic' then 1 ELSE NULL END) as Academic
	,COUNT(CASE WHEN Volume_Name = 'Acute Care Only' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Acute_Care
 	,COUNT(CASE WHEN Volume_Name = 'Addiction, Opioid Treatment/Methadone' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addiction_Opiod
 	,COUNT(CASE WHEN Volume_Name = 'Addictions, General' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addictions
 	,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Hospital w/ Hospital - Specialty Cardiac' then 1 ELSE NULL END) as Hosp_Spec_Cardiac
 	,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Specialty Cardiac Hospital' then 1 ELSE NULL END) as Spec_Cardiac
 	,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Hospital w/ Hospital - Childrens' THEN 1 ELSE NULL END) as Hosp_Children
 	,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Pediatric Specialty Hospital' THEN 1 ELSE NULL END) as Spec_Children
	,COUNT(CASE WHEN Volume_Name = 'Eating Disorders' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Eating
	,COUNT(CASE WHEN Volume_Name = 'General' AND Setting = 'General Medical/Surgical Hospital' then 1 ELSE NULL END) as General 
	,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Hospital w/ Hospital - LTAC' then 1 ELSE NULL END) as Hosp_LT_Acute_Care
 	,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Long Term Acute Care Hospital' then 1 ELSE NULL END) as LT_Acute_Care_Hosp
 	,COUNT(CASE WHEN Volume_Name = 'Mental Health' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Mental_Health
 	,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Hospital w/ Hospital - Oncology' then 1 ELSE NULL END) as Hosp_Oncology
 	,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Oncology Specialty Hospital' then 1 ELSE NULL END) as Oncology_Spec
 	,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Hospital w/Hospital-Specialty Orthopedic' then 1 ELSE NULL END) as Hosp_Orthopedic
 	,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Specialty Orthopedic Hospital' then 1 ELSE NULL END) as Spec_Orthopedic
 	,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, Emergency Room' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Emer
 	,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, General' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Gen
 	,COUNT(CASE WHEN Volume_Name = 'Psychiatric' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Psychiatric
 	,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Hospital w/ Hospital - Rehabilitation' then 1 ELSE NULL END) as Hosp_Rehabilitation
 	,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Physical Rehabilitation Hospital' then 1 ELSE NULL END) as Physical_Rehabilitation
 	,COUNT(CASE WHEN Volume_Name = 'Rehabilitation and Physical Medicine' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Rehabilitation_Med
 	,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Hospital w/ Hospital - Specialty Surgery' then 1 ELSE NULL END) as Hosp_Surgical
 	,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Specialty Surgery Hospital' then 1 ELSE NULL END) as Spec_Surgical
 	,COUNT(CASE WHEN Volume_Name = 'Swing' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Swing
 	,COUNT(CASE WHEN Volume_Name = 'Teaching' And Setting = 'Teaching' then 1 ELSE NULL END) as Teaching
FROM Main_Sites
GROUP BY Main_Site_ID, Number_of_Program_Sites

 
# select * from Main_Sites where Main_Site_ID = 16947
 
# select distinct Main_Site_ID from Main_Sites;
SELECT 
	Main_Site_ID
	,MAX(Number_of_Program_Sites)
	,Number_of_DSC_Certifications
	,Number_of_NonDSC_Certifications
	,COUNT(CASE WHEN Volume_Name = 'Academic' AND Setting = 'Academic' then 1 ELSE NULL END) as Academic
	,COUNT(CASE WHEN Volume_Name = 'Acute Care Only' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Acute_Care
 	,COUNT(CASE WHEN Volume_Name = 'Addiction, Opioid Treatment/Methadone' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addiction_Opiod
 	,COUNT(CASE WHEN Volume_Name = 'Addictions, General' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addictions
 	,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Hospital w/ Hospital - Specialty Cardiac' then 1 ELSE NULL END) as Hosp_Spec_Cardiac
 	,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Specialty Cardiac Hospital' then 1 ELSE NULL END) as Spec_Cardiac
 	,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Hospital w/ Hospital - Childrens' THEN 1 ELSE NULL END) as Hosp_Children
 	,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Pediatric Specialty Hospital' THEN 1 ELSE NULL END) as Spec_Children
	,COUNT(CASE WHEN Volume_Name = 'Eating Disorders' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Eating
	,COUNT(CASE WHEN Volume_Name = 'General' AND Setting = 'General Medical/Surgical Hospital' then 1 ELSE NULL END) as General 
	,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Hospital w/ Hospital - LTAC' then 1 ELSE NULL END) as Hosp_LT_Acute_Care
 	,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Long Term Acute Care Hospital' then 1 ELSE NULL END) as LT_Acute_Care_Hosp
 	,COUNT(CASE WHEN Volume_Name = 'Mental Health' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Mental_Health
 	,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Hospital w/ Hospital - Oncology' then 1 ELSE NULL END) as Hosp_Oncology
 	,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Oncology Specialty Hospital' then 1 ELSE NULL END) as Oncology_Spec
 	,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Hospital w/Hospital-Specialty Orthopedic' then 1 ELSE NULL END) as Hosp_Orthopedic
 	,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Specialty Orthopedic Hospital' then 1 ELSE NULL END) as Spec_Orthopedic
 	,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, Emergency Room' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Emer
 	,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, General' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Gen
 	,COUNT(CASE WHEN Volume_Name = 'Psychiatric' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Psychiatric
 	,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Hospital w/ Hospital - Rehabilitation' then 1 ELSE NULL END) as Hosp_Rehabilitation
 	,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Physical Rehabilitation Hospital' then 1 ELSE NULL END) as Physical_Rehabilitation
 	,COUNT(CASE WHEN Volume_Name = 'Rehabilitation and Physical Medicine' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Rehabilitation_Med
 	,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Hospital w/ Hospital - Specialty Surgery' then 1 ELSE NULL END) as Hosp_Surgical
 	,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Specialty Surgery Hospital' then 1 ELSE NULL END) as Spec_Surgical
 	,COUNT(CASE WHEN Volume_Name = 'Swing' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Swing
 	,COUNT(CASE WHEN Volume_Name = 'Teaching' And Setting = 'Teaching' then 1 ELSE NULL END) as Teaching
FROM Main_Sites
GROUP BY Main_Site_ID, MAX(Number_of_Program_Sites)
	,Number_of_DSC_Certifications
	,Number_of_NonDSC_Certifications
 
 
# select * from Main_Sites where Main_Site_ID = 16947
 
# select distinct Main_Site_ID from Main_Sites;
SELECT 
	Main_Site_ID
	,MAX(Number_of_Program_Sites)
	,Number_of_DSC_Certifications
	,Number_of_NonDSC_Certifications
	,COUNT(CASE WHEN Volume_Name = 'Academic' AND Setting = 'Academic' then 1 ELSE NULL END) as Academic
	,COUNT(CASE WHEN Volume_Name = 'Acute Care Only' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Acute_Care
 	,COUNT(CASE WHEN Volume_Name = 'Addiction, Opioid Treatment/Methadone' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addiction_Opiod
 	,COUNT(CASE WHEN Volume_Name = 'Addictions, General' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addictions
 	,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Hospital w/ Hospital - Specialty Cardiac' then 1 ELSE NULL END) as Hosp_Spec_Cardiac
 	,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Specialty Cardiac Hospital' then 1 ELSE NULL END) as Spec_Cardiac
 	,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Hospital w/ Hospital - Childrens' THEN 1 ELSE NULL END) as Hosp_Children
 	,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Pediatric Specialty Hospital' THEN 1 ELSE NULL END) as Spec_Children
	,COUNT(CASE WHEN Volume_Name = 'Eating Disorders' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Eating
	,COUNT(CASE WHEN Volume_Name = 'General' AND Setting = 'General Medical/Surgical Hospital' then 1 ELSE NULL END) as General 
	,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Hospital w/ Hospital - LTAC' then 1 ELSE NULL END) as Hosp_LT_Acute_Care
 	,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Long Term Acute Care Hospital' then 1 ELSE NULL END) as LT_Acute_Care_Hosp
 	,COUNT(CASE WHEN Volume_Name = 'Mental Health' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Mental_Health
 	,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Hospital w/ Hospital - Oncology' then 1 ELSE NULL END) as Hosp_Oncology
 	,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Oncology Specialty Hospital' then 1 ELSE NULL END) as Oncology_Spec
 	,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Hospital w/Hospital-Specialty Orthopedic' then 1 ELSE NULL END) as Hosp_Orthopedic
 	,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Specialty Orthopedic Hospital' then 1 ELSE NULL END) as Spec_Orthopedic
 	,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, Emergency Room' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Emer
 	,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, General' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Gen
 	,COUNT(CASE WHEN Volume_Name = 'Psychiatric' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Psychiatric
 	,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Hospital w/ Hospital - Rehabilitation' then 1 ELSE NULL END) as Hosp_Rehabilitation
 	,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Physical Rehabilitation Hospital' then 1 ELSE NULL END) as Physical_Rehabilitation
 	,COUNT(CASE WHEN Volume_Name = 'Rehabilitation and Physical Medicine' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Rehabilitation_Med
 	,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Hospital w/ Hospital - Specialty Surgery' then 1 ELSE NULL END) as Hosp_Surgical
 	,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Specialty Surgery Hospital' then 1 ELSE NULL END) as Spec_Surgical
 	,COUNT(CASE WHEN Volume_Name = 'Swing' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Swing
 	,COUNT(CASE WHEN Volume_Name = 'Teaching' And Setting = 'Teaching' then 1 ELSE NULL END) as Teaching
FROM Main_Sites
GROUP BY Main_Site_ID,Number_of_Program_Sites
	,Number_of_DSC_Certifications
	,Number_of_NonDSC_Certifications
 
 
# select * from Main_Sites where Main_Site_ID = 16947
 
# select distinct Main_Site_ID from Main_Sites;
SELECT 
	Main_Site_ID
	,Number_of_Program_Sites
	,Number_of_DSC_Certifications
	,Number_of_NonDSC_Certifications
	,COUNT(CASE WHEN Volume_Name = 'Academic' AND Setting = 'Academic' then 1 ELSE NULL END) as Academic
	,COUNT(CASE WHEN Volume_Name = 'Acute Care Only' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Acute_Care
 	,COUNT(CASE WHEN Volume_Name = 'Addiction, Opioid Treatment/Methadone' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addiction_Opiod
 	,COUNT(CASE WHEN Volume_Name = 'Addictions, General' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addictions
 	,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Hospital w/ Hospital - Specialty Cardiac' then 1 ELSE NULL END) as Hosp_Spec_Cardiac
 	,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Specialty Cardiac Hospital' then 1 ELSE NULL END) as Spec_Cardiac
 	,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Hospital w/ Hospital - Childrens' THEN 1 ELSE NULL END) as Hosp_Children
 	,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Pediatric Specialty Hospital' THEN 1 ELSE NULL END) as Spec_Children
	,COUNT(CASE WHEN Volume_Name = 'Eating Disorders' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Eating
	,COUNT(CASE WHEN Volume_Name = 'General' AND Setting = 'General Medical/Surgical Hospital' then 1 ELSE NULL END) as General 
	,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Hospital w/ Hospital - LTAC' then 1 ELSE NULL END) as Hosp_LT_Acute_Care
 	,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Long Term Acute Care Hospital' then 1 ELSE NULL END) as LT_Acute_Care_Hosp
 	,COUNT(CASE WHEN Volume_Name = 'Mental Health' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Mental_Health
 	,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Hospital w/ Hospital - Oncology' then 1 ELSE NULL END) as Hosp_Oncology
 	,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Oncology Specialty Hospital' then 1 ELSE NULL END) as Oncology_Spec
 	,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Hospital w/Hospital-Specialty Orthopedic' then 1 ELSE NULL END) as Hosp_Orthopedic
 	,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Specialty Orthopedic Hospital' then 1 ELSE NULL END) as Spec_Orthopedic
 	,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, Emergency Room' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Emer
 	,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, General' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Gen
 	,COUNT(CASE WHEN Volume_Name = 'Psychiatric' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Psychiatric
 	,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Hospital w/ Hospital - Rehabilitation' then 1 ELSE NULL END) as Hosp_Rehabilitation
 	,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Physical Rehabilitation Hospital' then 1 ELSE NULL END) as Physical_Rehabilitation
 	,COUNT(CASE WHEN Volume_Name = 'Rehabilitation and Physical Medicine' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Rehabilitation_Med
 	,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Hospital w/ Hospital - Specialty Surgery' then 1 ELSE NULL END) as Hosp_Surgical
 	,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Specialty Surgery Hospital' then 1 ELSE NULL END) as Spec_Surgical
 	,COUNT(CASE WHEN Volume_Name = 'Swing' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Swing
 	,COUNT(CASE WHEN Volume_Name = 'Teaching' And Setting = 'Teaching' then 1 ELSE NULL END) as Teaching
FROM Main_Sites
GROUP BY Main_Site_ID,Number_of_Program_Sites
	,Number_of_DSC_Certifications
	,Number_of_NonDSC_Certifications
 
 
# select * from Main_Sites where Main_Site_ID = 16947
 
# select distinct Main_Site_ID from Main_Sites;
select distinct Main_Site_ID from Main_Sites;
SELECT 
	Main_Site_ID
	,Number_of_Program_Sites
	,Number_of_DSC_Certifications
	,Number_of_NonDSC_Certifications
	,COUNT(CASE WHEN Volume_Name = 'Academic' AND Setting = 'Academic' then 1 ELSE NULL END) as Academic
	,COUNT(CASE WHEN Volume_Name = 'Acute Care Only' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Acute_Care
 	,COUNT(CASE WHEN Volume_Name = 'Addiction, Opioid Treatment/Methadone' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addiction_Opiod
 	,COUNT(CASE WHEN Volume_Name = 'Addictions, General' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addictions
 	,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Hospital w/ Hospital - Specialty Cardiac' then 1 ELSE NULL END) as Hosp_Spec_Cardiac
 	,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Specialty Cardiac Hospital' then 1 ELSE NULL END) as Spec_Cardiac
 	,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Hospital w/ Hospital - Childrens' THEN 1 ELSE NULL END) as Hosp_Children
 	,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Pediatric Specialty Hospital' THEN 1 ELSE NULL END) as Spec_Children
	,COUNT(CASE WHEN Volume_Name = 'Eating Disorders' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Eating
	,COUNT(CASE WHEN Volume_Name = 'General' AND Setting = 'General Medical/Surgical Hospital' then 1 ELSE NULL END) as General 
	,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Hospital w/ Hospital - LTAC' then 1 ELSE NULL END) as Hosp_LT_Acute_Care
 	,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Long Term Acute Care Hospital' then 1 ELSE NULL END) as LT_Acute_Care_Hosp
 	,COUNT(CASE WHEN Volume_Name = 'Mental Health' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Mental_Health
 	,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Hospital w/ Hospital - Oncology' then 1 ELSE NULL END) as Hosp_Oncology
 	,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Oncology Specialty Hospital' then 1 ELSE NULL END) as Oncology_Spec
 	,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Hospital w/Hospital-Specialty Orthopedic' then 1 ELSE NULL END) as Hosp_Orthopedic
 	,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Specialty Orthopedic Hospital' then 1 ELSE NULL END) as Spec_Orthopedic
 	,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, Emergency Room' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Emer
 	,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, General' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Gen
 	,COUNT(CASE WHEN Volume_Name = 'Psychiatric' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Psychiatric
 	,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Hospital w/ Hospital - Rehabilitation' then 1 ELSE NULL END) as Hosp_Rehabilitation
 	,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Physical Rehabilitation Hospital' then 1 ELSE NULL END) as Physical_Rehabilitation
 	,COUNT(CASE WHEN Volume_Name = 'Rehabilitation and Physical Medicine' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Rehabilitation_Med
 	,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Hospital w/ Hospital - Specialty Surgery' then 1 ELSE NULL END) as Hosp_Surgical
 	,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Specialty Surgery Hospital' then 1 ELSE NULL END) as Spec_Surgical
 	,COUNT(CASE WHEN Volume_Name = 'Swing' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Swing
 	,COUNT(CASE WHEN Volume_Name = 'Teaching' And Setting = 'Teaching' then 1 ELSE NULL END) as Teaching
FROM Main_Sites
GROUP BY Main_Site_ID,Number_of_Program_Sites
	,Number_of_DSC_Certifications
	,Number_of_NonDSC_Certifications
 
 
# select * from Main_Sites where Main_Site_ID = 16947
 
# select distinct Volume_Name, Setting from Main_Sites;
SELECT 
	Main_Site_ID
	,Number_of_Program_Sites
	,Number_of_DSC_Certifications
	,Number_of_NonDSC_Certifications
	,COUNT(CASE WHEN Volume_Name = 'Academic' AND Setting = 'Academic' then 1 ELSE NULL END) as Academic
	,COUNT(CASE WHEN Volume_Name = 'Acute Care Only' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Acute_Care
 	,COUNT(CASE WHEN Volume_Name = 'Addiction, Opioid Treatment/Methadone' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addiction_Opiod
 	,COUNT(CASE WHEN Volume_Name = 'Addictions, General' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addictions
 	,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Hospital w/ Hospital - Specialty Cardiac' then 1 ELSE NULL END) as Hosp_Spec_Cardiac
 	,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Specialty Cardiac Hospital' then 1 ELSE NULL END) as Spec_Cardiac
 	,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Hospital w/ Hospital - Childrens' THEN 1 ELSE NULL END) as Hosp_Children
 	,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Pediatric Specialty Hospital' THEN 1 ELSE NULL END) as Spec_Children
	,COUNT(CASE WHEN Volume_Name = 'Eating Disorders' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Eating
	,COUNT(CASE WHEN Volume_Name = 'General' AND Setting = 'General Medical/Surgical Hospital' then 1 ELSE NULL END) as General 
	,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Hospital w/ Hospital - LTAC' then 1 ELSE NULL END) as Hosp_LT_Acute_Care
 	,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Long Term Acute Care Hospital' then 1 ELSE NULL END) as LT_Acute_Care_Hosp
 	,COUNT(CASE WHEN Volume_Name = 'Mental Health' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Mental_Health
 	,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Hospital w/ Hospital - Oncology' then 1 ELSE NULL END) as Hosp_Oncology
 	,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Oncology Specialty Hospital' then 1 ELSE NULL END) as Oncology_Spec
 	,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Hospital w/Hospital-Specialty Orthopedic' then 1 ELSE NULL END) as Hosp_Orthopedic
 	,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Specialty Orthopedic Hospital' then 1 ELSE NULL END) as Spec_Orthopedic
 	,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, Emergency Room' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Emer
 	,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, General' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Gen
 	,COUNT(CASE WHEN Volume_Name = 'Psychiatric' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Psychiatric
 	,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Hospital w/ Hospital - Rehabilitation' then 1 ELSE NULL END) as Hosp_Rehabilitation
 	,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Physical Rehabilitation Hospital' then 1 ELSE NULL END) as Physical_Rehabilitation
 	,COUNT(CASE WHEN Volume_Name = 'Rehabilitation and Physical Medicine' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Rehabilitation_Med
 	,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Hospital w/ Hospital - Specialty Surgery' then 1 ELSE NULL END) as Hosp_Surgical
 	,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Specialty Surgery Hospital' then 1 ELSE NULL END) as Spec_Surgical
 	,COUNT(CASE WHEN Volume_Name = 'Swing' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Swing
 	,COUNT(CASE WHEN Volume_Name = 'Teaching' And Setting = 'Teaching' then 1 ELSE NULL END) as Teaching
FROM Main_Sites
GROUP BY Main_Site_IDNumber_of_Program_Sites
	,Number_of_DSC_Certifications
	,Number_of_NonDSC_Certifications
 
 
# select * from Main_Sites where Main_Site_ID = 16947
 
# select distinct Volume_Name, Setting from Main_Sites;
SELECT 
	Main_Site_ID
	,COUNT(CASE WHEN Volume_Name = 'Academic' AND Setting = 'Academic' then 1 ELSE NULL END) as Academic
	,COUNT(CASE WHEN Volume_Name = 'Acute Care Only' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Acute_Care
 	,COUNT(CASE WHEN Volume_Name = 'Addiction, Opioid Treatment/Methadone' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addiction_Opiod
 	,COUNT(CASE WHEN Volume_Name = 'Addictions, General' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addictions
 	,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Hospital w/ Hospital - Specialty Cardiac' then 1 ELSE NULL END) as Hosp_Spec_Cardiac
 	,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Specialty Cardiac Hospital' then 1 ELSE NULL END) as Spec_Cardiac
 	,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Hospital w/ Hospital - Childrens' THEN 1 ELSE NULL END) as Hosp_Children
 	,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Pediatric Specialty Hospital' THEN 1 ELSE NULL END) as Spec_Children
	,COUNT(CASE WHEN Volume_Name = 'Eating Disorders' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Eating
	,COUNT(CASE WHEN Volume_Name = 'General' AND Setting = 'General Medical/Surgical Hospital' then 1 ELSE NULL END) as General 
	,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Hospital w/ Hospital - LTAC' then 1 ELSE NULL END) as Hosp_LT_Acute_Care
 	,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Long Term Acute Care Hospital' then 1 ELSE NULL END) as LT_Acute_Care_Hosp
 	,COUNT(CASE WHEN Volume_Name = 'Mental Health' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Mental_Health
 	,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Hospital w/ Hospital - Oncology' then 1 ELSE NULL END) as Hosp_Oncology
 	,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Oncology Specialty Hospital' then 1 ELSE NULL END) as Oncology_Spec
 	,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Hospital w/Hospital-Specialty Orthopedic' then 1 ELSE NULL END) as Hosp_Orthopedic
 	,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Specialty Orthopedic Hospital' then 1 ELSE NULL END) as Spec_Orthopedic
 	,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, Emergency Room' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Emer
 	,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, General' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Gen
 	,COUNT(CASE WHEN Volume_Name = 'Psychiatric' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Psychiatric
 	,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Hospital w/ Hospital - Rehabilitation' then 1 ELSE NULL END) as Hosp_Rehabilitation
 	,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Physical Rehabilitation Hospital' then 1 ELSE NULL END) as Physical_Rehabilitation
 	,COUNT(CASE WHEN Volume_Name = 'Rehabilitation and Physical Medicine' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Rehabilitation_Med
 	,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Hospital w/ Hospital - Specialty Surgery' then 1 ELSE NULL END) as Hosp_Surgical
 	,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Specialty Surgery Hospital' then 1 ELSE NULL END) as Spec_Surgical
 	,COUNT(CASE WHEN Volume_Name = 'Swing' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Swing
 	,COUNT(CASE WHEN Volume_Name = 'Teaching' And Setting = 'Teaching' then 1 ELSE NULL END) as Teaching
FROM Main_Sites
GROUP BY Main_Site_ID
 
 
# select * from Main_Sites where Main_Site_ID = 16947
 
# select distinct Volume_Name, Setting from Main_Sites;
SELECT 
	Main_Site_ID
	,COUNT(CASE WHEN 'Academic' AND Setting = 'Academic' then 1 ELSE NULL END) as Academic
	,COUNT(CASE WHEN 'Acute Care Only' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Acute_Care
 	,COUNT(CASE WHEN 'Addiction, Opioid Treatment/Methadone' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addiction_Opiod
 	,COUNT(CASE WHEN 'Addictions, General' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addictions
 	,COUNT(CASE WHEN 'Cardiac' AND Setting = 'Hospital w/ Hospital - Specialty Cardiac' then 1 ELSE NULL END) as Hosp_Spec_Cardiac
 	,COUNT(CASE WHEN 'Cardiac' AND Setting = 'Specialty Cardiac Hospital' then 1 ELSE NULL END) as Spec_Cardiac
 	,COUNT(CASE WHEN 'Children\'s' AND Setting = 'Hospital w/ Hospital - Childrens' THEN 1 ELSE NULL END) as Hosp_Children
 	,COUNT(CASE WHEN 'Children\'s' AND Setting = 'Pediatric Specialty Hospital' THEN 1 ELSE NULL END) as Spec_Children
	,COUNT(CASE WHEN 'Eating Disorders' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Eating
	,COUNT(CASE WHEN Volume_Name = 'General' AND Setting = 'General Medical/Surgical Hospital' then 1 ELSE NULL END) as General 
	,COUNT(CASE WHEN 'Long Term Acute Care' AND Setting = 'Hospital w/ Hospital - LTAC' then 1 ELSE NULL END) as Hosp_LT_Acute_Care
 	,COUNT(CASE WHEN 'Long Term Acute Care' AND Setting = 'Long Term Acute Care Hospital' then 1 ELSE NULL END) as LT_Acute_Care_Hosp
 	,COUNT(CASE WHEN 'Mental Health' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Mental_Health
 	,COUNT(CASE WHEN 'Oncology' AND Setting = 'Hospital w/ Hospital - Oncology' then 1 ELSE NULL END) as Hosp_Oncology
 	,COUNT(CASE WHEN 'Oncology' AND Setting = 'Oncology Specialty Hospital' then 1 ELSE NULL END) as Oncology_Spec
 	,COUNT(CASE WHEN 'Orthopedic' AND Setting = 'Hospital w/Hospital-Specialty Orthopedic' then 1 ELSE NULL END) as Hosp_Orthopedic
 	,COUNT(CASE WHEN 'Orthopedic' AND Setting = 'Specialty Orthopedic Hospital' then 1 ELSE NULL END) as Spec_Orthopedic
 	,COUNT(CASE WHEN 'Outpatient, Hospital, Emergency Room' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Emer
 	,COUNT(CASE WHEN 'Outpatient, Hospital, General' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Gen
 	,COUNT(CASE WHEN 'Psychiatric' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Psychiatric
 	,COUNT(CASE WHEN 'Rehabilitation' AND Setting = 'Hospital w/ Hospital - Rehabilitation' then 1 ELSE NULL END) as Hosp_Rehabilitation
 	,COUNT(CASE WHEN 'Rehabilitation' AND Setting = 'Physical Rehabilitation Hospital' then 1 ELSE NULL END) as Physical_Rehabilitation
 	,COUNT(CASE WHEN 'Rehabilitation and Physical Medicine' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Rehabilitation_Med
 	,COUNT(CASE WHEN 'Surgical' AND Setting = 'Hospital w/ Hospital - Specialty Surgery' then 1 ELSE NULL END) as Hosp_Surgical
 	,COUNT(CASE WHEN 'Surgical' AND Setting = 'Specialty Surgery Hospital' then 1 ELSE NULL END) as Spec_Surgical
 	,COUNT(CASE WHEN 'Swing' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Swing
 	,COUNT(CASE WHEN 'Teaching' And Setting = 'Teaching' then 1 ELSE NULL END) as Teaching
FROM Main_Sites
GROUP BY Main_Site_ID
 
 
# select * from Main_Sites where Main_Site_ID = 16947
 
# select distinct Volume_Name, Setting from Main_Sites;
SELECT 
	Main_Site_ID
	,COUNT(CASE WHEN 'Academic' AND Setting = 'Academic' then 1 ELSE NULL END) as Academic
	,COUNT(CASE WHEN 'Acute Care Only' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Acute_Care
 	,COUNT(CASE WHEN 'Addiction, Opioid Treatment/Methadone' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addiction_Opiod
 	,COUNT(CASE WHEN 'Addictions, General' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addictions
 	,COUNT(CASE WHEN 'Cardiac' AND Setting = 'Hospital w/ Hospital - Specialty Cardiac' then 1 ELSE NULL END) as Hosp_Spec_Cardiac
 	,COUNT(CASE WHEN 'Cardiac' AND Setting = 'Specialty Cardiac Hospital' then 1 ELSE NULL END) as Spec_Cardiac
 	,COUNT(CASE WHEN 'Children\'s' AND Setting = 'Hospital w/ Hospital - Childrens' THEN 1 ELSE NULL END) as Hosp_Children
 	,COUNT(CASE WHEN 'Children\'s' AND Setting = 'Pediatric Specialty Hospital' THEN 1 ELSE NULL END) as Spec_Children
	,COUNT(CASE WHEN 'Eating Disorders' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Eating
	,COUNT(CASE WHEN 'General' AND Setting = 'General Medical/Surgical Hospital' then 1 ELSE NULL END) as General 
	,COUNT(CASE WHEN 'Long Term Acute Care' AND Setting = 'Hospital w/ Hospital - LTAC' then 1 ELSE NULL END) as Hosp_LT_Acute_Care
 	,COUNT(CASE WHEN 'Long Term Acute Care' AND Setting = 'Long Term Acute Care Hospital' then 1 ELSE NULL END) as LT_Acute_Care_Hosp
 	,COUNT(CASE WHEN 'Mental Health' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Mental_Health
 	,COUNT(CASE WHEN 'Oncology' AND Setting = 'Hospital w/ Hospital - Oncology' then 1 ELSE NULL END) as Hosp_Oncology
 	,COUNT(CASE WHEN 'Oncology' AND Setting = 'Oncology Specialty Hospital' then 1 ELSE NULL END) as Oncology_Spec
 	,COUNT(CASE WHEN 'Orthopedic' AND Setting = 'Hospital w/Hospital-Specialty Orthopedic' then 1 ELSE NULL END) as Hosp_Orthopedic
 	,COUNT(CASE WHEN 'Orthopedic' AND Setting = 'Specialty Orthopedic Hospital' then 1 ELSE NULL END) as Spec_Orthopedic
 	,COUNT(CASE WHEN 'Outpatient, Hospital, Emergency Room' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Emer
 	,COUNT(CASE WHEN 'Outpatient, Hospital, General' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Gen
 	,COUNT(CASE WHEN 'Psychiatric' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Psychiatric
 	,COUNT(CASE WHEN 'Rehabilitation' AND Setting = 'Hospital w/ Hospital - Rehabilitation' then 1 ELSE NULL END) as Hosp_Rehabilitation
 	,COUNT(CASE WHEN 'Rehabilitation' AND Setting = 'Physical Rehabilitation Hospital' then 1 ELSE NULL END) as Physical_Rehabilitation
 	,COUNT(CASE WHEN 'Rehabilitation and Physical Medicine' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Rehabilitation_Med
 	,COUNT(CASE WHEN 'Surgical' AND Setting = 'Hospital w/ Hospital - Specialty Surgery' then 1 ELSE NULL END) as Hosp_Surgical
 	,COUNT(CASE WHEN 'Surgical' AND Setting = 'Specialty Surgery Hospital' then 1 ELSE NULL END) as Spec_Surgical
 	,COUNT(CASE WHEN 'Swing' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Swing
 	,COUNT(CASE WHEN 'Teaching' And Setting = 'Teaching' then 1 ELSE NULL END) as Teaching
FROM Main_Sites
GROUP BY Main_Site_ID
 
 
# select * from Main_Sites where Main_Site_ID = 16947
 
# select distinct Volume_Name, Setting from Main_Sites;
SELECT 
	Main_Site_ID
	,COUNT(CASE WHEN 'Academic' AND Setting = 'Academic' then 1 ELSE NULL END) as Academic
	,COUNT(CASE WHEN 'Acute Care Only' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Acute_Care
 	,COUNT(CASE WHEN 'Addiction, Opioid Treatment/Methadone' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addiction_Opiod
 	,COUNT(CASE WHEN 'Addictions, General' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addictions
 	,COUNT(CASE WHEN 'Cardiac' AND Setting = 'Hospital w/ Hospital - Specialty Cardiac' then 1 ELSE NULL END) as Hosp_Spec_Cardiac
 	,COUNT(CASE WHEN 'Cardiac' AND Setting = 'Specialty Cardiac Hospital' then 1 ELSE NULL END) as Spec_Cardiac
 	,COUNT(CASE WHEN 'Children\'s' AND Setting = 'Hospital w/ Hospital - Childrens' THEN 1 ELSE NULL END) as Hosp_Children
 	,COUNT(CASE WHEN 'Children\'s' AND Setting = 'Pediatric Specialty Hospital' THEN 1 ELSE NULL END) as Spec_Children
	,COUNT(CASE WHEN 'Eating Disorders' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Eating
	,COUNT(CASE Volume_Name WHEN 'General' AND Setting = 'General Medical/Surgical Hospital' then 1 ELSE NULL END) as General 
	,COUNT(CASE Volume_Name WHEN 'Long Term Acute Care' AND Setting = 'Hospital w/ Hospital - LTAC' then 1 ELSE NULL END) as Hosp_LT_Acute_Care
 	,COUNT(CASE Volume_Name WHEN 'Long Term Acute Care' AND Setting = 'Long Term Acute Care Hospital' then 1 ELSE NULL END) as LT_Acute_Care_Hosp
 	,COUNT(CASE Volume_Name WHEN 'Mental Health' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Mental_Health
 	,COUNT(CASE Volume_Name WHEN 'Oncology' AND Setting = 'Hospital w/ Hospital - Oncology' then 1 ELSE NULL END) as Hosp_Oncology
 	,COUNT(CASE Volume_Name WHEN 'Oncology' AND Setting = 'Oncology Specialty Hospital' then 1 ELSE NULL END) as Oncology_Spec
 	,COUNT(CASE Volume_Name WHEN 'Orthopedic' AND Setting = 'Hospital w/Hospital-Specialty Orthopedic' then 1 ELSE NULL END) as Hosp_Orthopedic
 	,COUNT(CASE Volume_Name WHEN 'Orthopedic' AND Setting = 'Specialty Orthopedic Hospital' then 1 ELSE NULL END) as Spec_Orthopedic
 	,COUNT(CASE Volume_Name WHEN 'Outpatient, Hospital, Emergency Room' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Emer
 	,COUNT(CASE Volume_Name WHEN 'Outpatient, Hospital, General' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Gen
 	,COUNT(CASE Volume_Name WHEN 'Psychiatric' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Psychiatric
 	,COUNT(CASE Volume_Name WHEN 'Rehabilitation' AND Setting = 'Hospital w/ Hospital - Rehabilitation' then 1 ELSE NULL END) as Hosp_Rehabilitation
 	,COUNT(CASE Volume_Name WHEN 'Rehabilitation' AND Setting = 'Physical Rehabilitation Hospital' then 1 ELSE NULL END) as Physical_Rehabilitation
 	,COUNT(CASE Volume_Name WHEN 'Rehabilitation and Physical Medicine' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Rehabilitation_Med
 	,COUNT(CASE Volume_Name WHEN 'Surgical' AND Setting = 'Hospital w/ Hospital - Specialty Surgery' then 1 ELSE NULL END) as Hosp_Surgical
 	,COUNT(CASE Volume_Name WHEN 'Surgical' AND Setting = 'Specialty Surgery Hospital' then 1 ELSE NULL END) as Spec_Surgical
 	,COUNT(CASE Volume_Name WHEN 'Swing' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Swing
 	,COUNT(CASE Volume_Name WHEN 'Teaching' And Setting = 'Teaching' then 1 ELSE NULL END) as Teaching
FROM Main_Sites
GROUP BY Main_Site_ID
 
 
# select * from Main_Sites where Main_Site_ID = 16947
 
# select distinct Volume_Name, Setting from Main_Sites;
SELECT 
	Main_Site_ID
	,COUNT(CASE WHEN 'Academic' AND Setting = 'Academic' then Volume_Name ELSE NULL END) as Academic
	,COUNT(CASE WHEN 'Acute Care Only' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Acute_Care
 	,COUNT(CASE WHEN 'Addiction, Opioid Treatment/Methadone' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addiction_Opiod
 	,COUNT(CASE WHEN 'Addictions, General' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addictions
 	,COUNT(CASE WHEN 'Cardiac' AND Setting = 'Hospital w/ Hospital - Specialty Cardiac' then 1 ELSE NULL END) as Hosp_Spec_Cardiac
 	,COUNT(CASE Volume_Name WHEN 'Cardiac' AND Setting = 'Specialty Cardiac Hospital' then 1 ELSE NULL END) as Spec_Cardiac
 	,COUNT(CASE Volume_Name WHEN 'Children\'s' AND Setting = 'Hospital w/ Hospital - Childrens' THEN 1 ELSE NULL END) as Hosp_Children
 	,COUNT(CASE Volume_Name WHEN 'Children\'s' AND Setting = 'Pediatric Specialty Hospital' THEN 1 ELSE NULL END) as Spec_Children
	,COUNT(CASE Volume_Name WHEN 'Eating Disorders' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Eating
	,COUNT(CASE Volume_Name WHEN 'General' AND Setting = 'General Medical/Surgical Hospital' then 1 ELSE NULL END) as General 
	,COUNT(CASE Volume_Name WHEN 'Long Term Acute Care' AND Setting = 'Hospital w/ Hospital - LTAC' then 1 ELSE NULL END) as Hosp_LT_Acute_Care
 	,COUNT(CASE Volume_Name WHEN 'Long Term Acute Care' AND Setting = 'Long Term Acute Care Hospital' then 1 ELSE NULL END) as LT_Acute_Care_Hosp
 	,COUNT(CASE Volume_Name WHEN 'Mental Health' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Mental_Health
 	,COUNT(CASE Volume_Name WHEN 'Oncology' AND Setting = 'Hospital w/ Hospital - Oncology' then 1 ELSE NULL END) as Hosp_Oncology
 	,COUNT(CASE Volume_Name WHEN 'Oncology' AND Setting = 'Oncology Specialty Hospital' then 1 ELSE NULL END) as Oncology_Spec
 	,COUNT(CASE Volume_Name WHEN 'Orthopedic' AND Setting = 'Hospital w/Hospital-Specialty Orthopedic' then 1 ELSE NULL END) as Hosp_Orthopedic
 	,COUNT(CASE Volume_Name WHEN 'Orthopedic' AND Setting = 'Specialty Orthopedic Hospital' then 1 ELSE NULL END) as Spec_Orthopedic
 	,COUNT(CASE Volume_Name WHEN 'Outpatient, Hospital, Emergency Room' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Emer
 	,COUNT(CASE Volume_Name WHEN 'Outpatient, Hospital, General' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Gen
 	,COUNT(CASE Volume_Name WHEN 'Psychiatric' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Psychiatric
 	,COUNT(CASE Volume_Name WHEN 'Rehabilitation' AND Setting = 'Hospital w/ Hospital - Rehabilitation' then 1 ELSE NULL END) as Hosp_Rehabilitation
 	,COUNT(CASE Volume_Name WHEN 'Rehabilitation' AND Setting = 'Physical Rehabilitation Hospital' then 1 ELSE NULL END) as Physical_Rehabilitation
 	,COUNT(CASE Volume_Name WHEN 'Rehabilitation and Physical Medicine' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Rehabilitation_Med
 	,COUNT(CASE Volume_Name WHEN 'Surgical' AND Setting = 'Hospital w/ Hospital - Specialty Surgery' then 1 ELSE NULL END) as Hosp_Surgical
 	,COUNT(CASE Volume_Name WHEN 'Surgical' AND Setting = 'Specialty Surgery Hospital' then 1 ELSE NULL END) as Spec_Surgical
 	,COUNT(CASE Volume_Name WHEN 'Swing' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Swing
 	,COUNT(CASE Volume_Name WHEN 'Teaching' And Setting = 'Teaching' then 1 ELSE NULL END) as Teaching
FROM Main_Sites
GROUP BY Main_Site_ID
 
 
# select * from Main_Sites where Main_Site_ID = 16947
 
# select distinct Volume_Name, Setting from Main_Sites;
SELECT 
	Main_Site_ID
	,COUNT(CASE WHEN 'Academic' AND Setting = 'Academic' then Volume_Name ELSE NULL END) as Academic
	,COUNT(CASE Volume_Name WHEN 'Acute Care Only' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Acute_Care
 	,COUNT(CASE Volume_Name WHEN 'Addiction, Opioid Treatment/Methadone' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addiction_Opiod
 	,COUNT(CASE Volume_Name WHEN 'Addictions, General' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addictions
 	,COUNT(CASE Volume_Name WHEN 'Cardiac' AND Setting = 'Hospital w/ Hospital - Specialty Cardiac' then 1 ELSE NULL END) as Hosp_Spec_Cardiac
 	,COUNT(CASE Volume_Name WHEN 'Cardiac' AND Setting = 'Specialty Cardiac Hospital' then 1 ELSE NULL END) as Spec_Cardiac
 	,COUNT(CASE Volume_Name WHEN 'Children\'s' AND Setting = 'Hospital w/ Hospital - Childrens' THEN 1 ELSE NULL END) as Hosp_Children
 	,COUNT(CASE Volume_Name WHEN 'Children\'s' AND Setting = 'Pediatric Specialty Hospital' THEN 1 ELSE NULL END) as Spec_Children
	,COUNT(CASE Volume_Name WHEN 'Eating Disorders' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Eating
	,COUNT(CASE Volume_Name WHEN 'General' AND Setting = 'General Medical/Surgical Hospital' then 1 ELSE NULL END) as General 
	,COUNT(CASE Volume_Name WHEN 'Long Term Acute Care' AND Setting = 'Hospital w/ Hospital - LTAC' then 1 ELSE NULL END) as Hosp_LT_Acute_Care
 	,COUNT(CASE Volume_Name WHEN 'Long Term Acute Care' AND Setting = 'Long Term Acute Care Hospital' then 1 ELSE NULL END) as LT_Acute_Care_Hosp
 	,COUNT(CASE Volume_Name WHEN 'Mental Health' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Mental_Health
 	,COUNT(CASE Volume_Name WHEN 'Oncology' AND Setting = 'Hospital w/ Hospital - Oncology' then 1 ELSE NULL END) as Hosp_Oncology
 	,COUNT(CASE Volume_Name WHEN 'Oncology' AND Setting = 'Oncology Specialty Hospital' then 1 ELSE NULL END) as Oncology_Spec
 	,COUNT(CASE Volume_Name WHEN 'Orthopedic' AND Setting = 'Hospital w/Hospital-Specialty Orthopedic' then 1 ELSE NULL END) as Hosp_Orthopedic
 	,COUNT(CASE Volume_Name WHEN 'Orthopedic' AND Setting = 'Specialty Orthopedic Hospital' then 1 ELSE NULL END) as Spec_Orthopedic
 	,COUNT(CASE Volume_Name WHEN 'Outpatient, Hospital, Emergency Room' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Emer
 	,COUNT(CASE Volume_Name WHEN 'Outpatient, Hospital, General' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Gen
 	,COUNT(CASE Volume_Name WHEN 'Psychiatric' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Psychiatric
 	,COUNT(CASE Volume_Name WHEN 'Rehabilitation' AND Setting = 'Hospital w/ Hospital - Rehabilitation' then 1 ELSE NULL END) as Hosp_Rehabilitation
 	,COUNT(CASE Volume_Name WHEN 'Rehabilitation' AND Setting = 'Physical Rehabilitation Hospital' then 1 ELSE NULL END) as Physical_Rehabilitation
 	,COUNT(CASE Volume_Name WHEN 'Rehabilitation and Physical Medicine' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Rehabilitation_Med
 	,COUNT(CASE Volume_Name WHEN 'Surgical' AND Setting = 'Hospital w/ Hospital - Specialty Surgery' then 1 ELSE NULL END) as Hosp_Surgical
 	,COUNT(CASE Volume_Name WHEN 'Surgical' AND Setting = 'Specialty Surgery Hospital' then 1 ELSE NULL END) as Spec_Surgical
 	,COUNT(CASE Volume_Name WHEN 'Swing' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Swing
 	,COUNT(CASE Volume_Name WHEN 'Teaching' And Setting = 'Teaching' then 1 ELSE NULL END) as Teaching
FROM Main_Sites
GROUP BY Main_Site_ID
 
 
# select * from Main_Sites where Main_Site_ID = 16947
 
# select distinct Volume_Name, Setting from Main_Sites;
SELECT 
	Main_Site_ID
	,COUNT(CASE Volume_Name WHEN 'Academic' AND Setting = 'Academic' then Volume_Name ELSE NULL END) as Academic
	,COUNT(CASE Volume_Name WHEN 'Acute Care Only' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Acute_Care
 	,COUNT(CASE Volume_Name WHEN 'Addiction, Opioid Treatment/Methadone' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addiction_Opiod
 	,COUNT(CASE Volume_Name WHEN 'Addictions, General' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addictions
 	,COUNT(CASE Volume_Name WHEN 'Cardiac' AND Setting = 'Hospital w/ Hospital - Specialty Cardiac' then 1 ELSE NULL END) as Hosp_Spec_Cardiac
 	,COUNT(CASE Volume_Name WHEN 'Cardiac' AND Setting = 'Specialty Cardiac Hospital' then 1 ELSE NULL END) as Spec_Cardiac
 	,COUNT(CASE Volume_Name WHEN 'Children\'s' AND Setting = 'Hospital w/ Hospital - Childrens' THEN 1 ELSE NULL END) as Hosp_Children
 	,COUNT(CASE Volume_Name WHEN 'Children\'s' AND Setting = 'Pediatric Specialty Hospital' THEN 1 ELSE NULL END) as Spec_Children
	,COUNT(CASE Volume_Name WHEN 'Eating Disorders' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Eating
	,COUNT(CASE Volume_Name WHEN 'General' AND Setting = 'General Medical/Surgical Hospital' then 1 ELSE NULL END) as General 
	,COUNT(CASE Volume_Name WHEN 'Long Term Acute Care' AND Setting = 'Hospital w/ Hospital - LTAC' then 1 ELSE NULL END) as Hosp_LT_Acute_Care
 	,COUNT(CASE Volume_Name WHEN 'Long Term Acute Care' AND Setting = 'Long Term Acute Care Hospital' then 1 ELSE NULL END) as LT_Acute_Care_Hosp
 	,COUNT(CASE Volume_Name WHEN 'Mental Health' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Mental_Health
 	,COUNT(CASE Volume_Name WHEN 'Oncology' AND Setting = 'Hospital w/ Hospital - Oncology' then 1 ELSE NULL END) as Hosp_Oncology
 	,COUNT(CASE Volume_Name WHEN 'Oncology' AND Setting = 'Oncology Specialty Hospital' then 1 ELSE NULL END) as Oncology_Spec
 	,COUNT(CASE Volume_Name WHEN 'Orthopedic' AND Setting = 'Hospital w/Hospital-Specialty Orthopedic' then 1 ELSE NULL END) as Hosp_Orthopedic
 	,COUNT(CASE Volume_Name WHEN 'Orthopedic' AND Setting = 'Specialty Orthopedic Hospital' then 1 ELSE NULL END) as Spec_Orthopedic
 	,COUNT(CASE Volume_Name WHEN 'Outpatient, Hospital, Emergency Room' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Emer
 	,COUNT(CASE Volume_Name WHEN 'Outpatient, Hospital, General' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Gen
 	,COUNT(CASE Volume_Name WHEN 'Psychiatric' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Psychiatric
 	,COUNT(CASE Volume_Name WHEN 'Rehabilitation' AND Setting = 'Hospital w/ Hospital - Rehabilitation' then 1 ELSE NULL END) as Hosp_Rehabilitation
 	,COUNT(CASE Volume_Name WHEN 'Rehabilitation' AND Setting = 'Physical Rehabilitation Hospital' then 1 ELSE NULL END) as Physical_Rehabilitation
 	,COUNT(CASE Volume_Name WHEN 'Rehabilitation and Physical Medicine' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Rehabilitation_Med
 	,COUNT(CASE Volume_Name WHEN 'Surgical' AND Setting = 'Hospital w/ Hospital - Specialty Surgery' then 1 ELSE NULL END) as Hosp_Surgical
 	,COUNT(CASE Volume_Name WHEN 'Surgical' AND Setting = 'Specialty Surgery Hospital' then 1 ELSE NULL END) as Spec_Surgical
 	,COUNT(CASE Volume_Name WHEN 'Swing' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Swing
 	,COUNT(CASE Volume_Name WHEN 'Teaching' And Setting = 'Teaching' then 1 ELSE NULL END) as Teaching
FROM Main_Sites
GROUP BY Main_Site_ID
 
 
# select * from Main_Sites where Main_Site_ID = 16947
 
# select distinct Volume_Name, Setting from Main_Sites;
SELECT 
	Main_Site_ID
	,COUNT(CASE Volume_Name WHEN 'Academic' AND Setting = 'Academic' then 1 ELSE NULL END) as Academic
	,COUNT(CASE Volume_Name WHEN 'Acute Care Only' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Acute_Care
 	,COUNT(CASE Volume_Name WHEN 'Addiction, Opioid Treatment/Methadone' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addiction_Opiod
 	,COUNT(CASE Volume_Name WHEN 'Addictions, General' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addictions
 	,COUNT(CASE Volume_Name WHEN 'Cardiac' AND Setting = 'Hospital w/ Hospital - Specialty Cardiac' then 1 ELSE NULL END) as Hosp_Spec_Cardiac
 	,COUNT(CASE Volume_Name WHEN 'Cardiac' AND Setting = 'Specialty Cardiac Hospital' then 1 ELSE NULL END) as Spec_Cardiac
 	,COUNT(CASE Volume_Name WHEN 'Children\'s' AND Setting = 'Hospital w/ Hospital - Childrens' THEN 1 ELSE NULL END) as Hosp_Children
 	,COUNT(CASE Volume_Name WHEN 'Children\'s' AND Setting = 'Pediatric Specialty Hospital' THEN 1 ELSE NULL END) as Spec_Children
	,COUNT(CASE Volume_Name WHEN 'Eating Disorders' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Eating
	,COUNT(CASE Volume_Name WHEN 'General' AND Setting = 'General Medical/Surgical Hospital' then 1 ELSE NULL END) as General 
	,COUNT(CASE Volume_Name WHEN 'Long Term Acute Care' AND Setting = 'Hospital w/ Hospital - LTAC' then 1 ELSE NULL END) as Hosp_LT_Acute_Care
 	,COUNT(CASE Volume_Name WHEN 'Long Term Acute Care' AND Setting = 'Long Term Acute Care Hospital' then 1 ELSE NULL END) as LT_Acute_Care_Hosp
 	,COUNT(CASE Volume_Name WHEN 'Mental Health' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Mental_Health
 	,COUNT(CASE Volume_Name WHEN 'Oncology' AND Setting = 'Hospital w/ Hospital - Oncology' then 1 ELSE NULL END) as Hosp_Oncology
 	,COUNT(CASE Volume_Name WHEN 'Oncology' AND Setting = 'Oncology Specialty Hospital' then 1 ELSE NULL END) as Oncology_Spec
 	,COUNT(CASE Volume_Name WHEN 'Orthopedic' AND Setting = 'Hospital w/Hospital-Specialty Orthopedic' then 1 ELSE NULL END) as Hosp_Orthopedic
 	,COUNT(CASE Volume_Name WHEN 'Orthopedic' AND Setting = 'Specialty Orthopedic Hospital' then 1 ELSE NULL END) as Spec_Orthopedic
 	,COUNT(CASE Volume_Name WHEN 'Outpatient, Hospital, Emergency Room' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Emer
 	,COUNT(CASE Volume_Name WHEN 'Outpatient, Hospital, General' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Gen
 	,COUNT(CASE Volume_Name WHEN 'Psychiatric' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Psychiatric
 	,COUNT(CASE Volume_Name WHEN 'Rehabilitation' AND Setting = 'Hospital w/ Hospital - Rehabilitation' then 1 ELSE NULL END) as Hosp_Rehabilitation
 	,COUNT(CASE Volume_Name WHEN 'Rehabilitation' AND Setting = 'Physical Rehabilitation Hospital' then 1 ELSE NULL END) as Physical_Rehabilitation
 	,COUNT(CASE Volume_Name WHEN 'Rehabilitation and Physical Medicine' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Rehabilitation_Med
 	,COUNT(CASE Volume_Name WHEN 'Surgical' AND Setting = 'Hospital w/ Hospital - Specialty Surgery' then 1 ELSE NULL END) as Hosp_Surgical
 	,COUNT(CASE Volume_Name WHEN 'Surgical' AND Setting = 'Specialty Surgery Hospital' then 1 ELSE NULL END) as Spec_Surgical
 	,COUNT(CASE Volume_Name WHEN 'Swing' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Swing
 	,COUNT(CASE Volume_Name WHEN 'Teaching' And Setting = 'Teaching' then 1 ELSE NULL END) as Teaching
FROM Main_Sites
GROUP BY Main_Site_ID
 
 
# select * from Main_Sites where Main_Site_ID = 16947
 
# select distinct Volume_Name, Setting from Main_Sites;
select distinct Volume_Name, Setting from Main_Sites;
SELECT 
	Main_Site_ID
	,COUNT(CASE Volume_Name WHEN 'Academic' AND Setting = 'Academic' then 1 ELSE NULL END) as Academic
	,COUNT(CASE Volume_Name WHEN 'Acute Care Only' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Acute_Care
	,COUNT(CASE Volume_Name WHEN 'Rehabilitation and Physical Medicine' then 1 ELSE NULL END) as Rehab_Phys_Med
 	,COUNT(CASE Volume_Name WHEN 'Addiction, Opioid Treatment/Methadone' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addiction_Opiod
 	,COUNT(CASE Volume_Name WHEN 'Addictions, General' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addictions
 	,COUNT(CASE Volume_Name WHEN 'Cardiac' AND Setting = 'Hospital w/ Hospital - Specialty Cardiac' then 1 ELSE NULL END) as Hosp_Spec_Cardiac
 	,COUNT(CASE Volume_Name WHEN 'Cardiac' AND Setting = 'Specialty Cardiac Hospital' then 1 ELSE NULL END) as Spec_Cardiac
 	,COUNT(CASE Volume_Name WHEN 'Children\'s' AND Setting = 'Hospital w/ Hospital - Childrens' THEN 1 ELSE NULL END) as Hosp_Children
 	,COUNT(CASE Volume_Name WHEN 'Children\'s' AND Setting = 'Pediatric Specialty Hospital' THEN 1 ELSE NULL END) as Spec_Children
	,COUNT(CASE Volume_Name WHEN 'Eating Disorders' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Eating
	,COUNT(CASE Volume_Name WHEN 'General' AND Setting = 'General Medical/Surgical Hospital' then 1 ELSE NULL END) as General 
	,COUNT(CASE Volume_Name WHEN 'Long Term Acute Care' AND Setting = 'Hospital w/ Hospital - LTAC' then 1 ELSE NULL END) as Hosp_LT_Acute_Care
 	,COUNT(CASE Volume_Name WHEN 'Long Term Acute Care' AND Setting = 'Long Term Acute Care Hospital' then 1 ELSE NULL END) as LT_Acute_Care_Hosp
 	,COUNT(CASE Volume_Name WHEN 'Mental Health' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Mental_Health
 	,COUNT(CASE Volume_Name WHEN 'Oncology' AND Setting = 'Hospital w/ Hospital - Oncology' then 1 ELSE NULL END) as Hosp_Oncology
 	,COUNT(CASE Volume_Name WHEN 'Oncology' AND Setting = 'Oncology Specialty Hospital' then 1 ELSE NULL END) as Oncology_Spec
 	,COUNT(CASE Volume_Name WHEN 'Orthopedic' AND Setting = 'Hospital w/Hospital-Specialty Orthopedic' then 1 ELSE NULL END) as Hosp_Orthopedic
 	,COUNT(CASE Volume_Name WHEN 'Orthopedic' AND Setting = 'Specialty Orthopedic Hospital' then 1 ELSE NULL END) as Spec_Orthopedic
 	,COUNT(CASE Volume_Name WHEN 'Outpatient, Hospital, Emergency Room' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Emer
 	,COUNT(CASE Volume_Name WHEN 'Outpatient, Hospital, General' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Gen
 	,COUNT(CASE Volume_Name WHEN 'Psychiatric' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Psychiatric
 	,COUNT(CASE Volume_Name WHEN 'Rehabilitation' AND Setting = 'Hospital w/ Hospital - Rehabilitation' then 1 ELSE NULL END) as Hosp_Rehabilitation
 	,COUNT(CASE Volume_Name WHEN 'Rehabilitation' AND Setting = 'Physical Rehabilitation Hospital' then 1 ELSE NULL END) as Physical_Rehabilitation
 	,COUNT(CASE Volume_Name WHEN 'Rehabilitation and Physical Medicine' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Rehabilitation_Med
 	,COUNT(CASE Volume_Name WHEN 'Surgical' AND Setting = 'Hospital w/ Hospital - Specialty Surgery' then 1 ELSE NULL END) as Hosp_Surgical
 	,COUNT(CASE Volume_Name WHEN 'Surgical' AND Setting = 'Specialty Surgery Hospital' then 1 ELSE NULL END) as Spec_Surgical
 	,COUNT(CASE Volume_Name WHEN 'Swing' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Swing
 	,COUNT(CASE Volume_Name WHEN 'Teaching' And Setting = 'Teaching' then 1 ELSE NULL END) as Teaching
FROM Main_Sites
GROUP BY Main_Site_ID;
select * from Main_Sites where Main_Site_ID = 16947