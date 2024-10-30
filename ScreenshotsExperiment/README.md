# Screenshots Experiment

Figuring out options to automate screenshots for AppStore submissions

## Option 1. `ImageRenderer`

See `UsingImageRendererTests`. This one has difficulties with assets:

> No color named 'NiceOrange' found in asset catalog for .../ScreenshotsExperiment.app

## Option 2. `UIHostingController`

See `UsingUIHostingControllerTests`. This one works and there are no obvious problems.

## Option 3. `XCUIApplication`

See `UsingXCUIApplicationTests`. This one works and there are no obvious problems.