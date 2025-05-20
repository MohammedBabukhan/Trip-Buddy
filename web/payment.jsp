<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Payment Gateway</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #2d2d2d;
            margin-bottom: 30px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #333;
        }
        input[type="text"],
        input[type="email"],
        input[type="tel"],
        select {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 16px;
        }
        .card-details {
            display: flex;
            gap: 15px;
        }
        .card-number {
            flex: 2;
        }
        .expiry-date, .cvv {
            flex: 1;
        }
        .button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 15px 20px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
            font-weight: bold;
            margin-top: 10px;
        }
        .button:hover {
            background-color: #45a049;
        }
        .error {
            color: red;
            font-size: 14px;
            margin-top: 5px;
        }
        .payment-methods {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
        }
        .payment-method {
            margin: 0 10px;
            text-align: center;
        }
        .payment-logo {
            height: 40px;
            padding: 5px;
            border: 1px solid #ddd;
            border-radius: 4px;
            background-color: #f9f9f9;
        }
        .success-message {
            display: none;
            text-align: center;
            color: #4CAF50;
            font-weight: bold;
            padding: 20px;
            border: 1px solid #4CAF50;
            border-radius: 4px;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Secure Payment Gateway</h1>
        
        <div class="payment-methods">
            <div class="payment-method">
                <div class="payment-logo">VISA</div>
            </div>
            <div class="payment-method">
                <div class="payment-logo">MASTER</div>
            </div>
            <div class="payment-method">
                <div class="payment-logo">AMEX</div>
            </div>
        </div>
        
        <form id="paymentForm" action="processPayment.jsp" method="post" onsubmit="return validateForm()">
            <div class="form-group">
                <label for="amount">Amount</label>
                <input type="text" id="amount" name="amount" value="<%= request.getParameter("amount") != null ? request.getParameter("amount") : "100.00" %>" readonly>
            </div>
            
            <div class="form-group">
                <label for="name">Cardholder Name</label>
                <input type="text" id="name" name="name" placeholder="John Doe" required>
                <div id="nameError" class="error"></div>
            </div>
            
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" placeholder="johndoe@example.com" required>
                <div id="emailError" class="error"></div>
            </div>
            
            <div class="form-group card-details">
                <div class="card-number">
                    <label for="cardNumber">Card Number</label>
                    <input type="text" id="cardNumber" name="cardNumber" placeholder="1234 5678 9012 3456" maxlength="19" required>
                    <div id="cardNumberError" class="error"></div>
                </div>
            </div>
            
            <div class="form-group card-details">
                <div class="expiry-date">
                    <label for="expiryDate">Expiry Date</label>
                    <input type="text" id="expiryDate" name="expiryDate" placeholder="MM/YY" maxlength="5" required>
                    <div id="expiryDateError" class="error"></div>
                </div>
                
                <div class="cvv">
                    <label for="cvv">CVV</label>
                    <input type="text" id="cvv" name="cvv" placeholder="123" maxlength="4" required>
                    <div id="cvvError" class="error"></div>
                </div>
            </div>
            
            <div class="form-group">
                <label for="address">Billing Address</label>
                <input type="text" id="address" name="address" placeholder="123 Main St" required>
                <div id="addressError" class="error"></div>
            </div>
            
            <div class="form-group">
                <label for="city">City</label>
                <input type="text" id="city" name="city" placeholder="New York" required>
            </div>
            
            <div class="form-group card-details">
                <div class="expiry-date">
                    <label for="state">State/Province</label>
                    <input type="text" id="state" name="state" placeholder="NY" required>
                </div>
                
                <div class="cvv">
                    <label for="zipCode">Zip Code</label>
                    <input type="text" id="zipCode" name="zipCode" placeholder="10001" required>
                    <div id="zipCodeError" class="error"></div>
                </div>
            </div>
            
            <input type="submit" value="Pay Now" class="button">
        </form>
        
        <div id="successMessage" class="success-message">
            Payment processed successfully! Redirecting...
        </div>
    </div>

    <script>
        // Format card number with spaces
        document.getElementById('cardNumber').addEventListener('input', function(e) {
            let value = e.target.value.replace(/\s+/g, '').replace(/[^0-9]/gi, '');
            let formattedValue = '';
            
            for(let i = 0; i < value.length; i++) {
                if(i > 0 && i % 4 === 0) {
                    formattedValue += ' ';
                }
                formattedValue += value[i];
            }
            
            e.target.value = formattedValue;
        });
        
        // Format expiry date with slash
        document.getElementById('expiryDate').addEventListener('input', function(e) {
            let value = e.target.value.replace(/[^0-9]/gi, '');
            
            if(value.length > 2) {
                e.target.value = value.substring(0, 2) + '/' + value.substring(2, 4);
            } else {
                e.target.value = value;
            }
        });
        
        function validateForm() {
            let isValid = true;
            
            // Reset all error messages
            document.querySelectorAll('.error').forEach(function(el) {
                el.innerHTML = "";
            });
            
            // Validate name (only letters and spaces)
            const name = document.getElementById('name').value;
            if(!/^[A-Za-z\s]+$/.test(name)) {
                document.getElementById('nameError').innerHTML = "Please enter a valid name (letters only)";
                isValid = false;
            }
            
            // Validate email
            const email = document.getElementById('email').value;
            if(!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
                document.getElementById('emailError').innerHTML = "Please enter a valid email address";
                isValid = false;
            }
            
            // Validate card number (should be 16 digits, spaces allowed)
            const cardNumber = document.getElementById('cardNumber').value.replace(/\s/g, '');
            if(!/^\d{16}$/.test(cardNumber)) {
                document.getElementById('cardNumberError').innerHTML = "Please enter a valid 16-digit card number";
                isValid = false;
            }
            
            // Validate expiry date (MM/YY format)
            const expiryDate = document.getElementById('expiryDate').value;
            if(!/^(0[1-9]|1[0-2])\/([0-9]{2})$/.test(expiryDate)) {
                document.getElementById('expiryDateError').innerHTML = "Please enter a valid expiry date (MM/YY)";
                isValid = false;
            } else {
                // Check if card is expired
                const [month, year] = expiryDate.split('/');
                const expiryMonth = parseInt(month, 10);
                const expiryYear = parseInt('20' + year, 10);
                
                const today = new Date();
                const currentMonth = today.getMonth() + 1; // January is 0
                const currentYear = today.getFullYear();
                
                if(expiryYear < currentYear || (expiryYear === currentYear && expiryMonth < currentMonth)) {
                    document.getElementById('expiryDateError').innerHTML = "Card has expired";
                    isValid = false;
                }
            }
            
            // Validate CVV (3-4 digits)
            const cvv = document.getElementById('cvv').value;
            if(!/^\d{3,4}$/.test(cvv)) {
                document.getElementById('cvvError').innerHTML = "Please enter a valid CVV (3-4 digits)";
                isValid = false;
            }
            
            // Validate zip code (5 digits)
            const zipCode = document.getElementById('zipCode').value;
            if(!/^\d{5}(-\d{4})?$/.test(zipCode)) {
                document.getElementById('zipCodeError').innerHTML = "Please enter a valid zip code";
                isValid = false;
            }
            
            if(isValid) {
                // Show success message
                document.getElementById('paymentForm').style.display = 'none';
                document.getElementById('successMessage').style.display = 'block';
                
                // Simulate redirection after payment
                setTimeout(function() {
                    alert('Payment processed successfully! Transaction ID: ' + Math.floor(Math.random() * 10000000000));
                    window.location.href = 'paymentSuccess.jsp';
                }, 3000);
                
                return false; // Prevent form submission for this demo
            }
            
            return isValid;
        }
    </script>
</body>
</html>