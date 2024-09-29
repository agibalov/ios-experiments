import SwiftUI

class Todo: Identifiable {
    public var id: String
    public var text: String
    public var done: Bool
    
    init(id: String, text: String, done: Bool) {
        self.id = id
        self.text = text
        self.done = done
    }
}
