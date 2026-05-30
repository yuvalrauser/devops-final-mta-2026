# MeTA BMI Calculator

DevOps Final Project — MTA 2026 Semester B

A simple JSP web application that calculates Body Mass Index (BMI) and classifies
the result into standard categories.

## Pages
- `index.jsp` — the calculator (input form + result)
- `about.jsp` — information page about BMI categories

## UI elements (per assignment requirements)
- **1 link**: "About BMI categories" → `about.jsp`
- **1 button**: "Calculate BMI" (form submit)
- **2 input text boxes**: height (cm), weight (kg)

## How it works
The form posts back to `index.jsp` using GET. The Java scriptlet at the top of
the page reads the parameters, validates the input, computes BMI as
`weight / (height/100)^2`, and renders a result box colored by category.

## How it's served
Deployed to Apache Tomcat 8.5 at:
`http://localhost:8080/MeTA-final/`

## CI/CD
Jenkins polls this Git repository every minute. When a new commit lands on
`main`, the Jenkins pipeline (`Jenkinsfile`) checks the code out and copies the
files into Tomcat's `webapps/MeTA-final/`. Tomcat auto-redeploys.

## Team
Bar Hacham, Gil Eliav, Omer Ovadia, Shlomo Mordechai, Nofar Sagas, Yuval Rauser
