import SwiftUI

struct ContentView: View {
    @Environment(Router.self) var router
    
    var body: some View {
        @Bindable var router = router
        NavigationStack(path: $router.path) {
            router.navigate(to: .home)
                .navigationDestination(for: Screen.self) { screen in
                    router.navigate(to: screen)
                }
        }
    }
}

#Preview {
    let router = Router(todoRepository: TodoRepository())
    ContentView().environment(router)
}
