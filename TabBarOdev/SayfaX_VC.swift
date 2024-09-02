//
//  SayfaX_VC.swift
//  TabBarOdev
//
//  Created by Ceren Acay on 25.08.2024.
//

import UIKit

class SayfaX_VC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    @IBAction func btnGitY(_ sender: Any) {
        
        performSegue(withIdentifier: "YSayfasinaGit", sender: nil)
    }
    
}
