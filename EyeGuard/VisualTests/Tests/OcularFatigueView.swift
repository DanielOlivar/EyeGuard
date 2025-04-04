//
//  OcularFatigue.swift
//  EyeGuard
//
//  Created by Alexis Sanchez on 04/04/25.
//

import SwiftUI


struct OcularFatigue {
    var result: Double = 0.0
}

final class OcularFatigueViewModel: ObservableObject {
    @Published var ocularFatigue = OcularFatigue()
    
    func addResults() {
        ocularFatigue.result = 1.0
    }
    
    func getResults() -> OcularFatigue {
        ocularFatigue
    }
}

struct OcularFatigueView: View {
    
    @StateObject var viewModel: OcularFatigueViewModel
    @Binding var results: OcularFatigue?
    
    var onNext: () -> Void

    var body: some View {
        Text("OcularFatigue")
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
    @State var results: OcularFatigue? = nil
    return OcularFatigueView(viewModel: OcularFatigueViewModel(), results: $results, onNext: {})
}
