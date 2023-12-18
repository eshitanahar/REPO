CREATE OR REPLACE FORCE VIEW EMOB.VW_ALL_ZONE
(UNION_ID, UNION_CODE, UNION_NAME, UPAZILA_ID, UPAZILA_CODE, 
 UPAZILA_NAME, DISTRICT_ID, DISTRICT_CODE, DISTRICT_NAME, ASSIGN_BANK_CODE, 
 DIVISION_CODE, DIVISION_NAME)
BEQUEATH DEFINER
AS 
SELECT                        ------            --B.WARD_CODE_GOV ward_id,
           -- B.WARD_CODE,
           --B.WARD_NAME,
           C.UNION_CODE_GOV    union_id,
           C.UNION_CODE,
           c.union_name,
           D.UPAZILA_CODE_GOV  upazila_id,
           D.UPAZILA_CODE,
           D.UPAZILA_NAME,
           E.DISTRICT_CODE_GOV district_id,
           E.DISTRICT_CODE,
           E.DISTRICT_NAME,
           E.ASSIGN_BANK_CODE,
           F.DIVISION_CODE,
           F.DIVISION_NAME
      FROM                                                     -- ward_info b,
           union_info     c,
           upazila_info   d,
           district_info  e,
           division_info  f
     WHERE --b.DIVISION_CODE || b.DISTRICT_CODE || b.UPAZILA_CODE || b.UNION_CODE = c.DIVISION_CODE || c.DISTRICT_CODE || c.UPAZILA_CODE || c.UNION_CODE
               c.DIVISION_CODE || c.DISTRICT_CODE || c.UPAZILA_CODE =
               d.DIVISION_CODE || d.DISTRICT_CODE || d.UPAZILA_CODE
           AND c.DIVISION_CODE || c.DISTRICT_CODE =
               e.DIVISION_CODE || e.DISTRICT_CODE
           AND c.DIVISION_CODE = f.DIVISION_CODE
/
