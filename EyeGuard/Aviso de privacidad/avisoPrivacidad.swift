//
//  avisoPrivacidad.swift
//  EyeGuard
//
//  Created by Sistemas on 03/04/25.
//

import SwiftUI

struct avisoPrivacidad: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Text("Aviso de Privacidad")
            .foregroundStyle(Color.colorEyeGuard)
            .font(.title)
            .bold()
            .padding(.top, 15)
        
        
        VStack{
            Text("En EyeGuard respetamos tu privacidad y nos comprometemos a proteger la información personal que compartes con nosotros al utilizar nuestra aplicación. Este Aviso de Privacidad explica cómo recopilamos, usamos, almacenamos y protegemos tus datos personales. Al usar nuestra aplicación, aceptas las prácticas descritas en este aviso.")
                .font(.footnote)
                .foregroundColor(.gray)
                .padding(.top, 10)
                .padding(.horizontal, 10)
            
            
            Text("1. Seguridad de tus datos")
                .font(.footnote)
                .foregroundColor(Color.colorEyeGuard)
                .bold()
                .padding(.top, 10)
                .padding(.horizontal, 10)
            
            
            Text("Implementamos medidas de seguridad razonables para proteger la información personal que recopilamos. Sin embargo, ninguna transmisión de datos a través de Internet o sistema de almacenamiento electrónico es completamente segura. No podemos garantizar la seguridad absoluta de tu información.")
                .font(.footnote)
                .foregroundColor(.gray)
                .padding(.top, 10)
                .padding(.horizontal, 10)
            
            
            Text("2. Tus derechos")
                .font(.footnote)
                .foregroundColor(Color.colorEyeGuard)
                .bold()
                .padding(.top, 10)
                .padding(.horizontal, 10)
            
            
            Text("Dependiendo de la legislación local, puedes tener ciertos derechos sobre tu información personal, incluyendo: Acceso a la información que tenemos sobre ti, corrección de información incorrecta o incompleta, eliminación de tus datos personales bajo ciertas condiciones, oposición al uso de tus datos para ciertos fines, como marketing directo. Para ejercer tus derechos, por favor contacta con nosotros a través de eyeguard@simi.os.com")
                .font(.footnote)
                .foregroundColor(.gray)
                .padding(.trailing, 15)
                .padding(.top, 10)
                .padding(.horizontal, 10)
            
            
            Text("3. Contacto")
                .font(.footnote)
                .foregroundColor(Color.colorEyeGuard)
                .bold()
                .padding(.top, 10)
                .padding(.horizontal, 10)
            
            
            Text("Si tienes alguna pregunta o inquietud sobre este Aviso de Privacidad o nuestras prácticas de privacidad, por favor contáctanos a través de eyeguard@simi.os.com, EyeGuard se reserva el derecho de actualizar este Aviso de Privacidad de vez en cuando. Cualquier cambio será publicado en esta página, y la fecha de la última actualización se reflejará al final de este aviso.")
                .font(.footnote)
                .foregroundStyle(.gray)
                .padding(.top, 10)
                .padding(.horizontal, 10)
            
            //Spacer()
        
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
                .padding(.bottom, 30)
        }
    }
}

#Preview {
    avisoPrivacidad()
}
