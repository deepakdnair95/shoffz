//
//  reviewbookViewController.swift
//  Project shoffz
//
//  Created by iroid on 8/5/1402 AP.
//  Copyright © 1402 iroid. All rights reserved.
//

import UIKit

class reviewbookViewController: UIViewController, UIPopoverControllerDelegate {
    
  
    @IBOutlet weak var popupview: UIView!
    
    @IBAction func backk(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func confirmbook(_ sender: Any) {
        
    popupview.layer.cornerRadius = 24

    popupview.isHidden = false
        
    }
    @IBAction func closebtn(_ sender: Any) {
       self.view.removeFromSuperview()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        popupview.isHidden = true
        

            }
        }

        // Do any additional setup after loading the view.
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


