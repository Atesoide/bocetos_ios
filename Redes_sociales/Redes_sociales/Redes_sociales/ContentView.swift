//
//  ContentView.swift
//  Redes_sociales
//
//  Created by alumno on 3/24/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GenerarlPublicaciones()
    }
}

#Preview {
    ContentView()
        .environment(ControladorAplicacion())
}
