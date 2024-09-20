import Testing
@testable import TestingExperiment

struct TestingExperimentTests {
    @Test func thisTestShouldSucceed() {
        #expect(Calculator.add(2, 3) == 5)
    }
    
    @Test func thisTestShouldFail() {
        #expect(Calculator.add(2, 3) == -1)
    }
}
