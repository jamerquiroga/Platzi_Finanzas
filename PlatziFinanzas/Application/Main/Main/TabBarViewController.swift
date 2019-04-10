//
//  TabBarViewController.swift
//  PlatziFinanzas
//
//  Created by everis on 9/04/19.
//  Copyright © 2019 Jamer Quiroga. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        customButtom()
    }
    
    func customButtom(){
        let menuButtom = UIButton(frame: CGRect(x: 0, y: 0, width: 32, height: 32))

        //modificamos el frame
        var menuButtomFrame = menuButtom.frame
        
        //dividimos la pantalla a la mitad, colocar una linea y nuestro botón empieza en 0 lo corremos hacia el centro
        
        menuButtomFrame.origin.y = tabBar.frame.origin.y - 32
        menuButtomFrame.origin.x = view.bounds.width / 2 - menuButtomFrame.size.width / 2
        menuButtom.frame = menuButtomFrame
        menuButtom.setImage(UIImage(named: "TabBarAdd"), for: .normal) //el mismo icono para cualquier estado del app
        
        menuButtom.backgroundColor = UIColor(named: "GreenColor")
        menuButtom.layer.cornerRadius = 8
        view.addSubview(menuButtom)
        
        //creamos un evento cuando el boton sea precionado
        menuButtom.addTarget(self, action: #selector(menuButtonAction(sender: )), for: .touchUpInside)
        
    }
    
    @objc private func menuButtonAction(sender : UIButton){
        selectedIndex = 2
    }

}
