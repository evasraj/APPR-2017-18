# 2. faza: Uvoz podatkov

sl <- locale("sl", decimal_mark = ",", grouping_mark = ".")

# Funkcija, ki uvozi občine iz Wikipedije
uvozi.obcine <- function() {
  link <- "http://sl.wikipedia.org/wiki/Seznam_ob%C4%8Din_v_Sloveniji"
  stran <- html_session(link) %>% read_html()
  tabela <- stran %>% html_nodes(xpath="//table[@class='wikitable sortable']") %>%
    .[[1]] %>% html_table(dec = ",")
  for (i in 1:ncol(tabela)) {
    if (is.character(tabela[[i]])) {
      Encoding(tabela[[i]]) <- "UTF-8"
    }
  }
  colnames(tabela) <- c("obcina", "povrsina", "prebivalci", "gostota", "naselja",
                        "ustanovitev", "pokrajina", "regija", "odcepitev")
  tabela$obcina <- gsub("Slovenskih", "Slov.", tabela$obcina)
  tabela$obcina[tabela$obcina == "Kanal ob Soči"] <- "Kanal"
  tabela$obcina[tabela$obcina == "Loški potok"] <- "Loški Potok"
  for (col in c("povrsina", "prebivalci", "gostota", "naselja", "ustanovitev")) {
    tabela[[col]] <- parse_number(tabela[[col]], na = "-", locale = sl)
  }
  for (col in c("obcina", "pokrajina", "regija")) {
    tabela[[col]] <- factor(tabela[[col]])
  }
  return(tabela)
}

# Funkcija, ki uvozi podatke iz datoteke druzine.csv
uvozi.druzine <- function(obcine) {
  data <- read_csv2("podatki/druzine.csv", col_names = c("obcina", 1:4),
                    locale = locale(encoding = "Windows-1250"))
  data$obcina <- data$obcina %>% strapplyc("^([^/]*)") %>% unlist() %>%
    strapplyc("([^ ]+)") %>% sapply(paste, collapse = " ") %>% unlist()
  data$obcina[data$obcina == "Sveti Jurij"] <- "Sveti Jurij ob Ščavnici"
  data <- data %>% melt(id.vars = "obcina", variable.name = "velikost.druzine",
                        value.name = "stevilo.druzin")
  data$velikost.druzine <- parse_number(data$velikost.druzine)
  data$obcina <- factor(data$obcina, levels = obcine)
  return(data)
}

link <- "http://www.irssv.si/demografija-3/2013-01-11-18-12-48/2013-01-11-18-12-59/stevilo-dijakov-prejemnikov-stipendij-glede-na-vrsto-stipendije"
stran <- html_session(link,
                      add_headers("User-Agent" = "Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:57.0) Gecko/20100101 Firefox/57.0"))
tabela <- stran %>% read_html() %>% html_nodes(xpath="//table") %>%
  .[[1]] %>% html_table(header = TRUE) %>% .[1:16, ] %>%
  sapply(parse_number, locale = locale(grouping_mark = " ")) %>% data.frame()

MANJKAAAAA



drzavne <- read_xlsx("podatki/stipendije_vse.xlsx", sheet = 1, range = "A1:F8")
zoisove <- read_xlsx("podatki/stipendije_vse.xlsx", sheet = 2, range = "A19:F26")
deficitarni.poklici <- read_xlsx("podatki/stipendije_vse.xlsx", sheet = 2, range = "A1:F3")
kadrovske.posredne <- read_xlsx("podatki/stipendije_vse.xlsx", sheet = 4, range = "A1:F6")
kadrovske.neposredne <- read_xlsx("podatki/stipendije_vse.xlsx", sheet = 4, range = "A12:F19")



uvozi.pokrajine <-function() {
  PO  <- read.csv2("podatki/pokrajine.csv", sep = ";", as.is = TRUE,
                   na.strings = "-", header = FALSE,
                   fileEncoding = "Windows-1250",
                   skip = 3)
  colnames(PO)[1:2] <- c("pokrajina", "stipenditor")
 % PO <- PO %>% melt(id.vars = c("pokrajina", "spol"), variable.name = "leto",
                        value.name = "stevilo")
  % PO$leto <- parse_number(PO$leto)
  % PO$pokrajina <- factor(PO$regija)
  % PO$spol <- factor(PO$spol)
  % return(PO)
  
}
  
  
  
# Zapišimo podatke v razpredelnico obcine
obcine <- uvozi.obcine()

# Zapišimo podatke v razpredelnico druzine.
druzine <- uvozi.druzine(levels(obcine$obcina))

# Če bi imeli več funkcij za uvoz in nekaterih npr. še ne bi
# potrebovali v 3. fazi, bi bilo smiselno funkcije dati v svojo
# datoteko, tukaj pa bi klicali tiste, ki jih potrebujemo v
# 2. fazi. Seveda bi morali ustrezno datoteko uvoziti v prihodnjih
# fazah.
