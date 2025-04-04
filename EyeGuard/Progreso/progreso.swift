//
//  progreso.swift
//  EyeGuard
//
//  Created by Sistemas on 04/04/25.
//

import SwiftUI

struct progreso: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack{
            Image("logoEyeGuard")
                .resizable()
                .frame(width: 200, height: 200)
            Text("Mi progreso")
                .bold()
                .font(.title)
                .foregroundStyle(Color.colorEyeGuard)
                .padding(.top,20)
            Text("Realiza al menos 3 test para obtener resultados más precisos con la ayuda de las evaluaciones de vista")
                .font(.title3)
                .padding(.horizontal,20)
                .padding(.top,15)
            Text("Recuerda que el uso de EyeGuard NO sustituye la consulta con un especialista.")
                .font(.title3)
                .padding(.horizontal,20)
                .padding(.top,15)
            Image(systemName: "eye")
                .resizable()
                .foregroundStyle(Color.colorEyeGuard)
                .frame(width: 130, height: 90)
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
    progreso()
}
