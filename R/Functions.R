#' geocodeAddress
#'
#' Retorna a latitude e longitude de um determinado endereco com base na API do googlemaps.
#'
#' @param address Endereco de forma descrita
#' @param api_key Chave de acesso da API do googlemaps
#'
#' @importFrom RJSONIO fromJSON
#' @importFrom utils URLencode
#'
#' @export
#'
geocodeAddress <- function(address,api_key) {
  url <- "https://maps.googleapis.com/maps/api/geocode/json?address="
  url <- URLencode(paste(url, address, sep = ""))
  url <- URLencode(paste(url, "&key=", api_key, sep = ""))
  x <- fromJSON(url, simplify = FALSE)
  print(x$status)
  if (x$status == "OK") {
    out <- paste(x$results[[1]]$geometry$location$lat,
                 x$results[[1]]$geometry$location$lng, sep=',')
  } else {
    out <- NA
  }
  Sys.sleep(0.2)  # API only allows 5 requests per second
  out
}

#' geocodeLatlong
#'
#' Retorna o endereço através da latitude e longitude
#'
#' @param latlong Latutide e longitude do endereço
#' @param api_key Chave de acesso da API do googlemaps
#'
#' @importFrom googleway google_distance
#'
#' @export

geocodeLatlong <- function(latlong,api_key){
  dist <- google_distance(origins = latlong,
                          destinations = latlong,
                          mode = "walking",
                          key=api_key)
  print('ok')
  toupper(dist$origin_addresses)
}

#' geocodeDist
#'
#' Retorna a distância e o tempo de deslocamento entre dois endereços
#'
#' @param origin Latutide e longitude do endereço de origem
#' @param destination Latutide e longitude do endereço de destino
#' @param mode Forma de deslocamento; \code{"driving"}, \code{'walking'}, \code{'bicycling'} or \code{'transit'}
#' @param api_key Chave de acesso da API do googlemaps
#'
#' @importFrom googleway google_distance
#' @importFrom  tibble tibble
#'
#' @export
geocodeDist <- function(origin,destination,mode,api_key){
  dist <- google_distance(origins = origin,
                          destinations = destination,
                          mode = mode,
                          key=api_key)
  tibble(distancia = tibble(dist$rows[[1]][[1]])$distance$text,
                 tempo = tibble(dist$rows[[1]][[1]])$duration$text)
}
