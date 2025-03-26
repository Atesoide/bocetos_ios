//
//  Controlador_app.swift
//  Redes_sociales
//
//  Created by alumno on 3/26/25.
//

import Foundation
import SwiftUI

@Observable
@MainActor
public class ControladorAplicacion{
    var publicaciones: Array<Publicacion> = []
    
    var publicacionSeleccionada: Int = -1
    
    init(){
        Task.detached(priority: .high){
            await self.descargarPublicaciones()
        }
    }
    func descargarPublicaciones() async{
        defer{
            print("Esta funcion se manda a llamar despues de todos los awaits en fi funcion \(#function)")
        }
        guard let publicacionesDescargadas: [Publicacion] = try? await PlaceHolderAPI().descargarPublicaciones() else {return}
        
        publicaciones = publicacionesDescargadas
        
        
    }
    func descargarComentarios() async{
        defer{
            print("Esta funcion se manda a llamar despues de todos los awaits en fi funcion \(#function)")
        }
        guard let publicacionesDescargadas: [Publicacion] = try? await PlaceHolderAPI().descargarPublicaciones() else {return}
        
        publicaciones = publicacionesDescargadas
    }
}
