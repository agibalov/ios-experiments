command=$1

PROJECT_NAME=UiTestingExperiment.xcodeproj
SCHEME_NAME=UiTestingExperiment
DESTINATION="platform=iOS Simulator,name=iPhone SE (3rd generation),OS=18.0"

if [ "${command}" == "test" ]; then
  xcodebuild \
    -project ${PROJECT_NAME} \
    -scheme ${SCHEME_NAME} \
    -sdk iphonesimulator \
    -destination "${DESTINATION}" \
    test

elif [ "${command}" == "test-unit" ]; then
  xcodebuild \
    -project ${PROJECT_NAME} \
    -scheme ${SCHEME_NAME} \
    -sdk iphonesimulator \
    -destination "${DESTINATION}" \
    -only-testing:UiTestingExperimentTests \
    test

elif [ "${command}" == "test-ui" ]; then
  xcodebuild \
    -project ${PROJECT_NAME} \
    -scheme ${SCHEME_NAME} \
    -sdk iphonesimulator \
    -destination "${DESTINATION}" \
    -only-testing:UiTestingExperimentUITests \
    test

else
  echo "Unknown command: ${command}"

fi
