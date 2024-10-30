import Testing
import SwiftUI
@testable import ScreenshotsExperiment

struct UsingUIHostingControllerTests {
    @Test
    @MainActor
    func test() {
        let view = ContentView()
            .frame(width: 375, height: 667)

        let url = PathHacks.hostUserHome.appending(path: "UIHostingController.png")
        makeScreenshotUsingUIHostingController(view: view, targetUrl: url)

        print("url: \(url)")
    }
}

func makeScreenshotUsingUIHostingController<Content>(view: Content, targetUrl: URL) where Content: View {
    let controller = UIHostingController(rootView: view)
    controller.view.bounds = CGRect(origin: .zero, size: controller.view.intrinsicContentSize)

    UIGraphicsBeginImageContextWithOptions(controller.view.bounds.size, controller.view.isOpaque, 0.0)
    controller.view.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
    let image = UIGraphicsGetImageFromCurrentImageContext()!
    UIGraphicsEndImageContext()

    try! image.pngData()!.write(to: targetUrl)
}
