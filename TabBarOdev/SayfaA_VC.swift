//
//  SayfaA_VC.swift
//  TabBarOdev
//
//  Created by Ceren Acay on 25.08.2024.
//

import UIKit

class SayfaA_VC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    @IBAction func btnGitB(_ sender: Any) {
        
        performSegue(withIdentifier: "BSayfasinaGit", sender: nil)
    }
    

}
