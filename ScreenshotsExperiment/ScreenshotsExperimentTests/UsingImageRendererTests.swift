import Testing
import SwiftUI
@testable import ScreenshotsExperiment

struct UsingImageRendererTests {
    @Test
    @MainActor
    func test() throws {
        let view = ContentView()
            .frame(width: 375, height: 667)

        let url = PathHacks.hostUserHome.appending(path: "ImageRenderer.png")
        makeScreenshotUsingImageRendererTests(view: view, targetUrl: url)

        print("url: \(url)")
    }
}

@MainActor
func makeScreenshotUsingImageRendererTests<Content>(view: Content, targetUrl: URL) where Content: View {
    let renderer = ImageRenderer(content: view)
    try! renderer.uiImage!.pngData()!.write(to: targetUrl)
}
