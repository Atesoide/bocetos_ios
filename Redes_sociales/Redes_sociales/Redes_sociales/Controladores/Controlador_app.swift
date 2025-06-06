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
    var paginaResultadosPlaneta: PaginaResultadoPlaneta? = nil
    var personaje: MonoChino? = nil
    
    init(){
        Task.detached(priority: .high){
            await self.descargarPublicaciones()
            
            await self.descargarMonosChinos()
            
            await self.descargarPlanetas()
        }
    }
    func descargarMonosChinos() async{
        guard let paginaDescargada: PaginaResultado = try? await DragonBallAPI().descargarPaginaPersonajes() else{return}
        self.paginaResultados = paginaDescargada

    }
    func descargarInfoPersonajes(id: Int) async{
        guard let monoChino: MonoChino = try? await DragonBallAPI().descargarInformacionPersonaje(id: id) else {return}
        
        self.personaje = monoChino
    }
    func descargarInformacionPersonaje(id: Int){
        Task.detached(operation: {
            await self.descargarInfoPersonajes(id: id)
        })
    }
    //-------------------
    func descargarPlanetas() async{
        guard let paginaDescargada: PaginaResultadoPlaneta = try? await DragonBallAPI().descargarPaginaPlanetas() else{return}
        self.paginaResultadosPlaneta = paginaDescargada
        
    }
    func descargarInfoPlanetas(id: Int) async{
        guard let planeta: Planeta = try? await DragonBallAPI().descargarInformacionPlaneta(id: id) else{return}
    }
    func descargarInformacionPlaneta(id: Int){
        Task.detached(operation: {
            await self.descargarInfoPlanetas(id: id)
        })
    }
    //---------------------
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
