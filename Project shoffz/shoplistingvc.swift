//
//  shoplistingvc.swift
//  Project shoffzTests
//
//  Created by iroid on 7/24/1402 AP.
//  Copyright © 1402 iroid. All rights reserved.
//

import UIKit

class shoplistingvc: UIViewController, UICollectionViewDataSource,UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("111111111")
                let storyb = UIStoryboard(name: "Main", bundle: nil)
                let new = storyb.instantiateViewController(identifier: "hjkl")as! singleshop_vc
                self.navigationController?.pushViewController(new, animated: true)
                new.str2 = self.dict["id"] as! String
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return jsondata.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        self.dict = self.jsondata[indexPath.row]as! NSDictionary
        
        let icell = collectionView.dequeueReusableCell(withReuseIdentifier: "asdf", for: indexPath) as! Shoplisting_CollectionViewCell
        icell.shopname.text = self.dict["shopname"]as? String
        icell.shopdistance.text = self.dict["distance"]as? String
        icell.shopaddress.text = self.dict["address"]as? String
        
        let imgurl = self.dict["image"] as? String
        let urlimg = URL(string: imgurl!)
        let dataimg = try? Data(contentsOf: urlimg!)
        icell.pdtimg.image = UIImage(data: dataimg!)
        
        return icell
    }
   
    //    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let storyb = UIStoryboard(name: "Main", bundle: nil)
//        let new = storyb.instantiateViewController(identifier: "hjkl")as! singleshop_vc
//        new.navigationController?.pushViewController(new, animated: true)
//        new.str2 = self.dict["id"] as! String
//    }
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
       }
    @IBOutlet weak var shoplistcv: UICollectionView!
    var jsondata = NSArray()
    var dict = NSDictionary()
    var id = " "
    var str = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        id = str
        
        let urlstr = URL(string: "http://iroidtechnologies.in/Shopnow/Shopnow_api/product_available_shops")
        var urlreq = URLRequest(url: urlstr!)
        urlreq.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "content_type")
        urlreq.httpMethod = "post"
        
        let poststr = "product_id=\(id)"
        print("poststr__>>", poststr)
        urlreq.httpBody = poststr.data(using: .utf8)
        
        let task = URLSession.shared.dataTask(with: urlreq)
        { (data, response, error)in
            
            let mydata = data
            do {
                print("mydata", mydata!)
                do {
                    self.jsondata = try JSONSerialization.jsonObject(with: mydata!, options: []) as! NSArray
                    print("jsondata__>>", self.jsondata)
                    
                    DispatchQueue.main.async {
                        self.shoplistcv.reloadData()
                        
                    }
                }
            }
            catch {
                print("error", error.localizedDescription)
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
