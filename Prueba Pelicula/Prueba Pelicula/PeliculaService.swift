//
//  PeliculaService.swift
//  Prueba Pelicula
//
//  Created by NECSOFT on 24/10/21.
//

import Foundation
class PeliculaService: Networkable{
    static func (_ page: Int, completion: @escaping ([Movie]) -> Void) {
      requestAPI(MovieAPI.movies(page: page)) { data in
        let decodedData = self.decode(APIResults.self, data: data)
        completion(decodedData?.movies ?? [])
      }
    }
}
