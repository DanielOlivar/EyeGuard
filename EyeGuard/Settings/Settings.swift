//
//  Settings.swift
//  EyeGuard
//
//  Created by Alumno on 03/04/25
//

import SwiftUI

struct Settings: View {
    var body: some View {
        NavigationView{
            VStack{
                Text("Aviso de Limitación de Responsabilidad")
                Text("Esta aplicación no sustituye la consulta con un especialista; sin embargo, puede ofrecerte información adicional y orientarte en tu bienestar visual, sirviendo como un complemento útil para tu atención médica.")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .padding()
                    .bold()
                    .multilineTextAlignment(.leading)
                //.frame(maxWidth: .infinity, alignment: .leading)
                NavigationLink(destination: avisoPrivacidad()){
                    Text("Aviso de privacidad")
                        .font(.footnote)
                        .foregroundColor(Color.colorEyeGuard)
                        .padding()
                        .bold()
                        .multilineTextAlignment(.leading)
                }
            }
        }
    }
}

#Preview {
    Settings()
}
