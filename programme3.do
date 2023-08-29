
sysuse auto, clear

tabulate rep78 foreign, nofreq row

bysort foreign: summarize price if rep78!=1, detail


**********************************************************

**** Si R installé et chemin vers exécutable R renseigné
**** Installation de rsource requise

capt ssc install rsource 

* renseigne le chemin d'accès à R dans la ligne squi suit
* global Rterm_path    `"path/R.exe"'
* global Rterm_options `"--vanilla"'


* exécuter en un bloc de rsource à END_OF_R

rsource, terminator(END_OF_R) 

library(readr)
trans <- read.csv("https://raw.githubusercontent.com/mthevenin/analyse_duree/master/bases/transplantation.csv")

head(trans)
table(trans$died)

END_OF_R

********************************************************

* Python doit être installé" 
* Le chemin d'accès à Python doit être vérifié, voire renseigné
* help python

python query  // vérification accroche de Python


python: 

a = 4
b = 2
a*b
 
end

python:
import pandas as pd
trans = pd.read_csv("https://raw.githubusercontent.com/mthevenin/analyse_duree/master/bases/transplantation.csv")

trans.head(10)
trans.info()
end


*****************************************************

mdesc
mvpatterns
misschk


****************************************************

tab rep78
qui tab rep78


di exp(1)/(1+exp(1))
di "SALUT!!!!"

sum t*

***************************************************


local a = 2

di `a'
di 5^(`a')


local var mpg foreign

di "`var`"
mac list _var

sum `var'
regress price `var'

global var mpg weight length turn

di "$var"
mac list var

sum $var
reg price $var

macro drop var


qui sum price

return list

local mprice = r(mean)
di `mprice'



local var mpg headroom trunk
foreach x of local var {
regress price foreign `x', noheader
}










