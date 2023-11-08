//
//  ViewController.swift
//  Project shoffz
//
//  Created by iroid on 6/27/1402 AP.
//  Copyright © 1402 iroid. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class ViewController: UIViewController {
    
    
    @IBOutlet weak var firstnamefield: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var lastnamefield: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var emailfield: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var mobilefield: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var passwordfield: SkyFloatingLabelTextFieldWithIcon!
    
    @IBOutlet weak var signinref: UIButton!
    @IBOutlet weak var facebookref: UIButton!
    @IBOutlet weak var googleref: UIButton!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var malebtn: UIButton!
    @IBOutlet weak var femalebtn: UIButton!
    @IBOutlet weak var otherbtn: UIButton!
    var selectedButton = UIButton()
    var iconclick = true
    var gvalue = ""
    
    @IBAction func hidepasswo(_ sender: Any) {
        
        if iconclick {
            passwordfield.isSecureTextEntry = false
        }
        else {
            passwordfield.isSecureTextEntry = true
        }
        iconclick = !iconclick
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg1")!)
        
        facebookref.layer.cornerRadius = 1
        facebookref.layer.borderColor = UIColor.orange.cgColor
        facebookref.layer.borderWidth = 1
        
        googleref.layer.cornerRadius = 1
        googleref.layer.borderWidth = 1
        googleref.layer.borderColor = UIColor.orange.cgColor
        
        signinref.layer.cornerRadius = 1
        signinref.layer.borderColor = UIColor.orange.cgColor
        signinref.layer.borderWidth = 1
    }
    
    @IBAction func signupbtn(_ sender: Any) {
        
        let urlstr = URL(string: "http://iroidtechnologies.in/Shopnow/Shopnow_api/signup")!
        var urlreq = URLRequest(url: urlstr)
        urlreq.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "content_type")
        urlreq.httpMethod = "post"
        
        let poststr = "firstname=\(firstnamefield.text!)&lastname=\(lastnamefield!)&email=\(emailfield.text!)&mobile=\(mobilefield!)&password=\(passwordfield!)&gender=\(gvalue)"
        
        print("poststr__>>",poststr)
           
        
        urlreq.httpBody = poststr.data(using: .utf8)
        
        let task = URLSession.shared.dataTask(with: urlreq)
        
        {(data, response,error)in
                   
                   let mydata = data
                  do {
                  print("mydata",mydata!)
                  do {
                      let jsondata:NSDictionary = try JSONSerialization.jsonObject(with: mydata!, options: [])as! NSDictionary
                      print("jsondata__>>",jsondata)
                    
                    DispatchQueue.main.async {
                         UserDefaults.standard.set(jsondata["id"], forKey: "userid")
                        let storyb = UIStoryboard(name: "Main", bundle: nil)
                        let new = storyb.instantiateViewController(identifier: "signin") as! signin_page
                        self.navigationController?.pushViewController(new, animated: true)
                        
                        
                    }
            
            
                }
                catch {
                    print("error",error.localizedDescription)
                }
            }
            
        }
                
            task.resume()
    }
    
    
    @IBAction func clickedmale(_ sender: UIButton) {
        
        if sender.tag==1{
            otherbtn.backgroundColor=UIColor.clear
            malebtn.backgroundColor=UIColor.orange
            femalebtn.backgroundColor=UIColor.clear
            gvalue="male"
        }
        else if sender.tag == 2{
        
            gvalue="female"
           
            otherbtn.backgroundColor=UIColor.clear
            femalebtn.backgroundColor=UIColor.orange
            malebtn.backgroundColor=UIColor.clear
        }
        else{
             gvalue="others"
            otherbtn.backgroundColor=UIColor.orange
            femalebtn.backgroundColor=UIColor.clear
            malebtn.backgroundColor=UIColor.clear
            }
        }
    
    @IBAction func signinbtn(_ sender: Any) {
        
        let storyb = UIStoryboard(name: "Main", bundle: nil)
        let new = storyb.instantiateViewController(identifier: "signin")as! signin_page
        self.navigationController?.pushViewController(new, animated: true)
        
    }
}

       
        

  



