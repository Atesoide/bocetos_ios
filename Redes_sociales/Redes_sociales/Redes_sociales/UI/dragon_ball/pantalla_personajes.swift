//
//  pantalla_personajes.swift
//  Redes_sociales
//
//  Created by alumno on 4/4/25.
//

import SwiftUI

struct PantallaPersonajes: View {
    @Environment(ControladorAplicacion.self) var controlador
    var body: some View {
        if(controlador.paginaResultados != nil){
            NavigationStack{
                ScrollView{
                    LazyVStack{
                        ForEach(controlador.paginaResultados!.items){ personaje in
                            NavigationLink{
                                PreviewPersonaje()
                            }label:{
                                AsyncImage(url: URL(string: personaje.image)){imagen in
                                    imagen
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 50)
                                        .clipShape(Rectangle())
                                } placeholder: {
                                    ProgressView()
                                        .padding()
                                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                                        .background(Color.red)
                                        .clipShape(Circle())
                                }
                                Text("\(personaje.name)")
                                
                                    
                            }
                            
                        }
                    }
                }
            }
            
            
        }
        
    }
}

#Preview {
    PantallaPersonajes()
        .environment(ControladorAplicacion())
}
