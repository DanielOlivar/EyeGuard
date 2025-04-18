//
//  misDatosVisuales.swift
//  EyeGuard
//
//  Created by Alumno on 03/04/25
//

import SwiftUI

struct misDatosVisuales: View {
    
    @State private var date = Date()
    @State private var usoLentes = true
    @State private var odESF: String = ""
    @State private var odCIL: String = ""
    @State private var odEJE: String = ""
    @State private var oiESF: String = ""
    @State private var oiCIL: String = ""
    @State private var oiEJE: String = ""
    @State private var comentarios: String = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack{
            Text("Mis datos visuales")
                .font(.title)
                .foregroundStyle(Color.colorEyeGuard)
                .bold()
                .padding(.top, 15)
            
            
            DatePicker(
                    "Última consulta",
                    selection: $date,
                    displayedComponents: [.date]
                )
                .frame(width: 270, height: 20)
                .padding(.top, 15)
                .foregroundStyle(Color.colorEyeGuard)
                .bold()
                .font(.title3)
            
            
            HStack{
                Text("¿Usas lentes?")
                    .foregroundStyle(Color.colorEyeGuard)
                    .bold()
                Toggle("Usas lentes?", isOn: $usoLentes)
                    .toggleStyle(.switch)
                    .labelsHidden() // Ocultar texto del toggle
                    .padding()
                    .tint(Color.colorEyeGuard)
            }.frame(maxWidth: .infinity)
            
            
            Text("Receta ótpica")
                .foregroundStyle(Color.colorEyeGuard)
                .padding(.top,15)
                .bold()
                .padding(.bottom, 20)
            
            
            HStack{
                Text(" ")
                Text(" ")
                Text(" ESF")
                    .foregroundStyle(Color.colorEyeGuard)
                Text(" CIL")
                    .foregroundStyle(Color.colorEyeGuard)
                Text(" EJE")
                    .foregroundStyle(Color.colorEyeGuard)
            }
            
            
            HStack{
                Text("OD")
                    .foregroundStyle(Color.colorEyeGuard)
                TextField(" ", text: $odESF)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 35)
                    .textInputAutocapitalization(.none)
                    .disableAutocorrection(true)
                    .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.colorEyeGuard, lineWidth: 1)
                    )
                    .padding(.bottom, 10)
                
                
                TextField(" ", text: $odCIL)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 35)
                    .textInputAutocapitalization(.none)
                    .disableAutocorrection(true)
                    .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.colorEyeGuard, lineWidth: 1)
                    )
                    .padding(.bottom, 10)
                
                
                TextField(" ", text: $odEJE)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 35)
                    .textInputAutocapitalization(.none)
                    .disableAutocorrection(true)
                    .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.colorEyeGuard, lineWidth: 1)
                    )
                    .padding(.bottom, 10)
            }
            
            
            HStack{
                Text("OI")
                    .foregroundStyle(Color.colorEyeGuard)
                
                
                Text("")
                
                
                TextField(" ", text: $oiESF)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 35)
                    .textInputAutocapitalization(.none)
                    .disableAutocorrection(true)
                    .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.colorEyeGuard, lineWidth: 1)
                    )
                    .padding(.bottom, 10)
                
                
                TextField(" ", text: $oiCIL)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 35)
                    .textInputAutocapitalization(.none)
                    .disableAutocorrection(true)
                    .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.colorEyeGuard, lineWidth: 1)
                    )
                    .padding(.bottom, 10)
                
                
                TextField(" ", text: $oiEJE)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 35)
                    .textInputAutocapitalization(.none)
                    .disableAutocorrection(true)
                    .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.colorEyeGuard, lineWidth: 1)
                    )
                    .padding(.bottom, 10)
            }
            
            
            Text("Notas o recomendaciones")
                .foregroundStyle(Color.colorEyeGuard)
                .padding(.top,15)
                .padding(.bottom, 15)
                .bold()
            
            
            TextField(" ", text: $comentarios)
                .textFieldStyle(.roundedBorder)
                .frame(width: 200, height: 150)
                .textInputAutocapitalization(.none)
                .disableAutocorrection(true)
                .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.colorEyeGuard, lineWidth: 1)
                )
            
            Button(action: {
                
            }) {
                Text("Guardar datos")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .padding(.horizontal, 15)
                    .padding(.vertical, 10)
                    .background(Color.colorEyeGuard)
                    .clipShape(RoundedRectangle(cornerRadius: 7))
                    .padding(.top, 15)
            }
            
            Spacer()
            
            Button(action: {
                dismiss()
            }) {
                Text("Regresar")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .padding(.horizontal, 15)
                    .padding(.vertical, 10)
                    .background(Color.colorEyeGuard)
                    .clipShape(RoundedRectangle(cornerRadius: 7))
                    .padding(.top, 15)
            }
            //Spacer()
        }//.navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("EyeGuard")
                        .font(.system(.title)) // Cambia el tamaño de la fuente
                        .foregroundColor(.white) // Cambia el color del título
                        .bold()
                }
            }
            .toolbarBackground(Color.colorEyeGuard, for: .navigationBar)
            .toolbarBackgroundVisibility(.visible)
    }
}

#Preview {
    misDatosVisuales()
}
