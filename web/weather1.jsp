<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.SimpleDateFormat, java.net.*, java.io.*, org.json.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Real-Time Indore Weather Widget</title>
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
            text-transform: capitalize;
        }

        .forecast-details {
            font-size: 12px;
            color: #74b9ff;
        }

        .current-time {
            text-align: center;
            color: #636e72;
            font-size: 14px;
            margin-bottom: 20px;
        }

        .error-message {
            background: #ff6b6b;
            color: white;
            padding: 15px;
            border-radius: 10px;
            text-align: center;
            margin-bottom: 20px;
        }

        .refresh-btn {
            background: #74b9ff;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 8px;
            cursor: pointer;
            font-size: 14px;
            margin-left: 10px;
        }

        .weather-icon-large {
            font-size: 60px;
            margin-bottom: 10px;
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
    <%!
        // WeatherService class for fetching real-time weather data
        public class WeatherService {
            private static final String API_KEY = "1421f263b625f8dfb6a6679bcc458f1b"; // Replace with your actual API key
            private static final String BASE_URL = "http://api.openweathermap.org/data/2.5/";
            
            public JSONObject getCurrentWeather(String city) throws Exception {
                String urlString = BASE_URL + "weather?q=" + city + "&appid=" + API_KEY + "&units=metric";
                return makeApiCall(urlString);
            }
            
            public JSONObject getForecast(String city) throws Exception {
                String urlString = BASE_URL + "forecast?q=" + city + "&appid=" + API_KEY + "&units=metric";
                return makeApiCall(urlString);
            }
            
            private JSONObject makeApiCall(String urlString) throws Exception {
                URL url = new URL(urlString);
                HttpURLConnection conn = (HttpURLConnection) url.openConnection();
                conn.setRequestMethod("GET");
                
                int responseCode = conn.getResponseCode();
                if (responseCode == 200) {
                    BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
                    String inputLine;
                    StringBuilder response = new StringBuilder();
                    
                    while ((inputLine = in.readLine()) != null) {
                        response.append(inputLine);
                    }
                    in.close();
                    
                    return new JSONObject(response.toString());
                } else {
                    throw new Exception("Weather API call failed with response code: " + responseCode);
                }
            }
            
            public String getWeatherIcon(String weatherCode) {
                switch (weatherCode) {
                    case "01d": case "01n": return "☀️";
                    case "02d": case "02n": return "⛅";
                    case "03d": case "03n": return "☁️";
                    case "04d": case "04n": return "☁️";
                    case "09d": case "09n": return "🌦️";
                    case "10d": case "10n": return "🌧️";
                    case "11d": case "11n": return "⛈️";
                    case "13d": case "13n": return "❄️";
                    case "50d": case "50n": return "🌫️";
                    default: return "🌤️";
                }
            }
        }
    %>

    <%
        // Initialize variables
        WeatherService weatherService = new WeatherService();
        SimpleDateFormat sdf = new SimpleDateFormat("EEEE, MMMM dd, yyyy 'at' hh:mm a");
        String currentTime = sdf.format(new Date());
        
        // Default values
        String currentTemp = "N/A";
        String currentCondition = "Unable to fetch data";
        String currentHumidity = "N/A";
        String currentWind = "N/A";
        String weatherIcon = "🌤️";
        String errorMessage = null;
        List<Map<String, String>> forecastList = new ArrayList<>();
        
        // Refresh data if requested
        boolean refreshData = "true".equals(request.getParameter("refresh"));
        
        try {
            // Fetch current weather data for Indore
            JSONObject currentWeather = weatherService.getCurrentWeather("Indore,IN");
            
            if (currentWeather != null) {
                JSONObject main = currentWeather.getJSONObject("main");
                JSONObject wind = currentWeather.getJSONObject("wind");
                JSONArray weather = currentWeather.getJSONArray("weather");
                JSONObject weatherObj = weather.getJSONObject(0);
                
                currentTemp = Math.round(main.getDouble("temp")) + "°C";
                currentCondition = weatherObj.getString("description");
                currentHumidity = main.getInt("humidity") + "%";
                currentWind = wind.getDouble("speed") + " m/s";
                weatherIcon = weatherService.getWeatherIcon(weatherObj.getString("icon"));
            }
            
            // Fetch 5-day forecast
            JSONObject forecast = weatherService.getForecast("Indore,IN");
            if (forecast != null) {
                JSONArray list = forecast.getJSONArray("list");
                SimpleDateFormat dayFormat = new SimpleDateFormat("EEEE");
                SimpleDateFormat dateFormat = new SimpleDateFormat("MMM dd");
                Set<String> addedDates = new HashSet<>();
                
                for (int i = 0; i < list.length() && forecastList.size() < 5; i++) {
                    JSONObject item = list.getJSONObject(i);
                    String dateText = item.getString("dt_txt");
                    Date date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(dateText);
                    String dayKey = dateFormat.format(date);
                    
                    // Only add one forecast per day (preferably afternoon data)
                    if (!addedDates.contains(dayKey) && dateText.contains("12:00:00")) {
                        Map<String, String> dayForecast = new HashMap<>();
                        JSONObject main = item.getJSONObject("main");
                        JSONArray weather = item.getJSONArray("weather");
                        JSONObject weatherObj = weather.getJSONObject(0);
                        
                        dayForecast.put("date", forecastList.size() == 0 ? "Today" : dayFormat.format(date));
                        dayForecast.put("temp", Math.round(main.getDouble("temp")) + "°C");
                        dayForecast.put("condition", weatherObj.getString("description"));
                        dayForecast.put("icon", weatherService.getWeatherIcon(weatherObj.getString("icon")));
                        dayForecast.put("humidity", main.getInt("humidity") + "%");
                        
                        if (item.has("wind")) {
                            dayForecast.put("wind", item.getJSONObject("wind").getDouble("speed") + " m/s");
                        } else {
                            dayForecast.put("wind", "N/A");
                        }
                        
                        forecastList.add(dayForecast);
                        addedDates.add(dayKey);
                    }
                }
            }
            
        } catch (Exception e) {
            errorMessage = "Error fetching weather data: " + e.getMessage();
            // You might want to log this error
            System.err.println("Weather API Error: " + e.getMessage());
        }
    %>

    <div class="container">
        <% if (errorMessage != null) { %>
        <div class="error-message">
            <%= errorMessage %>
            <form style="display: inline;" method="get">
                <button type="submit" name="refresh" value="true" class="refresh-btn">Retry</button>
            </form>
        </div>
        <% } %>

        <div class="weather-widget">
            <div class="current-time">
                Last updated: <%= currentTime %>
                <form style="display: inline;" method="get">
                    <button type="submit" name="refresh" value="true" class="refresh-btn">Refresh</button>
                </form>
            </div>
            <div class="weather-header">
                <h3>Current Weather - Indore</h3>
            </div>
            <div class="weather-info">
                <div>
                    <div class="weather-icon-large"><%= weatherIcon %></div>
                    <div class="weather-temp"><%= currentTemp %></div>
                </div>
                <div class="weather-details">
                    <p><strong>Indore, Madhya Pradesh</strong></p>
                    <p style="text-transform: capitalize;"><%= currentCondition %></p>
                    <p>Humidity: <%= currentHumidity %> | Wind: <%= currentWind %></p>
                </div>
            </div>
            <button class="forecast-button" type="button" onclick="toggleForecast()">
                Check Weather Forecast
            </button>
        </div>

        <div class="forecast-container" id="forecastContainer">
            <div class="forecast-header">
                <h2>5-Day Weather Forecast</h2>
                <p>Indore, Madhya Pradesh, India</p>
            </div>
            <div class="forecast-grid">
                <% for (Map<String, String> day : forecastList) { %>
                <div class="forecast-card">
                    <div class="forecast-date"><%= day.get("date") %></div>
                    <div class="weather-icon-large" style="font-size: 40px;"><%= day.get("icon") %></div>
                    <div class="forecast-temp"><%= day.get("temp") %></div>
                    <div class="forecast-desc"><%= day.get("condition") %></div>
                    <div class="forecast-details">
                        <div>💧 <%= day.get("humidity") %></div>
                        <div>💨 <%= day.get("wind") %></div>
                    </div>
                </div>
                <% } %>
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

        // Auto-refresh every 10 minutes
        setTimeout(function() {
            window.location.href = window.location.href + (window.location.href.includes('?') ? '&' : '?') + 'refresh=true';
        }, 600000); // 10 minutes
    </script>
</body>
</html>