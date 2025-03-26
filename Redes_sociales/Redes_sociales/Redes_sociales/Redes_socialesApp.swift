//
//  Redes_socialesApp.swift
//  Redes_sociales
//
//  Created by alumno on 3/24/25.
//

import SwiftUI

@main
struct Redes_socialesApp: App {
    @State var controlador = ControladorAplicacion()
    
    var body: some Scene {
        WindowGroup {
            GenerarlPublicaciones()
                .environment(controlador)
        }
    }
}
