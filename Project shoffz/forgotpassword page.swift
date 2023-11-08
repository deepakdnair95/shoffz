//
//  forgotpassword page.swift
//  Project shoffz
//
//  Created by iroid on 7/18/1402 AP.
//  Copyright © 1402 iroid. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class forgotpassword_page: UIViewController {
    
    @IBOutlet weak var currentpassword: SkyFloatingLabelTextField!
    @IBOutlet weak var newpassword: SkyFloatingLabelTextField!
    @IBOutlet weak var confirmpassword: SkyFloatingLabelTextField!
    
    @IBAction func backbtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func submitbtn(_ sender: Any) {
        
        let urlstr = URL(string: "http://iroidtechnologies.in/Shopnow/Shopnow_api/change_password")
        var urlreq = URLRequest(url: urlstr!)
        urlreq.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "content_type")
        urlreq.httpMethod = "post"
        let poststr = "current_password=\(currentpassword.text!)&new_password=\(newpassword.text!)&conform_password=\(confirmpassword.text!)"
        //&id=\(UserDefaults.standard.object(forKey: "userid"))"
        
        print("poststr__>>",poststr)
        urlreq.httpBody = poststr.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: urlreq)
        { (data,response,error)in
            let mydata = data
            do {
                print("mydata__>>",mydata!)
            
            do {
                let jsondata = try JSONSerialization.jsonObject(with: mydata!, options: [])
                print("jsondata__>>", jsondata)
                }
            }
            catch {
                print("error", error.localizedDescription)
            }
        }
        task.resume()
            
            
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
