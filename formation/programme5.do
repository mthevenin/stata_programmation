

sysuse auto, clear
describe

compress 

sysuse auto, clear
des make 
list make in 1/10
recast str3 make, force
des make
list make in 1/10

format %format varlist
list gear_ratio in 1/10
format %6.0f gear_ratio

sum gear_ratio
sum gear_ratio, d
sum gear_ratio format
sum gear_ratio, d format


tostring foreign, gen(foreign_str)
des foreign foreign_str
tab foreign foreign_str

decode foreign, gen(foreign_str)
des foreign foreign_str
tab foreign_str


tostring rep78, replace
destring rep78, replace


encode foreign_str, gen(foreign2)
tab foreign2
tab foreign2, nolab

gen rep2 = rep78>3 & rep78<.
replace rep2 = . if rep78==.
tab rep78 rep2

tab foreign, gen(origine)
des origine1 origine2
tab origine1 foreign
tab origine2 foreign


egen mprice = mean(price)
list  make price mprice in 1/10

bysort foreign: egen mprice_or = mean(price)
list  make price mprice in 1/5
list  make price mprice in 66/70

gen x = 1 
gen id = sum(x)
list id make in 1/5
list id make in 66/70

egen N = total(x)
list id N make in 1/5
list id N make in 66/70












