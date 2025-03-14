//
//  primera_pantalla.swift
//  mvvm
//
//  Created by alumno on 3/14/25.
//

import SwiftUI

@main
struct Primera_pantalla: App {
    
    @State var controladorBasico = VistaModeloBasico()
    
    var body: some Scene {
        WindowGroup(id: "nombre") {
            ContentView()
                .environment(controladorBasico)
        }
    }
}
