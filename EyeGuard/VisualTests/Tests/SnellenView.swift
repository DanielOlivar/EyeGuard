//
//  Test2.swift
//  NavigationControl
//
//  Created by Alumno on 03/04/25.
//

import SwiftUI

struct Snellen {
    var result: Double = 0.0
}

final class SnellenViewModel: ObservableObject {
    @Published var snellen = Snellen()
    
    func addResults() {
        snellen.result = 9.0
    }
    
    func getResults() -> Snellen {
        snellen
    }
}

struct SnellenView: View {
    
    @StateObject var viewModel: SnellenViewModel
    @Binding var results: Snellen?
    
    var onNext: () -> Void

    var body: some View {
        Text("Snellen")
        Button("Answer") {
            viewModel.addResults()
        }
        Button("Next") {
            results = viewModel.getResults()
            onNext()
        }
    }
}

#Preview {
    @State var results: Snellen? = nil
    return SnellenView(viewModel: SnellenViewModel(), results: $results, onNext: {})
}
