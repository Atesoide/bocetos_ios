//
//  perfil.swift
//  Redes_sociales
//
//  Created by alumno on 3/28/25.
//

import Foundation

struct Perfil: Codable, Identifiable{
    let id: Int
    
    let name: String
    let username: String
    
    let email: String
    let phone: String
    
}
