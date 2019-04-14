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
        
        title = "Storm Viwer"
        
        print(arrayOfImages)
    }

    //MARK: TableView Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfImages.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = arrayOfImages[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = arrayOfImages[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

