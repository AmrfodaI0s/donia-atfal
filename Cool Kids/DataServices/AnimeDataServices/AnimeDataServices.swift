//
//  AnimeDataServices.swift
//  Cool Kids
//
//  Created by Eslam on 3/26/20.
//  Copyright © 2020 ioslam. All rights reserved.
//

import Foundation
import Alamofire

class CategoryDataServices {
    
    //MARK: -  get all Categories
    
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


