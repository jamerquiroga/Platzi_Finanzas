//
//  BudgetViewController.swift
//  PlatziFinanzas
//
//  Created by everis on 9/04/19.
//  Copyright © 2019 Jamer Quiroga. All rights reserved.
//

import UIKit

class BudgetViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var animationButtons : [UIButton]!
    @IBOutlet weak var animationLayout: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let cell = UINib(nibName: "TransactionsCell", bundle: Bundle.main)
        tableView.register(cell, forCellReuseIdentifier: "celdita")

    }
    
    @IBAction func animateHeader(sender: UIButton){
        
        animationLayout.constant = sender.frame.origin.x
        UIView.animate(withDuration: 0.5, animations: {
            self.view.layoutIfNeeded()
        }) { (complete) in
            //este clousure es invocado cuando nuestra animacion es terminada
            self.animationButtons.forEach{
                $0.setTitleColor(UIColor(named: "TextColor"), for: .normal)
                sender.setTitleColor(UIColor.white, for: .normal)
            }
        }
    }

}

extension BudgetViewController: UITableViewDelegate {
    
    
}

extension BudgetViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "celdita", for: indexPath)
    }
    
    
}
