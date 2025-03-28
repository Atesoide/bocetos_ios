//
//  perfil_vista_basica.swift
//  Redes_sociales
//
//  Created by alumno on 3/28/25.
//

import SwiftUI

struct PerfilBasicoVista: View{
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View{
        Text("User: \(controlador.perfilAMostrar?.username ?? "Puede que no")")
        Text("Nombre: \(controlador.perfilAMostrar?.name ?? "Sea bonito ver estas")")
        Text("Correo \(controlador.perfilAMostrar?.email ?? "Palabras de error")")
            .onDisappear(){
                print("Adios mundo cruel, este mensaje solo se ve cuando destruimos la vista")
            }
    }
}

#Preview{
    PerfilBasicoVista()
        .environment(ControladorAplicacion())
}
