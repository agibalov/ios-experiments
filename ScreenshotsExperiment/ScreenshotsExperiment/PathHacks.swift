import Foundation

struct PathHacks {
    static var hostUserHome: URL {
        let homeDirectoryString = URL.homeDirectory.absoluteString
        let match = homeDirectoryString.firstMatch(of: /(file:\/\/\/Users\/[^\/]+)/)!
        return URL(string: String(match.1))!
    }
}
