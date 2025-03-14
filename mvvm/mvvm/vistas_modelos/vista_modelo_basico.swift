//
//  vista_modelo_basico.swift
//  mvvm
//
//  Created by alumno on 3/14/25.
//

import Foundation

@Observable
class VistaModeloBasico{
    var seriesRegistradas: Array<InformacionSerie> = []
    
    func agregarSerie() -> Void{
        print("Hola mundo desde el controlador")
        seriesRegistradas.append(InformacionSerie(nombre: "prueba", tipo: "prueba", fechaEstreno: 2017, sinopsis: "Inserte Sinopsis larga", caratula: "Imagen_fake_1"))
    }
}
