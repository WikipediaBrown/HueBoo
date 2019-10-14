fastlane documentation
================
# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```
xcode-select --install
```

Install _fastlane_ using
```
[sudo] gem install fastlane -NV
```
or alternatively using `brew cask install fastlane`

# Available Actions
## iOS
### ios release_to_appstore
```
fastlane ios release_to_appstore
```
Send HueBoo to AppStore.
### ios release_to_testflight
```
fastlane ios release_to_testflight
```
Send HueBoo to TestFlight.
### ios build_for_apple_distribution
```
fastlane ios build_for_apple_distribution
```
Build for either TestFlight or AppStore
### ios match_with_options
```
fastlane ios match_with_options
```
Resolve Signing Certificates and Provisioning Profiles.
### ios test
```
fastlane ios test
```
Unit Test HueBoo.
### ios get_screenshots
```
fastlane ios get_screenshots
```
Create Screenshots of HueBoo.

----

This README.md is auto-generated and will be re-generated every time [fastlane](https://fastlane.tools) is run.
More information about fastlane can be found on [fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
