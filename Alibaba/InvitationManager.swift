//
//  InvitationManager.swift
//  Alibaba
//
//  Created by 村上晋太郎 on 2016/07/02.
//  Copyright © 2016年 S. Murakami. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class InvitationManager: NSObject {
    func get(complition: ((invitations: [Invitation]) -> Void)) {
        Alamofire.request(.GET, "http://10.201.120.98:3000/invite/index")
            .responseJSON {
                response in
                guard let object = response.result.value else {
                    NSLog("failed to get JSON from server...")
                    return
                }
                let json = JSON(object)
                
                let invitations: [Invitation] = (json.array ?? []).map { elem in
                    return Invitation(
                        id: elem["id"].int!,
                        category: elem["category"].string!,
                        status: elem["status"].string!,
                        lon: elem["lon"].double!,
                        lat: elem["lat"].double!,
                        limit: elem["limit"].int,
                        created_at: elem["created_at"].string!,
                        updated_at: elem["updated_at"].string!
                    )
                }
                
                complition(invitations: invitations)
        }
    }
    
    func create() {
        
    }
    
    static let shared = InvitationManager()
}

struct Invitation {
    static let categories = [
        "test",
        "test",
        "test",
        "test",
        "test",
        "test",
        "test",
        ]
    
    var id: Int
    var category: String
    var status: String
    var lon: Double
    var lat: Double
    var limit: Int?
    var created_at: String
    var updated_at: String
    
    static func mock() -> Invitation {
        return Invitation(id: 0, category: "", status: "", lon: 0, lat: 0, limit: nil, created_at: "", updated_at: "")
    }
}

