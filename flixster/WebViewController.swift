//
//  WebViewController.swift
//  flixster
//
//  Created by Sidney Pho on 9/25/20.
//  Copyright © 2020 sidney.pho@mavs.uta.edu. All rights reserved.
//

import UIKit
import WebKit
class WebViewController: UIViewController, WKUIDelegate {
    
    
    var movie: [String: Any]!
    var results = [[String:Any]]()
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //load movie ID
        let movieID = movie["id"] as! Int
        
        //locate end point for video
        let url = URL(string: "https://api.themoviedb.org/3/movie/\(movieID)/videos?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")
        let request = URLRequest(url: url!, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
           // This will run when the network request returns
           if let error = error {
              print(error.localizedDescription)
           } else if let data = data {
              let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
            self.results = dataDictionary["results"] as! [[String:Any]]

            
            //get key from video endpoint
            let movieKey = self.results[0]["key"]!
            
            //attach key to the base URL to load video
            let baseURL = URL(string: "https://www.youtube.com/watch?v=\(movieKey)")
            self.webView.load(URLRequest(url: baseURL!))
            
            }
        }
        task.resume()

    }
}
