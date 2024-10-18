# PackageAppExperiment

Figuring out how to put all the app code into a package, leaving only the App class in the app project. The benefits are:

* Being able to reuse the same code in multiple apps. Confirmed.
* No constant noise in `*.pbxproj` - because now only the App class is in `*.pbxproj`. Confirmed.
* Being able to run tests easily via CLI. This doesn't work - you can run `cd AppPackage && swift test`, but it will fail to build the package, because it tries to build against multiple platforms and looks like there's no way to tell it to only build for iOS.
