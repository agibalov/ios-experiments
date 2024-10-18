import Testing
@testable import UiTestingExperiment

struct CalculatorTests {
    @Test
    func twoAndThreeIsFive() {
        #expect(addNumbers(a: 2, b: 3) == 5)
    }
}
