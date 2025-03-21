//
//  vista_modelo_basico.swift
//  mvvm
//
//  Created by alumno on 3/14/25.
//

import Foundation

@Observable
class VistaModeloBasico{
var estadoActualDeLaApp: EstadosDeLaApplicacion = .mostrandoSeries
    var seriesRegistradas: Array<InformacionSerie> = []
    
    func agregarSerie(serie: InformacionSerie? = nil) -> Bool{
        if let serieNueva = serie{
            if serieNueva.nombre == ""{
                return false
            }
            seriesRegistradas.append(serieNueva)
        }
        else{
            seriesRegistradas.append(InformacionSerie(nombre: "prueba", tipo: "prueba", fechaEstreno: 2017, sinopsis: "Inserte Sinopsis larga", caratula: "Imagen_fake_1"))
        }
        
        estadoActualDeLaApp = .mostrandoSeries
        return true
    }
    func cambiarAAgregarSerie() -> Void{
        estadoActualDeLaApp = .agregandoSeries
    }
}
