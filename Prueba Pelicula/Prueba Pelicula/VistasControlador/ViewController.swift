//
//  ViewController.swift
//  Prueba Pelicula
//
//  Created by NECSOFT on 24/10/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var currencyPicker: UIPickerView!
    var apiMovieDB = ApiMovieDB()
    var peliculas : [Movie] = []
    var peliculaVistaModelo = PelicuaVistaModelo.shared
    @IBOutlet weak var TableView: UITableView!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        //apiMovieDB.delegate = self
        //apiMovieDB.ListadoPeliculas()
        
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
           
           
        
        //let selectedCurrency = apiMovieDB.currencyArray[row]
        //apiMovieDB.ListadoPeliculas(for: "Mejor Valorado",completion: <#T##([Movie]) -> Void#>)
           
        }
        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)

            peliculaVistaModelo.alimentarTabla(for:Constantes.defaul) {
                self.TableView.reloadData()
            }
        }
    
  
  
        // Do any additional setup after loading the view.
    }


//MARK: - UIPickerView DataSource & Delegate

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
          return 1
      }
      
      func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
          return apiMovieDB.currencyArray.count
      }
      
      func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
          return apiMovieDB.currencyArray[row]
      }
      
      func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedCurrency = apiMovieDB.currencyArray[row]
        peliculaVistaModelo.alimentarTabla(for:selectedCurrency) {
            self.TableView.reloadData()
        }
            
        
        
      }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peliculaVistaModelo.movies.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
 /*       let item = self.peliculas[indexPath.row]
        let cell = TableView.dequeueReusableCell(withIdentifier: item.title, for: indexPath) as! PeliculasTableViewCell
        cell.movieTitle.text = item.title
        cell.movieDirector.text = String (item.vote_count)
        cell.movieImg.image = UIImage(named: "\(Constantes.urlImagenes)\(item.posterPath)")
        
        */
        guard let cell = TableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath) as? PeliculasTableViewCell else { return UITableViewCell() }
        if(self.peliculaVistaModelo.movies == nil){
            peliculaVistaModelo.alimentarTabla(for:Constantes.defaul) {
                cell.configure(self.peliculaVistaModelo.movies[indexPath.row])
            }
        }else{
            cell.configure(self.peliculaVistaModelo.movies[indexPath.row])
        }
        //passing data to the method.
        return cell
     }
    /*
    func actulizarTabla(Peliculas: [Movie]) {
        
        DispatchQueue.main.async {
            self.peliculas = Peliculas
           // if self.peliculas != nil {
        
            self.TableView.reloadData()
            //}else {
              //  print("zxxzxzx")
            //}
        }
    }
    func didFailWithError(error: Error) {
        print(error)
    }*/
}


