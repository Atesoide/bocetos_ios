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
    
    @State var plataformasAgregadas: [Plataforma] = []
    
    @State var nombrePlataforma: String = ""
    @State var imagenPlataforma: String = ""
    
    @State var indicarProblemas: Bool = false
    @State var mostrarAgregarPlataformas: Bool = false
    
    var body: some View {
        Text("Agrega una serie")
        TextField("El nombre de la serie", text: $nombreDeLaSerie)
        TextField("Tipo", text: $tipoDeLaSerie)
        
        Spacer()
        Text("Plataformas")
        ScrollView(.horizontal){
            
            HStack{
                ForEach(plataformasAgregadas){ plataforma in
                    Text(plataforma.nombre)
                    
                }
            }
        }.sheet(isPresented: $mostrarAgregarPlataformas) {
            Text("Por favor agregar plataforma")
                .foregroundStyle(Color.black)
                .padding(15)
                .bold()
            
            TextField("Nombre de la plataforma", text: $nombrePlataforma)
            TextField("Indica la imagen", text: $imagenPlataforma)
            
            ScrollView(){
                VStack{
                    ForEach(plataformasAgregadas) { plataforma in
                        Text(plataforma.nombre)
                    }
                }
            }
            
            Button("Agregar plataforma"){
                if !nombrePlataforma.isEmpty && !imagenPlataforma.isEmpty{
                    let plataformaNueva = Plataforma(nombre: nombrePlataforma, icono: imagenPlataforma)
                    
                    plataformasAgregadas.append(plataformaNueva)
                    
                    nombrePlataforma = ""
                    imagenPlataforma = ""
                    
                    mostrarAgregarPlataformas.toggle()
                }
            }
        }.presentationDetents([.medium])
        Spacer()
        
        if indicarProblemas{
            Text("Hay un problema con tu serie. No tiene nombre")
        }
        Button("Agregar plataforma"){
            mostrarAgregarPlataformas = true
        }
        Spacer()
        
        Button("Agregar serie"){
            print("*Agrega la serie*")
            
            var serieNueva = InformacionSerie(nombre: nombreDeLaSerie, tipo: tipoDeLaSerie, plataformas: plataformasAgregadas, fechaEstreno: 1, sinopsis: "Una aleatoria", caratula: "Foto")
            
            
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
