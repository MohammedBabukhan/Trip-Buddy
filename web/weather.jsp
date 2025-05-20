<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Indore Weather Widget</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, #74b9ff, #0984e3);
            min-height: 100vh;
            padding: 20px;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
        }

        .weather-widget {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            padding: 30px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
            backdrop-filter: blur(10px);
            margin-bottom: 20px;
        }

        .weather-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .weather-header h3 {
            color: #2d3436;
            font-size: 24px;
            font-weight: 600;
        }

        .weather-info {
            display: flex;
            align-items: center;
            gap: 30px;
            justify-content: center;
        }

        .weather-temp {
            font-size: 48px;
            font-weight: bold;
            color: #0984e3;
        }

        .weather-details p {
            margin: 5px 0;
            color: #636e72;
            font-size: 16px;
        }

        .weather-details strong {
            color: #2d3436;
            font-size: 18px;
        }

        .forecast-button {
            background: linear-gradient(135deg, #00b894, #00a085);
            color: white;
            border: none;
            padding: 15px 30px;
            font-size: 18px;
            font-weight: 600;
            border-radius: 15px;
            cursor: pointer;
            margin-top: 30px;
            transition: all 0.3s ease;
            box-shadow: 0 5px 15px rgba(0, 184, 148, 0.3);
            display: block;
            margin-left: auto;
            margin-right: auto;
        }

        .forecast-button:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(0, 184, 148, 0.4);
        }

        .forecast-container {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            padding: 30px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
            backdrop-filter: blur(10px);
            margin-top: 20px;
            display: none;
        }

        .forecast-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .forecast-header h2 {
            color: #2d3436;
            font-size: 26px;
            margin-bottom: 10px;
        }

        .forecast-header p {
            color: #636e72;
            font-size: 16px;
        }

        .forecast-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
        }

        .forecast-card {
            background: white;
            border-radius: 15px;
            padding: 20px;
            text-align: center;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.08);
            transition: transform 0.3s ease;
            border: 2px solid transparent;
        }

        .forecast-card:hover {
            transform: translateY(-5px);
            border-color: #74b9ff;
        }

        .forecast-date {
            font-weight: 600;
            color: #2d3436;
            font-size: 16px;
            margin-bottom: 10px;
        }

        .forecast-temp {
            font-size: 28px;
            font-weight: bold;
            color: #0984e3;
            margin: 10px 0;
        }

        .forecast-desc {
            color: #636e72;
            font-size: 14px;
            margin-bottom: 10px;
        }

        .forecast-details {
            font-size: 12px;
            color: #74b9ff;
        }

        .loading {
            text-align: center;
            padding: 40px;
            color: #636e72;
            font-size: 18px;
        }

        .weather-icon {
            font-size: 40px;
            margin-bottom: 10px;
        }

        .current-time {
            text-align: center;
            color: #636e72;
            font-size: 14px;
            margin-bottom: 20px;
        }

        @media (max-width: 768px) {
            .weather-info {
                flex-direction: column;
                text-align: center;
                gap: 20px;
            }
            
            .forecast-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <%
        // JSP Scriptlet for server-side processing
        SimpleDateFormat sdf = new SimpleDateFormat("EEEE, MMMM dd, yyyy 'at' hh:mm a");
        String currentTime = sdf.format(new Date());
        
        // Sample current weather data (in real application, this would come from a weather API)
        String currentTemp = "29°C";
        String currentCondition = "Partly cloudy, pleasant";
        String currentHumidity = "68%";
        String currentWind = "12 km/h";
        
        // Sample forecast data (in real application, this would come from database or API)
        String[][] forecastData = {
            {"Today", "Monday", "29°C", "Partly Cloudy", "⛅", "68%", "12 km/h"},
            {"Tomorrow", "Tuesday", "31°C", "Sunny", "☀️", "55%", "8 km/h"},
            {"Wednesday", "Wednesday", "28°C", "Thunderstorms", "⛈️", "75%", "15 km/h"},
            {"Thursday", "Thursday", "26°C", "Light Rain", "🌦️", "82%", "10 km/h"},
            {"Friday", "Friday", "30°C", "Mostly Sunny", "🌤️", "60%", "7 km/h"}
        };
    %>

    <div class="container">
        <div class="weather-widget">
            <div class="current-time">
                Last updated: <%= currentTime %>
            </div>
            <div class="weather-header">
                <h3>Current Weather - Indore</h3>
            </div>
            <div class="weather-info">
                <div class="weather-temp"><%= currentTemp %></div>
                <div class="weather-details">
                    <p><strong>Indore, Madhya Pradesh</strong></p>
                    <p><%= currentCondition %></p>
                    <p>Humidity: <%= currentHumidity %> | Wind: <%= currentWind %></p>
                </div>
            </div>
            <form method="post" action="">
                <button class="forecast-button" type="button" onclick="toggleForecast()">
                    Check Weather Forecast
                </button>
            </form>
        </div>

        <div class="forecast-container" id="forecastContainer">
            <div class="forecast-header">
                <h2>5-Day Weather Forecast</h2>
                <p>Indore, Madhya Pradesh, India</p>
            </div>
            <div id="forecastContent">
                <div class="forecast-grid">
                    <%
                        for (int i = 0; i < forecastData.length; i++) {
                            String[] day = forecastData[i];
                    %>
                    <div class="forecast-card">
                        <div class="forecast-date"><%= day[0] %></div>
                        <div class="weather-icon"><%= day[4] %></div>
                        <div class="forecast-temp"><%= day[2] %></div>
                        <div class="forecast-desc"><%= day[3] %></div>
                        <div class="forecast-details">
                            <div>💧 <%= day[5] %></div>
                            <div>💨 <%= day[6] %></div>
                        </div>
                    </div>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>
    </div>

    <script>
        let forecastVisible = false;

        function toggleForecast() {
            const container = document.getElementById('forecastContainer');
            const button = document.querySelector('.forecast-button');

            if (!forecastVisible) {
                container.style.display = 'block';
                button.textContent = 'Hide Forecast';
                forecastVisible = true;
            } else {
                container.style.display = 'none';
                button.textContent = 'Check Weather Forecast';
                forecastVisible = false;
            }
        }

        // Optional: Auto-refresh page every 30 minutes to get updated weather
        setTimeout(function() {
            location.reload();
        }, 1800000); // 30 minutes in milliseconds
    </script>

    <%
        // JSP Scriptlet for handling form submission or other server-side logic
        if (request.getMethod().equals("POST")) {
            // Handle any POST requests here
            // For example, you could update weather data, log user interactions, etc.
            out.println("<!-- Weather data refreshed -->");
        }
    %>
</body>
</html>