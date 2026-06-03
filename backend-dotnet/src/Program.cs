var builder = WebApplication.CreateBuilder(args);

// Add CORS support to allow your frontend container to make requests
builder.Services.AddCors(options =>
{
    options.AddPolicy("AllowAll", policy =>
    {
        policy.AllowAnyOrigin()
              .AllowAnyMethod()
              .AllowAnyHeader();
    });
});

var app = builder.Build();

// Activate CORS policy right before handling routes
app.UseCors("AllowAll");

app.MapGet("/api/health", () => Task.FromResult(new { status = "Healthy", message = "Connected to .NET API!" }));

app.Run("http://*:5000");