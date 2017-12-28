# 2. faza: Uvoz podatkov

sl <- locale("sl", decimal_mark = ",", grouping_mark = ".")

# Funkcija, ki uvozi število dijakov glede na leto in vrsto štipendije
uvozi.dijaki <- function() {
  link <- "http://www.irssv.si/demografija-3/2013-01-11-18-12-48/2013-01-11-18-12-59/stevilo-dijakov-prejemnikov-stipendij-glede-na-vrsto-stipendije"
  stran <- html_session(link,
                        add_headers("User-Agent" = "Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:57.0) Gecko/20100101 Firefox/57.0"))
  tabela <- stran %>% read_html() %>% html_nodes(xpath="//table") %>%
    .[[1]] %>% html_table(header = TRUE) %>% .[1:16, ] %>%
    sapply(parse_number, locale = locale(grouping_mark = " ")) %>% data.frame()
  colnames(tabela) <- c("leto", "kadrovska", "drzavna", "zoisova", "druge")
  return(tabela %>% melt(id.vars = "leto", variable.name = "stipendija", value.name = "stevilo"))
}

# Zapišimo podatke v razpredelnico dijaki
dijaki <- uvozi.dijaki()


# Funkcija, ki uvozi stevilo stipendistov glede na leto in vrsto stipendije
uvozi.stipendist <- function(){
  drzavne <- read_xlsx("podatki/stipendije_vse.xlsx", sheet = 1, range = "A1:F8")
  zoisove <- read_xlsx("podatki/stipendije_vse.xlsx", sheet = 2, range = "A19:F26")
  deficitarni.poklici <- read_xlsx("podatki/stipendije_vse.xlsx", sheet = 2, range = "A1:F3")
  kadrovske.posredne <- read_xlsx("podatki/stipendije_vse.xlsx", sheet = 4, range = "A1:F6")
  kadrovske.neposredne <- read_xlsx("podatki/stipendije_vse.xlsx", sheet = 4, range = "A12:F19")
  
  colnames(drzavne) <- colnames(zoisove) <- colnames(kadrovske.neposredne) <-
    colnames(kadrovske.posredne) <- c("leto", "stevilo", "dijaki",
                                      "studenti", "povprecna", "sredstva")
  drzavne$stipendija <- "drzavna"
  zoisove$stipendija <- "zoisova"
  kadrovske.posredne$stipendija <- "posredna kadrovska"
  kadrovske.neposredne$stipendija <- "neposredna kadrovska"
  stipendije.skupaj <- rbind(drzavne, zoisove, kadrovske.posredne, kadrovske.neposredne) %>%
    mutate(stipendija = factor(stipendija))
  stipendije <- stipendije.skupaj %>% select(leto, stipendija, povprecna, sredstva)
  stipendisti <- stipendije.skupaj %>% select(leto, stipendija, dijaki, studenti) %>%
    melt(id.vars = c("leto", "stipendija"), variable.name = "stipendisti", value.name = "stevilo")
}

# Zapišimo podatke v razpredelnico stipendist
stipendisti <- uvozi.stipendist()

# Funkcija, ki uvozi število štipendistov glede na pokrajine Slovenije
uvozi.pokrajine <- function() {
  data <- read_csv2("podatki/pokrajine.csv", trim_ws = TRUE, na = c("-", ""),
                    locale = locale(encoding = "Windows-1250"), skip = 6,
                    col_names = c("regija", "stipenditor", "stipendija", 2008:2011), n_max = 234) %>%
    fill(1:2) %>% drop_na(3) %>% filter(! grepl("Skupaj", stipendija)) %>%
    melt(id.vars = c("regija", "stipenditor", "stipendija"),
         variable.name = "leto", value.name = "stevilo") %>%
    mutate(leto = parse_number(leto), stevilo = parse_number(stevilo))
  return(data)
}
pokrajine <- uvozi.pokrajine()


# Če bi imeli več funkcij za uvoz in nekaterih npr. še ne bi
# potrebovali v 3. fazi, bi bilo smiselno funkcije dati v svojo
# datoteko, tukaj pa bi klicali tiste, ki jih potrebujemo v
# 2. fazi. Seveda bi morali ustrezno datoteko uvoziti v prihodnjih
# fazah.
