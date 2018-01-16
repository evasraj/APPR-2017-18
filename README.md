# Analiza podatkov s programom R, 2017/18

Repozitorij z gradivi pri predmetu APPR v študijskem letu 2017/18

## Analiza štipendiranja slovenskih dijakov in študentov

V projektu bom obravnavala štipendiranje dijakov in študentov v Sloveniji.

Prva tabela bo vsebovala podatke iz spletne strani: http://www.irssv.si/demografija-3/2013-01-11-18-12-48/2013-01-11-18-12-59/stevilo-dijakov-prejemnikov-stipendij-glede-na-vrsto-stipendije.
Prvi stolpec predstavlja leta (1996-2014), vsi nadaljnji stolpci pa vrsto štipendij (kadrovska, državna, Zoisova in druge).
V tej tabeli bom opazovala, kako so se z leti spreminjali različne vrste štipendij. Za vsako izmed njih bom pogledala število dijakov, ki so štipendijo prejemali tekom leta.

Podatke za drugo tabelo bom vzela iz Statističnega urada Republike Slovenije: http://pxweb.stat.si/pxweb/Dialog/varval.asp?ma=0954316S&ti=&path=../Database/Dem_soc/09_izobrazevanje/90_Arhiv/02_09543_stipendisti/&lang=2.
V tej tabeli bom ugotavljala, kako se število štipendistov razlikuje med slovenskimi pokrajinami. Pokrajine bodo zapisane po vrsticah, po stolpcih pa leta. 

Iz sledeče spletne strani pa bom oblikovala 2 tabeli: http://pxweb.stat.si/pxweb/Dialog/varval.asp?ma=0954312S&ti=&path=../Database/Dem_soc/09_izobrazevanje/90_Arhiv/02_09543_stipendisti/&lang=2
Prva bo vsebovala podatke o številu študentov, ki so med leti 2008 in 2011 prejemali določeno vrsto štipendije (kadrovske, državne, Zoisove, druge), druga pa o številu dijakov. Tu pa bom kadrovske štipendije hierarhično razdelila še na vrsto financiranja (sofinancirane posredno, sofinancirane neposredno, nesofinancirane). 

Poleg podatkov v obliki .csv imam tudi Excelove tabele. Te v stolpcih vsebujejo leta (2010-2016), število prejemnikov, ki je ločeno na dijake in študente, povprečna štipendija in sredstva, ki jih je država namenila štipenditorjem.
S to tabelo pa bom ugotavljala ali je višina štipendije odvisna od sredstev, ki jih nameni država ali od števila štipendistov.


## Program

Glavni program in poročilo se nahajata v datoteki `projekt.Rmd`. Ko ga prevedemo,
se izvedejo programi, ki ustrezajo drugi, tretji in četrti fazi projekta:

* obdelava, uvoz in čiščenje podatkov: `uvoz/uvoz.r`
* analiza in vizualizacija podatkov: `vizualizacija/vizualizacija.r`
* napredna analiza podatkov: `analiza/analiza.r`

Vnaprej pripravljene funkcije se nahajajo v datotekah v mapi `lib/`. Podatkovni
viri so v mapi `podatki/`. Zemljevidi v obliki SHP, ki jih program pobere, se
shranijo v mapo `../zemljevidi/` (torej izven mape projekta).

## Potrebni paketi za R

Za zagon tega vzorca je potrebno namestiti sledeče pakete za R:

* `knitr` - za izdelovanje poročila
* `rmarkdown` - za prevajanje poročila v obliki RMarkdown
* `shiny` - za prikaz spletnega vmesnika
* `DT` - za prikaz interaktivne tabele
* `maptools` - za uvoz zemljevidov
* `sp` - za delo z zemljevidi
* `digest` - za zgoščevalne funkcije (uporabljajo se za shranjevanje zemljevidov)
* `readr` - za branje podatkov
* `rvest` - za pobiranje spletnih strani
* `reshape2` - za preoblikovanje podatkov v obliko *tidy data*
* `dplyr` - za delo s podatki
* `gsubfn` - za delo z nizi (čiščenje podatkov)
* `ggplot2` - za izrisovanje grafov
* `extrafont` - za pravilen prikaz šumnikov (neobvezno)
