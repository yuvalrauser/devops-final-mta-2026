<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>About BMI - MeTA</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        * { box-sizing: border-box; }
        body {
            font-family: -apple-system, "Segoe UI", Roboto, Arial, sans-serif;
            background: linear-gradient(135deg, #1e3c72 0%, #2a5298 100%);
            margin: 0;
            min-height: 100vh;
            color: #222;
        }
        .container {
            background: #fff;
            max-width: 640px;
            margin: 40px auto;
            padding: 32px 36px;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.25);
        }
        h1 { color: #1e3c72; margin-top: 0; }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 16px;
        }
        th, td {
            padding: 10px 12px;
            text-align: left;
            border-bottom: 1px solid #eaeaea;
        }
        th { background: #f5f7fa; color: #1e3c72; }
        .back-link {
            display: inline-block;
            margin-top: 24px;
            color: #2a5298;
            text-decoration: none;
            font-weight: 600;
        }
        .back-link:hover { text-decoration: underline; }
        .disclaimer {
            margin-top: 22px;
            padding: 12px 14px;
            background: #fff8e1;
            color: #6d4c00;
            border-left: 4px solid #ffcc80;
            font-size: 14px;
            border-radius: 4px;
        }
    </style>
</head>
<body>
    <main class="container">
        <h1>BMI Categories</h1>
        <p>The Body Mass Index (BMI) is a simple ratio used worldwide to classify
           body weight relative to height. It is calculated as:</p>
        <p style="text-align:center; font-weight:600;">BMI = weight (kg) / height (m)<sup>2</sup></p>

        <table>
            <thead>
                <tr><th>Category</th><th>BMI Range</th></tr>
            </thead>
            <tbody>
                <tr><td>Underweight</td><td>&lt; 18.5</td></tr>
                <tr><td>Normal</td><td>18.5 - 24.9</td></tr>
                <tr><td>Overweight</td><td>25.0 - 29.9</td></tr>
                <tr><td>Obese</td><td>&ge; 30.0</td></tr>
            </tbody>
        </table>

        <div class="disclaimer">
            <strong>Disclaimer:</strong> BMI is a general indicator and does not account
            for muscle mass, bone density, or body composition. Consult a healthcare
            professional for medical advice.
        </div>

        <a id="backLink" class="back-link" href="index.jsp">&laquo; Back to calculator</a>
    </main>
</body>
</html>
