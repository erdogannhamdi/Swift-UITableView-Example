//
//  UrunListesiTableViewController.swift
//  TableViewController
//
//  Created by Apple on 25.06.2020.
//  Copyright © 2020 erdogan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class UrunListesiTableViewController: UITableViewController {

    var urunlistesi: [Urun] = []
    var images: [String] = ["41", "34", "61"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AF.request("http://.../GetirSehir/",method: .get).responseJSON{ (response) in
            switch response.result{
                case .success(let value):
                    let json = JSON(value)
                    var i = 0
                    for data in json.arrayValue{
                        let sehir = Urun()
                        sehir.Id = data["Id"].intValue
                        sehir.SehirId = data["SehirId"].intValue
                        sehir.resim = UIImage(named: self.images[i])
                        sehir.urunSwitch = false
                        self.urunlistesi.append(sehir)
                        i = i + 1
                        
                    }
                    self.tableView.reloadData()
                case .failure(let error):
                    print(error)
                }
        }
        
        self.tableView.tableFooterView = UIView() //boş celler gözükmez
        
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return urunlistesi.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UrunCell", for: indexPath) as! UrunTableViewCell

        let indis = indexPath.row // indis verir
        //let sectionIndis = indexPath.section
        // Configure the cell...
        
        cell.Id.text = String(urunlistesi[indis].Id)
        cell.sehirId.text = String(urunlistesi[indis].SehirId)
        cell.imgResim.image = urunlistesi[indis].resim
        cell.urunSwitch.setOn(urunlistesi[indis].urunSwitch, animated: true)

        return cell
    }
    
}
