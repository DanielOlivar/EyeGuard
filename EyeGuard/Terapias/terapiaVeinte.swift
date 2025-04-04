//
//  terapiaVeinte.swift
//  EyeGuard
//
//  Created by Sistemas on 04/04/25.
//

import SwiftUI

struct terapiaVeinte: View {
    var body: some View {
        VStack{
            Text("Terapia 20-20-20")
                .bold()
                .font(.title)
                .foregroundStyle(Color.colorEyeGuard)
            Image(systemName: "stopwatch")
                .resizable()
                .foregroundStyle(Color.colorEyeGuard)
                .frame(width: 100, height: 100)
            Text("Cada 20 minutos, mira a una distancia de 20 pies durante 20 segundos.")
                .font(.title3)
                .padding(.horizontal,20)
                .padding(.top,15)
                
            Spacer()
            
        }
    }
}

#Preview {
    terapiaVeinte()
}
