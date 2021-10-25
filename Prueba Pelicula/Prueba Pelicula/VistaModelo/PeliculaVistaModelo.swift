//
//  PeliculaVistaModelo.swift
//  Prueba Pelicula
//
//  Created by NECSOFT on 24/10/21.
//

import Foundation
class PelicuaVistaModelo{
    static let shared = PelicuaVistaModelo()
    var movies: [Movie]
    var apiMovieDB = ApiMovieDB()
    var indicePeliculaSeleccionada: Int = 0
    init() {
        self.movies = [Movie]()
        
    }
    
    func alimentarTabla(for currency: String,completionHandler: @escaping () -> Void) {
        
        apiMovieDB.ListadoPeliculas(for: currency) { (movies) in
            DispatchQueue.main.async {
                self.movies = movies
               // self.movies.append(contentsOf: movies)
                completionHandler()
            }
        }
    }
    func peliculaSeleccionada() -> Int {
        return self.indicePeliculaSeleccionada
    }
}
