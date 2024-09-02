//
//  DetaySayfa.swift
//  UrunlerApp
//
//  Created by Ceren Acay on 29.08.2024.
//

import UIKit

class DetaySayfa: UIViewController {

    @IBOutlet weak var imageViewUrun: UIImageView!
    
    @IBOutlet weak var lblFiyat: UILabel!
    
    var urun:Urunler?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let u = urun
        {
            self.navigationItem.title = u.ad
            imageViewUrun.image = UIImage(named: u.resim!)
            lblFiyat.text = "\(u.fiyat!) ₺"
        }
        
        
    }

    @IBAction func btnSepeteEkle(_ sender: Any) {
        
        if let u = urun
        {
            print("Detay Sayfa : \(u.ad!) sepete eklendi")
        }
    }
}
