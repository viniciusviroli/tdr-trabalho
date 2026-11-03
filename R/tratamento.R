arrumar_viagens <- function(dados) {

  ordem_meses <- c(
    "jan", "fev", "mar", "abr",
    "mai", "jun", "jul", "ago",
    "set", "out", "nov", "dez"
  )

  dados |>
    tidyr::pivot_longer(
      cols = jan:dez,
      names_to = "mes",
      values_to = "viagens"
    ) |>
    dplyr::mutate(
      mes = factor(mes, levels = ordem_meses)
    )

}

juntar_cadastro <- function(viagens, cadastro) {

  viagens |>
    dplyr::left_join(
      cadastro,
      by = "codigo",
      relationship = "many-to-one"
    ) |>
    dplyr::select(
      codigo,
      nome,
      entorno,
      vagas,
      dplyr::everything()
    )

}

calcular_viagens_relativas <- function(dados) {

  dados |>
    dplyr::mutate(
      viagens_relativas = viagens / vagas
    )

}

substituir_ausentes <- function(dados) {
  
  dados |>
    dplyr::mutate(
      viagens = tidyr::replace_na(
        viagens,
        0
      ),
      viagens_relativas = tidyr::replace_na(
        viagens_relativas,
        0
      )
    )
  
}

