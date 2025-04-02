//
//  home.swift
//  EyeGuard
//
//  Created by Sistemas on 01/04/25.
//

import SwiftUI

struct vistaInicial: View {
    var body: some View {
        NavigationStack {
            VStack{
                Text("EyeGuard")
                    .font(.title)
                    .foregroundStyle(Color.colorEyeGuard)
                    .bold()
                    .padding(.top, 35)
                
                
                Image("logoEyeGuard")
                    .resizable()
                    .frame(width: 200, height: 200)
                
                
                Text("Bienvenido")
                    .font(.title2)
                    .foregroundStyle(Color.colorEyeGuard)
                
                
                NavigationLink(destination:login()){
                    Text("Inicia sesión")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .padding(.horizontal, 15)
                        .padding(.vertical, 10)
                        .background(Color.colorEyeGuard)
                        .clipShape(RoundedRectangle(cornerRadius: 7))
                        .padding(.top, 15)
                }
                
                
                NavigationLink(destination:signUp()){
                    Text("Regístrate")
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
                    exit(0)
                }) {
                    Text("Cerrar App")
                        .font(.headline)
                        .foregroundStyle(Color.white)
                        .padding(.horizontal, 15)
                        .padding(.vertical, 10)
                        .background(Color.colorEyeGuard)
                        .clipShape(RoundedRectangle(cornerRadius: 7))
                }
            }
        }
    }
}

// MARK: Color personalizado para la App
extension Color {
    static let colorEyeGuard = Color(red: 0.0, green: 0.749, blue: 0.749)
}

#Preview {
    vistaInicial()
}
