FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

COPY ["Clientes/Clientes.csproj", "Clientes/"]
RUN dotnet restore "Clientes/Clientes.csproj"

COPY . .
WORKDIR "/src/Clientes"
RUN dotnet publish "Clientes.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS final
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "Clientes.dll"]
