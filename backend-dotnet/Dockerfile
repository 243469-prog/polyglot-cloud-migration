FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app

# Copy and restore dependencies
COPY src/*.csproj ./src/
RUN dotnet restore src/*.csproj

# Copy code and publish straight to a clean root folder
COPY src/ ./src/
RUN dotnet publish src/*.csproj -c Release -o /app/out

# Runtime Stage
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app
COPY --from=build /app/out .

EXPOSE 5000
ENTRYPOINT ["dotnet", "backend-dotnet.dll"]