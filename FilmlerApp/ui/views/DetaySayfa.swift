//
//  DetaySayfa.swift
//  FilmlerApp
//
//  Created by Ceren Acay on 30.08.2024.
//

import UIKit

class DetaySayfa: UIViewController {
    
    
    @IBOutlet weak var ImageViewDjango: UIImageView!
    @IBOutlet weak var lblDjango: UILabel!
    @IBOutlet weak var lblfiyat: UILabel!
    
    var film: Filmler?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let f = film {
            lblDjango.text = f.ad
            ImageViewDjango.image = UIImage(named: f.resim!)
            lblfiyat.text = "\(f.fiyat!) ₺"
        }
    
    }
    
    
}
