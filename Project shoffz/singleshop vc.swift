//
//  singleshop vc.swift
//  Project shoffz
//
//  Created by iroid on 7/25/1402 AP.
//  Copyright © 1402 iroid. All rights reserved.
//

import UIKit
import MapKit

class singleshop_vc: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let tcell =    tableView.dequeueReusableCell(withIdentifier: "shop") as! shopTableViewCell
        
       

       
        
        return tcell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
   
    
    @IBOutlet weak var shopname: UILabel!
    @IBOutlet weak var shopaddress: UILabel!
    @IBOutlet weak var shopdistance: UIButton!
    @IBOutlet weak var shoprating: UIButton!
    @IBOutlet weak var shopimage: UIImageView!
   
    @IBOutlet weak var mapvieww: MKMapView!
    
    @IBOutlet weak var tblview: UITableView!
    
    var jsondata = NSArray()
    var dict = NSDictionary()
    var str2 = String()
  
    @IBAction func reviewbtn(_ sender: Any) {
        let storyb = UIStoryboard(name: "Main", bundle: nil)
        let new = storyb.instantiateViewController(identifier: "review")as! reviewViewController
        self.navigationController?.pushViewController(new, animated: true)
        
        
    }
    @IBAction func back(_ sender: Any) {
    navigationController?.popViewController(animated: true)
        
    }
    @IBAction func viewdeals(_ sender: Any) {
        let storyb = UIStoryboard(name: "Main", bundle: nil)
        let newpage = storyb.instantiateViewController(identifier: "pizzahut")as! pizzahutViewController
        self.navigationController?.pushViewController(newpage, animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let urlstr = URL(string:"http://iroidtechnologies.in/Shopnow/Shopnow_api/shops/\(str2)")
        print(urlstr)
        let urlreq = URLRequest(url: urlstr!)
        
        let task = URLSession.shared.dataTask(with: urlreq)
        
        { (data, response, error)in
            
            if let mydata = data
            {
                print("mydata", mydata)
            do {
                self.jsondata = try JSONSerialization.jsonObject(with: mydata, options: [])as! NSArray
                print("jsondata",self.jsondata)
                self.dict = self.jsondata[0] as! NSDictionary
                DispatchQueue.main.async {
                    
                    self.tblview.reloadData()
                    self.shopname.text = self.dict["shopname"] as? String
                    self.shopaddress.text = self.dict["address"] as? String
          
                    let imgurl = self.dict["image"] as? String
                    let urlmg = URL(string: imgurl!)
                    let dataimg = try? Data(contentsOf: urlmg!)
                    self.shopimage.image = UIImage(data: dataimg!)
//
                    
                }
            }
            catch {
                print("error", error.localizedDescription)
                }
            }
            
        }
        task.resume()
        
        
        mapvieww.mapType = MKMapType.standard
        let locationn = CLLocationCoordinate2D(latitude: 10.0014, longitude: 76.3101)
        let spann = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        let regionn = MKCoordinateRegion(center: locationn, span: spann)
        mapvieww.setRegion(regionn, animated: true)
        let annotationn = MKPointAnnotation()
        annotationn.coordinate = locationn
        annotationn.title = "palarivattom"
        annotationn.subtitle = "Ernakulam"
        mapvieww.addAnnotation(annotationn)
        
        
        
        
        


        

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
