ajustar_modelo_relativa <- function(dados) {

  dados |>
    dplyr::filter(
      viagens_relativas > 0
    ) |>
    lm(
      log(viagens_relativas) ~
        ano +
        mes +
        entorno,
      data = _
    )

}