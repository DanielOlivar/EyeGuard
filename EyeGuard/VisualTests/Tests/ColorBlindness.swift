//
//  Test3.swift
//  NavigationControl
//
//  Created by Alumno on 03/04/25.
//
import SwiftUI

struct ColorBlindness {
    var result: Int = 0
}

final class ColorBlindnessViewModel: ObservableObject {
    @Published var colorBlindness = ColorBlindness()
    
    func addResults(score: Int) {
        colorBlindness.result = score
    }
    
    func getResults() -> ColorBlindness {
        colorBlindness
    }
}

struct ColorBlindnessView: View {
    
    @StateObject var viewModel: ColorBlindnessViewModel
    @Binding var results: ColorBlindness?
    
    var onNext: () -> Void

    let images = ["Ishihara_01", "Ishihara_02", "Ishihara_03",
                  "Ishihara_04", "Ishihara_05", "Ishihara_06",
                  "Ishihara_07", "Ishihara_08", "Ishihara_09",
                  "Ishihara_10", "Ishihara_11", "Ishihara_12",
                ]
    let correctAnswers = ["74", "6", "16", "2", "29", "7", "45","5","97","8","42","3"]
    @State private var currentIndex = 0
    @State private var userAnswers: [String] = Array(repeating: "", count: 12)
    @State private var selectedAnswer: String? = nil
    
    var body: some View {
        VStack(spacing: 4) {
            
            VStack(spacing: 10) {
                Text("Prueba de Daltonismo")
                    .font(.title)
                    .bold()
                    .foregroundColor(.colorEyeGuard)
                    .padding(.top, 10)
            }
            Spacer()
            TabView(selection: $currentIndex) {
                ForEach(0..<images.count, id: \.self) { index in
                    Image(images[index])
                        .resizable()
                        .scaledToFit()
                        .tag(index)
                        .padding(.vertical, 4)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .frame(height: 300) // Ajusta según tus imágenes
            Spacer()

            VStack(spacing: 8) {
                Text("¿Qué número ves en la imagen?")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                TextField("Ingresa tu respuesta", text: Binding(
                    get: { userAnswers[currentIndex] },
                    set: { userAnswers[currentIndex] = $0 }
                ))
                .keyboardType(.numberPad)
                .padding()
                .background(Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.colorEyeGuard, lineWidth: 2)
                )
                .padding(.horizontal)

                // Botón para ir a la siguiente imagen o finalizar
                Button(action: {
                    if currentIndex < images.count - 1 {
                        currentIndex += 1
                    } else {
                        // Calcular aciertos
                        let score = zip(userAnswers, correctAnswers).filter { $0 == $1 }.count
                        viewModel.addResults(score: score)
                        results = viewModel.getResults()
                        onNext()
                    }
                }) {
                    Text(currentIndex < images.count - 1 ? "Siguiente" : "Finalizar")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.colorEyeGuard)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 4)
            .padding()
        }
    }
}

#Preview {
    @State var results: ColorBlindness? = nil
    return ColorBlindnessView(viewModel: ColorBlindnessViewModel(), results: $results, onNext: {})
}
