//
// Created by Jonathan YEUNG on 13/5/2020.
// DemoView
// Copyright © 2020 Jonathan Yeung. All rights reserved.
// 

import Foundation
import SwiftyJSON

struct Entity {
    var id: Int = 0
    var nickName: String = ""
    var lastName: String = ""
    var firstName: String = ""
    var language: String = ""
    var hobbies: String = ""
    var hometown: String = ""
    var imageLink: String = ""
    var summary: String = ""
}

class PersonalData {
    var entities = Array<Entity>()

    init() {
        self.initData()
    }

    func initData() {
        guard let data = try? getJSONData() else {
            return
        }
        
        guard let json = try? JSON(data: data) else {
            return
        }

        for (_, subdata) : (String, JSON) in json {
            var entity: Entity! = Entity()
            
            entity.id = subdata["id"].int ?? 0
            entity.nickName = subdata["nickName"].string ?? ""
            entity.lastName = subdata["lastName"].string ?? ""
            entity.firstName = subdata["firstName"].string ?? ""
            entity.language = subdata["language"].string ?? ""
            entity.hobbies = subdata["hobbies"].string ?? ""
            entity.hometown = subdata["hometown"].string ?? ""
            entity.imageLink = subdata["imageLink"].string ?? ""
            entity.summary = subdata["summary"].string ?? ""
            
            entities.append(entity)
        }
    }
    
    func getJSONData() throws -> Data? {
        guard let path = Bundle.main.path(forResource: "mates", ofType: "json") else {
            return nil
        }
        
        let url = URL(fileURLWithPath: path)

        return try Data(contentsOf: url)
    }
}
