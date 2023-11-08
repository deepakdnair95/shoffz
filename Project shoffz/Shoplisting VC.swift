//
//  Shoplisting VC.swift
//  Project shoffz
//
//  Created by iroid on 7/21/1402 AP.
//  Copyright © 1402 iroid. All rights reserved.
//

import UIKit

class Shoplisting_VC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return jsondata.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let vcell = collectionView.dequeueReusableCell(withReuseIdentifier: "asdf", for: indexPath) as! Shoplisting_CollectionViewCell
        
        return vcell
    }
    

    @IBOutlet weak var shoplistcollview: UICollectionView!
       let jsondata = NSArray()
       let dict = NSDictionary()
       
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        let urlstr = URL(string: "http://iroidtechnologies.in/Shopnow/Shopnow_api/product_available_shops")
        var urlreq = URLRequest(url: urlstr!)
        urlreq.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "content_type")
        urlreq.httpMethod = "Post"
        
        let poststr = "product_id=\(shopname.text)"
            print("poststr__>>",poststr)
        urlreq.httpBody = poststr.data(using: .utf8)
            
            
         
            
            

              
        { (data,response,error)in
            
            if let mydata = data {
                do {
                    print("mydata__>>", mydata)
                    do {
                        let jsondata = try JSONSerialization.jsonObject(with: mydata, options: [])as! NSArray
                        DispatchQueue.main.async {
                            self.shoplistcollview.reloadData()
                        }
                        
                    }
                    
                }
                catch {
                    print("error", error.localizedDescription)
                }
            }
        }
        task.resume()
        
        
        
        
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

}
