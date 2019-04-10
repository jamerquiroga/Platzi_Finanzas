//
//  OnBoardingStepsViewController.swift
//  PlatziFinanzas
//
//  Created by everis on 4/04/19.
//  Copyright © 2019 Jamer Quiroga. All rights reserved.
//

import UIKit

class OnBoardingStepsViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var onBoardingImage: UIImageView!
    
    var item : OnBoardingItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = item?.title
        descriptionLabel.text = item?.description
        onBoardingImage.image = UIImage(named: item?.imageName ?? "")
        
    }

}
