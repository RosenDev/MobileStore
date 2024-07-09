#See https://aka.ms/customizecontainer to learn how to customize your debug container and how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:8.0-jammy-amd64 AS base
USER app
WORKDIR /app
EXPOSE 8080
EXPOSE 8081

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src
COPY ["MobileStore.Api/MobileStore.Api.csproj", "MobileStore.Api/"]
COPY ["MobileStore.Data/MobileStore.Data.csproj", "MobileStore.Data/"]
COPY ["MobileStore.Entities/MobileStore.Entities.csproj", "MobileStore.Entities/"]
COPY ["MobileStore.CommandsAndQueries/MobileStore.CommandsAndQueries.csproj", "MobileStore.CommandsAndQueries/"]
COPY ["MobileStore.Services/MobileStore.Services.csproj", "MobileStore.Services/"]
COPY ["MobileStore.Api.Model/MobileStore.Api.Model.csproj", "MobileStore.Api.Model/"]
RUN dotnet restore "./MobileStore.Api/MobileStore.Api.csproj"
COPY . .
WORKDIR "/src/MobileStore.Api"
RUN dotnet build "./MobileStore.Api.csproj" -c $BUILD_CONFIGURATION -o /app/build

FROM build AS publish
ARG BUILD_CONFIGURATION=Release
RUN dotnet publish "./MobileStore.Api.csproj" -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "MobileStore.Api.dll"]