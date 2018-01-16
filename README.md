# Analiza podatkov s programom R, 2017/18

Repozitorij z gradivi pri predmetu APPR v študijskem letu 2017/18

## Tematika

V projektu bom obravnavala štipendiranje dijakov in študentov v Sloveniji.

Podatki, porabljeni v projektu so:
* http://www.irssv.si/demografija-3/2013-01-11-18-12-48/2013-01-11-18-12-59/stevilo-dijakov-prejemnikov-stipendij-glede-na-vrsto-stipendije
*  http://pxweb.stat.si/pxweb/Dialog/varval.asp?ma=0954316S&ti=&path=../Database/Dem_soc/09_izobrazevanje/90_Arhiv/02_09543_stipendisti/&lang=2
* http://pxweb.stat.si/pxweb/Dialog/varval.asp?ma=0954312S&ti=&path=../Database/Dem_soc/09_izobrazevanje/90_Arhiv/02_09543_stipendisti/&lang=2


1.TABELA: Število dijakov glede na vrsto štipendije po letih 1996-2014
- leto
- vrsta štipendije
- število

2.TABELA: Število štipendistov po letih 2010-2016
- leto
- vrsta štipendije
- štipendisti
- število

3.TABELA: Višina štipendij in porabljena državna sredstva glede na vrsto štipendije po letih 2010-2016
- leto
- vrsta štipendije
- povprečna višina štipendije
- porabljena državna sredstva

4.TABELA: Število štipendistov po pokrajinah po letih 2008-2011
- regija
- štipenditor
- vrsta štipendije
- leto
- število

5.TABELA: Število štipendistov v % po pokrajinah po letih 2008-2011
- regija
- leto
- štipendisti

Poleg tabel projekt vsebuje še 4 grafe in 2 zemljevida in sicer:
- graf1 - Število dijakov glede na vrsto štipendije po letih
- graf2 - Število štipendistov glede na leto
- graf3 - Povprečna višina štipendije po letih
- graf4 - Število štipendistov v % po pokrajinah
- zemljevid1 - Povprečno število slovenskih dijakov po regijah v %
- zemljevid1 - Povprečno število slovenskih študentov po regijah v %

V projektu sem primerjala,....... kako se število štipendistov razlikuje glede na vrsto štipendije

tej tabeli bom ugotavljala, kako se število štipendistov razlikuje med slovenskimi pokrajinami. Pokrajine bodo zapisane po vrsticah, po stolpcih pa leta.

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

