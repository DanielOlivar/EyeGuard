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
        "La agudeza visual por debajo que 20/25 debe ser evaluada por un profesional de la vista autorizado para determinar si pueden ser necesarios lentes correctivos u otros tratamientos."
    
    let results: VisualTestsResults
    let onFinish: () -> Void
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                Text("Resultados")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.colorEyeGuard)
                    .padding(.top, 20)
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("Agudeza visual:")
                        .font(.headline)
                        .foregroundColor(.colorEyeGuard)

                    if let index = results.visualAcuity?.results,
                       index >= 0 && index < visualAcuityResults.count {
                        Text(visualAcuityResults[index])
                            .font(.title3)
                            .foregroundColor(.black)

                        if index < 7 {
                            Text(recommendation)
                                .foregroundColor(.red)
                                .font(.subheadline)
                        } else if (index == 11) {
                            Text(recommendation)
                                .foregroundColor(.red)
                                .font(.subheadline)
                        } else {
                            Text("Tienes una buena agudeza visual!")
                                .foregroundColor(.green)
                                .font(.subheadline)
                        }
                    } else {
                        Text("No se registró resultado")
                            .foregroundColor(.gray)
                    }

                    Divider()

                    Text("Snellen:")
                        .font(.headline)
                        .foregroundColor(.colorEyeGuard)
                    Text(String(results.snellen?.result ?? 0.0))
                        .foregroundColor(.black)

                    Text("Daltonismo:")
                        .font(.headline)
                        .foregroundColor(.colorEyeGuard)
                    
                    if ( (results.colorBlindness?.result ?? 0) > 10 ) {
                        Text("Tú visión es normal!").foregroundStyle(Color.green)
                    } else if ( (results.colorBlindness?.result ?? 0) > 7 ) {
                        Text("Leve deficiencia posible (puede que confunda algunos tonos).").foregroundStyle(Color.yellow)
                    } else if ( (results.colorBlindness?.result ?? 0) > 3 ) {
                        Text("Deficiencia moderada (alta probabilidad de daltonismo rojo-verde).").foregroundStyle(Color.orange)
                    } else {
                        Text("Deficiencia severa, casi total en la percepción de rojos y verdes.").foregroundStyle(Color.red)
                    }

            
                    Text("Ocular Fatigue:")
                        .font(.headline)
                        .foregroundColor(.colorEyeGuard)
                    Text(String(results.ocularFatigue?.result ?? 0.0))
                        .foregroundColor(.black)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(16)
                .shadow(radius: 4)
                .padding(.horizontal)
                .padding(.bottom, 20)
            }
        }
        .background(Color(UIColor.systemGroupedBackground).ignoresSafeArea())
        .onDisappear {
            onFinish()
        }
    }
}

#Preview {
    TestsResults(results: VisualTestsResults(), onFinish: {})
}
