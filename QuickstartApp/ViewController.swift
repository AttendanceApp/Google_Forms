//
//  ViewController.swift
//  QuickstartApp
//
//  Created by Liz Parker on 2/1/17.
//  Copyright © 2017 Liz Parker. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    @IBAction func buttonPressed(_ sender: Any) {
        let myUrl = NSURL(string: "https://docs.google.com/a/castilleja.org/forms/d/e/1FAIpQLSefSGzX46w4W8K_l3L68GndYLitfGvjA_u4jmVUWFbpIYmskA/formResponse")
        
        var request = URLRequest(url:myUrl! as URL)
        //NSMutableURLRequest(url: url! as URL)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        request.httpMethod = "POST"
        
        let fieldsToPost = "entry.42768537=Deborah&entry.1877164239=Campbell&entry.674640187=yipee" as NSString
        
        request.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
        
        request.httpBody = fieldsToPost.data(using: String.Encoding.utf8.rawValue)
        
        let task = session.dataTask(with: request as URLRequest) {
            (data, response, error) in
            let strData = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print(strData)
            print(error)
            print(response)
        }
        task.resume()
    }
}
    
    
    
    

