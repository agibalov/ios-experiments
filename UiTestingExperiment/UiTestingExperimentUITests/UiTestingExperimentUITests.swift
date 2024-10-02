import XCTest

final class UiTestingExperimentUITests: XCTestCase {
    private var app: XCUIApplication!
    private var aTextField: XCUIElement!
    private var bTextField: XCUIElement!
    private var addNumbersButton: XCUIElement!
    private var resultTextField: XCUIElement!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        
        app = XCUIApplication()
        app.launch()
        
        aTextField = app.textFields[ContentViewIds.aTextFieldName]
        bTextField = app.textFields[ContentViewIds.bTextFieldName]
        addNumbersButton = app.buttons[ContentViewIds.addNumbersButtonName]
        resultTextField = app.textFields[ContentViewIds.resultTextFieldName]
    }

    override func tearDownWithError() throws {
    }

    @MainActor
    func testAppCanAdd2And3() throws {
        aTextField.tap()
        aTextField.typeText("2")
        
        bTextField.tap()
        bTextField.typeText("3")
        
        addNumbersButton.tap()
        
        XCTAssertEqual("5", resultTextField.value as! String)
    }
    
    @MainActor
    func testAppCanAdd5And7() throws {
        aTextField.tap()
        aTextField.typeText("5")
        
        bTextField.tap()
        bTextField.typeText("7")
        
        addNumbersButton.tap()
        
        XCTAssertEqual("12", resultTextField.value as! String)
    }
    
    @MainActor
    func testAppReportsErrorIfAIsNotANumber() throws {
        aTextField.tap()
        aTextField.typeText("hello")
        
        addNumbersButton.tap()
        
        XCTAssertEqual("a is not a number", resultTextField.value as! String)
    }
    
    @MainActor
    func testAppReportsErrorIfBIsNotANumber() throws {
        aTextField.tap()
        aTextField.typeText("2")
        
        bTextField.tap()
        bTextField.typeText("hello")
        
        addNumbersButton.tap()
        
        XCTAssertEqual("b is not a number", resultTextField.value as! String)
    }
}
