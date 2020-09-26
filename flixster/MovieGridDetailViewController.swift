//
//  MovieGridDetailViewController.swift
//  flixster
//
//  Created by Sidney Pho on 9/25/20.
//  Copyright © 2020 sidney.pho@mavs.uta.edu. All rights reserved.
//

import UIKit
import WebKit

class MovieGridDetailViewController: UIViewController {
    
    var movie: [String: Any]!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UITextView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backdropView: UIImageView!
    @IBOutlet weak var imagePoster: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.interactivePopGestureRecognizer?.delegate = nil
        
        
        titleLabel.text! = movie["title"] as! String
        synopsisLabel.text! = movie["overview"] as! String
        
        let rating: Double = movie["vote_average"] as! Double
        ratingLabel.text = "Rating: \(rating)"
        
        //date label processing
        let date: String = movie["release_date"] as! String
        let releaseTime = date.split(separator: "-")
        let month = releaseTime[1]
        let year = releaseTime[0]
        let day = releaseTime[2]
        let finalReleaseDate = "Released: \(month)-\(day)-\(year)"
        dateLabel.text = finalReleaseDate
           
        
        //poster image
        let baseUrl = "https://image.tmdb.org/t/p/w185/"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string: baseUrl + posterPath)
        imagePoster.af.setImage(withURL: posterUrl!)
        

        //backdrop image
        let backdropPath = movie["backdrop_path"] as! String
        let backdropUrl = URL(string: "https://image.tmdb.org/t/p/w780/" + backdropPath)
        backdropView.af.setImage(withURL: backdropUrl!)
        
    }

}
