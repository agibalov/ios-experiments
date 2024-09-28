import Testing

struct GuardTests {
    @Test
    func canUseGuard() {
        enum AddError: Error {
            case aIsTooBig
            case bIsTooBig
        }
        
        func add(_ a: Int, _ b: Int) throws -> Int {
            guard a <= 10 else {
                throw AddError.aIsTooBig
            }
            guard b <= 10 else {
                throw AddError.bIsTooBig
            }
            return a + b
        }
        
        #expect(throws: AddError.aIsTooBig) {
            try add(11, 3)
        }
        
        #expect(throws: AddError.bIsTooBig) {
            try add(3, 11)
        }
        
        #expect(try! add(2, 3) == 5)
    }
}
