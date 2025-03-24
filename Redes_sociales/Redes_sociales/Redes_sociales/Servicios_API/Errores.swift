//
//  Errores.swift
//  Redes_sociales
//
//  Created by alumno on 3/24/25.
//

import Foundation

enum ErroresDeRed: Error{
    case malaDireccionUrl
    case invalidRequest
    case badResponse
    case badStatus
    case fallaAlConvertirLaRespuesta
}
