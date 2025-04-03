//
//  EyeSightTest.swift
//  EyeGuard
//
//  Created by Alexis Sanchez on 01/04/25.
//

import SwiftUI

struct EyeSightTest: View {
    @State private var seleccionCompleta = true
    @State private var pruebasSeleccionadas: Set<String> = []

    let pruebas = ["Agudeza visual", "Astigmatismo", "Fatiga ocular", "Daltonismo"]

    var body: some View {
        VStack {

            Text("Evalúa mi visión")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.colorEyeGuard)
                .padding(.top, 30)

            Spacer()

            VStack(spacing: 20) {
                Text("¿Quieres hacer una evaluación completa o pruebas individuales?")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)

                HStack(spacing: 10) {
                    Button(action: {
                        seleccionCompleta = true
                        pruebasSeleccionadas.removeAll()
                    }) {
                        Text("Evaluación completa")
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundColor(.white)
                            .background(seleccionCompleta ? Color.colorEyeGuard : Color.colorEyeGuard.opacity(0.5))
                            .cornerRadius(10)
                    }

                    Button(action: {
                        seleccionCompleta = false
                    }) {
                        Text("Pruebas individuales")
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundColor(Color.colorEyeGuard)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.colorEyeGuard, lineWidth: 2)
                            )
                    }
                }
                .padding(.horizontal)

                // Lista de pruebas si eligió individuales
                if !seleccionCompleta {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Elige")
                            .font(.headline)
                            .foregroundColor(.black)

                        ForEach(pruebas, id: \.self) { prueba in
                            HStack {
                                Button(action: {
                                    if pruebasSeleccionadas.contains(prueba) {
                                        pruebasSeleccionadas.remove(prueba)
                                    } else {
                                        pruebasSeleccionadas.insert(prueba)
                                    }
                                }) {
                                    Image(systemName: pruebasSeleccionadas.contains(prueba) ? "checkmark.square.fill" : "square")
                                        .foregroundColor(.colorEyeGuard)
                                }
                                Text(prueba)
                            }
                        }
                    }
                    .padding(.horizontal)
                }

                // Botón Comenzar
                if seleccionCompleta || (!seleccionCompleta && !pruebasSeleccionadas.isEmpty) {
                    Button(action: {
                        print("Comenzar evaluación...")
                    }) {
                        Text("Comenzar")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.horizontal, 40)
                            .padding(.vertical, 12)
                            .background(Color.colorEyeGuard)
                            .cornerRadius(10)
                    }
                    .padding(.top, 20)
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(16)
            .shadow(radius: 4)
            .padding()

            Spacer()
        }
        .background(Color(.systemGroupedBackground).ignoresSafeArea())
    }
}

#Preview {
    EyeSightTest()
}


