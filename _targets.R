library(targets)
library(tarchetypes)

tar_option_set(
  packages = c(
    "readr",
    "dplyr",
    "tidyr",
    "purrr",
    "forcats",
    "quarto"
  )
)

lapply(
  list.files(
    "R",
    pattern = "\\.R$",
    full.names = TRUE
  ),
  source
)

############### list #######################################################

list(
  
  tar_target(
    cadastro_arquivo,
    "dados/cadastro.csv",
    format = "file"
  ),
  
  tar_target(
    viagens_2023_arquivo,
    "dados/viagens_2023.csv",
    format = "file"
  ),
  
  tar_target(
    viagens_2024_arquivo,
    "dados/viagens_2024.csv",
    format = "file"
  ),
  
  tar_target(
    viagens_2025_arquivo,
    "dados/viagens_2025.csv",
    format = "file"
  ),
  
  tar_target(
    cadastro,
    ler_cadastro(cadastro_arquivo)
  ),
  
  tar_target(
    viagens_2023,
    ler_viagens(viagens_2023_arquivo)
  ),
  
  tar_target(
    viagens_2024,
    ler_viagens(viagens_2024_arquivo)
  ),
  
  tar_target(
    viagens_2025,
    ler_viagens(viagens_2025_arquivo)
  ),
  
  tar_target(
    viagens_todos,
    dplyr::bind_rows(
      dplyr::mutate(viagens_2023, ano = 2023),
      dplyr::mutate(viagens_2024, ano = 2024),
      dplyr::mutate(viagens_2025, ano = 2025)
    )
  ),
  
  tar_target(
    viagens_long,
    arrumar_viagens(viagens_todos)
  ),
  
  tar_target(
    viagens_join,
    juntar_cadastro(
      viagens_long,
      cadastro
    )
  ),
  
  tar_target(
    viagens_relativas,
    calcular_viagens_relativas(
      viagens_join
    )
  ),
  
  tar_target(
    viagens_limpo,
    substituir_ausentes(
      viagens_relativas
    )
  ),
  
  tar_target(
    conferencia_linhas,
    conferir_linhas(
      viagens_long
    )
  ),
  
  tar_target(
    conferencia_ausentes,
    conferir_ausentes(
      viagens_long
    )
  ),
  
  tar_target(
    conferencia_somas,
    conferir_somas(
      viagens_long
    )
  ),
  
  tar_target(
    unidade_sem_medicao_tbl,
    unidade_sem_medicao(
      cadastro,
      viagens_2023
    )
  ),
  
  tar_target(
    resumo_unidade_tbl,
    resumo_unidade(
      viagens_limpo
    )
  ),
  
  tar_target(
    resumo_categoria_tbl,
    resumo_categoria(
      viagens_limpo
    )
  ),
  
  tar_target(
    resumo_categoria_ano_tbl,
    resumo_categoria_ano(
      viagens_limpo
    )
  ),
  
  tar_quarto(
    relatorio,
    "analise.qmd"
  ),
  
  tar_target(
    resumo_sazonalidade_tbl,
    resumo_sazonalidade(
      viagens_limpo
    )
  ),
  
  tar_target(
    resumo_ano_tbl,
    resumo_ano(
      viagens_limpo
    )
  ),
  tar_target(
    medias_categoria_tbl,
    medias_categoria(
      viagens_limpo
    )
  )
)