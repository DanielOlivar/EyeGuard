//
//  MainTabView.swift
//  EyeGuard
//
//  Created by Alexis Sanchez on 02/04/25.
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
            Profile()
                .tabItem {
                    Image(systemName: "person.circle.fill")
                    Text("Perfil")
                }

            Settings() 
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("Configuración")
                }
        }
        .accentColor(.colorEyeGuard)
    }
}

#Preview {          
    MainTabView()
}
