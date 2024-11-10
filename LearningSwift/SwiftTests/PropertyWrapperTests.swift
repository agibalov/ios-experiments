import Testing
import Cocoa

struct PropertyWrapperTests {
    @Test
    func canUseStructPropertyWrapper() {
        struct MyStruct {
            @NotLargerThan(value: 5, maximum: 10) public var i: Int
        }

        var s = MyStruct()
        #expect(s.i == 5)
        #expect(s.$i == 5)

        s.i = 10
        #expect(s.i == 10)
        #expect(s.$i == 10)

        s.i = 11
        #expect(s.i == 10)
        #expect(s.$i == 11)
    }

    @Test
    func canUseLocalVariablePropertyWrapper() {
        @NotLargerThan(value: 5, maximum: 10) var i
        #expect(i == 5)

        i = 11
        #expect(i == 10)
        #expect($i == 11)
    }
}

@propertyWrapper
struct NotLargerThan {
    private var actualValue: Int
    private var maximum: Int

    init(value: Int, maximum: Int) {
        self.actualValue = value
        self.maximum = maximum
    }

    var wrappedValue: Int {
        get { return min(actualValue, maximum) }
        set { actualValue = newValue }
    }

    var projectedValue: Int {
        return actualValue
    }
}
