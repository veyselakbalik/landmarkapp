//
//  DetailsVC.swift
//  LandMarkBook
//
//  Created by Veysel Akbalık on 21.12.2022.
//

import UIKit

class DetailsVC: UIViewController {
    @IBOutlet weak var landmarkLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    var selectedLandmarkText = ""
    var selectedLandmarkImage = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()

        landmarkLabel.text = selectedLandmarkText
        imageView.image = selectedLandmarkImage
    }
    

    

}
