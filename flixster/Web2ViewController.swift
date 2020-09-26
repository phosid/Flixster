//
//  Web2ViewController.swift
//  flixster
//
//  Created by Sidney Pho on 9/25/20.
//  Copyright © 2020 sidney.pho@mavs.uta.edu. All rights reserved.
//

import UIKit
import WebKit
class Web2ViewController: UIViewController, WKUIDelegate {

    var movie: [String: Any]!
    var results = [[String: Any]]()

    @IBOutlet weak var gridWebView: WKWebView!
    override func viewDidLoad() {
          super.viewDidLoad()
                let myURL = URL(string:"https://www.apple.com")
                let myRequest = URLRequest(url: myURL!)
                gridWebView.load(myRequest)
                  
    

                      // Do any additional setup after loading the view.
          }
}
