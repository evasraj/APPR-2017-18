# 3. faza: Vizualizacija podatkov

# graf števila dijakov glede na vrsto štipendije po letih
graf1 <- ggplot(dijaki, aes(x = leto, y = stevilo, color = stipendija)) +
  geom_line(size = 1) +
  geom_point(size = 1.5) +
  xlab("Leto") + ylab("Število") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5)) + 
  ggtitle("Število dijakov glede na vrsto štipendije po letih")

# graf števila štipendistov glede na leto (za vse štipendije skupaj)
graf2 <- ggplot(stipendisti, aes(x = factor(leto), y = stevilo, fill = stipendisti)) +
  geom_bar(stat = "identity", position = "dodge") +
  xlab("Leto") + ylab("Število") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5)) +
  ggtitle("Število štipendistov glede na leto")

# graf povprečne višine štipendije po letih
graf3 <- ggplot(stipendije, aes(x = leto, y = povprecna, color =stipendija)) +
  geom_line(size = 1) +
  geom_point(size = 1.5) +
  xlab("Leto") + ylab("Povprečna višina") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5), 
        panel.grid.major = element_line(linetype = "dotted"), 
        panel.grid.minor = element_line(linetype = "dotted")) + 
  ggtitle("Povprečna višina štipendije po letih")

# graf ptevila štipendistov v % po pokrajinah
graf4 <- ggplot(pokrajine_skupaj, aes(x = factor(leto), y = odstotek, fill = c("odstotek.x", "odstotek.y"))) +
  geom_bar(stat = "identity", position = "dodge") +
  xlab("Leto") + ylab("Odstotek") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5)) +
  ggtitle("Število štipendistov v % po pokrajinah")
print(graf4) # ODSTOTEK NEKI NE DELA !!!


# Uvozimo zemljevid
gpclibPermit()
zemljevid <- uvozi.zemljevid("http://biogeo.ucdavis.edu/data/gadm2.8/shp/SVN_adm_shp.zip",
                             "SVN_adm1", encoding = "UTF-8") %>% pretvori.zemljevid()

zdruzitev.stipendij <- pokrajine %>% group_by(leto, regija) %>% summarise(stevilo = sum(stevilo, na.rm = TRUE)/2)
#povprecje stipendij na leto glede na pokrajine
povprecje <- zdruzitev.stipendij %>% group_by(regija) %>% summarise(povprecje = mean(stevilo))

zemljevid.povprecij <- ggplot() +
  geom_polygon(data = povprecje %>% right_join(zemljevid, by = c("regija" = "NAME_1")),
               aes(x = long, y = lat, group = group, fill = povprecje))



zdruzitev.pokrajine.d <- pokrajine_dijaki %>% group_by(leto, regija) %>% summarise(odstotek = sum(odstotek, na.rm = TRUE)/10)
povprecje.d <- zdruzitev.pokrajine.d %>% group_by(regija) %>% summarise(povprecje = mean(odstotek))

zemljevid.povprecij.d <- ggplot() +
  geom_polygon(data = povprecje.d %>% right_join(zemljevid, by = c("regija" = "NAME_1")),
               aes(x = long, y = lat, group = group, fill = povprecje))


zdruzitev.pokrajine.s <- pokrajine_studenti %>% group_by(leto, regija) %>% summarise(odstotek = sum(odstotek, na.rm = TRUE)/10)
povprecje.s <- zdruzitev.pokrajine.s %>% group_by(regija) %>% summarise(povprecje = mean(odstotek))

zemljevid.povprecij.s <- ggplot() +
  geom_polygon(data = povprecje.s %>% right_join(zemljevid, by = c("regija" = "NAME_1")),
               aes(x = long, y = lat, group = group, fill = povprecje))

