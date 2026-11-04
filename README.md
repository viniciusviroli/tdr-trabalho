# Trabalho intermediário

Projeto desenvolvido na disciplina Tecnologia de Dados do curso de Bacharelado em Estatística e Ciência de Dados da Universidade Federal do Paraná (UFPR).

O projeto analisa dados simulados de viagens em estações de bicicletas compartilhadas na cidade de Curitiba (PR), utilizando um pipeline reproduzível construído com targets.

## Reproduzindo o projeto

### Pré-requisitos

- R
- Quarto
- Git

### Restaurar o ambiente

```{r}
renv::restore()
```

Ao final da execução, o relatório é renderizado automaticamente.

## Estrutura do projeto

- `dados/`: arquivos de entrada fornecidos pela disciplina.
- `R/`: funções utilizadas pelo pipeline.
- `_targets.R`: definição dos alvos do pipeline.
- `analise.qmd`: relatório analítico.
- `renv.lock`: registro das dependências do projeto.
- `.github/workflows/relatorio.yaml`: workflow de integração contínua.

## Declaração de uso de LLMs

Foi utilizada a ferramenta Microsoft Copilot para apoio ao desenvolvimento do projeto.

A ferramenta foi empregada para:

- esclarecimento de dúvidas sobre `targets`, `renv` e GitHub Actions;
- interpretação de mensagens de erro;
- sugestões de organização do pipeline;
- revisão de trechos textuais do relatório.

Todos os resultados foram conferidos manualmente pelo autor. O código, as análises e a reprodutibilidade do projeto foram verificados antes da entrega.
