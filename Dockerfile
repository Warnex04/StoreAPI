# Use a .NET 7 SDK image
FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS base
WORKDIR /app
EXPOSE 80

# Build the app
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src
COPY ["StoreAPI/StoreAPI.csproj", "StoreAPI/"]
RUN dotnet restore "StoreAPI/StoreAPI.csproj"
COPY . .
WORKDIR "/src/StoreAPI"
RUN dotnet build "StoreAPI.csproj" -c Release -o /app/build

FROM build AS publish
WORKDIR "/src/StoreAPI"
RUN dotnet publish "StoreAPI.csproj" -c Release -o /app/publish

# Copy build app to base image and define entrypoint
FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "StoreAPI.dll"]
