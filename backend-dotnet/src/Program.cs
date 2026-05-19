using Microsoft.AspNetCore.Mvc;
using StackExchange.Redis;

var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

var redisHost = Environment.GetEnvironmentVariable("REDIS_HOST") ?? "localhost";
ConnectionMultiplexer redis = ConnectionMultiplexer.Connect($"{redisHost}:6379");
var db = redis.GetDatabase();

app.MapGet("/api/status", () => Results.Ok(new { status = "Healthy", framework = ".NET 8.0" }));

app.MapGet("/api/tasks", async () => {
    var tasks = await db.StringGetAsync("latest_task");
    return Results.Ok(new { latest_task = tasks.HasValue ? tasks.ToString() : "No tasks processed yet." });
});

app.MapPost("/api/tasks", async ([FromBody] TaskRequest req) => {
    await db.StringSetAsync("latest_task", req.TaskName);
    return Results.Created($"/api/tasks", new { message = "Task queued successfully", task = req.TaskName });
});

app.Run("http://0.0.0.0:5000");

public record TaskRequest(string TaskName);
