//
//  dragonball_api.swift
//  Redes_sociales
//
//  Created by alumno on 4/2/25.
//

import SwiftUI

class DragonBallAPI: Codable{
    let urlBase = "https://dragonball-api.com/api"
    
    func descargarPaginaPersonajes() async -> PaginaResultado?{
        let ubicacionRecurso = "/characters"
        
        return await descargar(recurso: ubicacionRecurso)
    }
    
    private func descargar<TipoGenerico: Codable>(recurso: String) async -> TipoGenerico?{
        do{
            guard let url = URL(string: "\(urlBase)\(recurso)") else{ throw ErroresDeRed.malaDireccionUrl }
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
            print("En DB API")
        }
        catch ErroresDeRed.invalidRequest{
            print("Como llegaste aqui?")
        }
        catch{
            
        }
        return nil
    }
}
