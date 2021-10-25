//
//  PeliculasTableView.swift
//  Prueba Pelicula
//
//  Created by NECSOFT on 24/10/21.
//

import UIKit
class PeliculasTableViewCell: UITableViewCell {
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDirector: UILabel!
    @IBOutlet weak var movieImg: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
   func configure(_ item : Movie){
        movieTitle.text = item.title
        movieDirector.text = String("Puntuación: \(item.vote_average)")
    
        //movieImg.image = UIImage(named: "\(Constantes.urlImagenes)\(item.poster_path)")
        //let url = URL(image: item.posterPath)
        //let url = URL(string: "\(Constantes.urlImagenes)\(item.poster_path)")
        //movieImg.image = UIImage(named: "\(url)")
        //movieImg.kf.setImage(with: url)
        //movieReleaseDate.text = "Release Date: \(item.releaseDate)"
        
    }
    
}
    

