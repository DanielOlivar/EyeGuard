//
//  recomendaciones.swift
//  EyeGuard
//
//  Created by Sistemas on 04/04/25.
//

import SwiftUI

struct recomendaciones: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack{
            Image("logoEyeGuard")
                .resizable()
                .frame(width: 200, height: 200)
            Text("Recomendaciones")
                .bold()
                .font(.title)
                .foregroundStyle(Color.colorEyeGuard)
                .padding(.top,20)
            Text("1. Tomar descansos regulares")
                .font(.title3)
                //.padding(.horizontal,20)
                .padding(.top,15)
                .padding(.leading,15)
                .foregroundStyle(Color.colorEyeGuard)
            
            Text("Tomar descansos regulares de la pantalla puede ayudar a proteger la vista, es recomendable hacer una pausa de 5 minutos cada hora.")
                .font(.title3)
               // .padding(.horizontal,20)
                .padding(.top,15)
                .padding(.leading,20)
            Text("2. Usar filtros de luz azul")
                .font(.title3)
                //.padding(.horizontal,20)
                .padding(.top,15)
                .padding(.leading,15)
                .foregroundStyle(Color.colorEyeGuard)
            
            Text("Usar lentes o monitores con filtros de luz azul ayudan considerablemente la fatiga muscular ocacionada por estar mucho tiempo delante de la pantalla.")
                .font(.title3)
               // .padding(.horizontal,20)
                .padding(.top,15)
                .padding(.leading,20)
            Image(systemName: "checkmark.circle")
                .resizable()
                .foregroundStyle(Color.colorEyeGuard)
                .frame(width: 90, height: 90)
                .padding(.top, 40)
            
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
            .onAppear {
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            //MARK: Toolbar
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
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    recomendaciones()
}
