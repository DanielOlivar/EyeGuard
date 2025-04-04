//
//  Menu.swift
//  EyeGuard
//
//  Created by Alumno on 03/04/25
//

import SwiftUI

struct Menu: View {
    let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                VStack(spacing: 10) {
                    Text("Inicio")
                        .font(.title)
                        .foregroundStyle(Color.colorEyeGuard)
                        .bold()
                        .padding(.top, 10)
                    
                    Image("logoEyeGuard")
                        .resizable()
                        .frame(width: 100, height: 100)
                }
                .padding(.top, 30)

                // Grid de opciones con NavigationLink
                LazyVGrid(columns: gridItems, spacing: 20) {
                    NavigationLink(destination: VisualTestsSelection()) {
                        OpcionTarjeta(icono: "eye", titulo: "Evaluar mi visión")
                    }
                    NavigationLink(destination: misDatosVisuales()) {
                        OpcionTarjeta(icono: "doc.text.viewfinder", titulo: "Mis datos visuales")
                    }
                    NavigationLink(destination: progreso()) {
                        OpcionTarjeta(icono: "chart.bar.xaxis", titulo: "Mi progreso visual")
                    }
                    NavigationLink(destination: terapias()) {
                        OpcionTarjeta(icono: "stethoscope", titulo: "Terapia ocular")
                    }
                    NavigationLink(destination: recomendaciones()) {
                        OpcionTarjeta(icono: "lightbulb", titulo: "Recomendaciones")
                    }
                    NavigationLink(destination: especialistaCerca()) {
                        OpcionTarjeta(icono: "mappin.and.ellipse", titulo: "Especialista cerca")
                    }
                }
                .navigationBarBackButtonHidden(true)
                .padding()

                Spacer()
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
}


#Preview {
    Menu()
}
