//
//  MarsViewController.swift
//  StarBoardDemo
//
//  Created by RayRainier on 3/31/17.
//  Copyright © 2017 RadiuSense. All rights reserved.
//

import UIKit

class MarsViewController: UIViewController {

    weak var delegate: MarsViewProtocolDelegate?
    
    override func viewWillAppear(_ animated: Bool) {
    
    let burger = "Congratulations!\n You have just ordered a Martian Burger!!!"
    
    delegate?.passtheburger(bread: burger)
        
	// lets modify navbar
    let font = UIFont(name: "SFUIDisplay-Thin", size: 32)
    
    self.navigationController?.navigationBar.barTintColor = UIColor(r: 234, g: 199, b: 70)
    self.navigationController?.navigationBar.tintColor = UIColor(r: 234, g: 69, b: 40)
    self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white, NSFontAttributeName: font!]
    
    self.view.backgroundColor = UIColor(r: 234, g: 69, b: 40)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let leftButton =  UIBarButtonItem(image: UIImage(named: "left-arrow copy"), style: .plain, target: self, action: #selector(goBack))
        navigationItem.leftBarButtonItem = leftButton
        navigationItem.title = "Planet-Mars"
                
        print("Welcome to Mars!")
        
    }
    
    func goBack() {
        dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
