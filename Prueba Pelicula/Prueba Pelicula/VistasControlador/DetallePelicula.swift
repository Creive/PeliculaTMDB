//
//  DetallePelicular.swift
//  Prueba Pelicula
//
//  Created by NECSOFT on 25/10/21.
//

import UIKit

class DetallePelicula: UIViewController {
    var peliculaVistaModelo = PelicuaVistaModelo.shared
    
    @IBOutlet weak var movieOverview: UILabel!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        informarcionPelicula()
    }
    
    func informarcionPelicula(){
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        //print(peliculaVistaModelo.movies.count)
        movieTitle.text = peliculaVistaModelo.movies[peliculaVistaModelo.peliculaSeleccionada()].title
        movieOverview.text = peliculaVistaModelo.movies[peliculaVistaModelo.peliculaSeleccionada()].overview
        
    }
}
    

