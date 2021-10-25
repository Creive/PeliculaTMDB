//
//  Movie.swift
//  Prueba Pelicula
//
//  Created by NECSOFT on 24/10/21.
//

import Foundation
class Movie : Codable{
   
    let backdrop_path : String
    let id: Int
    let overview : String
    let poster_path: String?
    let release_date: String
    let title: String
    let vote_average: Double

    
    private enum CodingKeys: String, CodingKey {
        case id,
             poster_path = "poster_path",
             backdrop_path = "backdrop_path",
             title,
             release_date = "release_date",
             vote_average = "vote_average",
             overview
    }
   
}
