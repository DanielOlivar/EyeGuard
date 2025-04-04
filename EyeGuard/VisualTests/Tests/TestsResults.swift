//
//  TestsResults.swift
//  NavigationControl
//
//  Created by Alumno on 03/04/25.
//

import SwiftUI

struct TestsResults: View {
    let visualAcuityResults = [
        "20/200",
        "20/100",
        "20/70",
        "20/60",
        "20/50",
        "20/40",
        "20/30",
        "20/25",
        "20/20",
        "20/20",
        "20/20",
        "No puede ver letras"
    ]

    let recommendation =
        "La agudeza visual peor que 20/25 debe ser evaluada por un profesional de la vista autorizado para determinar si pueden ser necesarios lentes correctivos u otros tratamientos."
    let results: VisualTestsResults
    let onFinish: () -> Void
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Resultados")
                .font(.title)
                .bold()
            
            Text("Agudeza visual:")
                .font(.headline)

            if let index = results.visualAcuity?.results,
               index >= 0 && index < visualAcuityResults.count {
                Text(visualAcuityResults[index])
                    .font(.title3)
                if index < 7 {
                    Text(recommendation).foregroundStyle(Color.red)
                }else if (index == 11) {
                    Text(recommendation).foregroundStyle(Color.red)
                }else{
                    Text("Tienes una buena agudeza visual!").foregroundStyle(Color.green)
                }
            } else {
                Text("No se registró resultado")
            }
            
            Divider()
            
            Text("Snellen:")
                .font(.headline)
            Text(String(results.snellen?.result ?? 0.0))

            Text("Color Blindness:")
                .font(.headline)
            Text(String(results.colorBlindness?.result ?? 0.0))

            Text("Ocular Fatigue:")
                .font(.headline)
            Text(String(results.ocularFatigue?.result ?? 0.0))

        }
        .padding()
        .onDisappear {
            onFinish()
        }
    }
}


#Preview {
    TestsResults(results: VisualTestsResults(), onFinish: {})
}
