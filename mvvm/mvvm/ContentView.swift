//
//  ContentView.swift
//  mvvm
//
//  Created by alumno on 3/14/25.
//

import SwiftUI

struct ContentView: View {
    @Environment(VistaModeloBasico.self) private var controlador
    var body: some View {//Deuda técnica
        if controlador.estadoActualDeLaApp == .mostrandoSeries{
            Menu_Principal_Series()
        }
        else{
            AgregarSerie()
        }
    }
}

#Preview {
    ContentView()
        .environment(VistaModeloBasico())
}
