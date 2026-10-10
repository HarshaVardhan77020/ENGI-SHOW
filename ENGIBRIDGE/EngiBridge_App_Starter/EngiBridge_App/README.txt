EngiBridge — Frontend Prototype
================================

Files
- index.html: app screens and page structure
- style.css: responsive visual design
- script.js: demo login flow, mock OTP, year-aware modules, and interactions
- logo.svg: original vector logo

How to run
1. Extract the ZIP file.
2. Open index.html in Chrome, Edge, Firefox, or Safari.
3. Enter your details and submit.
4. Enter demo OTP: 123456.
5. Change the learning year to see different modules.

Important limitations
- This is a front-end prototype, not a production-ready Android/iPhone app.
- The OTP is simulated. No SMS is sent and no identity is verified.
- Student scores, attendance, and progress are sample/demo data.
- No real backend, database, teacher portal, or company integration is included.
- Do not enter sensitive personal information into this demo.

For a real release
- Frontend: HTML/CSS/JavaScript can be wrapped with Capacitor for Android and iOS, or rebuilt with a mobile framework.
- Backend: Python Django or Flask with a database and secure APIs.
- Authentication: a real OTP provider and rate limiting; never trust a demo OTP.
- Admin tools: manage syllabus versions, branch content, attendance, practical marks, quizzes, and academic year updates.
- Certificates: use transparent scoring rules and verify all results before issuing.
- Jobs: company partnerships and job listings need permission and authenticated application links.

Note on “Java”:
The web prototype uses JavaScript (not Java). Java is a separate language commonly used for native Android apps. An iPhone app generally needs a separate iOS build or a cross-platform approach.
