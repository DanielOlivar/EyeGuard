//
//  EyeSightTest.swift
//  EyeGuard
//
//  Created by Alexis Sanchez on 01/04/25.
//

import SwiftUI

struct EyeSightTestView: View {
    
    @State private var nombre: String = ""
    @State private var edad: String = ""
    @State private var problemaVisual: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            VStack(alignment: .leading, spacing: 5) {
                Text("Test de")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                Text("Agudeza Visual")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            
            
            Group {
                TextField("Nombre", text: $nombre)
                TextField("Edad", text: $edad)
                    .keyboardType(.numberPad)
                TextField("Problema visual", text: $problemaVisual)
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(12)
            .padding(.horizontal)
            
            
            Button(action: {
                // Acción al registrarse
                print("Registrado: \(nombre), \(edad), \(problemaVisual)")
            }) {
                Text("Registrarse")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.colorEyeGuard)
                    .cornerRadius(12)
            }
            .padding(.horizontal)
            
            Spacer()
        }
    }
}

#Preview {
    EyeSightTestView()
}
