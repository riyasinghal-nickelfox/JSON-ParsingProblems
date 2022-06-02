//
//  JSON-2.swift
//  ParseJson1
//
//  Created by riya singhal on 02/06/22.

import UIKit
import Foundation
struct File :Codable{
    let response :Response?
    
}

struct Docs : Codable{
    let id:String?
    let publicationDate:Date?
    let titleDisplay:String?
    let score:Double?
}
enum CodingKeys : String,CodingKey {
case id = "id"
case publicationDate = "publication_date"
case titleDisplay = "title_display"
case score = "score"
}

struct Response : Codable{
   let  numFound : Int?
    let start = 0
    let maxScore : Double
    let docs : [Docs]
    
    enum CodingKeys: String, CodingKey {
        case numFound = "numFound"
        case start = "start"
        case maxScore = "maxScore"
        case docs = "docs"
        
        
    
}
}
struct FinalResponse : Codable{
    let response : Response
}


class ViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = "https://api.plos.org/search?q=title:DNA"
        
        let url = URL(string: urlString)
        
        guard url != nil else {
            return
        }
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url!) { data, response, error in
            if error == nil && data != nil{
                do{
                    let myData = try JSONSerialization.jsonObject(with: data!, options: .mutableLeaves)
                    
                    if let jsonData = myData as? [String:Any] {
                        if let tempResponseFile  = jsonData["response"] as? [String:Any] {
                            if let tempDocs = tempResponseFile["docs"] as? [[String:Any]] {
                                for tempDoc in tempDocs {
                                    if let tempScore = tempDoc["score"] as? Double {
                                        if tempScore < 6.2 {
                                            print("print all below than 6.2: ")
                                            print("TempIDs")
                                            if let tempID = tempDoc["id"] as? String {
                                                print(tempID)
                                            }
                                            print("TempTitles")
                                            if let tempTitle = tempDoc["title_display"] as? String{
                                                print(tempTitle)
                                            }
                                            print("Publication Dates")
                                            if let tempDate = tempDoc["publication_date"] as? String{
                                                print(tempDate)
                                            }
                                           }
                                           }
                                           }
                                          }
                                         }
                                         }
                                         }
                catch
                {
                    print(error)
                }
            }
        }
        task.resume()
    }
}


