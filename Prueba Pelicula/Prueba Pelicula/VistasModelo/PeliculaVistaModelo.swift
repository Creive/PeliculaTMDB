//
//  PeliculaVistaModelo.swift
//  Prueba Pelicula
//
//  Created by NECSOFT on 24/10/21.
//

import Foundation
class PeliculaVistaModelo {
   
    let compartir = PeliculaVistaModelo()
    var movies: [Movie]
    var selectedMovieIndex: Int = 0
    
    init() {
        self.movies = [Movie]()
    }
    
    func traerPeliculas(){
        ApiMovieDB.ListadoPeliculas() { (movies) in
            DispatchQueue.main.async {
                self.movies = movies
               // self.movies.append(contentsOf: movies)
                
            }
        }
    }
}
