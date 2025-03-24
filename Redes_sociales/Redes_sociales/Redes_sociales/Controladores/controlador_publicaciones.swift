//
//  controlador_publicaciones.swift
//  Redes_sociales
//
//  Created by alumno on 3/24/25.
//

import Foundation
import SwiftUI

class ControladorPublicaciones: ObservableObject{
    @Published var publicaciones: [Publicacion] = []
    
    let urlDePublicaciones = "https://jsonplaceholder.typicode.com/posts"
    
    func obtenerPublicaciones() async {
        guard let publicacionesDescargadas: [Publicacion] = try? await PlaceHolderAPI().descargarPublicaciones(desde: urlDePublicaciones) else { return }
        publicaciones = publicacionesDescargadas
    }
}
