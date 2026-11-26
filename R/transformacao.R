empilhar_viagens <- function(
    viagens_2023,
    viagens_2024,
    viagens_2025
) {
  dplyr::bind_rows(
    dplyr::mutate(viagens_2023, ano = 2023),
    dplyr::mutate(viagens_2024, ano = 2024),
    dplyr::mutate(viagens_2025, ano = 2025)
  )
}
