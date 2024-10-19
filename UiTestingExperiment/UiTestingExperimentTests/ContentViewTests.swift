import SwiftUI
import ViewInspector
@testable import UiTestingExperiment
import XCTest

class ContentViewTests: XCTestCase {
    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
    }

    func testTwoAndThreeIsFive() throws {
        var sut = ContentView()

        let exp = sut.on(\.didAppear) { view in
            let form = try view.actualView().inspect().anyView().form()

            let aTextField = try form.find(viewWithAccessibilityIdentifier: ContentViewIds.aTextFieldName).textField()
            try aTextField.setInput("2")

            let bTextField = try form.find(viewWithAccessibilityIdentifier: ContentViewIds.bTextFieldName).textField()
            try bTextField.setInput("3")

            let addNumbersButton = try form.find(viewWithAccessibilityIdentifier: ContentViewIds.addNumbersButtonName).button()
            try addNumbersButton.tap()

            let resultTextField = try form.find(viewWithAccessibilityIdentifier: ContentViewIds.resultTextFieldName).textField()
            XCTAssertEqual("5", try resultTextField.input())
        }

        ViewHosting.host(view: sut)
        wait(for: [exp], timeout: 1)
    }

    func testFieldAValidation() throws {
        var sut = ContentView()

        let exp = sut.on(\.didAppear) { view in
            let form = try view.actualView().inspect().anyView().form()

            let aTextField = try form.find(viewWithAccessibilityIdentifier: ContentViewIds.aTextFieldName).textField()
            try aTextField.setInput("hello")

            let addNumbersButton = try form.find(viewWithAccessibilityIdentifier: ContentViewIds.addNumbersButtonName).button()
            try addNumbersButton.tap()

            let resultTextField = try form.find(viewWithAccessibilityIdentifier: ContentViewIds.resultTextFieldName).textField()
            XCTAssertEqual("a is not a number", try resultTextField.input())
        }

        ViewHosting.host(view: sut)
        wait(for: [exp], timeout: 1)
    }

    func testFieldBValidation() throws {
        var sut = ContentView()

        let exp = sut.on(\.didAppear) { view in
            let form = try view.actualView().inspect().anyView().form()

            let aTextField = try form.find(viewWithAccessibilityIdentifier: ContentViewIds.aTextFieldName).textField()
            try aTextField.setInput("2")

            let bTextField = try form.find(viewWithAccessibilityIdentifier: ContentViewIds.bTextFieldName).textField()
            try bTextField.setInput("hello")

            let addNumbersButton = try form.find(viewWithAccessibilityIdentifier: ContentViewIds.addNumbersButtonName).button()
            try addNumbersButton.tap()

            let resultTextField = try form.find(viewWithAccessibilityIdentifier: ContentViewIds.resultTextFieldName).textField()
            XCTAssertEqual("b is not a number", try resultTextField.input())
        }

        ViewHosting.host(view: sut)
        wait(for: [exp], timeout: 1)
    }
}
