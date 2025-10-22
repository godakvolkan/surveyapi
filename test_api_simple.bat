@echo off
echo Survey API Test
echo ===============

echo.
echo Testing API endpoints...
echo.

echo 1. API Info:
powershell -Command "try { $response = Invoke-WebRequest -Uri 'http://127.0.0.1:3000/api' -Method GET; Write-Host 'Status:' $response.StatusCode; Write-Host 'Content:'; $response.Content } catch { Write-Host 'Error:' $_.Exception.Message }"

echo.
echo 2. Users API:
powershell -Command "try { $response = Invoke-WebRequest -Uri 'http://127.0.0.1:3000/api/v1/users' -Method GET; Write-Host 'Status:' $response.StatusCode; Write-Host 'Content:'; $response.Content } catch { Write-Host 'Error:' $_.Exception.Message }"

echo.
echo 3. Surveys API:
powershell -Command "try { $response = Invoke-WebRequest -Uri 'http://127.0.0.1:3000/api/v1/surveys' -Method GET; Write-Host 'Status:' $response.StatusCode; Write-Host 'Content:'; $response.Content } catch { Write-Host 'Error:' $_.Exception.Message }"

echo.
echo Test completed!
echo.
echo You can also test in browser:
echo - http://127.0.0.1:3000/api
echo - http://127.0.0.1:3000/api/v1/users
echo - http://127.0.0.1:3000/api/v1/surveys
pause
