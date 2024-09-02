//
//  SayfaB_VC.swift
//  TabBarOdev
//
//  Created by Ceren Acay on 25.08.2024.
//

import UIKit

class SayfaB_VC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    @IBAction func btnGit_Y(_ sender: Any) {
    
        performSegue(withIdentifier: "YSayfasina_Git", sender: nil )
    }
    
}
