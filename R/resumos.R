resumo_unidade <- function(dados) {

  dados |>
    dplyr::group_by(
      codigo,
      nome,
      entorno
    ) |>
    dplyr::summarise(
      meses_com_registro = sum(!is.na(viagens)),
      total_ano = sum(viagens),
      media_relativa = mean(viagens_relativas),
      .groups = "drop"
    ) |>
    dplyr::arrange(
      dplyr::desc(media_relativa)
    )

}

resumo_categoria <- function(dados) {

  dados |>
    dplyr::group_by(entorno) |>
    dplyr::summarise(
      unidades_na_categoria =
        dplyr::n_distinct(codigo),
      total_ano_categoria =
        sum(viagens),
      media_relativa_categoria =
        mean(viagens_relativas),
      .groups = "drop"
    )

}

resumo_categoria_ano <- function(dados) {

  dados |>
    dplyr::mutate(
      viagens = tidyr::replace_na(
        viagens,
        0
      )
    ) |>
    dplyr::group_by(
      entorno,
      ano
    ) |>
    dplyr::summarise(
      total_ano = sum(viagens),
      .groups = "drop"
    ) |>
    tidyr::pivot_wider(
      names_from = ano,
      values_from = total_ano
    )

}

