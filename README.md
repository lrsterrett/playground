# playground

A new Flutter project.

## Getting Started

1. Install xcode
1. Install flutter
1. Install firebase cli
1. Install deps - `flutter pub get`
1. Open iphone simulator - `open -a Simulator`
1. Run `firebase emulators:start`
1. Run `flutter run`

## To run against live firebase app

`flutter run --dart-define=ENVIRONMENT=prod`

## Build and Deploy (ios)
1. Update provisioning license (with new device udids) in xcode
    1. Drag downloaded license to xcode
1. run `flutter build ipa`
1. run `firebase appdistribution:distribute build/ios/ipa/playground.ipa --app 1:204545120301:ios:606875eb3fbd2832fd80a4`
