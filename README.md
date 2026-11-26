# LanHouse · Clientes

Microsserviço de **Clientes** do projeto LanHouse (Arquitetura de Software, Engenharia de Software, UNISATC).

Cadastro, consulta e situação (ativo ou bloqueado) dos clientes. Consulta o saldo devedor no serviço de Cobrança.

- Requisitos atendidos: RF01, RF02, RF08 (em conjunto com Cobrança)
- Depende de: Cobranca
- Consumido por: Reservas
- Banco próprio: SQLite (`clientes.db`), criado com `EnsureCreated()` na inicialização
- Porta local: `5001`

Dados de demonstração criados na inicialização: clientes 1 e 2 (ativos) e 3 (bloqueado).

## Endpoints

- `POST /api/clientes`
- `GET /api/clientes?nome=&telefone=`
- `GET /api/clientes/{id}`
- `PUT /api/clientes/{id}/situacao`
- `GET /api/clientes/{id}/saldo-devedor`

Também expõe `GET /health` e a documentação interativa (Scalar) em `/scalar`. Erros seguem o formato `{ "erro": "mensagem" }`.

## Configuração

| Variável de ambiente | Descrição |
|---|---|
| `Servicos__Cobranca` | URL pública do serviço Cobranca (padrão local: `http://localhost:5004`) |

Valores padrão para execução local estão em `Clientes/appsettings.json`.

## Executar localmente

Requisito: [.NET SDK 10](https://dotnet.microsoft.com/download).

```bash
cd Clientes
dotnet run --launch-profile http   # http://localhost:5001
```

## Executar com Docker

```bash
docker build -t lanhouse-clientes .
docker run --rm -p 5001:8080 lanhouse-clientes
```

## Publicação no Render

| Campo | Valor |
|---|---|
| Language | Docker |
| Dockerfile Path | `./Dockerfile` |
| Docker Build Context Directory | `./` |
| Instance Type | Free |

Publique primeiro os serviços sem dependências (Cobrança e Computadores), depois Clientes e por último Reservas.

## Os 4 repositórios do projeto

| Serviço | Repositório |
|---|---|
| Clientes | https://github.com/pachecothiagoo/lanhouse-clientes |
| Computadores | https://github.com/pachecothiagoo/lanhouse-computadores |
| Reservas | https://github.com/pachecothiagoo/lanhouse-reservas |
| Cobrança | https://github.com/pachecothiagoo/lanhouse-cobranca |

Documento de requisitos, diagramas e execução conjunta: https://github.com/pachecothiagoo/lanhouse
