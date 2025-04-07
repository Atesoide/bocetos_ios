//
//  preview_personaje.swift
//  Redes_sociales
//
//  Created by alumno on 4/7/25.
//

import SwiftUI

struct PreviewPersonaje: View {
    @Environment(ControladorAplicacion.self) var controlador
    let persobaje: MonoChino
    var body: some View {
        Text("Hola")
    }
}

#Preview {
    PreviewPersonaje()
        .environment(ControladorAplicacion())
}
