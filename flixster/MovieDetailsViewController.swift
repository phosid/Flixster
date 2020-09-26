//
//  MovieDetailsViewController.swift
//  flixster
//
//  Created by Sidney Pho on 9/24/20.
//  Copyright © 2020 sidney.pho@mavs.uta.edu. All rights reserved.
//

import UIKit
import AlamofireImage
import WebKit

class MovieDetailsViewController: UIViewController {
    
    
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
     @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UITextView!
    @IBOutlet weak var backdropView: UIImageView!
    var movie: [String: Any]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //swipe to the right to go back to the previous screen
        navigationController?.interactivePopGestureRecognizer?.delegate = nil
        
        titleLabel.text = movie["title"] as? String
        titleLabel.sizeToFit()
        
        synopsisLabel.text = movie["overview"] as? String
        
        let rating: Double = movie["vote_average"] as! Double
        ratingLabel.text = "Rating: \(rating)"
        
        //date label processing to get it into the correct format with month, day, year
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
        posterView.af.setImage(withURL: posterUrl!)
        

        //backdrop image
        let backdropPath = movie["backdrop_path"] as! String
        let backdropUrl = URL(string: "https://image.tmdb.org/t/p/w780/" + backdropPath)
        backdropView.af.setImage(withURL: backdropUrl!)
        
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        let webViewController = segue.destination as! WebViewController
        webViewController.movie = self.movie
    }

    
}
