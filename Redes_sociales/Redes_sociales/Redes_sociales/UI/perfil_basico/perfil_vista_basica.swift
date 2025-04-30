//
//  perfil_vista_basica.swift
//  Redes_sociales
//
//  Created by alumno on 3/28/25.
//

import SwiftUI
import PhotosUI//Para usar la galería

struct PerfilBasicoVista: View{
    @State var fotoSeleccionada: PhotosPickerItem? = nil
    @State var fotoAMostrar: UIImage? = nil
    
    
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View{
        ZStack{
            
            PhotosPicker(selection: $fotoSeleccionada){
                Image(uiImage: fotoAMostrar ?? UIImage(resource: .miku))
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .frame(width: 300, height: 300)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            }
            .onChange(of: fotoSeleccionada){valorAnterior, valorNuevo in
                Task{
                    if let fotoSeleccionada, let datos = try? await
                        fotoSeleccionada.loadTransferable(type: Data.self){
                        if let imagen = UIImage(data: datos){
                            fotoAMostrar = imagen
                        }
                    }
                }
                
            }
            Image(systemName: "folder.badge.plus")
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .frame(width: 60, height: 60)
        }
        
        Text("User: \(controlador.perfilAMostrar?.username ?? "Puede que no")")
        Text("Nombre: \(controlador.perfilAMostrar?.name ?? "Sea bonito ver estas")")
        Text("Correo \(controlador.perfilAMostrar?.email ?? "Palabras de error")")
            .onDisappear(){
                print("Adios mundo cruel, este mensaje solo se ve cuando destruimos la vista")
            }
    }
}

#Preview{
    PerfilBasicoVista()
        .environment(ControladorAplicacion())
}
