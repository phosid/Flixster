//
//  OneMovieViewController.swift
//  flixster
//
//  Created by Sidney Pho on 9/17/20.
//  Copyright © 2020 sidney.pho@mavs.uta.edu. All rights reserved.
//

import UIKit
import AlamofireImage


class OneMovieViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var rating: UILabel!

    @IBOutlet weak var fullSynopsis: UITextView!
    
    
    var movieInfo: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = "\(movieInfo!.movieName ?? "None")"
        let releaseTime = movieInfo!.dateReleased.split(separator: "-")
        var month = releaseTime[1]
        var year = releaseTime[0]
        var day = releaseTime[2]
        let finalReleaseDate = "\(month)-\(day)-\(year)"
        releaseDate.text = "Release date: \(finalReleaseDate ?? "None")"
        rating.text = "Rating: \(movieInfo!.ratingLabel ?? 0)"
        fullSynopsis.text = "\(movieInfo!.descriptionLabel ?? "None")"
        

    }
    
}
