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



class ViewController: UIViewController {
    
    // Instance variable
    let album = Album()
    
   

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
            
        }.resume()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    //MARK: - Parsing JSON
    /**************************************************/
    
    // Sample cell
    // Will make function to fill more cells later.
    func getOneAlbumData(json: JSON) {
        
//        let album = Album()
        
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
    
    //MARK: - Downloading album image
    /**************************************************/

//    func downloadImage(urlString: String) {
//
//    }


}


//MARK: - Creating the table
/**************************************************/


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? AlbumTableViewCell else { return UITableViewCell() }
        
//        var item: Album?
//
//        item =
        
        cell.setup(album: album)
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}





