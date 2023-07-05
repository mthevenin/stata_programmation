

** Append

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
	
	
	
** Merge

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



















	
 
