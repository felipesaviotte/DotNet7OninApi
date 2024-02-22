# teste-net7onin-api

![ApiRest](docs/imagens/ApiRest.png)
![DotNet](docs/imagens/DotNet.png)
![SonarCloud](docs/imagens/SonarCloud.png)
![DataDog](docs/imagens/DataDog.png)

- Descrição: Teste .net7 onin
- Produto: teste

## Pré-requisitos

:heavy_check_mark: [.NET 7](https://dotnet.microsoft.com/en-us/download/dotnet/7.0)  
:heavy_check_mark: [Docker](https://aws-dev.localiza.dev/portal/devops/container/containers-windows01.html?q=docker)

## Como executar

1. Adicionar as variáveis de ambiente no arquivo /src/TesteNet7OninApi.Api/Properties/launchSettings.json
    ```json
    {
      "environmentVariables": {
        "BaseUrlApiExemplo": "https://apigateway-hom.localiza.com/stackspot-sample-rest-api-v1",
        "ClientSecretApiExemplo": "",
        "ClientIdApiExemplo": "",
        "BaseUrlApiGateway": "https://apigateway.localiza.com",
        "ASPNETCORE_ENVIRONMENT": "Development",
        "AMBIENTE": "dev"
      }
    }
    ```
1. Executar o projeto
    - Visual Studio: 
        1. Configurar a solução para inicializar o projeto src/TesteNet7OninApi.Api/TesteNet7OninApi.Api.csproj
        1. Build -> Run
    - Comando: 
        ```cmd
        dotnet dev-certs https --trust
        dotnet run --project ./src/TesteNet7OninApi.Api/TesteNet7OninApi.Api.csproj
        ```
1. Acessar a url: https://localhost:5001/swagger

## Dependências

- Uso do SDK - [BuildingBlock.Rest](https://localiza.visualstudio.com/Arquitetura%20-%20Bibliotecas%20Open%20Source%20Localiza/_git/buildingblockrest-lib?path=/docs/index.md&_a=preview). SDK de REST utilizando a arquitetura Refit e a biblioteca HttpClient para facilitar a interação com APIs web.
- Uso do SDK [MediatR](https://www.nuget.org/packages/MediatR/). Implementa o padrão mediator para reduzir o acoplamento entre objetos em aplicações .NET.
- Uso do SDK [BuildingBlock.CorrelationId](https://localiza.visualstudio.com/Arquitetura%20-%20Bibliotecas%20Open%20Source%20Localiza/_git/buildingblockcorrelationid-lib). Gerador de CorrelationId para serviços ASP.NET.  
:white_check_mark: Recebe o cabeçalho `X-Correlation-Id` da solicitação do cliente e gera um `CorrelationId` caso não tenha sido enviado pelo cliente  
:white_check_mark: Retorna o cabeçalho `X-Correlation-Id` na resposta  
:white_check_mark: Ativa o acesso ao `CorrelationId` durante a solicitação HTTP para que você possa fazer um registro personalizado  
- Uso do SDK [Localiza.BuildingBlocks.Logging](https://localiza.visualstudio.com/Arquitetura%20-%20Bibliotecas%20Open%20Source%20Localiza/_git/buildingblocks-logging-netstandard). Gerador de Log para serviços ASP.NET.  
- **ToDo**: incluir os recursos que a aplicação utilizada como banco de dados, mensageria, cache, relatório e apis externas

## Referências

- [Refit](/arte/chapters/integracao/habilitadores/tecnicas/api-rest) 
- [Polly](/arte/chapters/engenharia/docs/habilitadores/tecnicas/polly)  
- [onion](/docs/base-cientifica/definicoes-arquiteturais/arquitetura-software/onion.md)
- [api](https://backstage.localiza.com/arte/chapters/integracao/habilitadores/tecnicas/api-rest)
- [rest](https://backstage.localiza.com/arte/Engenharia/habilitadores/tecnicas/rest)
- [.net](https://backstage.localiza.com/arte/chapters/engenharia/docs/habilitadores/frameworks/netcore6)
- [entrypoints](https://backstage.localiza.com/arte/Engenharia/base-cientifica/definicoes-arquiteturais/plataforma/entrypoint/)
- [Segurança de API](https://backstage.localiza.com/arte/chapters/cybersec/docs/base-cientifica/seguranca-rede-comunicacao/protecao-aplicativos/api/)
- [OWASP API Security](https://backstage.localiza.com/arte/architectures/tribo-cyber-seguranca/docs/appsec/owasp_rest_security/)

---

If you want to learn more about creating good readme files then refer the following [guidelines](https://docs.microsoft.com/en-us/azure/devops/repos/git/create-a-readme?view=azure-devops).  
You can also seek inspiration from the below readme files:
- [ASP.NET Core](https://github.com/aspnet/Home)
- [Visual Studio Code](https://github.com/Microsoft/vscode)
- [Chakra Core](https://github.com/Microsoft/ChakraCore)