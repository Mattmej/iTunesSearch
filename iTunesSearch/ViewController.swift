//
//  ViewController.swift
//  iTunesSearch
//
//  Created by Matt Mejia on 12/11/18.
//  Copyright © 2018 Matt_Mejia. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    // We will change this later. Need to make limit changeable.
    let MAIN_URL = "http://itunes.apple.com/us/rss/topalbums/limit=10/json"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    //MARK: - Networking
    /**************************************************/
    
    func getAlbumData(url: String, parameters:[String:String]) {
        
    }


}

