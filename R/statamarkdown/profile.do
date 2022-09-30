**************************
* profile.do Ined        *
* M.Thevenin Ined-SMS    *
**************************

*****************************
* ado + et personal dans D: *
***************************** 
sysdir set PLUS "D:\D\ado\plus\"
sysdir set PERSONAL "D:\D\ado\personal\"

****************
** STATA_TEMP **
****************

cd "D:\D\stata_temp\"

****************
** USER REP   **
****************
global user "C:\Users\thevenin_m\"

*************************************************
* affichage du contenu du repertoire stata_temp *
*************************************************
*noisily display as txt    "------------------------------------"
*noisily display as result "  Contenu du repertoire stata_temp  "
*noisily display as txt    "------------------------------------"
*noisily dir "D:/D/stata_temp/"

*************************************************
* chargement du répertoire  $tmp dans stata_temp *
*************************************************
*noisily display as result "Librairie temporaire tmp chargee dans D:stata_temp/"
global tmp "D:\D\stata_temp\"

*******************************************************
* chargement du répertoire  $sg dans stata_temp/graph *
*******************************************************
*noisily display as result "Enregistrement des graphs dans D:stata_temp/graph/ avec macro sg"
*global sg "D:/stata_temp/graph/"

******************************************
* Creation automatique d'un fichier .log *
******************************************
capture log close statalog
local cdt = "`c(current_date)'"
local cdt: subinstr local cdt " " "-", all
local cti = "`c(current_time)'"
local cti: subinstr local cti ":" ".", all
local statalogname "statalog_`cdt'_`cti'.log"
*noisily display "Creation d'un fichier log dans D:/stata_temp/log/"
*noisily display "Nom du log: `statalogname'"
log using "D:/D/stata_temp/log/`statalogname'" , text name(statalog)
*noisily display ""

*****************
* R source path *
*****************
*global Rterm_path `"C:\Program Files\R\R-3.4.3\bin\R.exe"'
*global Rterm_options `"--slave --vanilla --args  "`tf1'" "`tf2'" "'


***************************************************
* supprimer le blocage du défilement  de l'output *
***************************************************
set more off

*******************************
* output regression           *
*******************************

* format decimale
set cformat %9.3f
* garder baselevel
set showbaselevels on

*******************************
* graphique                   *
*******************************

grstyle init
grstyle set imesh
grstyle set legend 11, nobox
grstyle set color tableau

*** timer
set rmsg  off , permanently

****** plugin miniconda

python:
import os
os.environ['QT_QPA_PLATFORM_PLUGIN_PATH']="C:\\Users\\thevenin_m\\Miniconda3\\Library\\plugins\\plugins"
end

sysuse auto, clear
