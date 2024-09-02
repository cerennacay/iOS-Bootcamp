//
//  ViewController.swift
//  TasarimCalismasi
//
//  Created by Ceren Acay on 22.08.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Pizza"
        
        let appearence = UINavigationBarAppearance()
        
        appearence.backgroundColor = UIColor(named: "anaRenk")
        
        appearence.titleTextAttributes = [ .foregroundColor:UIColor(named: "yaziRenk1")! , .font:UIFont(name: "Pacifico-Regular", size: 22) ]
        
        navigationController?.navigationBar.barStyle = .black
        
        navigationController?.navigationBar.standardAppearance = appearence
        navigationController?.navigationBar.compactAppearance = appearence
        navigationController?.navigationBar.scrollEdgeAppearance = appearence

        
            
    }


}

