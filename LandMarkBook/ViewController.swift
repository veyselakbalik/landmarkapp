//
//  ViewController.swift
//  LandMarkBook
//
//  Created by Veysel Akbalık on 20.12.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate , UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var landmarkNames = [String]()
    var landmarkImages = [UIImage]()
    
    var chosenLandmarkName = ""
    var chosenLandmarkImage = UIImage()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        landmarkNames.append("Tokyo")
        landmarkNames.append("Nevada")
        landmarkNames.append("Sofia")
        landmarkNames.append("Mardin")
        landmarkNames.append("Rio")
        
        
        landmarkImages.append(UIImage(named: "tokyo")!)
        landmarkImages.append(UIImage(named: "nevada")!)
        landmarkImages.append(UIImage(named: "sofia")!)
        landmarkImages.append(UIImage(named: "mardin")!)
        landmarkImages.append(UIImage(named: "rio")!)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
//        cell.textLabel?.text = "veyc"
        var content = cell.defaultContentConfiguration()
        content.text = landmarkNames[indexPath.row]
        
        cell.contentConfiguration = content
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        chosenLandmarkName = landmarkNames[indexPath.row]
        chosenLandmarkImage = landmarkImages[indexPath.row]
        
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsVC
            destinationVC.selectedLandmarkImage = chosenLandmarkImage
            destinationVC.selectedLandmarkText = chosenLandmarkName
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.landmarkNames.remove(at: indexPath.row)
            self.landmarkImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
    }

}

