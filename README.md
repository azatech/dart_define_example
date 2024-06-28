# dart_define_example

A new Flutter project.

## Getting Started

Run and define your:
- `API_KEY_ID` string value
- `SOME_CONDITIONS_PATH` string value
- `IS_STAGE` bool value
- `IS_PROD` bool value

You have 2 options to run:
### First
`flutter run --dart-define=API_KEY_ID=SOME_KEY --dart-define=SOME_CONDITIONS_PATH=/_path
--dart-define=IS_STAGE=true --dart-define=IS_PROD=false`

### Second
`--dart-define-from-file=keys_production.json` or `--dart-define-from-file=keys_staging.json`

Useful links:
- https://pub.dev/packages/dart_define#dart_define
- https://codewithandrea.com/articles/flutter-api-keys-dart-define-env-files/
- https://medium.com/flutter-community/how-to-setup-dart-define-for-keys-and-secrets-on-android-and-ios-in-flutter-apps-4f28a10c4b6c

- https://thiele.dev/blog/part-1-configure-a-flutter-app-with-dart-define-environment-variable/
- https://thiele.dev/blog/flutter-dart-define-part-2-dev-and-prod-package-names-and-bundle-ids/

## TODO
1. Configure CI/CD pipeline with dart define command and not show-off the API keys

#### P.S. 
1. Add to `.gitignore` all json files with sensitive `API_KEYS`
2. Always remember to obfuscate code with sensitive `API_KEYS`