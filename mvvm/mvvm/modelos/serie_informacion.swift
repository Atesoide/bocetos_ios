//
//  aqui_guarda_modelos.swift
//  mvvm
//
//  Created by alumno on 3/14/25.
//

import Foundation

struct Temporada: Identifiable{
    var id = UUID()
    
    var nombre: String
    var cantidadCapitulos: Int
}

struct Plataforma: Identifiable{
    var id = UUID()
    
    var nombre: String
    var icono: String
}

struct InformacionSerie: Identifiable{
    var id = UUID()//Universal Unique ID
    
    var nombre: String
    var tipo: String
    var plataformas: [Plataforma] = [] 
    var fechaEstreno: Int
    var sinopsis: String
    var temporadas: [Temporada] = []
    var caratula: String
    
}
