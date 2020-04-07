//
//  AnimeDataServices.swift
//  Cool Kids
//
//  Created by Eslam on 3/26/20.
//  Copyright © 2020 ioslam. All rights reserved.
//

import Foundation
import Alamofire

// using ALAMOFIRE
class CategoryDataServices {
    
    //MARK: -  get all Categories using ALAMOFIRE
    class func getAllCategories(completation: @escaping ( _ error: Error?, _ category: [Category]? )->() ) {
        AF.request(URLs.categories).responseJSON { (response) in
            do {
                let json = try JSONDecoder().decode(Categories.self, from: response.data!)
                completation(nil, json)
            } catch {
                print(error)
            }
        }
    }
}
class AnimeDataServices {
    class func getAnimeByID(categoryID: Int,completation: @escaping (_ error: Error?,_ videos: [Video]?) ->()) {
        let url = URLs.videos + String(categoryID)
        AF.request(url).responseJSON { (response) in
            do {
                 let jsonData = try JSONDecoder().decode(Videos.self, from: response.data!)
                 completation(nil, jsonData)
            } catch {
                print(error)
            }
        }
    }
    
    class func getRelatedVideos(id: Int, completation: @escaping (_ error: Error?,_ related_videos: [Video]?) ->()){
        let url = URLs.related_videos + "\(id)"
        AF.request(url).responseJSON { (response) in
            do {
                let json = try JSONDecoder().decode(Videos.self, from: response.data!)
                completation(nil, json)
            } catch  {
                print(error)
            }
        }
    }
}
//MARK: -  DataServises-Class using URLSession instead of Alamofire
class API {
    
    //MARK: -  fetch all categories using UrlSession
   static func getAllCategories(completation: @escaping ( _ error: Error?, _ category: [Category]? )->() ) {
        
        let session = URLSession.shared
        let url = URL(string: URLs.categories)!
        let task = session.dataTask(with: url) { data, response, error in
        if error != nil || data == nil {
            print("Client error!")
            return
        }
        guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
            print("Server error!")
            return
        }
        guard let mime = response.mimeType, mime == "application/json" else {
            print("Wrong MIME type!")
            return
        }
        do {
            //let json = try JSONSerialization.jsonObject(with: data!, options: [])
            let json = try JSONDecoder().decode(Categories.self, from: data!)
            completation(nil,json)
        } catch {
            print("JSON error: \(error.localizedDescription)")
        }
    }
    task.resume()
    }
    
}


