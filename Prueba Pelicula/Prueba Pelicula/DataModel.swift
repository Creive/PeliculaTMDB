//
//  DataModel.swift
//  Prueba Pelicula
//
//  Created by NECSOFT on 24/10/21.
//

import Foundation

class DataModel {
    var listadoPeliculas:[Movie]
    var paginaActual: Int
    var totalPaginas : Int
    var apiMovieDB = ApiMovieDB()
    var result : [Result]
    init() {
        listadoPeliculas = []
        paginaActual = 0
        totalPaginas = 100 // default upper limit
        result = [Result]()
    }
    
  
    
    func CargarPelicultas(completionHandler: @escaping () -> Void){
        
  
        apiMovieDB.ListadoPeliculas(page: 1) { (result) in
            DispatchQueue.main.async {
                self.result = result
               // self.movies.append(contentsOf: movies)
                completionHandler()
            }
        }
    }
}
