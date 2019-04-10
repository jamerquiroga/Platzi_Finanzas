//
//  OnboardingContainerViewController.swift
//  PlatziFinanzas
//
//  Created by everis on 3/04/19.
//  Copyright © 2019 Jamer Quiroga. All rights reserved.
//

import UIKit

class OnboardingContainerViewController: UIViewController {
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard segue.identifier == "openOnboarding",
            let destination = segue.destination as? OnBoardingViewController else {
            return
        }
        
        destination.pageControl = pageControl
    }

}
