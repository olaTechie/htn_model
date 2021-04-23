set more off

use ../lmicHTN/Data/htn_overall, clear

// #delimit ;
// recode fuel 
// (5 6 7 8=1 "air_pol")
// (1 2 3 4 9 10 11 12 13 14 95 96=0 "no_airpol"), gen(airp)
// ;
// #delimit cr

// recode marital (0 = 1 "Never married") (1 2 = 2 "Currently married") ( 3 4 5 = 3 "Formerly married"), gen(marital_cat)

/*
keep htn country commune idn cons strata psu wt age10 year sex education wealth3 notwork marital_cat dec3 rc_tobc_any bmi_cat media_access smoke airp rc_hins_any money_problem  com_poverty_hl com_illit_hl com_uemp_hl com_diversity_hl com_rural_hl hdi* com_zses*

*/
*** Descriptive statistics
*drop if country == "India"
drop female
drop bmi
gen female = (sex == 2)
_strip_labels airp

drop marital
ren hdi3 hsi 
ren com_zses3 com
ren marital_cat  marital
ren bmi_cat bmi
ren media_access media
ren rc_hins_any hins

label define cat 1 "Low" 2 "Moderate" 3 "High"

label values com cat 

label values hdi  cat 


keep htn female education wealth  marital  bmi media airp hins money_problem smoke  com hdi

order htn female education wealth  marital  bmi media airp hins money_problem smoke  com hdi

outsheet using df.csv, replace comma


exit
