# Analiza podatkov s programom R, 2017/18

Repozitorij z gradivi pri predmetu APPR v študijskem letu 2017/18

## Tematika

V projektu bom obravnavala štipendiranje dijakov in študentov v Sloveniji.

Podatki, ki sem jih uporabila v projektu so:
* http://www.irssv.si/demografija-3/2013-01-11-18-12-48/2013-01-11-18-12-59/stevilo-dijakov-prejemnikov-stipendij-glede-na-vrsto-stipendije
* http://www.mddsz.gov.si/si/uveljavljanje_pravic/statistika/stipendiranje/
* http://pxweb.stat.si/pxweb/Dialog/varval.asp?ma=0973010S&ti=&path=../Database/Dem_soc/09_izobrazevanje/90_Arhiv/03_09730_stipendisti_kazal/&lang=2
* http://pxweb.stat.si/pxweb/Dialog/varval.asp?ma=0954316S&ti=&path=../Database/Dem_soc/09_izobrazevanje/90_Arhiv/02_09543_stipendisti/&lang=2.


1.TABELA: Število dijakov glede na vrsto štipendije po letih 2000-2014
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

Poleg tabel projekt vsebuje še 4 grafe in zemljevid in sicer:
- graf1 - Število dijakov glede na vrsto štipendije po letih
- graf2 - Število štipendistov državne štipendije glede na leto
- graf3 - Povprečni znesek štipendije po letih
- graf4 - Število štipendistov v % po pokrajinah
- zemljevid - Delež štipendistov po pokrajinah

Namen projekta je ugotoviti, kako se število štipendistov (dijaki, študentje) spreminja po letih glede na slovenske pokrajine in vrsto štipendij (kadrovske, državne, Zoisove, druge).
Poleg tega bom analizirala še višino posamezne vrste štipendije glede na leto.

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

