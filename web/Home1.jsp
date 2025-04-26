<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trip Buddy - Your Complete Travel Solution</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background-color: #f5f7fa;
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }
        
        /* Header Styles */
        header {
            background-color: #ffffff;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            position: sticky;
            top: 0;
            z-index: 100;
        }
        
        .header-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 0;
        }
        
        .logo {
            font-size: 24px;
            font-weight: 700;
            color: #2563eb;
        }
        
        .nav-menu {
            display: flex;
            list-style: none;
        }
        
        .nav-menu li {
            margin-left: 30px;
        }
        
        .nav-menu a {
            text-decoration: none;
            color: #1f2937;
            font-weight: 500;
            transition: color 0.3s;
        }
        
        .nav-menu a:hover {
            color: #2563eb;
        }
        
        .auth-buttons {
            display: flex;
            gap: 15px;
        }
        
        .btn {
            padding: 10px 20px;
            border-radius: 5px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s;
        }
        
        .btn-outline {
            border: 1px solid #2563eb;
            color: #2563eb;
            background: transparent;
        }
        
        .btn-primary {
            background-color: #2563eb;
            color: white;
            border: none;
        }
        
        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 6px rgba(37, 99, 235, 0.1);
        }
        
        /* Hero Section */
        .hero {
            background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('/api/placeholder/1200/500');
            background-size: cover;
            background-position: center;
            color: white;
            padding: 100px 0;
            text-align: center;
        }
        
        .hero h1 {
            font-size: 48px;
            margin-bottom: 20px;
        }
        
        .hero p {
            font-size: 18px;
            margin-bottom: 30px;
            max-width: 700px;
            margin-left: auto;
            margin-right: auto;
        }
        
        /* Search Form */
        .search-form {
            background: white;
            border-radius: 10px;
            padding: 25px;
            max-width: 900px;
            margin: 0 auto;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        }
        
        .form-tabs {
            display: flex;
            margin-bottom: 20px;
            border-bottom: 1px solid #e5e7eb;
        }
        
        .form-tab {
            padding: 10px 20px;
            cursor: pointer;
            font-weight: 500;
            color: #6b7280;
            position: relative;
        }
        
        .form-tab.active {
            color: #2563eb;
        }
        
        .form-tab.active::after {
            content: '';
            position: absolute;
            bottom: -1px;
            left: 0;
            width: 100%;
            height: 2px;
            background-color: #2563eb;
        }
        
        .form-row {
            display: flex;
            gap: 15px;
            margin-bottom: 20px;
        }
        
        .form-group {
            flex: 1;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: 500;
            color: #4b5563;
        }
        
        .form-group input, .form-group select {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #d1d5db;
            border-radius: 5px;
            font-size: 16px;
        }
        
        .search-btn {
            background-color: #2563eb;
            color: white;
            border: none;
            padding: 12px 30px;
            border-radius: 5px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s;
            width: 100%;
        }
        
        .search-btn:hover {
            background-color: #1d4ed8;
        }
        
        /* Services Section */
        .services {
            padding: 80px 0;
        }
        
        .section-title {
            text-align: center;
            margin-bottom: 50px;
        }
        
        .section-title h2 {
            font-size: 36px;
            color: #1f2937;
            margin-bottom: 15px;
        }
        
        .section-title p {
            color: #6b7280;
            max-width: 600px;
            margin: 0 auto;
        }
        
        .services-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 30px;
        }
        
        .service-card {
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
            transition: transform 0.3s;
        }
        
        .service-card:hover {
            transform: translateY(-10px);
        }
        
        .service-img {
            height: 200px;
            background-color: #e5e7eb;
        }
        
        .service-content {
            padding: 20px;
        }
        
        .service-content h3 {
            margin-bottom: 10px;
            color: #1f2937;
        }
        
        .service-content p {
            color: #6b7280;
            margin-bottom: 15px;
        }
        
        /* Weather Widget */
        .weather-widget {
            background: white;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
            margin-bottom: 40px;
        }
        
        .weather-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
        }
        
        .weather-info {
            display: flex;
            align-items: center;
        }
        
        .weather-temp {
            font-size: 36px;
            font-weight: 700;
            margin-right: 15px;
        }
        
        .weather-details p {
            margin: 5px 0;
        }
        
        /* Chatbot Widget */
        .chatbot-widget {
            position: fixed;
            bottom: 30px;
            right: 30px;
            background: #2563eb;
            color: white;
            width: 60px;
            height: 60px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            box-shadow: 0 4px 10px rgba(37, 99, 235, 0.3);
            z-index: 100;
        }
        
        /* Footer */
        footer {
            background-color: #1f2937;
            color: white;
            padding: 60px 0 30px;
        }
        
        .footer-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            gap: 30px;
            margin-bottom: 40px;
        }
        
        .footer-col h4 {
            margin-bottom: 20px;
            font-size: 18px;
        }
        
        .footer-links {
            list-style: none;
        }
        
        .footer-links li {
            margin-bottom: 10px;
        }
        
        .footer-links a {
            color: #d1d5db;
            text-decoration: none;
            transition: color 0.3s;
        }
        
        .footer-links a:hover {
            color: white;
        }
        
        .footer-bottom {
            text-align: center;
            padding-top: 30px;
            border-top: 1px solid #374151;
            color: #9ca3af;
        }
        
        /* Responsive */
        @media (max-width: 768px) {
            .header-container {
                flex-direction: column;
                gap: 15px;
            }
            
            .nav-menu {
                margin-top: 15px;
                justify-content: center;
            }
            
            .nav-menu li {
                margin: 0 10px;
            }
            
            .form-row {
                flex-direction: column;
            }
            
            .hero h1 {
                font-size: 36px;
            }
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header>
        <div class="container header-container">
            <div class="logo">Trip Buddy</div>
            <ul class="nav-menu">
                <li><a href="#">Home</a></li>
                <li><a href="#">Flights</a></li>
                <li><a href="#">Hotels</a></li>
                <li><a href="#">Packages</a></li>
                <li><a href="#">Car Rentals</a></li>
            </ul>
            <div class="auth-buttons">
                <button class="btn btn-outline" id="loginButton">Login</button>
                <button class="btn btn-primary" id="registerButton">Register</button>
            </div>
        </div>
    </header>
    
    <!-- Hero Section -->
    <section class="hero">
        <div class="container">
            <h1>Your Journey Begins Here</h1>
            <p>Discover amazing places, find the best deals on flights, hotels, and vacation packages all in one place.</p>
            
            <!-- Search Form -->
            <div class="search-form">
                <div class="form-tabs">
                    <div class="form-tab active">Flights</div>
                    <div class="form-tab">Hotels</div>
                    <div class="form-tab">Packages</div>
                    <div class="form-tab">Car Rentals</div>
                </div>
                
                <form>
                    <div class="form-row">
                        <div class="form-group">
                            <label for="departure">From</label>
                            <input type="text" id="departure" placeholder="City or Airport">
                        </div>
                        <div class="form-group">
                            <label for="arrival">To</label>
                            <input type="text" id="arrival" placeholder="City or Airport">
                        </div>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label for="depart-date">Depart</label>
                            <input type="date" id="depart-date">
                        </div>
                        <div class="form-group">
                            <label for="return-date">Return</label>
                            <input type="date" id="return-date">
                        </div>
                        <div class="form-group">
                            <label for="travelers">Travelers</label>
                            <select id="travelers">
                                <option>1 Adult</option>
                                <option>2 Adults</option>
                                <option>2 Adults, 1 Child</option>
                                <option>2 Adults, 2 Children</option>
                            </select>
                        </div>
                    </div>
                    
                    <button type="submit" class="search-btn">Search</button>
                </form>
            </div>
        </div>
    </section>
    
    <!-- Weather Widget Section -->
    <div class="container">
        <div class="weather-widget">
            <div class="weather-header">
                <h3>Current Weather</h3>
                <select id="weather-location">
                    <option>New York</option>
                    <option>London</option>
                    <option>Paris</option>
                    <option>Tokyo</option>
                </select>
            </div>
            <div class="weather-info">
                <div class="weather-temp">72°F</div>
                <div class="weather-details">
                    <p><strong>New York, USA</strong></p>
                    <p>Sunny, clear skies</p>
                    <p>Humidity: 65% | Wind: 5 mph</p>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Services Section -->
    <section class="services">
        <div class="container">
            <div class="section-title">
                <h2>Our Services</h2>
                <p>Everything you need for your perfect trip in one place.</p>
            </div>
            
            <div class="services-grid">
                <div class="service-card">
                    <div class="service-img">
                        <img src="/api/placeholder/400/300" alt="Flight Booking">
                    </div>
                    <div class="service-content">
                        <h3>Flight Tickets</h3>
                        <p>Find the best deals on flights to destinations worldwide.</p>
                        <a href="#" class="btn btn-outline">Book Now</a>
                    </div>
                </div>
                
                <div class="service-card">
                    <div class="service-img">
                        <img src="/api/placeholder/400/300" alt="Hotel Booking">
                    </div>
                    <div class="service-content">
                        <h3>Hotel Reservations</h3>
                        <p>Book your stay at the best hotels with exclusive discounts.</p>
                        <a href="#" class="btn btn-outline">Find Hotels</a>
                    </div>
                </div>
                
                <div class="service-card">
                    <div class="service-img">
                        <img src="/api/placeholder/400/300" alt="Travel Packages">
                    </div>
                    <div class="service-content">
                        <h3>Vacation Packages</h3>
                        <p>All-inclusive packages for a hassle-free trip experience.</p>
                        <a href="#" class="btn btn-outline">Explore Packages</a>
                    </div>
                </div>
                
                <div class="service-card">
                    <div class="service-img">
                        <img src="/api/placeholder/400/300" alt="Car Rental">
                    </div>
                    <div class="service-content">
                        <h3>Car Rentals</h3>
                        <p>Rent vehicles for your trips at affordable prices.</p>
                        <a href="#" class="btn btn-outline">Rent a Car</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <!-- Popular Destinations Section -->
    <section class="services">
        <div class="container">
            <div class="section-title">
                <h2>Popular Destinations</h2>
                <p>Explore top-rated locations loved by travelers around the world.</p>
            </div>
            
            <div class="services-grid">
                <div class="service-card">
                    <div class="service-img">
                        <img src="/api/placeholder/400/300" alt="Paris">
                    </div>
                    <div class="service-content">
                        <h3>Paris, France</h3>
                        <p>The city of lights and romance.</p>
                        <a href="#" class="btn btn-outline">View Deals</a>
                    </div>
                </div>
                
                <div class="service-card">
                    <div class="service-img">
                        <img src="/api/placeholder/400/300" alt="Bali">
                    </div>
                    <div class="service-content">
                        <h3>Bali, Indonesia</h3>
                        <p>Tropical paradise with beautiful beaches.</p>
                        <a href="#" class="btn btn-outline">View Deals</a>
                    </div>
                </div>
                
                <div class="service-card">
                    <div class="service-img">
                        <img src="/api/placeholder/400/300" alt="New York">
                    </div>
                    <div class="service-content">
                        <h3>New York, USA</h3>
                        <p>The city that never sleeps.</p>
                        <a href="#" class="btn btn-outline">View Deals</a>
                    </div>
                </div>
                
                <div class="service-card">
                    <div class="service-img">
                        <img src="/api/placeholder/400/300" alt="Tokyo">
                    </div>
                    <div class="service-content">
                        <h3>Tokyo, Japan</h3>
                        <p>A perfect blend of tradition and modernity.</p>
                        <a href="#" class="btn btn-outline">View Deals</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <script src="https://cdn.botpress.cloud/webchat/v2.4/inject.js"></script>
    <script src="https://files.bpcontent.cloud/2025/04/20/11/20250420115751-L8TC1QY4.js"></script>
    <!-- Chatbot Widget -->
<!--    <div class="chatbot-widget">
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"></path>
        </svg>
    </div>
    -->
    <!-- Footer -->
    <footer>
        <div class="container">
            <div class="footer-grid">
                <div class="footer-col">
                    <h4>Company</h4>
                    <ul class="footer-links">
                        <li><a href="#">About Us</a></li>
                        <li><a href="#">Careers</a></li>
                        <li><a href="#">Press</a></li>
                        <li><a href="#">Blog</a></li>
                    </ul>
                </div>
                
                <div class="footer-col">
                    <h4>Support</h4>
                    <ul class="footer-links">
                        <li><a href="#">Contact Us</a></li>
                        <li><a href="#">FAQ</a></li>
                        <li><a href="#">Help Center</a></li>
                        <li><a href="#">COVID-19 Updates</a></li>
                    </ul>
                </div>
                
                <div class="footer-col">
                    <h4>Services</h4>
                    <ul class="footer-links">
                        <li><a href="#">Flight Booking</a></li>
                        <li><a href="#">Hotel Reservations</a></li>
                        <li><a href="#">Vacation Packages</a></li>
                        <li><a href="#">Car Rentals</a></li>
                    </ul>
                </div>
                
                <div class="footer-col">
                    <h4>Legal</h4>
                    <ul class="footer-links">
                        <li><a href="#">Terms & Conditions</a></li>
                        <li><a href="#">Privacy Policy</a></li>
                        <li><a href="#">Cookie Policy</a></li>
                        <li><a href="#">Sitemap</a></li>
                    </ul>
                </div>
            </div>
            
            <div class="footer-bottom">
                <p>&copy; 2025 TravelEase. All rights reserved.</p>
            </div>
        </div>
    </footer>
    
    <!-- JavaScript for interactivity -->
    <script>
        // Form tab switcher
        const formTabs = document.querySelectorAll('.form-tab');
        formTabs.forEach(tab => {
            tab.addEventListener('click', () => {
                formTabs.forEach(t => t.classList.remove('active'));
                tab.classList.add('active');
                // Here you would normally also change the form fields
            });
        });
        
        // Simple weather widget location changer
        const weatherLocation = document.getElementById('weather-location');
        const weatherTemp = document.querySelector('.weather-temp');
        const weatherCity = document.querySelector('.weather-details p:first-child strong');
        
        weatherLocation.addEventListener('change', () => {
            const location = weatherLocation.value;
            // In a real application, you would fetch actual weather data here
            // This is just a mock change
            if (location === 'London') {
                weatherTemp.textContent = '65°F';
                weatherCity.textContent = 'London, UK';
            } else if (location === 'Paris') {
                weatherTemp.textContent = '68°F';
                weatherCity.textContent = 'Paris, France';
            } else if (location === 'Tokyo') {
                weatherTemp.textContent = '75°F';
                weatherCity.textContent = 'Tokyo, Japan';
            } else {
                weatherTemp.textContent = '72°F';
                weatherCity.textContent = 'New York, USA';
            }
        });
         document.getElementById('loginButton').addEventListener('click', function() {
            window.location.href = 'Login.jsp';
        });
        document.getElementById('registerButton').addEventListener('click', function() {
            // Redirect to register page when needed
             window.location.href = 'Registration.html';
//            alert('Registration functionality will be added soon!');
        });
        // Chatbot widget toggle (simplified version)
        const chatbotWidget = document.querySelector('.chatbot-widget');
        chatbotWidget.addEventListener('click', () => {
            alert('Chatbot functionality would open here. In a real implementation, this would open a chat interface.');
        });
    </script>
</body>
</html>