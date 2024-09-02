//
//  UrunlerHucre.swift
//  UrunlerApp
//
//  Created by Ceren Acay on 29.08.2024.
//

import UIKit

protocol HucreProtocol
{
    func sepeteEkleTiklandi(indexPath: IndexPath)
}

class UrunlerHucre: UITableViewCell {

    @IBOutlet weak var hucreArkaplan: UIView!
    
    @IBOutlet weak var rsmBilgisayar: UIImageView!
    
    @IBOutlet weak var lblFiyat: UILabel!
    
    @IBOutlet weak var lblUrun: UILabel!
    
    var hucreProtocol : HucreProtocol?
    var indexPath : IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func btnSEkle(_ sender: Any) {
        hucreProtocol?.sepeteEkleTiklandi(indexPath: indexPath!)
    }
}
