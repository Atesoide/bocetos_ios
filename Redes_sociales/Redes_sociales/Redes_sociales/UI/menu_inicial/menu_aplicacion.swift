//
//  menu_aplicacion.swift
//  Redes_sociales
//
//  Created by alumno on 3/31/25.
//

import SwiftUI

struct MenuNavegacion: View {
    @Environment(ControladorAplicacion.self) var controlador
    var body: some View {
        TabView{
            GenerarlPublicaciones()
                .tabItem { Label("Es esta pantalla \n otra parte", systemImage: "circle") }
                .badge(controlador.publicaciones.count)
            
            Text("Hola dos")
                .tabItem {
                    Label{
                        VStack{
                            Text("Hola")
                            Text("Esto es un segundo click")
                        }
                        
                    } icon: {
                        Circle()
                            .frame(width: 44, height: 44, alignment: .center)
                            .overlay(Text("JJ Abarhams"))
                    }
                }
            Text("Hola una vez más")
                .tabItem {
                    Label("Etiqueta de esta label", systemImage: "circle")
                }
        }
    }
}

#Preview {
    MenuNavegacion()
        .environment(ControladorAplicacion())
}
