//
//  MoviesViewController.swift
//  flixster
//
//  Created by Sidney Pho on 9/16/20.
//  Copyright © 2020 sidney.pho@mavs.uta.edu. All rights reserved.
//

import UIKit
import AlamofireImage

class Movie {
    var movieName: String!
    var descriptionLabel: String!
    var dateReleased: String!
    var ratingLabel: Double!
    
    init(prName:String, prDescription:String, prDateReleased:String, prRating:Double) {
        self.movieName = prName
        self.descriptionLabel = prDescription
        self.dateReleased = prDateReleased
        self.ratingLabel = prRating
        
    }
    
}



class MoviesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var moviesArray = [Movie]()
    @IBOutlet weak var tableView: UITableView!
    var movies = [[String:Any]]()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
           // This will run when the network request returns
           if let error = error {
              print(error.localizedDescription)
           } else if let data = data {
              let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]

              // TODO: Get the array of movies
            self.movies = dataDictionary["results"] as! [[String : Any]]
            for movie in self.movies {
                var finalMovie = Movie(prName: movie["title"] as! String, prDescription: movie["overview"] as! String, prDateReleased: movie["release_date"] as! String, prRating: movie["vote_average"] as! Double)
                self.moviesArray.append(finalMovie)
            }
            self.tableView.reloadData()
            

           }
        }
        task.resume()

        // Do any additional setup after loading the view.
    }
    
    func filterList() {
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell
        let movie = movies[indexPath.row]
        let title = movie["title"] as! String
        let synopsis = movie["overview"] as! String
        cell.titleLabel!.text = title
        cell.synopsisLabel!.text = synopsis
        let baseUrl = "https://image.tmdb.org/t/p/w185/"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string: baseUrl + posterPath)
        let rating = movie["vote_average"] as! Double
        let image = cell.posterView.af_setImage(withURL: posterUrl!)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       performSegue(withIdentifier: "showDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? OneMovieViewController {
            destination.movieInfo =  moviesArray[(tableView.indexPathForSelectedRow!.row)]
            tableView.deselectRow(at: tableView.indexPathForSelectedRow!, animated: true)
        }
    }
    
    
    

}
