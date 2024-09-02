//
//  ViewController.swift
//  TabBarOdev
//
//  Created by Ceren Acay on 25.08.2024.
//

import UIKit

class AnasayfaVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func btnGit_A(_ sender: Any) {
        
        performSegue(withIdentifier: "ASayfasinaGecis", sender: nil )
    }
    
    
    @IBAction func btnXSayfasinaGit(_ sender: Any) {
        
        performSegue(withIdentifier: "XSayfasinaGecis", sender: nil )
    }
}


