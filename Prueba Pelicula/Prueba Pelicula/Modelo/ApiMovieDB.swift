//
//  ApiMovieDB.swift
//  Prueba Pelicula
//
//  Created by NECSOFT on 24/10/21.
//

import Foundation

class ApiMovieDB {
    private  let session: URLSession
    init() {
       
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .reloadIgnoringLocalCacheData
        config.urlCache = nil

        session = URLSession.init(configuration: config)
    }
   
    let currencyArray = Constantes.menu
   
    func ListadoPeliculas(for currency: String, completion: @escaping ([Movie]) -> Void){
        var urlcompleta = ""
       
        
        switch currency {
        case "Mejor Valorado":
            urlcompleta = "\(Constantes.URL)\(Constantes.top_Rated)api_key=\(Constantes.Api)"
        case "Estrenos":
            urlcompleta = "\(Constantes.URL)\(Constantes.nowplaying)api_key=\(Constantes.Api)"
        case "Proximamente":
            urlcompleta = "\(Constantes.URL)\(Constantes.upcoming)api_key=\(Constantes.Api)"
        case "Popular":
            urlcompleta = "\(Constantes.URL)\(Constantes.popular)api_key=\(Constantes.Api)"
        case "Ultimo":
            urlcompleta = "\(Constantes.URL)\(Constantes.latest)api_key=\(Constantes.Api)"
        default:
            urlcompleta = "\(Constantes.URL)385128?api_key=\(Constantes.Api)"
        }
        
        print(urlcompleta)
            if let url = URL(string: urlcompleta) {
                
                let session = URLSession(configuration: .default)
                let task = session.dataTask(with: url) { (data, response, error) in
                    let successRange = 200..<300
                    
                    guard error == nil,
                          let statusCode = (response as? HTTPURLResponse)?.statusCode,
                          successRange.contains(statusCode) else {
                        completion([])
                        return
                    }
                    guard let resultData = data else {
                        completion([])
                        return
                    }
                         let peliculas = self.parseJSON(resultData)
                            //let priceString = String(format: "%.2f", bitcoinPrice)
                            //self.delegate!.actulizarTabla(Peliculas : peliculas)
                            completion(peliculas)
                        
                    
                }
                task.resume()
        }
    }
    
    func parseJSON(_ data: Data) -> [Movie] {
        
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(Result.self, from: data)
            let peliculas = decodedData.results
            //print(peliculas[0])
            return peliculas
            
        } catch let error {
            print("##MovieLoad decodingError: \(error.localizedDescription)")
            return []
        }
    }
    /*
    func getData (from url: URL, completion : (Data?, URLResponse?, Error?)) -> (){
        URLSession.shared.dataTask(with: url, completionHandres: completion).resume()
    };)*/
}
