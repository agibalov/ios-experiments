import Testing
@testable import AppPackage

@Test
func twoAndThreeShouldBeFive() async throws {
    #expect(addNumbers(a: 2, b: 3) == 5)
}
