//
//  ViewController.swift
//  TabBarKullanimi
//
//  Created by Ceren Acay on 25.08.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let tabItems = tabBarController?.tabBar.items
        {
            let AnasayfaItem = tabItems[0]
            let AyarlarItem = tabItems[1]
            AnasayfaItem.badgeValue = "3"
            AyarlarItem.badgeValue = "Yeni"
        }
        
        let appearence = UITabBarAppearance()
        appearence.backgroundColor = UIColor.systemIndigo
        
        renkDegistir(itemAppearence: appearence.stackedLayoutAppearance)
        renkDegistir(itemAppearence: appearence.inlineLayoutAppearance)
        renkDegistir(itemAppearence: appearence.compactInlineLayoutAppearance)
        
        tabBarController?.tabBar.standardAppearance = appearence
        tabBarController?.tabBar.scrollEdgeAppearance = appearence
        
    }
    
    func renkDegistir(itemAppearence : UITabBarItemAppearance)
    {
        // Seçili Durum
        
        itemAppearence.selected.iconColor = UIColor.systemOrange
        itemAppearence.selected.titleTextAttributes = [ .foregroundColor: UIColor.systemOrange]
        itemAppearence.selected.badgeBackgroundColor = UIColor.systemMint
        
        // Seçili Olmayan Durum
        
        itemAppearence.normal.iconColor = UIColor.white
        itemAppearence.normal.titleTextAttributes = [ .foregroundColor: UIColor.white]
        itemAppearence.normal.badgeBackgroundColor = UIColor.lightGray
    }


}

