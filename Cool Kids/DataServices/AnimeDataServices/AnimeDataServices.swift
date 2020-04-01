//
//  AnimeDataServices.swift
//  Cool Kids
//
//  Created by Eslam on 3/26/20.
//  Copyright © 2020 ioslam. All rights reserved.
//

import Foundation
import Alamofire

class AnimeDataServices {
    
    //MARK: -  get all Categories
    
    class func getAllCategories(completation: @escaping ( _ error: Error?, _ result: [Category]? )->() ) {
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
