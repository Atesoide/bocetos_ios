//
//  pantalla_planetas.swift
//  Redes_sociales
//
//  Created by alumno on 5/2/25.
//

import SwiftUI

struct PantallaPlanetas: View {
    @Environment(ControladorAplicacion.self) var controlador
    var body: some View {
        if(controlador.paginaResultadosPlaneta != nil){
            NavigationStack{
                ScrollView{
                    LazyVStack{
                        ForEach(controlador.paginaResultadosPlaneta!.items){ planeta in
                            
                            HStack(alignment: VerticalAlignment.center){
                                NavigationLink{
                                    Text("lllllllll")
                                    //Text("Hola \(controlador.personaje?.originPlanet?.name)")
                                    //AsyncImage(url: URL(string: controlador.personaje?.originPlanet!.image ?? ""))
                                }label:{
                                    Spacer()
                                    AsyncImage(url: URL(string: planeta.image)){imagen in
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
                                    Text("\(planeta.name)")
                                        .foregroundStyle(Color.red)
                                        .bold()
                                        
                                    Spacer()
                                    
                                    
                                        
                                }.simultaneousGesture(TapGesture().onEnded({
                                    controlador.descargarInformacionPlaneta(id: planeta.id)
                                }))
                            }
                            .frame(maxWidth: 300)
                            .padding()
                            .background(Color.yellow)
                            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)))
                            
                            
                            
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    PantallaPlanetas()
        .environment(ControladorAplicacion())
}
