import SwiftUI

enum Screen: Hashable {
    case home
    case todo(id: String)
    case about
}
