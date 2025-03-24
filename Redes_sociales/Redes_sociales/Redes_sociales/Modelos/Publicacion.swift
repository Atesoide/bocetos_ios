//
//  Publicacion.swift
//  Redes_sociales
//
//  Created by alumno on 3/24/25.
//

import Foundation

/*
 Codable
 Encodable
 Decodable
 */

struct Publicacion: Identifiable, Codable{
    let userId: Int
    let id: Int
    
    let title: String
    let body: String
}
