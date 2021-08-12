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
