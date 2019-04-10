//
//  OnBoardingViewController.swift
//  PlatziFinanzas
//
//  Created by everis on 3/04/19.
//  Copyright © 2019 Jamer Quiroga. All rights reserved.
//

import UIKit

struct OnBoardingItem {
    let title: String
    let description: String
    let imageName: String
}

class OnBoardingViewController: UIPageViewController {
    
    var pageControl: UIPageControl?
    
    fileprivate(set) lazy var items : [OnBoardingItem] = {
        return [
            OnBoardingItem(
                title: "Save money and reduce debt",
                description: "Press the start button",
                imageName: "OnBoarding1"),
            OnBoardingItem(
                title: "You've finished your onboarding",
                description: "Press the start button",
                imageName: "OnBoarding2"),
            OnBoardingItem(
                title: "Text for test new page",
                description: "Press the start button",
                imageName: "OnBoarding1")
        ]
    }()

    fileprivate(set) lazy var contentViewController: [UIViewController] = {
        
        //inicializamos una lista vacia de ViewController
        var items = [UIViewController]()
        
        for i in 0 ..< self.items.count{
            items.append(self.instateViewController(i))
        }
        return items
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
        dataSource = self
        
        pageControl?.numberOfPages = items.count
        updateContainerView(stepNumber: 0)
        
    }
    
    func instateViewController(_ index: Int) -> UIViewController{
        
        //as? -> crear una variable de ese tipo
        
        guard let viewController = UIStoryboard(name: "OnBoarding", bundle: Bundle.main).instantiateViewController(withIdentifier: "OnBoardingSteps") as? OnBoardingStepsViewController else {
            return UIViewController()
        }
        
        viewController.item = items[index]
        return viewController
    }
    
    //funcion para actualizar el pointer del pageControl
    func updateContainerView(stepNumber index: Int) {
        setViewControllers([contentViewController[index]], direction: .forward, animated: true, completion: nil)
    }

}

extension OnBoardingViewController: UIPageViewControllerDataSource{
    
    //pagina anterior
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        //preguntamos por el indice actual del viewController cuando retrocedemos
        let index = contentViewController.index(of : viewController)
        
        print("item before is \(index!)")
        
        //si el index es 0, no hay nadie anrtes de el
        if index == 0 {
            return nil
        }
        
        print("return before \(index! - 1)")
        
        return contentViewController[index! - 1]
    }
    
    
    //pagina siguiente
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        //preguntamos por el indice actual del viewController cuando avanzamos
        let index = contentViewController.index(of : viewController)
        
        print("item after is \(index!)")
        
        //si el index es el ultimo, no hay nadie despues de el
        if index == contentViewController.count - 1 {
            return nil
        }
        
        return contentViewController[index! + 1]
        
    }
    
}

//avisar al pagerControler para que se actualize con una nueva vista
extension OnBoardingViewController: UIPageViewControllerDelegate{
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        //optiene el index de la nueva pagina
        guard let index = contentViewController.index(of: viewControllers!.first!) else {
            return
        }
        
        print("update index \(index)")
        
        pageControl?.currentPage = index
        
    }
    
}


