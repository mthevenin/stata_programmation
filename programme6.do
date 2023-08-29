

*************
** Fusion  **
*************

** Append **

clear
		  
input str6 id v1 v2
  "A" 8 2 
  "B" 1 2 
  "C" 2 4
    end
save base1, replace

clear 

		  
input str20 id v1 v2 v3
  "D" 2 5 10
  "E" 12 1 8 
    end
save base2, replace


append using base1	
sort id


use base1, clear
append using base2, keep(id v1 v2)
	
	
	
** Merge **

** merge 1:1	
	
clear 
input str6 id v1	
"A" 8
"B" 1
"C" 2
"D" 2
"E" 12
end
save v1, replace

clear 
input str6 id v2	
"A" 2
"B" 2
"C" 4
"D" 5
"E" 1
end
save v2, replace
	
clear 
input str6 id v3	
"A" .
"B" .
"C" .
"D" 10
"E" 8
end

*append using v1 v2
*order id v1 v2 v3
*list


clear 
input str1 id v1 v2 
"A" 8 2 
"B" 1 2
"C" 2 4 
end
list

sort id
save base1, replace


clear
input str1 id v3 
"B" 10 
"C" 8
"D" 10 
end
list 
sort id
save base2, replace 


merge 1:1 id using base1


clear
input str1 id str3  v4 

"A" "Non" 
"B" "Oui" 
"C" "Oui" 
end
list 

sort id

merge id using base1 base2

order id v1 v2 v3 v4 _merge1 _merge2 _merge 
tab _merge1
tab _merge2
tab _merge


** merge 1:m ou merge m:1	


clear 
input id périodes str8 Activité
1 1 "Emploi"
1 2 "Emploi"
1 3 "Chômage"
2 1 "Chômage" 
2 2 "Chômage"
2 3 "Emploi"
2 4 "Chômage" 
end 
list 
sort id 
save "period_act", replace

clear
input id str6 sexe 
1 "Homme"  
2 "Femme"  
end 
list
sort id 
save "sexe", replace


*merge 1:1 id using activités
/*
variable id does not uniquely identify observations in the using data
r(459);

*/

merge 1:m id using period_act


use sexe, clear
merge id using period_act
sort id périodes
list


*** Merge avec frame
frame reset

frame create period_act
frame period_act: use period_act
frame create sexe
frame sexe: use sexe

frame change period_act

frlink m:1 id, frame(sexe) gen(link)
frget sexe , from(link)

frame period_act: order link, last
list



* frame et merge=2
frame create tvc
frame change tvc
frame tvc {
input id périodes tvc
1 1 0
1 2 0
1 3 1
1 4 0
2 1 1 
2 2 0 
end 

list

}

frame change period_act
frlink 1:1 id périodes, frame(tvc) gen(link2)

frget tvc, from(link2)
list


use tvc, clear
sort id périodes
save tvc, replace
use period_act, clear
sort id périodes
merge 1:1 id périodes using tvc
sort id périodes
list


** fonction frval pour opérations sur bases contextuelle

frame reset 

clear 
input id str6 zone x
1 "zoneA" 10
2 "zoneA" 15
3 "zoneB" 9
4 "zoneB" 12
5 "zoneB" 10
6 "zoneB" 15
7 "zoneC" 6
8 "zoneC" 13
9 "zoneC" 16
end
save indiv, replace

clear
input str6 zone xmean
"zoneA" 11
"zoneB" 12
"zoneC" 13
end
save zone, replace

frame create indiv
frame indiv: use indiv
frame create zone
frame zone: use zone

frame change indiv
frlink m:1 zone, frame(zone) gen(link)
list

gen diffx = x - frval(link, xmean)
list



*******************
** Transposition **
*******************







































	
 
