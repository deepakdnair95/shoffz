//
//  pizzahutViewController.swift
//  Project shoffz
//
//  Created by iroid on 8/4/1402 AP.
//  Copyright © 1402 iroid. All rights reserved.
//

import UIKit

class pizzahutViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tcell = tableView.dequeueReusableCell(withIdentifier: "pizza")as! pizzahutTableViewCell
        return tcell
    }
    
    
    @IBAction func back(_ sender: Any) {
        
       self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func review(_ sender: Any) {
        
        let storyb = UIStoryboard(name: "Main", bundle: nil)
        let new = storyb.instantiateViewController(identifier: "reviewbook")as! reviewbookViewController
        self.navigationController?.pushViewController(new, animated: true)
    }
}
