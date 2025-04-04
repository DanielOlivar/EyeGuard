//
//  terapiaEnfoque.swift
//  EyeGuard
//
//  Created by Sistemas on 04/04/25.
//

import SwiftUI

struct terapiaEnfoque: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack{
            Image("logoEyeGuard")
                .resizable()
                .frame(width: 200, height: 200)
            Text("Enfoque cercano-lejano")
                .bold()
                .font(.title)
                .foregroundStyle(Color.colorEyeGuard)
                .padding(.top,20)
            Text("1. Estira tu mano y levanta tu dedo pulgar, observa tu dedo y enfocate en él.")
                .font(.title3)
                //.padding(.horizontal,20)
                .padding(.top,15)
                .padding(.leading,15)
            
            Text("2. Ahora enfoca algun objeto lejano que se encuentre detrás de tu pulgar.")
                .font(.title3)
               // .padding(.horizontal,20)
                .padding(.top,15)
                .padding(.leading,20)
            Text("3. Repite el procedimiento para comprobar si no tienes problemas de acomodación visual.")
                .font(.title3)
                //.padding(.horizontal,20)
                .padding(.top,15)
                .padding(.leading,20)
            Image(systemName: "target")
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
    terapiaEnfoque()
}
