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
    var comentarios: Array<Comentario> = []
    
    var publicacionSeleccionada: Publicacion? = nil
    
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
        guard let comentariosDescargados: [Comentario] = try? await PlaceHolderAPI().descargarComentarios(postId: self._publicacionSeleccionada!.id ) else {return}
        
        comentarios = comentariosDescargados
    }
    func seleccionarPublicacion(_ publicacion: Publicacion) -> Void{
        publicacionSeleccionada = publicacion
        
        Task.detached(operation: {
            await self.descargarComentarios()
        })
    }
}
