//
//  publicacion.swift
//  Redes_sociales
//
//  Created by alumno on 3/26/25.
//

import SwiftUI
let publicacionFalsa = Publicacion(userId: 1, id: 1, title: "Lorem ipsum", body: "Et dolor sit amet")

struct PublicacionVista: View {
    
    let publicacionAMostrar: Publicacion
    @Environment(ControladorAplicacion.self) var controlador
    var body: some View {
        
        Text("\(publicacionAMostrar.title)")
        Text("\(publicacionAMostrar.body)")
        
        ScrollView{
            VStack{
                //Foreach
            }
        }
    }
}

#Preview {
    PublicacionVista(publicacionAMostrar: publicacionFalsa)
        .environment(ControladorAplicacion())
}
