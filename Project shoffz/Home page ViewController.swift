//
//  Home page ViewController.swift
//  Created by iroid on 7/4/1402 AP.
//

import UIKit

class Home_page_ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource
{
  
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return jsondata.count
    }
   
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        self.dict = self.jsondata[indexPath.row]as! NSDictionary

        let tcell = collectionView.dequeueReusableCell(withReuseIdentifier: "qwerty", for: indexPath) as! HomeCollectionViewCell
   
         tcell.pdtname.text  = self.dict["product_name"] as? String
         tcell.pdtprice.text = self.dict["price"] as? String
        
         let imgurl = self.dict["image"] as? String
         let urlimg = URL(string: imgurl!)
         let dataimg = try?Data(contentsOf: urlimg!)
         tcell.homepgimg.image = UIImage(data: dataimg!)
      
        return tcell
        
    }
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            
            self.dict = self.jsondata[indexPath.row]as! NSDictionary
            
            let storyb = UIStoryboard(name: "Main", bundle: nil)
            let new = storyb.instantiateViewController(identifier: "uiop")as! shoplistingvc
            self.navigationController?.pushViewController(new, animated: true)
            
            new.str = self.dict["id"] as! String
            
    }
    
    @IBOutlet weak var collectionv: UICollectionView!
    var jsondata = NSArray()
    var dict  = NSDictionary()
    
    @IBOutlet weak var sideview: UIView!
    
    @IBAction func hamburger(_ sender: Any) {
     
    if
        sideview.isHidden == false{
        sideview.isHidden = true
    }else{
        sideview.isHidden = false
        }
        
        
        
    }
    @IBAction func sideviewpro(_ sender: Any) {
        
        if (sender as AnyObject).tag==1 {
            let storyb  = UIStoryboard(name: "Main", bundle: nil)
            let new = storyb.instantiateViewController(identifier: "prof") as! profile_viewcontroller
            self.navigationController?.pushViewController(new, animated: true)
        }
        else if (sender as AnyObject).tag == 2 {
            let storyb  = UIStoryboard(name: "Main", bundle: nil)
            let new = storyb.instantiateViewController(identifier: "reviewbook") as! reviewbookViewController
            self.navigationController?.pushViewController(new, animated: true)
            
        }
        else if (sender as AnyObject).tag == 3 {
            let storyb = UIStoryboard(name: "Main", bundle: nil)
            let new  = storyb.instantiateViewController(identifier: "samplevc") as! sampleViewController
            self.navigationController?.pushViewController(new, animated: true)
            
        }
    }
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        sideview.isHidden = true
        self.sideview.backgroundColor = UIColor(patternImage: UIImage(named: "bg1")!)
        
        let urlstr = URL(string: "http://iroidtechnologies.in/Shopnow/Shopnow_api/view_all_products")
        let urlreq = URLRequest(url: urlstr!)
        let task = URLSession.shared.dataTask(with: urlreq)
        
        { (data, response,error)in
            
            if let mydata = data {
                print("mydata__>>", mydata)
                do {
                    self.jsondata = try JSONSerialization.jsonObject(with: mydata, options: [])as! NSArray
                    print("jsondata", self.jsondata)
                    
                    DispatchQueue.main.async {
                        self.collectionv.reloadData()
                    }
                }
                catch {
                    print("error", error.localizedDescription)
                }
            }
        }
        task.resume()
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

}
