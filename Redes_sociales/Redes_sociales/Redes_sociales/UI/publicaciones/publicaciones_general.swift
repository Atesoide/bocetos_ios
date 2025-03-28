//
//  publicaciones_general.swift
//  Redes_sociales
//
//  Created by alumno on 3/24/25.
//

import SwiftUI

struct GenerarlPublicaciones: View {
    //@StateObject var controlador = ControladorPublicaciones()
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    ForEach(controlador.publicaciones){ publicacion in
                        NavigationLink{
                            PublicacionVista()
                        } label: {
                            HStack{
                                Text("\(publicacion.id)")
                                VStack{
                                    Text("\(publicacion.title)")
                                    Text("\(publicacion.body)")
                                }

                            }
                            
                            /*.onTapGesture {
                                print("usted ha seleccionado: \(publicacion.id)")
                            }*/
                        }.simultaneousGesture(TapGesture().onEnded({
                            controlador.seleccionarPublicacion(publicacion)
                        }))
                    }
                
                }
            }
        }
        
        
                    
        }
    }
        

#Preview {
    GenerarlPublicaciones()
        .environment(ControladorAplicacion())
}
