FROM registryll.azurecr.io/ti/container/images/dotnet7-build/alpine:stable as build
ARG ARTIFACTSTOKENNUGET
RUN dotnet nuget add source https://localiza.pkgs.visualstudio.com/_packaging/LocalizaAtivos%40Local/nuget/v3/index.json -n LocalizaAtivos -u myUsername -p $ARTIFACTSTOKENNUGET --store-password-in-clear-text
WORKDIR /src
COPY src .
WORKDIR /src/TesteNet7OninApi.Api
RUN dotnet publish TesteNet7OninApi.Api.csproj -c Release -o /app/publish

FROM registryll.azurecr.io/ti/container/images/dotnet7-runtime/debian:stable
RUN apt-get update && \
    apt-get install -y --no-install-recommends -y ca-certificates=20210119 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && update-ca-certificates
WORKDIR /app
COPY --from=build /app/publish .
EXPOSE 80
EXPOSE 443
ENTRYPOINT ["dotnet", "TesteNet7OninApi.Api.dll"]