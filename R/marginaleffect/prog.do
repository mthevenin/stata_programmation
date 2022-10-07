keep female black region highbp bmi hsizgp  hlthstat

label drop hlth 

export delimited using "D:\D\Marc\SMS\STATA INED\Programmation\R\marginaleffect\nhanes.csv", replace

use "D:\D\Marc\SMS\STATA INED\Programmation\R\marginaleffect\nhanes.dta", clear

logit highbp female black bmi 
margins, dydx(*)

ologit hlthstat female black bmi 
brant, detail

margins, dydx(female) 
margins, dydx(*) predict(pr outcome(5))

qui mlogit hlthstat female black bmi 
margins, dydx(*) predict(pr outcome(5))

slogit hlthstat female black bmi , dim(1)
margins, dydx(*) predict(pr outcome(1))


tab highbp female

tab highbp female, chi2

logit highbp















