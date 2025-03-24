//
//  publicaciones_general.swift
//  Redes_sociales
//
//  Created by alumno on 3/24/25.
//

import SwiftUI

struct GenerarlPublicaciones: View {
    @StateObject var controlador = ControladorPublicaciones()
    
    var body: some View {
        ScrollView{
            VStack{
                ForEach(controlador.publicaciones){ publicacion in
                    Text("\(publicacion.id)")
                    VStack{
                        Text("\(publicacion.title)")
                        Text("\(publicacion.body)")
                    }
                }
            
            }
        }
        
        .onAppear{
            if controlador.publicaciones.isEmpty{
                Task{
            await controlador.obtenerPublicaciones()
        }
            }
                    
        }
    }
        
}

#Preview {
    GenerarlPublicaciones()
}
