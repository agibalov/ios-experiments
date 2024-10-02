import SwiftUI

public struct ContentView: View {
    public static let aTextFieldName = "aTextField"
    public static let bTextFieldName = "bTextField"
    public static let resultTextFieldName = "resultTextField"
    public static let addNumbersButtonName = "addNumbersButton"
    
    @State private var aString = ""
    @State private var bString = ""
    @State private var sumString = ""
    
    public var body: some View {
        Form {
            Section(header: Text("A goes here")) {
                TextField("a number", text: $aString)
                    .accessibilityIdentifier(ContentViewIds.aTextFieldName)
            }
            Section(header: Text("B goes here")) {
                TextField("b number", text: $bString)
                    .accessibilityIdentifier(ContentViewIds.bTextFieldName)
            }
            Section(header: Text("A+B goes here")) {
                TextField("result number", text: $sumString)
                    .accessibilityIdentifier(ContentViewIds.resultTextFieldName)
            }
            Button("Add Numbers") {
                guard let a = Int(aString) else {
                    sumString = "a is not a number"
                    return
                }
                guard let b = Int(bString) else {
                    sumString = "b is not a number"
                    return
                }
                
                sumString = String(a + b)
            }
            .accessibilityIdentifier(ContentViewIds.addNumbersButtonName)
        }
    }
}

#Preview {
    ContentView()
}
