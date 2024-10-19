import SwiftUI
import Testing
import ViewInspector
@testable import UiTestingExperiment

struct DummyView: View {
    public var body: some View {
        Text("hello world")
    }
}

@MainActor
struct ViewInspectorTests {
    @Test
    func canCheckTextContent() throws {
        let sut = Text("hi there")
        let value = try sut.inspect().text().string()
        #expect(value == "hi there")
    }

    @Test
    func canCheckDummyView() throws {
        let sut = DummyView()
        let value = try sut.inspect().anyView().text().string()
        #expect(value == "hello world")
    }
}
