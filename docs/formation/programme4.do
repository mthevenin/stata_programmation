
sysuse auto, clear

webuse set  "https://raw.githubusercontent.com//mthevenin/stata_graphiques/master/ressources/gjoint"
webuse "logement.dta", clear
webuse set


sysuse auto, clear  
save auto, replace


* exportation csv
export delimited using "D:\D\stata_temp\export_csv.csv", replace

* exportation xls
export excel using "D:\D\stata_temp\export_excel.xls", firstrow(variables) replace

* importation cxv
import delimited "D:\D\stata_temp\export_csv.csv",  clear


* importation xls
import excel "D:\D\stata_temp\export_excel.xls", sheet("Sheet1") firstrow clear

***********************

sysuse auto.dta, clear

des

describe using  https://www.stata-press.com/data/r17/census2.dta

list price mpg turn foreign in 1/10

labelbook  origin
label list origin


***********************

sort price
gsort + foreign - price  


order foreign, first
order rep78, after(foreign)

des

**********************


sum price
sum 
sum price length, d
bysort foreign: sum price, d

qui sum price, d
return list

mean price  
mean price, over(foreign)
mean price, over(foreign rep78)

tabstat price  
tabstat price mpg, by(foreign)

tabstat price mpg, by(foreign) stat(mean median)


*********************

capt ssc install violinplot  
capt ssc install hexplot
capt net install gjoint, from("https://raw.githubusercontent.com/mthevenin/stata_graphiques/master/ressources/gjoint/") replace


graph hbox mpg, 
graph hbox mpg, over(foreign)   

histogram mpg, percent 
histogram mpg, percent by(foreign)


violinplot mpg, fill
violinplot mpg, nobox over(foreign) left overlay nomedian  dscale(.) 
violinplot mpg, fill over(foreign)
violinplot mpg, fill split(foreign) horizontal

hexplot price mpg, colors(flare)  p(lc(black) lw(*.5))
gjoint price mpg, palette(flare)


*********************

capt ssc install catplot
capt ssc install fre
capt ssc install tabm // pas d'application avec la base


tab rep78, mis
tab rep78, mis sort 
tab rep78 foreign, nolab mis

fre rep78 

tabsort rep78

capt ssc install catplot

catplot rep78, percent 
catplot rep78, percent over(foreign)


**********************

* Intoduction frame

frame dir

sysuse auto, clear

frame dir

frame rename default auto

frame dir

frame copy  auto prix
frame dir
frame prix: keep price foreign

frame change prix

frame prix {
des
sum		
}

frame auto: drop make

frame change auto

frame drop prix

*frame drop auto  //erreur car frame active

frame reset
frame dir
