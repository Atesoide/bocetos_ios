//
//  Placeholder_API.swift
//  Redes_sociales
//
//  Created by alumno on 3/24/25.
//

import SwiftUI
import Foundation

class PlaceHolderAPI: Codable{
    let urlDeServicio = "https://jsonplaceholder.typicode.com"
    func descargarPublicaciones() async throws -> [Publicacion]?{
        let ubicacionRecurso = "/posts"
        return await descargar(recurso: ubicacionRecurso)
    }
    func descargarComentarios(postId: Int) async -> [Comentario]?{
        let ubicacionRecurso = "/posts/\(postId)/comments"
        return await descargar(recurso: ubicacionRecurso)
    }
    
    func descargarPerfil(id: Int) async -> Perfil?{
        let ubicacionRecurso = "/users/\(id)/"
        return await descargar(recurso: ubicacionRecurso)
    }
    
    private func descargar<TipoGenerico: Codable>(recurso: String) async -> TipoGenerico?{
        do{
            guard let url = URL(string: "\(urlDeServicio)\(recurso)") else{ throw ErroresDeRed.malaDireccionUrl }
            let (datos, respuesta) = try await URLSession.shared.data(from: url)
            guard let respuesta = respuesta as? HTTPURLResponse else { throw ErroresDeRed.badResponse }
            guard respuesta.statusCode >= 200 && respuesta.statusCode < 300 else { throw ErroresDeRed.badStatus}
            
            guard let respuestaDecodificada = try? JSONDecoder().decode(TipoGenerico.self, from: datos) else { throw ErroresDeRed.fallaAlConvertirLaRespuesta}
            return respuestaDecodificada
        } catch ErroresDeRed.malaDireccionUrl{
            print("Tenes mal la url capo, cambiala")
        }
        catch ErroresDeRed.badResponse{
            print("Algo salio mal con la respuesta, revisa por favor")
        }
        catch ErroresDeRed.badStatus{
            print("Como consigues un status negativo de algo que ni siquiera se mueve")
        }
        catch ErroresDeRed.fallaAlConvertirLaRespuesta{
            print("Tienes mal el modelo o la implementación de este")
        }
        catch ErroresDeRed.invalidRequest{
            print("Como llegaste aqui?")
        }
        catch{
            
        }
        return nil
    }
}
