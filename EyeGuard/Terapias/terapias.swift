//
//  terapias.swift
//  EyeGuard
//
//  Created by Sistemas on 04/04/25.
//

import SwiftUI

struct terapias: View {
    
    @Environment(\.dismiss) var dismiss
    
    let gridItemsTerapia = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Text("Terapias")
                        .font(.title)
                        .foregroundStyle(Color.colorEyeGuard)
                        .bold()
                        .padding(.top, 20)
                    
                    Image("logoEyeGuard")
                        .resizable()
                        .frame(width: 200, height: 200)
                }
                
                LazyVGrid(columns: gridItemsTerapia, spacing: 20) {
                    NavigationLink(destination: terapiaVeinte()) {
                        OpcionTarjeta(icono: "stopwatch", titulo: "Terapia 20-20-20")
                    }
                    NavigationLink(destination: terapiaEnfoque()) {
                        OpcionTarjeta(icono: "target", titulo: "Enfoque cercano y lejano")
                    }
                    NavigationLink(destination: terapiaParpadeo()) {
                        OpcionTarjeta(icono: "eye", titulo: "Parpadeo consciente")
                    }
                    NavigationLink(destination: terapiaPalma()) {
                        OpcionTarjeta(icono: "hand.pinch", titulo: "Palmeo relajante")
                    }
                }
                
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
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("EyeGuard")
                        .font(.system(.title))
                        .foregroundColor(.white)
                        .bold()
                }
            }.navigationBarBackButtonHidden(true)
            .toolbarBackground(Color.colorEyeGuard, for: .navigationBar)
            .toolbarBackgroundVisibility(.visible)
        }.navigationBarBackButtonHidden(true)
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
    terapias()
}

