library(httr)

url = 'https://www.anbima.com.br/informacoes/curvas-debentures/CD-down.asp'

dt = as.Date('2020-05-14')

r = POST(url = url,
         encode = 'form',
         body = list(
           Idioma = 'PT',
           Dt_Ref = format(dt, '%d/%m/%Y'),
           saida = 'csv'
         ))

txt = content(r,enconding = "UTF-8")
txt = rawToChar(txt)
txt
dados = read.csv2(text = txt, skip = 1, header = TRUE, stringsAsFactors = FALSE)
dados
dados$Dt_obs = Sys.Date()
