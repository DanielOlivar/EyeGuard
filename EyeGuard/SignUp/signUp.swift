//
//  signUp.swift
//  EyeGuard
//
//  Created by Alumno on 03/04/25
//

import SwiftUI
import Firebase
import FirebaseAuth

struct signUp: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var mostrarAlerta = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Text("Crear cuenta")
                .font(.title)
                .foregroundStyle(Color.colorEyeGuard)
                .bold()
                .padding(.top,15)
            
            
            Image("logoEyeGuard")
                .resizable()
                .frame(width: 200, height: 200)
            
            
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
            
           
            Button(action: registrarUsuario) {
                Text("Regístrate")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .padding(.horizontal, 15)
                    .padding(.vertical, 10)
                    .background(Color.colorEyeGuard)
                    .clipShape(RoundedRectangle(cornerRadius: 7))
                    .padding(.top, 15)
            }.alert("Registro exitoso", isPresented: $mostrarAlerta){
                Button("Ok", role: .cancel){}
            }message: {
                Text("Regresa a la página de inicio para iniciar sesión")
            }.navigationBarBackButtonHidden(true)
            
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
    
    func registrarUsuario() {
        // Validación de que el email y la contraseña no están vacíos
        guard !email.isEmpty, !password.isEmpty else {
            print("El correo electrónico y la contraseña no pueden estar vacíos.")
            return
        }
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Error al registrar al usuario: \(error.localizedDescription)")
                return
            }
            mostrarAlerta = true
            print("Usuario registrado con éxito: \(String(describing: result?.user.email))")
        }
    }
}


#Preview {
    signUp()
}
