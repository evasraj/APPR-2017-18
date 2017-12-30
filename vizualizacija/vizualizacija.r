# 3. faza: Vizualizacija podatkov

dijaki1 <- ggplot(dijaki, aes(x = leto, y = stipendija) + geom_line() +
                    xlab("Leto")+ ylab("Vrsta štipendije") )
