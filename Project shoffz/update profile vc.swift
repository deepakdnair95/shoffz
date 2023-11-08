//
//  update profile vc.swift
//  Project shoffz
//
//  Created by iroid on 7/26/1402 AP.
//  Copyright © 1402 iroid. All rights reserved.
//

import UIKit

class update_profile_vc: UIViewController {
    @IBOutlet weak var firstnamefield: UITextField!
    @IBOutlet weak var lastnamefield: UITextField!
    @IBOutlet weak var emailfield: UITextField!
    @IBOutlet weak var mobilefield: UITextField!
    @IBOutlet weak var changepassref: UIButton!
    
    @IBAction func backbtn(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    
    
    let urlstr = URL(string: "http://iroidtechnologies.in/Shopnow/Shopnow_api/update_profile")
        var urlreq = URLRequest(url: urlstr!)
        urlreq.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "content_type")
        urlreq.httpMethod = "post"
        
        let poststr = "firstname=\(firstnamefield.text!)&lastname=\(lastnamefield.text!)&email=\(emailfield.text!)&mobile=\(mobilefield.text!)"
        //&id=\(UserDefaults.standard.object(forKey: "userid"))"
        
        print("poststr__>>", poststr)
            
        urlreq.httpBody = poststr.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: urlreq)
            
        {(data, response, error)in
            
            let mydata = data
            do {
                print("mydata__>>", mydata!)
                do {
                    let jsondata = try JSONSerialization.jsonObject(with: mydata!, options: [])
                    print("jsondata__>>", jsondata)
                    
                    
                }
            }
            catch {
                print("error",error.localizedDescription)

            }
            
        }
        task.resume()
        // Do any additional setup after loading the view.
    }
  
    
}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

//}

