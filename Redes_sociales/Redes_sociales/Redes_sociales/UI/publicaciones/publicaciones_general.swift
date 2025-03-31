//
//  publicaciones_general.swift
//  Redes_sociales
//
//  Created by alumno on 3/24/25.
//

import SwiftUI

struct GenerarlPublicaciones: View {
    var largoDePantalla = UIScreen.main.bounds.width
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
                            VStack(alignment: HorizontalAlignment.leading){
                                HStack(alignment: VerticalAlignment.center){
                                    Text("\(publicacion.id)").background(Color.red)
                                        .padding(10)
                                        .frame(alignment: .center)
                                    
                                    Spacer()
                                    
                                    Text("\(publicacion.title)").background(Color.yellow)
                                        .frame(alignment: .center)
                                    Spacer()
                                }
                                
                                Text("\(publicacion.body)")
                            }.background(Color.mint)
                                .frame(width: largoDePantalla - 10, alignment: Alignment.center)
                                .padding()
                            
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
