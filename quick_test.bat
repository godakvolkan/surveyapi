@echo off
echo Survey API Quick Test
echo ====================

echo.
echo 1. Testing API Info...
curl -X GET http://localhost:3000/api
echo.

echo.
echo 2. Testing Users API...
curl -X GET http://localhost:3000/api/v1/users
echo.

echo.
echo 3. Testing Surveys API...
curl -X GET http://localhost:3000/api/v1/surveys
echo.

echo.
echo 4. Testing Questions API...
curl -X GET http://localhost:3000/api/v1/questions
echo.

echo.
echo 5. Testing Answers API...
curl -X GET http://localhost:3000/api/v1/answers
echo.

echo.
echo 6. Testing Responses API...
curl -X GET http://localhost:3000/api/v1/responses
echo.

echo.
echo Quick test completed!
echo.
echo You can now test the API endpoints:
echo - http://localhost:3000/api
echo - http://localhost:3000/api/v1/users
echo - http://localhost:3000/api/v1/surveys
echo - http://localhost:3000/api/v1/questions
echo - http://localhost:3000/api/v1/answers
echo - http://localhost:3000/api/v1/responses
pause
