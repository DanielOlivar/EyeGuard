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
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            VStack {
                Text("Iniciar sesión")
                    .font(.title)
                    .foregroundStyle(Color.colorEyeGuard)
                    .bold()
                    .padding(.top, 35)
                
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
                .alert("Error", isPresented: $showAlert) {
                    Button("OK", role: .cancel) {}
                } message: {
                    Text(alertMessage)
                }
                
                .navigationDestination(isPresented: $isLoggedIn) {
                    ContentView() // Aquí navegas a ContentView cuando isLoggedIn es true
                }.navigationBarBackButtonHidden(true)
                
                Text("Otras formas de inicio de sesión")
                    .foregroundStyle(Color.gray)
                    .padding(.top, 20)
                
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
            }
        }
    }
    
    func iniciarSesion() {
        guard !email.isEmpty, !password.isEmpty else {
            errorMessage = "El correo electrónico y la contraseña no pueden estar vacíos."
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                DispatchQueue.main.async {
                    alertMessage = "Datos incorrectos, verifica tu correo y contraseña."
                    showAlert = true
                    isLoggedIn = false
                }
                return
            }

            DispatchQueue.main.async {
                isLoggedIn = true // Inicia sesión correctamente
                showAlert = false
                errorMessage = nil // Limpiar mensaje de error
            }
        }
    }
}



#Preview {
    login()
}
