@echo off
echo Survey API Test Script
echo =====================

echo.
echo 1. Testing Users API...
echo GET /api/v1/users
curl -X GET http://localhost:3000/api/v1/users
echo.

echo.
echo 2. Creating a test user...
curl -X POST http://localhost:3000/api/v1/users -H "Content-Type: application/json" -d "{\"user\": {\"email\": \"test@example.com\", \"username\": \"testuser\"}}"
echo.

echo.
echo 3. Testing Surveys API...
echo GET /api/v1/surveys
curl -X GET http://localhost:3000/api/v1/surveys
echo.

echo.
echo 4. Creating a test survey...
curl -X POST http://localhost:3000/api/v1/surveys -H "Content-Type: application/json" -d "{\"survey\": {\"title\": \"Test Survey\", \"description\": \"Test Description\", \"user_id\": 1}}"
echo.

echo.
echo 5. Testing Questions API...
echo GET /api/v1/questions
curl -X GET http://localhost:3000/api/v1/questions
echo.

echo.
echo 6. Creating a test question...
curl -X POST http://localhost:3000/api/v1/questions -H "Content-Type: application/json" -d "{\"question\": {\"text\": \"What is your favorite color?\", \"type\": \"multiple_choice\", \"survey_id\": 1}}"
echo.

echo.
echo 7. Testing Responses API...
echo GET /api/v1/responses
curl -X GET http://localhost:3000/api/v1/responses
echo.

echo.
echo 8. Creating a test response...
curl -X POST http://localhost:3000/api/v1/responses -H "Content-Type: application/json" -d "{\"response\": {\"survey_id\": 1, \"user_id\": 1}}"
echo.

echo.
echo 9. Testing Answers API...
echo GET /api/v1/answers
curl -X GET http://localhost:3000/api/v1/answers
echo.

echo.
echo 10. Creating a test answer...
curl -X POST http://localhost:3000/api/v1/answers -H "Content-Type: application/json" -d "{\"answer\": {\"text\": \"Blue\", \"is_correct\": true, \"question_id\": 1, \"response_id\": 1}}"
echo.

echo.
echo Test completed!
pause
