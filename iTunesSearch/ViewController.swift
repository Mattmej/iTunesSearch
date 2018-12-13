//
//  ViewController.swift
//  iTunesSearch
//
//  Created by Matt Mejia on 12/11/18.
//  Copyright © 2018 Matt_Mejia. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

//
//struct MainObject {
//    let feed: Feed
//}
//
//struct Feed {
//    let topAlbums: [Album]
//}
//
//struct Album {
//    let
//}
//






class ViewController: UIViewController {
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
//        URLSession.shared.dataTask(with: MAIN_URL) { (data, response, err) in
//            print("Do stuff")
//        }.resume()
        
        
        
        //MARK: - Networking and Retrieving JSON
        /***************************************************************/
        
        
        
        // We will change this later. Need to make limit changeable.
        let mainURLString = "http://itunes.apple.com/us/rss/topalbums/limit=10/json"
        guard let mainURL = URL(string: mainURLString) else { return }
        
//        URLSession.shared.dataTask(with: mainURL) {(data, response, error) in
//            print("Do stuff")
//        }.resume()
        
        var urlRequest = URLRequest(url: mainURL)
        urlRequest.httpMethod = "GET"
        
        Alamofire.request(urlRequest).responseJSON { (dataResponse) in
            
            print(dataResponse.result.value!)
        }.resume()
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

