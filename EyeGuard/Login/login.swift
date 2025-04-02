//
//  login.swift
//  EyeGuard
//
//  Created by Sistemas on 31/03/25.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct login: View {
    var body: some View {
        NavigationStack{
            ZStack{
                //Color.colorEyeGuard.ignoresSafeArea()
                VStack{
                    Text("Iniciar sesión")
                        .font(.title)
                        .foregroundStyle(Color.colorEyeGuard)
                        .bold()
                        .padding(.top,35)
                    
                    
                    Image("logoEyeGuard")
                        .resizable()
                        .frame(width: 200, height: 200)
                    
                    
                    Text("Ingrese su dirección de correo electrónico")
                        .font(.caption)
                        .foregroundStyle(Color.colorEyeGuard)
                    
                    
                    TextField("Correo electrónico", text: .constant(""))
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 200)
                        .textInputAutocapitalization(.none)
                        .disableAutocorrection(true)
                        .textInputAutocapitalization(.never)
                   
                    
                    SecureField("Contraseña", text: .constant(""))
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 200)
                        .textInputAutocapitalization(.none)
                        .disableAutocorrection(true)
                    
                    
                    NavigationLink(destination: ContentView()){
                        Text("Ingresar")
                            .font(.headline)
                            .foregroundStyle(.white)
                            .padding(.horizontal, 15)
                            .padding(.vertical, 10)
                            .background(Color.colorEyeGuard)
                            .clipShape(RoundedRectangle(cornerRadius: 7))
                            .padding(.top, 15)
                    }
                    
                    
                    Text("Otras formas de inicio de sesión")
                        .foregroundStyle(Color.gray)
                        .padding(.top, 20)
                    
                    
                    HStack{
                        /*Image(systemName: "apple.logo")
                            .resizable()
                            .frame(width: 45, height: 45)
                        NavigationLink(destination: signUp()){
                            Text("Continuar con Google")
                                .font(.headline)
                            //.foregroundStyle(Color.colorEyeGuard)
                                .foregroundStyle(.white)
                                .padding(.horizontal, 15)
                                .padding(.vertical, 10)
                            //.background(Color.white)
                                .background(Color.colorEyeGuard)
                                .clipShape(RoundedRectangle(cornerRadius: 7))
                                .padding(.top, 15)
                        }*/
                    }
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    login()
}
