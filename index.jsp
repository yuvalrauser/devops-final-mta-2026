<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    // ---- BMI calculation ----
    String heightStr = request.getParameter("height");
    String weightStr = request.getParameter("weight");
    String resultText = null;
    String resultClass = null;     // CSS class for the result box
    String resultCategory = null;  // Underweight / Normal / Overweight / Obese
    Double bmiValue = null;
    String errorMsg = null;

    if (heightStr != null && weightStr != null) {
        try {
            double height = Double.parseDouble(heightStr.trim());
            double weight = Double.parseDouble(weightStr.trim());
            if (height < 50 || height > 250) {
                errorMsg = "Height must be between 50 and 250 cm.";
            } else if (weight < 10 || weight > 300) {
                errorMsg = "Weight must be between 10 and 300 kg.";
            } else {
                double meters = height / 100.0;
                bmiValue = weight / (meters * meters);
                if (bmiValue < 18.5) {
                    resultCategory = "Underweight";
                    resultClass = "cat-under";
                } else if (bmiValue < 25.0) {
                    resultCategory = "Normal";
                    resultClass = "cat-normal";
                } else if (bmiValue < 30.0) {
                    resultCategory = "Overweight";
                    resultClass = "cat-over";
                } else {
                    resultCategory = "Obese";
                    resultClass = "cat-obese";
                }
                resultText = String.format("BMI = %.1f → %s", bmiValue, resultCategory);
            }
        } catch (NumberFormatException e) {
            errorMsg = "Please enter valid numbers for height and weight.";
        }
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>MeTA BMI Calculator</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        * { box-sizing: border-box; }
        body {
            font-family: -apple-system, "Segoe UI", Roboto, Arial, sans-serif;
            background: linear-gradient(135deg, #1e3c72 0%, #2a5298 100%);
            margin: 0;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            color: #222;
        }
        .container {
            background: #fff;
            max-width: 480px;
            margin: 40px auto;
            padding: 32px 36px;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.25);
            flex: 1;
        }
        header {
            text-align: center;
            margin-bottom: 24px;
        }
        header h1 {
            margin: 0 0 4px 0;
            color: #1e3c72;
            font-size: 26px;
        }
        header .subtitle {
            color: #666;
            font-size: 14px;
        }
        form { margin-top: 8px; }
        label {
            display: block;
            font-weight: 600;
            margin-top: 14px;
            margin-bottom: 4px;
            color: #333;
        }
        input[type="number"] {
            width: 100%;
            padding: 10px 12px;
            border: 1px solid #ccd;
            border-radius: 6px;
            font-size: 15px;
        }
        input[type="number"]:focus {
            outline: none;
            border-color: #2a5298;
            box-shadow: 0 0 0 3px rgba(42, 82, 152, 0.15);
        }
        button {
            width: 100%;
            margin-top: 20px;
            padding: 12px;
            background: #2a5298;
            color: #fff;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: background 0.15s;
        }
        button:hover { background: #1e3c72; }
        .result, .error {
            margin-top: 22px;
            padding: 14px 16px;
            border-radius: 8px;
            font-size: 16px;
            text-align: center;
            font-weight: 600;
        }
        .cat-under  { background: #e3f2fd; color: #0d47a1; border: 1px solid #90caf9; }
        .cat-normal { background: #e8f5e9; color: #1b5e20; border: 1px solid #a5d6a7; }
        .cat-over   { background: #fff8e1; color: #ef6c00; border: 1px solid #ffcc80; }
        .cat-obese  { background: #ffebee; color: #b71c1c; border: 1px solid #ef9a9a; }
        .error      { background: #ffebee; color: #b71c1c; border: 1px solid #ef9a9a; }
        .info-link {
            display: block;
            margin-top: 18px;
            text-align: center;
            color: #2a5298;
            text-decoration: none;
            font-weight: 600;
        }
        .info-link:hover { text-decoration: underline; }
        footer {
            text-align: center;
            color: #fff;
            padding: 16px;
            font-size: 13px;
            opacity: 0.85;
        }
        footer .team-names {
            font-weight: 600;
            margin-top: 4px;
        }
    </style>
</head>
<body>
    <main class="container">
        <header>
            <h1>MeTA BMI Calculator</h1>
            <div class="subtitle">Employee Wellness Portal &middot; v1.2 LIVE DEMO</div>
        </header>

        <form id="bmiForm" method="get" action="index.jsp">
            <label for="height">Height (cm)</label>
            <input type="number" id="height" name="height" step="0.1" min="50" max="250"
                   placeholder="e.g. 175"
                   value="<%= heightStr != null ? heightStr : "" %>" required>

            <label for="weight">Weight (kg)</label>
            <input type="number" id="weight" name="weight" step="0.1" min="10" max="300"
                   placeholder="e.g. 70"
                   value="<%= weightStr != null ? weightStr : "" %>" required>

            <button type="submit" id="calcBtn">Calculate BMI</button>
        </form>

        <% if (errorMsg != null) { %>
            <div id="errorBox" class="error"><%= errorMsg %></div>
        <% } else if (resultText != null) { %>
            <div id="resultBox" class="result <%= resultClass %>" data-bmi="<%= bmiValue %>" data-category="<%= resultCategory %>">
                <%= resultText %>
            </div>
        <% } %>

        <a id="aboutLink" class="info-link" href="about.jsp">About BMI categories &raquo;</a>
    </main>

    <footer>
        <div>MTA 2026 - DevOps Final Project</div>
        <div class="team-names" id="teamNames">
            Team: Bar Haham, Gil Eliav, Omer Ovadia, Shlomo Mordechai, Nofar Sagas, Yuval Rauser
        </div>
    </footer>
</body>
</html>
