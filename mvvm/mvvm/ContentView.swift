//
//  ContentView.swift
//  mvvm
//
//  Created by alumno on 3/14/25.
//

import SwiftUI

struct ContentView: View {
    @Environment(VistaModeloBasico.self) private var controlador
    @State var mostrarAgregarPantalla: Bool = false
    var body: some View {
        if !mostrarAgregarPantalla{
            ScrollView{
                VStack {
                    ForEach(controlador.seriesRegistradas){ serie in
                        Image(systemName: "plus")
                    }
                }
                .padding()
            }
            
            Button("Agrega por favor una serie de prueba"){
                controlador.agregarSerie()
            }
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
