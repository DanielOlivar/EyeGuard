//
//  Menu.swift
//  EyeGuard
//
//  Created by Alexis Sanchez on 02/04/25.
//

import SwiftUI

struct Menu: View {
    let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                
                // Título y logo
                VStack(spacing: 10) {
                    Text("EyeGuard")
                        .font(.title)
                        .foregroundStyle(Color.colorEyeGuard)
                        .bold()
                    
                    Image("logoEyeGuard")
                        .resizable()
                        .frame(width: 100, height: 100)
                }
                .padding(.top, 30)

                // Grid de opciones con NavigationLink
                LazyVGrid(columns: gridItems, spacing: 20) {
                    NavigationLink(destination: misDatosVisuales()) {
                        OpcionTarjeta(icono: "eye", titulo: "Evaluar mi visión")
                    }.navigationBarBackButtonHidden(true)
                    NavigationLink(destination: misDatosVisuales()) {
                        OpcionTarjeta(icono: "doc.text.viewfinder", titulo: "Mis datos visuales")
                    }.navigationBarBackButtonHidden(true)
                    NavigationLink(destination: misDatosVisuales()) {
                        OpcionTarjeta(icono: "chart.bar.xaxis", titulo: "Mi progreso visual")
                    }.navigationBarBackButtonHidden(true)
                    NavigationLink(destination: misDatosVisuales()) {
                        OpcionTarjeta(icono: "stethoscope", titulo: "Terapia ocular")
                    }.navigationBarBackButtonHidden(true)
                    NavigationLink(destination: misDatosVisuales()) {
                        OpcionTarjeta(icono: "lightbulb", titulo: "Recomendaciones")
                    }.navigationBarBackButtonHidden(true)
                    NavigationLink(destination: misDatosVisuales()) {
                        OpcionTarjeta(icono: "mappin.and.ellipse", titulo: "Especialista cerca")
                    }.navigationBarBackButtonHidden(true)
                }
                .padding()

                Spacer()
            }
            .navigationBarHidden(true)
        }
    }
}


struct OpcionTarjeta: View {
    var icono: String
    var titulo: String

    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: icono)
                .resizable()
                .scaledToFit()
                .frame(width: 35, height: 35)
                .foregroundStyle(Color.colorEyeGuard)

            Text(titulo)
                .font(.caption)
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: .gray.opacity(0.2), radius: 4, x: 0, y: 2)
    }
}


#Preview {
    Menu()
}
