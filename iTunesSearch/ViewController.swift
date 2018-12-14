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
//    let album = Album()
    var albums: [Album] = []
    
    var service = Service()
    
    
    
    //MARK: - Setting up our service / Moving data between threads
    /***************************************************************/

    func setupService() {
        let success: successResponse = { [unowned self] albumResponse in
            DispatchQueue.main.async {
                <#code#>
            }
        }
    }
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
//        URLSession.shared.dataTask(with: MAIN_URL) { (data, response, err) in
//            print("Do stuff")
//        }.resume()
        
        
        
        //MARK: - Networking and Retrieving JSON
        /***************************************************************/
        
        
        service.retrieveJSON()
        
        
        
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
    
    //MARK: - Downloading album image
    /**************************************************/

//    func downloadImage(urlString: String) {
//
//    }


}


//MARK: - Creating the table
/**************************************************/

//
//extension ViewController: UITableViewDelegate, UITableViewDataSource {
//
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? AlbumTableViewCell else { return UITableViewCell() }
//
////        var item: Album?
////
////        item =
//
//        cell.setup(album: album)
//
//        return cell
//    }
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//}





