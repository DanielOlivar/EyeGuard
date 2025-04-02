//
//  ContentView.swift
//  EyeGuard
//
//  Created by Sistemas on 31/03/25.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {
            Text("Puro pinche Simi OS 🦍")
                .foregroundStyle(.cyan)
                .font(.largeTitle)
                .padding(.top,15)
            
            
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
        .padding()
        .navigationBarBackButtonHidden(true) 
    }
}

#Preview {
    ContentView()
}

