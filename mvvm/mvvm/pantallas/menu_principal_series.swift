//
//  menu_principal_series.swift
//  mvvm
//
//  Created by alumno on 3/21/25.
//

import SwiftUI

struct Menu_Principal_Series: View {
    @Environment(VistaModeloBasico.self) private var controlador
    
    var body: some View {
        ScrollView{
            VStack {
                ForEach(controlador.seriesRegistradas){ serie in
                    Image(systemName: "plus")
                }
            }
            .padding()
        }
        
        Button("Agrega por favor una serie de prueba"){
            controlador.cambiarAAgregarSerie()
        }
    }
}

#Preview {
    Menu_Principal_Series()
        .environment(VistaModeloBasico())
}
