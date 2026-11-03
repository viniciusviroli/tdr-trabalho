conferir_linhas <- function(dados) {
  nrow(dados)
}

conferir_ausentes <- function(dados) {

  dados |>
    dplyr::group_by(ano) |>
    dplyr::summarise(
      ausentes = sum(is.na(viagens)),
      .groups = "drop"
    )

}

conferir_somas <- function(dados) {

  dados |>
    dplyr::group_by(ano) |>
    dplyr::summarise(
      soma = sum(viagens, na.rm = TRUE),
      .groups = "drop"
    )

}