//
//  ViewController.swift
//  WidgetKullanimi
//
//  Created by Ceren Acay on 26.08.2024.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    @IBOutlet weak var labelSonuc: UILabel!
    
    @IBOutlet weak var SwitchGoster: UISwitch!
    
    @IBOutlet weak var textFieldGirdi: UITextField!
    

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }
    

    @IBAction func butonYap(_ sender: Any) {
        
        if let alinanVeri = textFieldGirdi.text
        {
            labelSonuc.text = alinanVeri
        }
    }
    
    @IBAction func btnMutlu(_ sender: Any) {
        
        imageView.image = UIImage(named: "mutlu")
    }
    
    
    @IBAction func btnUzgun(_ sender: Any) {
        
        imageView.image = UIImage(named: "üzgün")
    }
    
    
    @IBAction func btnGoster(_ sender: Any) {
        
        // print("Switch Durum : \(SwitchGoster.isOn)")
        
        let secilenIndex = segmentControl.selectedSegmentIndex
        
        let secilenKategori = segmentControl.titleForSegment(at: (secilenIndex))
        
        print("Segmented Durum : \(secilenKategori!)") // Optional olmaması için unwrap ettik.
    }
    
    @IBAction func segmentAction(_ sender: UISegmentedControl) {
        
        let secilenIndex = sender.selectedSegmentIndex
        
        let secilenKategori = sender.titleForSegment(at: (secilenIndex))
        
        print("Seçim : \(secilenKategori!)") // Optional olmaması için unwrap ettik.
        
        
    }
    
    @IBAction func switchDegisim(_ sender: UISwitch) {
        
        if sender.isOn
        {
            
            print("Switch : ON")
        }
        else
        {
            
            
            print("Switch : OFF")
        }
        
        
    }
}

