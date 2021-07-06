//
//  HeroesTableViewController.swift
//  Busca Herois
//
//  Created by Bruno Ornelas on 17/06/21.
//

import UIKit

class HeroesTableViewController: UITableViewController {
    
    
    private var name: String = ""
    
    private var heroes: [Hero] = []
    private var loadingHeroes = false
    private var currentPage = 0
    private var total = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadHeroes()

    }
    
    func setName(name: String) {
        self.name = name
    }
    
   
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    private func loadHeroes() {
        loadingHeroes = true
        MarvelAPI.loadCharacter(by: name, page: currentPage) { (info) in
            
            if let info = info {
                self.heroes += info.data.results
                self.total = info.data.total
                
                DispatchQueue.main.async { // garantir carrega na main
                    self.loadingHeroes = false
                    self.tableView.reloadData()
                }
            }
            else {
                //tratativa de erro
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return heroes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as!
        HeroTableViewCell
        
        
        let hero = heroes[indexPath.row]
        cell .prepareCell(with: hero)
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
