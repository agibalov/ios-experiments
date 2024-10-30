import XCTest

final class UsingXCUIApplicationTests: XCTestCase {
    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    @MainActor
    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        let _ = XCTWaiter.wait(for: [XCTestExpectation(description: "Hello World!")], timeout: 2.0)

        let screenshot = app.screenshot()
        let url = PathHacks.hostUserHome.appending(path: "XCUIApplication.png")
        try screenshot.image.pngData()?.write(to: url)

        print("url: \(url)")
    }
}
