//
//  JSON-3.swift
//  ParseJson1
//
//  Created by riya singhal on 02/06/22.
//

import Foundation
//import Foundation
//import Foundation
struct BoolValue  : Codable{
    var archived : Bool
    var hasissues : Bool
    var hasProjects : Bool
    var hasdownloads : Bool
    var hasPages : Bool
    var defaultbranch : String?
    var size : Int?
    var forkscount : Int = 0
    
    enum CodingKeys : String, CodingKey{
        case archived = "archived"
        case hasissues = "has_issues"
        case hasProjects = "has_Projects"
        case hasdownloads = "has_downloads"
        case hasPages = "has_Pages"
        case defaultbranch = "default_branch"
        case size = "id"
        case forkscount = "forks_count"
    }
    
}

struct ObjectArray : Codable{
    let Owner : [owner]
    let boolValue : BoolValue?
}


import Foundation
struct owner : Codable{
  let avatarurl : String?
    let url : String?
    let htmlurl: String?
    let followersurl: String?
    let followingurl: String?
    let login : String?
    let nodeid : String?
    let gravatarid : String?
    let type: String?
    let id :Int?
    
    enum CodingKeys : String, CodingKey{
        case avatarurl = "avatar_url"
        case url = "url"
        case htmlurl = "html_url"
        case followersurl = "followers_url"
        case followingurl = "following_url"
        case login = "login"
        case nodeid = "node_id"
        case gravatarid = "gravatar_id"
        case type = "type"
        case id = "id"
    }
    
}

import UIKit

class ViewController3: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = "https://api.github.com/users/mralexgray/repos"
        
        let url = URL(string: urlString)
        
        guard url != nil else {
            return
        }
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url!) { data, response, error in
            
            if error == nil && data != nil {
                do {
                    let myData = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                    print(myData)
                    if let myPresentData = myData as? [[String:Any]]
                    {
                        for _  in myPresentData {
                            print(myPresentData.first ?? 0)
                            
                        }
                        for _ in myPresentData {
                            print(myPresentData.last ?? 0)
                        }
                        
                        for _ in myPresentData {
                            let mySize = myPresentData.count
                            let myMiddleData = myPresentData[mySize/2]
                            print(myMiddleData)
                        }
                    }
                }
                catch {
                    print("Error")
                }
            }
        }
        task.resume()
    }

}



