ENGIBRIDGE - FLASK BACKEND
============================

Files:
- app.py                 Main Flask backend
- templates/index.html   Simple registration webpage
- requirements.txt       Required Python package
- database.db            Created automatically when the server starts

HOW TO RUN
----------

1. Install Python 3.x.

2. Open Command Prompt/Terminal in this folder.

3. Install Flask:

   pip install -r requirements.txt

4. Start the server:

   python app.py

5. Open this address in your browser:

   http://127.0.0.1:5000

AVAILABLE API ROUTES
--------------------

GET  /                  EngiBridge registration page
POST /register          Register a student
GET  /students          View registered students
POST /quiz              Save a quiz score
GET  /quiz/<student_id> View a student's quiz scores
GET  /branches          Get available engineering branches

NOTE
----
This is a beginner-friendly prototype. For a production app,
add proper authentication/OTP, password security, validation,
authorization, a production database, and HTTPS.
