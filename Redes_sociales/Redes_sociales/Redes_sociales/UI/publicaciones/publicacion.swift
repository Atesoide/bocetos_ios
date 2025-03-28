//
//  publicacion.swift
//  Redes_sociales
//
//  Created by alumno on 3/26/25.
//

import SwiftUI
let publicacionFalsa = Publicacion(userId: 1, id: 1, title: "Lorem ipsum", body: "Et dolor sit amet")

struct PublicacionVista: View {
    
    //let publicacionAMostrar: Publicacion
    @Environment(ControladorAplicacion.self) var controlador
    var body: some View {
        
        Text("\(controlador.publicacionSeleccionada?.title ?? "Valor por defecto")")
        Text("\(controlador.publicacionSeleccionada?.body ?? "Valor por defecto")")
        NavigationLink{
            PerfilBasicoVista()
        } label: {
            Text("Ver perfil")
        }.simultaneousGesture(TapGesture().onEnded({
            controlador.verPerfil(id: controlador.publicacionSeleccionada!.userId)
        }))
        
        ScrollView{
            VStack{
                ForEach(controlador.comentarios){ comentario in
                    Text("Usuario: \(comentario.name)")
                    Text("\(comentario.body)")
                }
                //Foreach
            }
        }
    }
}

#Preview {
    NavigationStack{
        PublicacionVista()
            .environment(ControladorAplicacion())
    }
    
}
