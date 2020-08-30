//
//  SharedInstanceClass.swift
//  SearchAPI
//
//  Created by Sose Yeritsyan on 7/21/20.
//  Copyright © 2020 Sose Yeritsyan. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class SharedInstanceClass {

    static let sharedInstance = SharedInstanceClass()
    
    
    func getSongs(requestURL: String, taskCallback: @escaping (Bool, [Song]?) -> ()) {
        
        var items = [Song]()

        AF.request(requestURL).responseJSON(completionHandler: {(response) in
            if response.value != nil {

                let json = response.value as? [String: Any]
                if json != nil {
                    if let songs = json!["results"] as? [[String: Any]] {
                        for dic in songs {
                            let s = Song(json: dic)
                            items.append(s)
                        }
                        taskCallback(true, items)

                    }
                }
            } else {
                taskCallback(false, nil)
            }
        })
        
    }
       
}
