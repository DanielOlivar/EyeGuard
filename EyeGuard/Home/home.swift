//
//  home.swift
//  EyeGuard
//
//  Created by Sistemas on 01/04/25.
//

import SwiftUI

struct home: View {
    var body: some View {
        NavigationView {
            VStack{
                Text("EyeGuard")
                    .font(.title)
                    //.foregroundStyle(.white)
                    .foregroundStyle(Color.colorEyeGuard)
                    .bold()
                    .padding(.top, 35)
                Image("logoEyeGuard")
                    .resizable()
                    .frame(width: 200, height: 200)
                Text("Bienvenido")
                    .font(.title2)
                    //.foregroundStyle(.white)
                    .foregroundStyle(Color.colorEyeGuard)
                
                NavigationLink(destination:login()){
                    Text("Inicia sesión")
                        .font(.headline)
                        //.foregroundStyle(Color.colorEyeGuard)
                        .foregroundStyle(.white)
                        .padding(.horizontal, 15)
                        .padding(.vertical, 10)
                        //.background(Color.white)
                        .background(Color.colorEyeGuard)
                        .clipShape(RoundedRectangle(cornerRadius: 7))
                        .padding(.top, 15)
                }
                NavigationLink(destination:signUp()){
                    Text("Regístrate")
                        .font(.headline)
                        //.foregroundStyle(Color.colorEyeGuard)
                        .foregroundStyle(.white)
                        .padding(.horizontal, 15)
                        .padding(.vertical, 10)
                        //.background(Color.white)
                        .background(Color.colorEyeGuard)
                        .clipShape(RoundedRectangle(cornerRadius: 7))
                        .padding(.top, 15)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    home()
}
