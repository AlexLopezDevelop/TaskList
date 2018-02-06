//
//  Tarea.swift
//  TaskList
//
//  Created by Alex Lopez on 30/1/18.
//  Copyright © 2018 alex.lopez. All rights reserved.
//

import UIKit

class Tarea: NSObject {
    var nombre: String
    var descripcion: String
    var tipo: String
    var finalizada: Bool
    
    init(nombre: String, descripcion: String, tipo: String, finalizada: Bool){
        self.nombre = nombre
        self.descripcion = descripcion
        self.tipo = tipo
        self.finalizada = finalizada
    }
    override init() {
        self.nombre = ""
        self.descripcion = ""
        self.tipo = ""
        self.finalizada = false
    }
}
