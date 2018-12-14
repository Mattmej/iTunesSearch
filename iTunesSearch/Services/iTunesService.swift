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


typealias successResponse = ([Album]) -> ()

typealias failureResponse = () -> ()

class Service {
    var success: successResponse!
    var failure: failureResponse!

    
    
    // TODO: add input variable for number of results
    func retrieveJSON() {
        
        
        // We will change this later. Need to make limit changeable.
        let mainURLString = "http://itunes.apple.com/us/rss/topalbums/limit=10/json"
        guard let mainURL = URL(string: mainURLString) else { return }
        
        //        URLSession.shared.dataTask(with: mainURL) {(data, response, error) in
        //            print("Do stuff")
        //        }.resume()
        
        var urlRequest = URLRequest(url: mainURL)
        urlRequest.httpMethod = "GET"
        
        Alamofire.request(urlRequest).responseJSON(queue: DispatchQueue.global(), options: .mutableLeaves) { (dataResponse) in
            
            if dataResponse.result.isSuccess {
                print("Success! Got album data.")
                
                //            print(dataResponse.result.value!)
                let albumJSON: JSON = JSON(dataResponse.result.value!)
                //            print(albumJSON)
                //                print(albumJSON["feed"]["entry"][0]["im:name"]["label"])
                self.getAlbumData(json: albumJSON)
                
//                var albums =
                
                
            }
                
            else {
                print("Unable to get album data.")
            }
            
//            self.success?(
            
        }
    }
    
    //MARK: - Parsing JSON
    /**************************************************/
    
    // Sample cell
    // Will make function to fill more cells later.
    func getAlbumData(json: JSON) {
        
//        let album = Album()
        var albums: [Album] = []
        
        let albumArray = json["feed"]["entry"].array!
//        album.albumName = albumArray[0]["im:name"]["label"].stringValue
//        album.artistName = albumArray[0]["im:artist"]["label"].stringValue
        
        for item in albumArray {
            let albumName = item["im:name"]["label"].stringValue
            let artistName = item["im:artist"]["label"].stringValue
            
            let album = Album()
            album.albumName = albumName
            album.artistName = artistName
            
            if let imagePath = item["im:image"][2]["label"].string {
                album.albumImagePath = imagePath
            }
            
            else {
                album.albumImagePath = ""
            }
            
            albums.append(album)
        }
        
        
        // Store successful object to use in main thread
        self.success?(albums)
        
        
//
//        print(album.albumName)
//        print(album.artistName)
//        print(album.albumImagePath!)
        
    }
    
    //MARK: - Retrieving album image from URL
    /**************************************************/

    func downloadAlbumImage(urlString: String, completion: @escaping (Data)-> ()) {
        guard let url = URL(string: urlString) else {return}
        
        Alamofire.request(url).response { (dataResponse) in
            guard let data = dataResponse.data else { return }
            completion(data)
        }
    }
    
    
    
    
    
    
}
