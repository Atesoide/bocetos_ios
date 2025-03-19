//
//  agregar_serie.swift
//  mvvm
//
//  Created by alumno on 3/19/25.
//

import SwiftUI

struct AgregarSerie: View {
    @Environment(VistaModeloBasico.self) private var controlador
    
    @State var nombreDeLaSerie: String = ""
    @State var tipoDeLaSerie: String = ""
    
    @State var plataformas: [Plataforma] = [
        Plataforma(nombre: "Hulu", icono: "icono plus")
    ]
    
    @State var indicarProblemas: Bool = false
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        TextField("El nombre de la serie", text: $nombreDeLaSerie)
        TextField("Tipo", text: $tipoDeLaSerie)
        
        Spacer()
        ScrollView{
            Text("Plataformas")
            HStack{
                ForEach(plataformas){ plataforma in
                    Text(plataforma.nombre)
                    
                }
            }
        }
        if indicarProblemas{
            Text("Hay un problema con tu serie. No tiene nombre")
        }
        Button("Agregar plataforma"){
            print("Agregar plataforma falta implementar")
        }
        
        Button("Agregar serie"){
            print("*Agrega la serie*")
            
            var serieNueva = InformacionSerie(nombre: nombreDeLaSerie, tipo: tipoDeLaSerie, plataformas: plataformas, fechaEstreno: 1, sinopsis: "Una aleatoria", caratula: "Foto")
            
            
            indicarProblemas = !controlador.agregarSerie(serie: serieNueva)
        }
    }
}
/*
 struct InformacionSerie: Identifiable{
     var id = UUID()//Universal Unique ID
     var nombre: String
     var tipo: String
     var plataformas: [Plataforma] = [] //Aqui tengo una deuda técnica para indicar otras plataformas de forma más fácil
     var fechaEstreno: Int
     var sinopsis: String
     var temporadas: [Temporada] = []
     var caratula: String
     
 }
 */

#Preview {
    AgregarSerie()
        .environment(VistaModeloBasico())
}
