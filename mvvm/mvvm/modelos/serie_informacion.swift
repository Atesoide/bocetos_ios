//
//  aqui_guarda_modelos.swift
//  mvvm
//
//  Created by alumno on 3/14/25.
//

import Foundation

struct Temporada{
    var nombre: String
    var cantidadCapitulos: Int
}

struct Plataforma{
    var nombre: String
    var icono: String
}

struct InformacionSerie: Identifiable{
    //var id:
    var nombre: String
    var tipo: String
    var plataformas: [Plataforma] = [] //Aqui tengo una deuda técnica para indicar otras plataformas de forma más fácil
    var fechaEstreno: Int
    var sinopsis: String
    var temporadas: [Temporada] = []
    var caratula: String
    
}
