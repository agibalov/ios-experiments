import Testing
@testable import TestingExperiment

struct ParameterizedTests {
    @Test(arguments: [
        [2, 3, 5],
        [1, 2, 3],
        [5, 11, 999]
    ])
    func sumShouldBeCorrect(args: [Int]) {
        let a = args[0]
        let b = args[1]
        let result = args[2]
        
        print("\(a) + \(b) = \(result)")
        
        #expect(Calculator.add(a, b) == result)
    }
}
