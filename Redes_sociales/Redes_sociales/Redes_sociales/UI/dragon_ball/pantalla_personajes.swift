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
                            
                            HStack(alignment: VerticalAlignment.center){
                                NavigationLink{
                                    PreviewPersonaje(personaje: personaje)
                                    //Text("Hola \(controlador.personaje?.originPlanet?.name)")
                                    //AsyncImage(url: URL(string: controlador.personaje?.originPlanet!.image ?? ""))
                                }label:{
                                    Spacer()
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
                                    Spacer()
                                    Text("\(personaje.name)")
                                        .foregroundStyle(Color.red)
                                        .bold()
                                        
                                    Spacer()
                                    
                                        
                                }.simultaneousGesture(TapGesture().onEnded({
                                    controlador.descargarInformacionPersonaje(id: personaje.id)
                                }))
                            }
                            .frame(maxWidth: 300)
                            .padding()
                            .background(Color.yellow)
                            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)))
                            
                            
                            
                        }
                    }
                }
                .background(Color.orange)
            }
            
            
            
        }
        
    }
}

#Preview {
    PantallaPersonajes()
        .environment(ControladorAplicacion())
}
