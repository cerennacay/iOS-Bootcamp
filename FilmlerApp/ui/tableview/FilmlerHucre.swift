//
//  FilmlerHucre.swift
//  FilmlerApp
//
//  Created by Ceren Acay on 30.08.2024.
//

import UIKit

protocol HucreProtocol {
    func sepeteEkleTikla(indexpath:IndexPath)
}

class FilmlerHucre: UICollectionViewCell {
    
    @IBOutlet weak var lblFiyat: UILabel!
    @IBOutlet weak var ImageViewFilmler: UIImageView!

    var hucreProtocol : HucreProtocol?
    var indexPath : IndexPath?
    
    @IBAction func btnSepeteEkle(_ sender: Any) {
        hucreProtocol?.sepeteEkleTikla(indexpath: indexPath!)
    }
    
}
