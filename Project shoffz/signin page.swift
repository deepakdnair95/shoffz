//
//  signin page.swift
//  
//
//  Created by iroid on 7/4/1402 AP.
//

import UIKit
import SkyFloatingLabelTextField
class signin_page: UIViewController {

    @IBOutlet weak var forgotpass: UIButton!
    @IBOutlet weak var loginpagesignup: UIButton!
    @IBOutlet weak var logingoogle: UIButton!
    @IBOutlet weak var loginfacebook: UIButton!
    @IBOutlet weak var loginemail: SkyFloatingLabelTextField!
    @IBOutlet weak var loginpassword: SkyFloatingLabelTextField!
    
    var jsondata = NSArray()
    var iconClick = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg2")!)
        loginpagesignup.layer.cornerRadius = 1
        loginpagesignup.layer.borderColor = UIColor.orange.cgColor
        loginpagesignup.layer.borderWidth = 1
        
        loginfacebook.layer.cornerRadius = 1
        loginfacebook.layer.borderWidth = 2
        loginfacebook.layer.borderColor = UIColor.orange.cgColor
        
        logingoogle.layer.borderWidth = 2
        logingoogle.layer.cornerRadius = 1
        logingoogle.layer.borderColor = UIColor.orange.cgColor
        
        // Do any additional setup after loading the view.
    }
    @IBAction func iconaction(_ sender: Any) {
        if iconClick {
            loginpassword.isSecureTextEntry = false
        } else {
            loginpassword.isSecureTextEntry = true
        }
        iconClick = !iconClick
    }
    
    @IBAction func loginsigin(_ sender: Any) {
        if loginemail.text=="" || loginpassword.text==""{
            
            let alertobj = UIAlertController(title: "Alert", message: "Username or password is Void", preferredStyle: .alert)
                 
                   alertobj.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                   
                   self.present(alertobj,animated: true,completion: nil)
            
        }else{
            
        
        
        let urlstr = URL(string: "http://iroidtechnologies.in/Shopnow/Shopnow_api/login")
        var  urlreq = URLRequest(url: urlstr!)
        urlreq.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "content_type")
        urlreq.httpMethod = "Post"
        
        let poststr = "email=\(loginemail.text!)&password=\(loginpassword.text!)"
        print("poststr__>>",poststr)
            
            // password:1234
            
        urlreq.httpBody = poststr.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: urlreq)
        
        { (data, respose, error)in
            let mydata = data
            do {
                print("mydata__>>",mydata!)
                do {
                    
                    let jsondata: NSDictionary = try JSONSerialization.jsonObject(with: mydata!, options: []) as!NSDictionary
                    print("jsondata__>>",jsondata)
                    
                    DispatchQueue.main.async {

                        UserDefaults.standard.set(jsondata["id"], forKey: "userid")
                        let storyb = UIStoryboard(name: "Main", bundle: nil)
                             let new = storyb.instantiateViewController(identifier: "tabbar")as! tabbar_controller
                             self.navigationController?.pushViewController(new, animated: true)
                    }
                }
            }
            catch {
                print("error",error.localizedDescription)
            }
            
        }
        task.resume()
        
        }
        
    }
    @IBAction func loginsignup(_ sender: Any) {
               
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func forgotpassword(_ sender: Any) {
        let storyb = UIStoryboard(name: "Main", bundle: nil)
        let new = storyb.instantiateViewController(identifier: "changepassword")as! forgotpassword_page
        self.navigationController?.pushViewController(new, animated: true)
        
        
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
