//
//  JSON-4.swift
//  ParseJson1
//
//  Created by riya singhal on 02/06/22.
//

import Foundation
import UIKit

class ViewController4: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.bringData()
    }
    let urlString = "http://country.io/capital.json"
    
    func bringData(){
        guard let url = URL(string: self.urlString) else{
            return
        }
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { data, response, error in
            if error == nil && data != nil{
                do{
                    let myData = try JSONSerialization.jsonObject(with: data!, options: .mutableLeaves)
                    print(myData)
                    if let presentData = myData as? [String:String]{
                        for (key,value) in presentData{
                            if key.contains("A") || key.contains("M"){
                                print(value)
                            }
                        }
                    }

                }
                catch{
                    print(error)
                }
            }
        }
        task.resume()
    }

}


