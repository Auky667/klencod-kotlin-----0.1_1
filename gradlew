#!/usr/bin/env sh
# Gradle launcher for environments that provide a system Gradle installation.
# A standard Gradle Wrapper JAR is not bundled in this export.
APP_HOME=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
if [ -f "$APP_HOME/gradle/wrapper/gradle-wrapper.jar" ]; then
  exec java ${JAVA_OPTS:-} ${GRADLE_OPTS:-} -classpath "$APP_HOME/gradle/wrapper/gradle-wrapper.jar" org.gradle.wrapper.GradleWrapperMain "$@"
fi
if command -v gradle >/dev/null 2>&1; then
  exec gradle -p "$APP_HOME" "$@"
fi
echo "Gradle is not installed and the Gradle Wrapper JAR is not bundled." >&2
echo "Open this project in Klencod IDE and use its built-in Gradle/Android build action." >&2
exit 1
