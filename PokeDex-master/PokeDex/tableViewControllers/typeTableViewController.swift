//
//  typeTableViewController.swift
//  PokeDex
//
//  Created by user163857 on 8/27/20.
//  Copyright © 2020 user179175. All rights reserved.
//

import UIKit

class typeTableViewController: UITableViewController {

    var typeUrl = ""
    var typeNames = [String]()
       
       override func viewDidLoad() {
           super.viewDidLoad()
           
              PokeFetch.fetchBaseUrl("type"){
               (fetchResult) -> Void in
                                   
               switch fetchResult {
               case let .success(entryPoints):
                   for entry in entryPoints {
                       self.typeUrl = entry.url.absoluteString
                       PokeFetch.fetchUrl(self.typeUrl){
                       (getTypeNames) -> Void in
                           switch getTypeNames {
                           case let .success(pokeEntry):
                               for entry2 in pokeEntry {
                                   self.typeNames.append(entry2.name!)
                               }
                           case let .failure(error):
                               print("Error fetching the : \(error)")
                           }
                       }
                   }
               case let .failure(error):
                   print("Error fetching the : \(error)")
               }
           }
       }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        Thread.sleep(forTimeInterval: 0.5)
        return typeNames.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "typeTable", for: indexPath)

        cell.textLabel?.text = typeNames[indexPath.row]
        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
