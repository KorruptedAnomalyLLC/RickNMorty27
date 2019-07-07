//
//  CharacterListTableViewController.swift
//  RickNM0rtyDusty
//
//  Created by Austin West on 7/7/19.
//  Copyright © 2019 Austin West. All rights reserved.
//

import UIKit

class CharacterListTableViewController: UITableViewController {
    
    // Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        CharacterController.shared.getCharacters {
            print("We got our characters!")
        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return CharacterController.shared.characterList.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "characterCell", for: indexPath) as? CharacterTableViewCell else { return UITableViewCell() }
        let character = CharacterController.shared.characterList[indexPath.row]
        cell.characterNameLabel.text = character.name
        cell.originLabel.text = character.origin.planetName
        cell.statusLabel.text = character.status
        do {
             guard let url = URL(string: character.image) else { return UITableViewCell() }
            let imageData = try Data(contentsOf: url)
            cell.characterPictureImageView.image = UIImage(data: imageData)
            } catch {
                print("There was an error putting an image in our tableView: \(error.localizedDescription)")
        }
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
