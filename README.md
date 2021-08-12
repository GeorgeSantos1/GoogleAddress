## GoogleAddress (em desenvolvimento)

Pacote de funções criado para utilização de endereços em conjunto com a API do googlemaps (token de acesso deve ser obtido para utilização das funções).

***
### Instalação

Utilizar o seguinte código:
```r
# install.packages("devtools")
devtools::install_github("GeorgeSantos1/GoogleAddress")
```

### Funções

`geocodeAddress`: Função que retorna as coordenadas de latitude e longitude de um determinado endereço.

`geocodeLatlong`: Função que retorna o endereço através de uma determinada latitude e longitude.

## Exemplos

```r
GoogleAddress::geocodeAddress("Times Square, NY, EUA",api_key)
#> "40.7579747,-73.9855426"

GoogleAddress::geocodeLatlong("40.7579747,-73.9855426",api_key)
#> "TIMES SQUARE, NEW YORK, NY 10036, USA"

```