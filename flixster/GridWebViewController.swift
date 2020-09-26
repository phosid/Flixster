//
//  GridWebViewController.swift
//  flixster
//
//  Created by Sidney Pho on 9/25/20.
//  Copyright © 2020 sidney.pho@mavs.uta.edu. All rights reserved.
//

import UIKit
import WebKit
class GridWebViewController: UIViewController, WKUIDelegate {

    var movie: [String: Any]!
    var results = [[String:Any]]()
    @IBOutlet weak var gridWebView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(movie["id"]!) as! Int
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
