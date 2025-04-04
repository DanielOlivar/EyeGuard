//
//  Test1.swift
//  NavigationControl
//
//  Created by Alumno on 03/04/25.
//

import SwiftUI
import SwiftUI

struct VisualAcuity {
    var results: [Bool] = []
}

final class VisualAcuityViewModel: ObservableObject {
    var visualAcuity = VisualAcuity()
    
    func addResults() {
        visualAcuity.results = [true, false, true]
    }
    
    func getResults() -> VisualAcuity {
        visualAcuity
    }
}

struct VisualAcuityView: View {
    
    @StateObject var viewModel: VisualAcuityViewModel
    @Binding var results: VisualAcuity?
    @State private var showInfoAlert = false
    @State private var selectedAnswer: String? = nil

    let respuestas = [
        "Linea 1",
        "Linea 2",
        "Linea 3",
        "Linea 4",
        "Linea 5",
        "Linea 6",
        "Linea 7",
        "Linea 8",
        "Linea 9",
        "Linea 10",
        "Linea 11",
        "No puedo ver ninguna letra"
    ]

    var onNext: () -> Void
    
    var body: some View {
        VStack {
            // Título principal
            Text("Prueba de Agudeza Visual")
                .font(.title)
                .bold()
                .foregroundColor(.colorEyeGuard)
                .padding(.top, 30)
            Button(action: {
                showInfoAlert = true
            }) {
                Text("Instrucciones")
                    .fontWeight(.semibold)
                    .padding()
                    .padding(.horizontal)
                    .foregroundColor(.white)
                    .background(Color.colorEyeGuard)
                    .cornerRadius(10)
            }
            .alert(isPresented: $showInfoAlert) {
                Alert(
                    title: Text("Instrucciones de uso"),
                    message: Text("""
            • Ilumina bien la habitación y ajusta el brillo del teléfono al 100%.
            • Coloca la pantalla a 1.2 m (4 pies) del paciente.
            • Evalúa cada ojo por separado; cubre el ojo contrario.
            """),
                    dismissButton: .default(Text("Entendido"))
                )
            }


            Spacer()
            
            VStack(spacing: 20) {
                Text("Selecciona la menor linea que puedas leer correctamente.")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                // Botón de Información
                
                
                // Botón para responder
                VStack(alignment: .leading, spacing: 10) {
                    Picker(selection: $selectedAnswer) {
                        ForEach(respuestas, id: \.self) { respuesta in
                            Text(respuesta).tag(Optional(respuesta))
                        }
                    } label: {
                        // Sin texto, vacío
                        EmptyView()
                    }
                    .pickerStyle(.menu)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.colorEyeGuard, lineWidth: 2)
                    )
                    .padding(.horizontal)

                }
            
            
                
                // Botón para continuar
                Button(action: {
                    if let selected = selectedAnswer {
                        viewModel.addResults() // Aquí podrías pasar la respuesta si quieres
                        results = viewModel.getResults()
                        onNext()
                    }
                }) {
                    Text("Siguiente")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(selectedAnswer != nil ? Color.colorEyeGuard : Color.gray.opacity(0.5))
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                .disabled(selectedAnswer == nil)

            }
            .padding()
            .background(Color.white)
            .cornerRadius(16)
            .shadow(radius: 4)
            .padding()
            
            Spacer()
        }
    }
}

#Preview {
    @State var results: VisualAcuity? = nil
    return VisualAcuityView(viewModel: VisualAcuityViewModel(), results: $results, onNext: {})
}
