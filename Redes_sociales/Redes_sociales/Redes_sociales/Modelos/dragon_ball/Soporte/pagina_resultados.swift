//
//  pagina_resultados.swift
//  Redes_sociales
//
//  Created by alumno on 4/2/25.
//

import Foundation

struct Meta: Codable{
    let totalItems: Int
    let itemCount: Int
    let itemsPerPage: Int
    let totalPages: Int
    let currentPage: Int
}
struct Enlaces: Codable{
    let first: String
    let previous: String
    let next: String
    let last: String
}

struct PaginaResultado: Codable{
    let items: [MonoChino]
    let meta: Meta
    let links: Enlaces
}
struct PaginaResultadoPlaneta: Codable{
    let items: [Planeta]
    let meta: Meta
    let links: Enlaces
}

