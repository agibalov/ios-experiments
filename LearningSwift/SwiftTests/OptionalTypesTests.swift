import Testing

struct OptionalTypesTests {
    let x: Int? = nil
    let y: Int? = 123
    
    @Test
    func canCheckForNilness() {
        #expect(x == nil)
        #expect(x != 123)
        
        #expect(y != nil)
        #expect(y == 123)
    }
    
    @Test
    func canUseNilCoalescingOperator1() {
        let a = x ?? 1
        #expect(a == 1)
        
        let b = y ?? 1
        #expect(b == 123)
    }
    
    @Test
    func canUseNilCoalescingOperator2() {
        func one(_ a: Int?, _ b: Int?, _ c: Int?) -> Int? {
            return a ?? b ?? c
        }
        
        #expect(one(1, nil, nil) == 1)
        #expect(one(nil, 1, nil) == 1)
        #expect(one(nil, nil, 1) == 1)
        #expect(one(1, 2, nil) == 1)
        #expect(one(1, nil, 2) == 1)
        #expect(one(nil, 1, 2) == 1)
        #expect(one(nil, nil, nil) == nil)
    }
    
    @Test
    func canUseIfLetSyntax() {
        // let sum = x + 1 // can't do that
        if let x {
            let sum = x + 1
            #expect(false, "should never get here")
        } else {
            #expect(true)
        }
        
        if let y {
            let sum = y + 1
            #expect(sum == 124)
        } else {
            #expect(false, "should never get here")
        }
        
        if let a = x {
            let sum = a + 1
            #expect(false, "should never get here")
        } else {
            #expect(true)
        }
        
        if let b = y {
            let sum = b + 1
            #expect(sum == 124)
        } else {
            #expect(false, "should never get here")
        }
    }
    
    @Test
    func canUseGuardLetSyntax1() {
        guard let x else {
            return
        }
        
        #expect(false, "should never get here")
    }
    
    @Test
    func canUseGuardLetSyntax2() {
        guard let a = x else {
            return
        }
        
        #expect(false, "should never get here")
    }
    
    @Test
    func canUseGuardLetSyntax3() {
        guard let y else {
            #expect(false, "should never get here")
            return
        }
        
        #expect(y + 1 == 124)
    }
    
    @Test
    func canUseGuardLetSyntax4() {
        guard let b = y else {
            #expect(false, "should never get here")
            return
        }
        
        #expect(b + 1 == 124)
    }
    
    @Test
    func canUseImplicitlyUnwrappedOptionals() {
        if true {
            var a: Int! = nil
            #expect(a == nil)
            
            a = 1
            #expect(a + 2 == 3) // it's just "a", not "a!"
        }
        
        if true {
            var a: Int? = nil
            #expect(a == nil)
            
            a = 1
            #expect(a! + 2 == 3) // it's "a!"
        }
    }
    
    @Test
    func canUseOptionalChaining() {
        struct Name {
            var first: String?
            var last: String?
        }
        
        struct Person {
            var name: Name?
        }
        
        func firstNameOrNil(_ person: Person?) -> String? {
            person?.name?.first
        }
        
        #expect(firstNameOrNil(nil) == nil)
        #expect(firstNameOrNil(Person(name: nil)) == nil)
        #expect(firstNameOrNil(Person(name: Name(first: nil, last: nil))) == nil)
        #expect(firstNameOrNil(Person(name: Name(first: "John", last: "Smith"))) == "John")
        
        func firstNameOrDefault(_ person: Person?, _ defaultValue: String) -> String {
            person?.name?.first ?? defaultValue
        }
        
        #expect(firstNameOrDefault(nil, "hello") == "hello")
        #expect(firstNameOrDefault(Person(name: nil), "hello") == "hello")
        #expect(firstNameOrDefault(Person(name: Name(first: nil, last: nil)), "hello") == "hello")
        #expect(firstNameOrDefault(Person(name: Name(first: "John", last: "Smith")), "hello") == "John")
    }
}
