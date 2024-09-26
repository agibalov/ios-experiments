import Testing

struct GenericTests {
    @Test
    func canUseGenericFunctions() {
        func add<T: Numeric>(_ a: T, _ b: T) -> T {
            return a + b
        }
        
        #expect(add(2, 3) == 5)
        #expect(abs(add(2.1, 3.2) - 5.3) < 1e-10)
    }
    
    @Test
    func canUseGenericClasses() {
        class Calculator<T: Numeric> {
            var value: T = T(exactly: 0)!
            
            func add(_ x: T) {
                value += x
            }
        }
        
        let intCalculator = Calculator<Int>()
        #expect(intCalculator.value == 0)
        
        intCalculator.add(3)
        #expect(intCalculator.value == 3)
        
        
        let doubleCalculator = Calculator<Double>()
        #expect(abs(doubleCalculator.value) < 1e-10)
        
        doubleCalculator.add(3)
        #expect(abs(doubleCalculator.value - 3) < 1e-10)
    }
    
    @Test
    func canUseGenericProtocols() {
        protocol Listener {
            associatedtype TMessage
            func onMessage(message: TMessage)
        }
        
        class Messager {
            func sendMessage<TMessage, ListenerType: Listener>(
                _ message: TMessage,
                _ listener: ListenerType)
            where ListenerType.TMessage == TMessage {
                    
                listener.onMessage(message: message)
            }
        }
        
        class MyStringListener : Listener {
            typealias TMessage = String
            
            var message: String?
            
            func onMessage(message: String) {
                self.message = message
            }
        }
        
        let messager = Messager()
        
        let myStringListener = MyStringListener()
        messager.sendMessage("hello", myStringListener)
        #expect(myStringListener.message == "hello")
        
        class MyGenericListener<M> : Listener {
            typealias TMessage = M
            
            var message: M?
            
            func onMessage(message: M) {
                self.message = message
            }
        }
        
        let myGenericListener = MyGenericListener<Int>()
        messager.sendMessage(234, myGenericListener)
        #expect(myGenericListener.message == 234)
    }
}
