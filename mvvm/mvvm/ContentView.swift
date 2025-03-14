//
//  ContentView.swift
//  mvvm
//
//  Created by alumno on 3/14/25.
//

import SwiftUI

struct ContentView: View {
    @Environment(VistaModeloBasico.self) private var controlador
    var body: some View {
        VStack {
            ForEach(controlador.seriesRegistradas){ _ in
                Image(systemName: "plus")
            }
        }
        .padding()
        
        Button("Agrega por favot una serie de prueba"){
            controlador.agregarSerie()
        }
    }
}

#Preview {
    ContentView()
        .environment(VistaModeloBasico())
}
