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
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isLoggedIn = false
    @State private var errorMessage: String? = nil
    @State private var showAlert = false  // Para mostrar la alerta
    @State private var alertMessage = ""  // Mensaje de la alerta
    
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
                    
                    
                    TextField("Correo electrónico", text: $email)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 200)
                        .textInputAutocapitalization(.none)
                        .disableAutocorrection(true)
                        .textInputAutocapitalization(.never)
                   
                    
                    SecureField("Contraseña", text: $password)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 200)
                        .textInputAutocapitalization(.none)
                        .disableAutocorrection(true)
                    
                    Button(action: iniciarSesion) {
                        Text("Ingresar")
                            .font(.headline)
                            .foregroundStyle(.white)
                            .padding(.horizontal, 15)
                            .padding(.vertical, 10)
                            .background(Color.colorEyeGuard)
                            .clipShape(RoundedRectangle(cornerRadius: 7))
                            .padding(.top, 15)
                    }
                    .navigationDestination(isPresented: $isLoggedIn) {
                        ContentView()
                    }
                    
                    /*NavigationLink(destination: ContentView()){
                        Text("Ingresar")
                            .font(.headline)
                            .foregroundStyle(.white)
                            .padding(.horizontal, 15)
                            .padding(.vertical, 10)
                            .background(Color.colorEyeGuard)
                            .clipShape(RoundedRectangle(cornerRadius: 7))
                            .padding(.top, 15)
                            .onTapGesture{
                                iniciarSesion()
                            }
                    }*/
                    
                    
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
        .alert("Error", isPresented: $showAlert) {
            Button("OK", role: .cancel) {}
        } message: {
            Text(alertMessage)
        }
    }
    
    func iniciarSesion() {
        guard !email.isEmpty, !password.isEmpty else {
            errorMessage = "El correo electrónico y la contraseña no pueden estar vacíos."
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                // Mostrar el error en pantalla
                DispatchQueue.main.async {
                    alertMessage = "Datos incorrectos, verifica tu correo y contraseña."
                    showAlert = true
                    isLoggedIn = false // Asegurarse de que no se navegue si hay error
                }
                return
            }

            // Si no hay error, iniciar sesión correctamente
            DispatchQueue.main.async {
                isLoggedIn = true
                showAlert = false
                errorMessage = nil // Limpiar mensaje de error si fue exitoso
            }
        }
    }
}


#Preview {
    login()
}
