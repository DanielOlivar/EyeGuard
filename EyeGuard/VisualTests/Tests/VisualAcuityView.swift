//
//  VisualAcuity.swift
//  NavigationControl
//
//  Created by Alumno on 03/04/25.
//

import SwiftUI
import SwiftUI

struct VisualAcuity {
    var results: Int = 0
}

final class VisualAcuityViewModel: ObservableObject {
    var visualAcuity = VisualAcuity()
    
    func addResults(res: Int) {
        visualAcuity.results = res
    }
    
    func getResults() -> VisualAcuity {
        visualAcuity
    }
}

struct VisualAcuityView: View {
    
    @StateObject var viewModel: VisualAcuityViewModel
    @Binding var results: VisualAcuity?
    @State private var selectedIndex: Int? = nil
    @State private var showInfoAlert = false


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
        VStack(spacing: 4) {
            
            // Encabezado fijo arriba
            VStack(spacing: 10) {
                Text("Prueba de Agudeza Visual")
                    .font(.title)
                    .bold()
                    .foregroundColor(.colorEyeGuard)
                    .padding(.top, 10)
                
                Button(action: {
                    showInfoAlert = true
                }) {
                    Text("Instrucciones")
                        .fontWeight(.semibold)
                        .padding(.vertical,8)
                        .padding(.horizontal,10)
                        .foregroundColor(.white)
                        .background(Color.colorEyeGuard)
                        .cornerRadius(8)
                }
                .alert(isPresented: $showInfoAlert) {
                    Alert(
                        title: Text("Instrucciones de uso"),
                        message: Text("""
• Ilumina bien la habitación y ajusta el brillo del teléfono al 100%.
• Coloca la pantalla a 1.2 m (4 pies).
• Evalúa cada ojo por separado; cubre el ojo contrario.
"""),
                        dismissButton: .default(Text("Entendido"))
                    )
                }
            }

            
            // Imagen central con scroll
                ScrollView(.vertical, showsIndicators: true) {
                    Image("snellen")
                        .resizable()
                        .scaledToFit()
                        .padding(.vertical, 4)
                }
                .frame(maxHeight: .infinity) // Ocupa el espacio disponible para que los botones queden abajo
                
            
            
            // Zona de selección fija abajo
                       VStack(spacing: 8) {
                           Text("Selecciona la menor linea que puedas leer correctamente.")
                               .multilineTextAlignment(.center)
                               .padding(.horizontal)
                           
                           Picker(selection: $selectedIndex) {
                               Text("Selecciona...").tag(Optional<Int>(nil))
                               ForEach(respuestas.indices, id: \.self) { index in
                                   Text(respuestas[index]).tag(Optional(index))
                               }
                           }label: {
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

                           Button(action: {
                               if let index = selectedIndex {
                                   viewModel.addResults(res: index)
                                   results = viewModel.getResults()
                                   onNext()
                               }
                           }) {
                               Text("Siguiente")
                                   .fontWeight(.semibold)
                                   .frame(maxWidth: .infinity)
                                   .padding()
                                   .foregroundColor(.white)
                                   .background(selectedIndex != nil ? Color.colorEyeGuard : Color.gray.opacity(0.5))
                                   .cornerRadius(10)
                                   .padding(.horizontal)
                           }
                           .disabled(selectedIndex == nil)

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
    @Previewable @State var results: VisualAcuity? = nil
    return VisualAcuityView(viewModel: VisualAcuityViewModel(), results: $results, onNext: {})
}
