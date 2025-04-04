//
//  TestsResults.swift
//  NavigationControl
//
//  Created by Alumno on 03/04/25.
//

import SwiftUI

struct TestsResults: View {
    let results: VisualTestsResults
    let onFinish: () -> Void
    
    var body: some View {
        VStack {
            Text("Results")
            Text("Visual Acuity:")
            ForEach(results.visualAcuity?.results ?? [], id: \.self) {  result in
                Text(String(result))
            }
            Text("Snellen:")
            Text(String(results.snellen?.result ?? 0.0))
            Text("Color Blindness")
            Text(String(results.colorBlindness?.result ?? 0.0))
            Text("OcularFatigue")
            Text(String(results.ocularFatigue?.result ?? 0.0))
        }.onDisappear {
            onFinish()
        }
    }
}

#Preview {
    TestsResults(results: VisualTestsResults(), onFinish: {})
}
