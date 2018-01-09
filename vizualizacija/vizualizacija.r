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
print(graf3)



# Uvozimo zemljevid
gpclibPermit()
zemljevid <- uvozi.zemljevid("http://biogeo.ucdavis.edu/data/gadm2.8/shp/SVN_adm_shp.zip",
                             "SVN_adm1", encoding = "UTF-8")

zdruzitev.stipendij <- pokrajine %>% group_by(leto, regija) %>% summarise(stevilo = sum(stevilo, na.rm = TRUE)/2)
#povprečje štipendij na leto glede na pokrajine
povprecje <- zdruzitev.stipendij %>% group_by(regija) %>% summarise(povprecje = round(sum(stevilo)/4))

zemljevid.povprecij <- ggplot() +
  geom_polygon(data = povprecje %>%
                 mutate(zemljevid@data[["NAME_1"]] = parse_factor(regija, levels(zemljevid$zemljevid@data[["NAME_1"]]))) %>%
                 group_by(zemljevid@data[["NAME_1"]]) %>% summarise(povprecje = sum(povprecje)) %>%
                 right_join(zemljevid))
