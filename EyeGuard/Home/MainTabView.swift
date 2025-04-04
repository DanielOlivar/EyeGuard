//
//  MainTabView.swift
//  EyeGuard
//
//  Created by Alumno on 03/04/25
//
import SwiftUI

struct MainTabView: View {
    
    var body: some View {
        TabView {
            
            Menu()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Inicio")
                }
            Settings() 
                .tabItem {
                    Image(systemName: "info.circle.fill")
                    Text("Info")
                }
        }
        .accentColor(.colorEyeGuard)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("EyeGuard")
                        .font(.system(.title)) // Cambia el tamaño de la fuente
                        .foregroundColor(.white) // Cambia el color del título
                        .bold()
                }
            }
            .toolbarBackground(Color.colorEyeGuard, for: .navigationBar)
            .toolbarBackgroundVisibility(.visible)
    }
}

#Preview {          
    MainTabView()
}
