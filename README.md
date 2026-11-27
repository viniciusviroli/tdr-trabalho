# Trabalho Intermediário

Projeto desenvolvido na disciplina **Tecnologia de Dados** do curso de **Bacharelado em Estatística e Ciência de Dados** da **Universidade Federal do Paraná (UFPR)**.

O projeto analisa dados simulados de viagens em estações de bicicletas compartilhadas, utilizando um pipeline reproduzível construído com o pacote `targets`. O objetivo é realizar a importação, conferência, transformação e análise dos dados, gerando automaticamente um relatório com os resultados obtidos.

## Reproduzindo o projeto

### Pré-requisitos

Para reproduzir o projeto, é necessário ter instalado:

- R;
- Quarto;
- Git.

### Clonar o repositório

```bash
git clone git@github.com:viniciusviroli/tdr-trabalho.git
cd tdr-trabalho
```

### Restaurar o ambiente

As dependências utilizadas no projeto são gerenciadas pelo pacote `renv`. Para restaurar o ambiente, execute:

```r
renv::restore()
```

### Executar o pipeline

Após restaurar o ambiente, execute:

```r
targets::tar_make()
```

Este comando:

- importa os dados de entrada;
- realiza as etapas de conferência e transformação;
- executa as análises;
- gera os produtos definidos no pipeline;
- renderiza o relatório final.

### Gerar o relatório manualmente

Se necessário, o relatório pode ser renderizado manualmente com:

```r
quarto::quarto_render("analise.qmd")
```

## Estrutura do projeto

```text
.
├── dados/                      # Arquivos de entrada fornecidos pela disciplina
├── R/                          # Funções utilizadas pelo pipeline
├── _targets.R                  # Definição dos alvos do pipeline
├── analise.qmd                 # Relatório analítico
├── renv.lock                   # Registro das dependências do projeto
├── README.md                   # Documentação do projeto
└── .github/workflows/          # Integração contínua
```

## Produtos gerados

A execução do pipeline produz:

- bases de dados processadas;
- resultados das análises estatísticas;
- tabelas e gráficos utilizados no relatório;
- relatório final renderizado em HTML.

## Reprodutibilidade

O gerenciamento de dependências é realizado com `renv` e a execução do fluxo de trabalho é controlada por `targets`, permitindo a reprodução dos resultados em diferentes ambientes computacionais.

## Declaração de uso de LLMs

Foi utilizada a ferramenta Microsoft Copilot como apoio ao desenvolvimento do projeto.

A ferramenta foi empregada para:

- esclarecimento de dúvidas sobre `targets`, `renv` e GitHub Actions;
- interpretação de mensagens de erro;
- sugestões de organização do pipeline;
- revisão de trechos textuais do relatório.

Todos os resultados foram conferidos manualmente pelo autor. O código, as análises e a reprodutibilidade do projeto foram verificados antes da entrega.
