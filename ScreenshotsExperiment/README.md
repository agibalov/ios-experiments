# Screenshots Experiment

Figuring out options to automate screenshots for AppStore submissions.

## Option 1. `ImageRenderer`

See `UsingImageRendererTests`.

* Easy to render any view in any state
* Doesn't show carrier, clock, etc
* Assets (at least colors) don't work:
  > No color named 'NiceOrange' found in asset catalog for .../ScreenshotsExperiment.app

## Option 2. `UIHostingController`

See `UsingUIHostingControllerTests`.

* Easy to render any view in any state
* Doesn't show carrier, clock, etc
* Assets work

## Option 3. `XCUIApplication`

See `UsingXCUIApplicationTests`.

* Difficult to render any view in any state - no programmatic access to the app code. Not obvious how to wait for app to fully launch.
* Shows carrier, clock, etc
* Assets work
