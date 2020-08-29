//
//  profileViewController.swift
//  PokeDex
//
//  Created by user163857 on 8/28/20.
//  Copyright © 2020 user179175. All rights reserved.
//

import UIKit
import CoreData

class profileViewController: UIViewController {

    @IBAction func save(_ sender: UIButton) {
    }
    
    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "userDataModel")
        container.loadPersistentStores {
            (desc, error) in
            if let error = error{
                print("Error (\(error))")
            }
        }
        return container
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
