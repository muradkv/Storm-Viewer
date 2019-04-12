//
//  ViewController.swift
//  Storm Viewer
//
//  Created by murad on 12/04/2019.
//  Copyright © 2019 murad. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var arrayOfImages = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath
        let items = try! fm.contentsOfDirectory(atPath: path!)
        
        for item in items {
            if item.hasPrefix("nssl") {
                arrayOfImages.append(item)
            }
        }
        
        print(arrayOfImages)
    }


}

