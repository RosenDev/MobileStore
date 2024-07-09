#See https://aka.ms/customizecontainer to learn how to customize your debug container and how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/runtime:8.0 AS base
USER app
WORKDIR /app/emailservice

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
ARG BUILD_CONFIGURATION=Release
WORKDIR /emailservice
COPY ["MobileStore.Email.Service/MobileStore.Email.Service.csproj", "MobileStore.Email.Service/"]
RUN dotnet restore "./MobileStore.Email.Service/MobileStore.Email.Service.csproj"
COPY . .
WORKDIR "/emailservice/MobileStore.Email.Service"
RUN dotnet build "./MobileStore.Email.Service.csproj" -c $BUILD_CONFIGURATION -o /app/emailservice/build

FROM build AS publish
ARG BUILD_CONFIGURATION=Release
RUN dotnet publish "./MobileStore.Email.Service.csproj" -c $BUILD_CONFIGURATION -o /app/emailservice/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app/emailservice
COPY --from=publish /app/emailservice/publish .
ENTRYPOINT ["dotnet", "MobileStore.Email.Service.dll"]