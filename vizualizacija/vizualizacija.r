# 3. faza: Vizualizacija podatkov


library(gridExtra)

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

# graf števila štipendistov v % po pokrajinah
graf4 <- ggplot(pokrajine_skupaj, aes(x = factor(regija), y = odstotek, fill = stipendisti)) +
  geom_bar(stat = "identity", position = "dodge") +
  xlab("Leto") + ylab("Odstotek") + guides(fill = guide_legend("Štipendisti")) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5)) +
  ggtitle("Število štipendistov v % po pokrajinah")

#  Uvozimo zemljevid
zemljevid <- uvozi.zemljevid("http://biogeo.ucdavis.edu/data/gadm2.8/shp/SVN_adm_shp.zip",
                             "SVN_adm1", encoding = "UTF-8") %>% pretvori.zemljevid()

# zemljevid slovenskih dijakov po %
zemljevid.dijaki <- ggplot() +
  geom_polygon(data = pokrajine_skupaj %>% filter(stipendisti == "dijaki", leto == 2014) %>%
                 right_join(zemljevid, by = c("regija" = "NAME_1")),
               aes(x = long, y = lat, group = group, fill = odstotek)) +
  ggtitle("Delež slovenskih dijakov po pokrajinah")


# zemljevid slovenskih študentov po %
zemljevid.studenti <- ggplot() +
  geom_polygon(data = pokrajine_skupaj %>% filter(stipendisti == "studenti", leto == 2014) %>%
                 right_join(zemljevid, by = c("regija" = "NAME_1")),
               aes(x = long, y = lat, group = group, fill = odstotek))+
  ggtitle("Delež slovenskih študentov po pokrajinah")

zemljevid.skupaj <- grid.arrange(zemljevid.dijaki, zemljevid.studenti, nrow = 1)