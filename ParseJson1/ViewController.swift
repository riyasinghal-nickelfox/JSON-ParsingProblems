//
//  ViewController.swift
//  ParseJson1
//
//  Created by riya singhal on 25/05/22.
//
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.bringData()
    }
        let urlString = "https://reqres.in/api/products/3"
        func bringData()
    {
        
        let url = URL(string: urlString)
        guard url != nil else{
            return
        }
    
        let session = URLSession.shared
        
        let task = session.dataTask(with:url!) { data ,response, error in
            
            if error == nil &&  data != nil {
                
                do {
                    let myData = try JSONSerialization.jsonObject(with: data!, options: .mutableLeaves)
                    print(myData)
                    if let jsonData = myData as? [String:Any]
                    {
                        if let tempData = jsonData["support"]  as? [String:Any]{
                            if let tempurl = tempData["url"] as?  String
                            {
                                print("my url is ",tempurl)
                            }
                        }
                    }
                    
                    if let jsonSupport = myData as? [String:Any]
                    {
                        if let tempSupport = jsonSupport["data"] as? [String:Any]
                        {
                            if let tempName = tempSupport["name"] as? String
                            {
                                print("my name is" ,tempName)
                            }
                        }
                            
                        }
                    }
                    
        
                
                catch{
                    print("Error coming  in JSON parsing")
                }
                
            }
        
        }
        task.resume()
     
    }


}


