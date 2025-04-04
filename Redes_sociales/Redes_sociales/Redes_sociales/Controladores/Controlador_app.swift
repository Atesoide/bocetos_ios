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
    var perfilAMostrar: Perfil? = nil
    
    var publicacionSeleccionada: Publicacion? = nil
    
    //Seccion DB
    var paginaResultados: PaginaResultado? = nil
    
    init(){
        Task.detached(priority: .high){
            await self.descargarPublicaciones()
            
            await self.descargarMonosChinos()
        }
    }
    func descargarMonosChinos() async{
        guard let paginaDescargada: PaginaResultado = try? await DragonBallAPI().descargarPaginaPersonajes() else{return}
        self.paginaResultados = paginaDescargada

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
    
    func descargarPerfil(id: Int) async -> Void{
        guard let perfil: Perfil = try? await PlaceHolderAPI().descargarPerfil(id: id) else { return }
        perfilAMostrar = perfil
    }
    
    func verPerfil(id: Int) -> Void{
        Task.detached{
            await self.descargarPerfil(id: id)
        }
    }
}
