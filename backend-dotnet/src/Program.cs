var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

app.MapGet("/api/health", () => Task.FromResult(new { status = "Healthy", message = "Connected to .NET Core API" }));

app.Run("http://0.0.0.0:5000");