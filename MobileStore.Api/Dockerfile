#See https://aka.ms/customizecontainer to learn how to customize your debug container and how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:9.0-jammy-amd64 AS base
USER app
WORKDIR /app
EXPOSE 8080
EXPOSE 8081

FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src
COPY ["MobileStore.Api/MobileStore.Api.csproj", "MobileStore.Api/"]
COPY ["MobileStore.Api.Model/MobileStore.Api.Model.csproj", "MobileStore.Api.Model/"]
COPY ["MobileStore.Configuration.Common/MobileStore.Configuration.csproj", "MobileStore.Configuration.Common/"]
COPY ["MobileStore.Email.Service.Model/MobileStore.Email.Contracts.csproj", "MobileStore.Email.Service.Model/"]
COPY ["MobileStore.Customers/MobileStore.Customers.csproj", "MobileStore.Customers/"]
COPY ["MobileStore.Orders/MobileStore.Orders.csproj", "MobileStore.Orders/"]
COPY ["MobileStore.Products/MobileStore.Products.csproj", "MobileStore.Products/"]
COPY ["MobileStore.Customers.Contracts/MobileStore.Customers.Contracts.csproj", "MobileStore.Customers.Contracts/"]
COPY ["MobileStore.Orders.Contracts/MobileStore.Orders.Contracts.csproj", "MobileStore.Orders.Contracts/"]
COPY ["MobileStore.Products.Contracts/MobileStore.Products.Contracts.csproj", "MobileStore.Products.Contracts/"]
RUN dotnet restore "./MobileStore.Api/MobileStore.Api.csproj"
COPY . .
WORKDIR "/src/MobileStore.Api"
RUN dotnet build "./MobileStore.Api.csproj" -c  -o /app/build

FROM build AS publish
ARG BUILD_CONFIGURATION=Release
RUN dotnet publish "./MobileStore.Api.csproj" -c  -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "MobileStore.Api.dll"]

