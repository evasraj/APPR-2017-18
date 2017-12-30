# 3. faza: Vizualizacija podatkov

graf1 <- ggplot(dijaki, aes(x = leto, y = stipendija) + geom_line() +
                    xlab("Leto")+ ylab("Vrsta štipendije") )
