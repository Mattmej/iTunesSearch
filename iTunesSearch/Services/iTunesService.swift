//
//  iTunesService.swift
//  iTunesSearch
//
//  Created by Matt Mejia on 12/14/18.
//  Copyright © 2018 Matt_Mejia. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


typealias successResponse = ([Album])
 -> ()

typealias failureResponse = () -> ()

class Service {
    var success: successResponse!
    var failure: failureResponse!

    
    func retrieveJSON() {
        
        
        // We will change this later. Need to make limit changeable.
        let mainURLString = "http://itunes.apple.com/us/rss/topalbums/limit=10/json"
        guard let mainURL = URL(string: mainURLString) else { return }
        
        //        URLSession.shared.dataTask(with: mainURL) {(data, response, error) in
        //            print("Do stuff")
        //        }.resume()
        
        var urlRequest = URLRequest(url: mainURL)
        urlRequest.httpMethod = "GET"
        
        Alamofire.request(urlRequest).responseJSON { (dataResponse) in
            
            if dataResponse.result.isSuccess {
                print("Success! Got album data.")
                
                //            print(dataResponse.result.value!)
                let albumJSON: JSON = JSON(dataResponse.result.value!)
                //            print(albumJSON)
                //                print(albumJSON["feed"]["entry"][0]["im:name"]["label"])
                self.getOneAlbumData(json: albumJSON)
                
                
            }
                
            else {
                print("Unable to get album data.")
            }
            
        }
    }
    
    //MARK: - Parsing JSON
    /**************************************************/
    
    // Sample cell
    // Will make function to fill more cells later.
    func getOneAlbumData(json: JSON) {
        
                let album = Album()
        
        let albumArray = json["feed"]["entry"]
        album.albumName = albumArray[0]["im:name"]["label"].stringValue
        album.artistName = albumArray[0]["im:artist"]["label"].stringValue
        
        
        if let imagePath = albumArray[0]["im:image"][2]["label"].string {
            album.albumImagePath = imagePath
            
            
        }
        
        
        
        print(album.albumName)
        print(album.artistName)
        print(album.albumImagePath!)
        
    }
    
    
    
    
    
}
