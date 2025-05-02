//
//  preview_personaje.swift
//  Redes_sociales
//
//  Created by alumno on 4/7/25.
//

import SwiftUI
let defaul: MonoChino = MonoChino(id: 1, name: "safdaf", ki: "sdfrw", maxKi: "dfdf", race: "dfdfd", gender: "H", description: "Tonoto", image: "", affiliation: "Bueno", originPlanet: nil, transformations: nil)
struct PreviewPersonaje: View {
    @Environment(ControladorAplicacion.self) var controlador
    var personaje: MonoChino
    
    
    var body: some View {
        VStack{
            Text(controlador.personaje?.name ?? "Personaje")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.red)
 
            AsyncImage(url: URL(string: controlador.personaje?.image ?? "")) { imagen in
                imagen
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .shadow(color: .pink.opacity(0.5), radius: 10, x: 0, y: 5)
            } placeholder: {
                ProgressView()
                    .padding()
                    .frame(width: 100, height: 100)
                    .background(Color.pink.opacity(0.3))
                    .clipShape(Circle())
            }
            VStack(alignment: .leading, spacing: 8) {
                            Text("Nombre: \(personaje.name)")
                            Text("Raza: \(personaje.race)")
                            Text("Género: \(personaje.gender)")
                            Text("Afiliación: \(personaje.affiliation)")
                            Text("Ki: \(personaje.ki)")
                            Text("Máximo Ki: \(personaje.maxKi)")
                            Text("Descripción: \(personaje.description)")
                        }
                        .padding()
                        .background(Color.yellow)
                        .cornerRadius(15)
                        .foregroundColor(.red)
        }
        .padding()
        .background(Color.orange)
        .cornerRadius(25)
        .shadow(radius: 5)
    }
}

#Preview {
    PreviewPersonaje(personaje: defaul)
        .environment(ControladorAplicacion())
}
