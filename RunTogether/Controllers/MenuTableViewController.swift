//
//  MenuTableViewController.swift
//  RunTogether
//
//  Created by Ian Hall on 8/5/19.
//  Copyright © 2019 Ian Hall. All rights reserved.
//

import UIKit

struct MenuProperties{
    var menuTitle: String
    var backgroundImage: UIImage
}

let menu = [MenuProperties(menuTitle: "Go For A Run", backgroundImage: <#T##UIImage#>), MenuProperties(menuTitle: "Mychallenges", backgroundImage: <#T##UIImage#>), MenuProperties(menuTitle: "LeaderBoard", backgroundImage: <#T##UIImage#>), MenuProperties(menuTitle: <#T##String#>, backgroundImage: <#T##UIImage#>)]

class MenuTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
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
