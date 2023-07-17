//
//  noteViewController.swift
//  Note App
//
//  Created by Randima Dilshani on 2023-04-21.
//

import UIKit

class noteViewController: UIViewController {

    @IBOutlet weak var segmentoutlet: UISegmentedControl!
    @IBOutlet weak var pendingnotes: UIView!
    @IBOutlet weak var completednotes: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.bringSubviewToFront(pendingnotes)

    }
    
    @IBAction func segmentaction(_ sender:UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 0 :
            self.view.bringSubviewToFront(pendingnotes)
        case 1:
            self.view.bringSubviewToFront(completednotes)
        default:
            break
        }
    }
    

}
