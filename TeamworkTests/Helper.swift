//
//  Helper.swift
//  Teamwork
//
//  Created by Lucas Correa on 15/09/2017.
//  Copyright © 2017 SiriusCode. All rights reserved.
//

import Foundation

class Helper {
    
    func readJson(name: String) -> [Any] {
        let parseArray:[Any] = [Any]()
        
        do {
            let testBundle = Bundle(for: type(of: self))
            if let file = testBundle.url(forResource: name, withExtension: "json") {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let object = json as? [String: Any] {
                    // json is a dictionary
                    let array = object[name] as! NSArray
                    return array as! [Any]
                } else if let object = json as? [Any] {
                    // json is an array
                    return object
                } else {
                    print("JSON is invalid")
                    return parseArray
                }
            } else {
                print("no file")
                return parseArray
            }
        } catch {
            print(error.localizedDescription)
        }
        
        return parseArray
    }
}

