//
//  profile viewcontroller.swift
//  Project shoffz
//
//  Created by iroid on 7/25/1402 AP.
//  Copyright © 1402 iroid. All rights reserved.
//

import UIKit

class profile_viewcontroller: UIViewController {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var mobile: UILabel!
    @IBOutlet weak var email: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let idval =  UserDefaults.standard.object(forKey: "userid")
        let urlstr = URL(string: "http://iroidtechnologies.in/Shopnow/Shopnow_api/view_profile")
        var urlreq = URLRequest(url: urlstr!)
        urlreq.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "content_type")
        urlreq.httpMethod = "post"
        
        let poststr = "id=\(idval!)"
        print("poststr__>>", poststr)
        urlreq.httpBody = poststr.data(using: .utf8)
        
        let task = URLSession.shared.dataTask(with: urlreq)
        
        { (data, response, error)in
            
            let mydata = data
            do {
                print("mydata__>>", mydata!)
                do {
                    let jsondata: NSArray = try JSONSerialization.jsonObject(with: mydata!, options: []) as! NSArray
                    print("jsondata__>>", jsondata)
                    let jsondict: NSDictionary = jsondata[0] as! NSDictionary
                    
                    DispatchQueue.main.async {
                        self.name.text =  jsondict["mobile"] as? String
                        self.email.text = jsondict["email"]as? String
                        self.mobile.text = jsondict["mobile"] as? String
                    }
                    
                }
            }
            catch {
                print("error",error.localizedDescription)
            }
            
        }
        task.resume()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func profileeditbtn(_ sender: Any) {
        
        let storyb = UIStoryboard(name: "Main", bundle: nil)
        let new = storyb.instantiateViewController(identifier: "zxcv") as? update_profile_vc
        self.navigationController?.pushViewController(new!, animated: true)
    }
    
    @IBAction func back(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
