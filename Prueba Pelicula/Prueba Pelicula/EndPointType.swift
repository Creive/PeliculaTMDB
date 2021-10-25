//
//  EndPointTipo.swift
//  Prueba Pelicula
//
//  Created by NECSOFT on 24/10/21.
//

import Foundation
protocol EndPointType{
    var baseURL: String { get }
    var path: String { get }
    var url: URL? { get }
}
