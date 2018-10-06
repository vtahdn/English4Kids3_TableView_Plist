//
//  SubDetailViewController.swift
//  English4Kids3
//
//  Created by macbook on 9/28/18.
//  Copyright © 2018 Viet. All rights reserved.
//

import UIKit

class SubDetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var imageName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: imageName)
    }

}
