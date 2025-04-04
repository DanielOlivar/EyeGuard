//
//  Test3.swift
//  NavigationControl
//
//  Created by Alumno on 03/04/25.
//

import SwiftUI

struct ColorBlindness {
    var result: Double = 0.0
}

final class ColorBlindnessViewModel: ObservableObject {
    var colorBlindness = ColorBlindness()
    
    func addResults() {
        colorBlindness.result = 9.0
    }
    
    func getResults() -> ColorBlindness {
        colorBlindness
    }
}

struct ColorBlindnessView: View {
    
    @StateObject var viewModel: ColorBlindnessViewModel
    @Binding var results: ColorBlindness?

    var onNext: () -> Void
    
    var body: some View {
        Text("ColorBlindness")
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
    @State var results: ColorBlindness? = nil
    return ColorBlindnessView(viewModel: ColorBlindnessViewModel(), results: $results, onNext: {})
}
