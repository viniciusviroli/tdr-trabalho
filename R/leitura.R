ler_cadastro <- function(arquivo) {
  readr::read_delim(
    arquivo,
    delim = ";",
    locale = readr::locale(encoding = "Latin1"),
    col_types = readr::cols(
      codigo = readr::col_character(),
      nome = readr::col_character(),
      entorno = readr::col_character(),
      vagas = readr::col_integer()
    )
  )
}

ler_viagens <- function(arquivo) {
  readr::read_delim(
    arquivo,
    delim = ";",
    locale = readr::locale(encoding = "Latin1"),
    na = "-",
    col_types = readr::cols(
      codigo = readr::col_character(),
      jan = readr::col_double(),
      fev = readr::col_double(),
      mar = readr::col_double(),
      abr = readr::col_double(),
      mai = readr::col_double(),
      jun = readr::col_double(),
      jul = readr::col_double(),
      ago = readr::col_double(),
      set = readr::col_double(),
      out = readr::col_double(),
      nov = readr::col_double(),
      dez = readr::col_double()
    )
  )
}