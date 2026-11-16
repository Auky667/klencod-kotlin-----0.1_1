@echo off
set APP_HOME=%~dp0
if exist "%APP_HOME%gradle\wrapper\gradle-wrapper.jar" (
  java %JAVA_OPTS% %GRADLE_OPTS% -classpath "%APP_HOME%gradle\wrapper\gradle-wrapper.jar" org.gradle.wrapper.GradleWrapperMain %*
  exit /b %ERRORLEVEL%
)
where gradle >nul 2>nul
if %ERRORLEVEL% EQU 0 (
  gradle -p "%APP_HOME%" %*
  exit /b %ERRORLEVEL%
)
echo Gradle is not installed and the Gradle Wrapper JAR is not bundled.
echo Open this project in Klencod IDE and use its built-in Gradle/Android build action.
exit /b 1
