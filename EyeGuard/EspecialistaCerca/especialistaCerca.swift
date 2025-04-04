//
//  especialistaCerca.swift
//  EyeGuard
//
//  Created by Sistemas on 03/04/25.
//

import SwiftUI
import MapKit

struct especialistaCerca: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var position: MapCameraPosition = .region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 19.4291, longitude: -99.1546), // Ubicación de ejemplo
            span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)
        )
    )

    let especialistas = [
        Especialista(nombre: "Conde de Valenciana", coordenadas: CLLocationCoordinate2D(latitude: 19.422918442248584, longitude: -99.14253097638846)),
        Especialista(nombre: "SalaUno Hamburgo", coordenadas: CLLocationCoordinate2D(latitude: 19.42657429572569, longitude: -99.1646935103179)),
        Especialista(nombre: "Salud Digna", coordenadas: CLLocationCoordinate2D(latitude: 19.437797902619362, longitude: -99.15676301229918))
    ]

    var body: some View {
        VStack {
            Text("Especialistas de la")
                .foregroundStyle(Color.colorEyeGuard)
                .font(.title)
                .bold()
                .padding(.top, 20)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .padding(.horizontal, 5)
            Text("salud visual")
                .foregroundStyle(Color.colorEyeGuard)
                .font(.title)
                .bold()
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                
            Text("EyeGuard recomienda especialistas de:")
                //.foregroundStyle(Color.colorEyeGuard)
                .font(.title3)
                .padding(.top, 8)
                .padding(.leading, 3)
            //.padding(.horizontal,5)
            
            HStack{
                Text("1.-")
                    .foregroundStyle(Color.colorEyeGuard)
                    .font(.title3)
                    .padding(.top, 5)
                    .padding(.leading,20)
                Text("Hospital Conde de Valenciana")
                    .font(.title3)
                    .padding(.top, 5)
                    .padding(.leading,3)
                Spacer()
            }
            HStack{
                Text("2.-")
                    .foregroundStyle(Color.colorEyeGuard)
                    .font(.title3)
                    .padding(.top, 5)
                    .padding(.leading,20)
                Text("Salauno Hamburgo")
                    .font(.title3)
                    .padding(.top, 5)
                    .padding(.trailing,5)
                Spacer()
            }
            HStack{
                Text("3.-")
                    .foregroundStyle(Color.colorEyeGuard)
                    .font(.title3)
                    .padding(.top, 5)
                    .padding(.leading,20)
                Text("Salud Digna Insurgentes")
                    .font(.title3)
                    .padding(.top, 5)
                    .padding(.leading,2)
                Spacer()
            }
            
            Map(position: $position) {
                ForEach(especialistas) { especialista in
                    Marker(especialista.nombre, coordinate: especialista.coordenadas)
                }
            }
            .frame(height: 400) // Ajusta la altura del mapa
            .clipShape(RoundedRectangle(cornerRadius: 15)) // Bordes redondeados
            .padding()
            
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
                    .padding(.bottom, 30)
            }
        }
        //Spacer()
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

struct Especialista: Identifiable {
    let id = UUID()
    let nombre: String
    let coordenadas: CLLocationCoordinate2D
}

#Preview {
    especialistaCerca()
}
