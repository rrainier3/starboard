//
//  ViewController.swift
//  StarBoardDemo
//
//  Created by RayRainier on 3/31/17.
//  Copyright © 2017 RadiuSense. All rights reserved.
//

import UIKit

protocol MarsViewProtocolDelegate: class {
    func passtheburger(bread: String?)
}

class ViewController: UIViewController, MarsViewProtocolDelegate,UIImagePickerControllerDelegate, UINavigationControllerDelegate {

	var imagePicker: UIImagePickerController?
    

    internal func passtheburger(bread: String?) {
        if bread == nil {
            //return
            print("You don't have any money!")
        } else {
            print(bread!)
        }
    }

    let container: UIView = {
        let contview = UIView()
        contview.backgroundColor = .white
        contview.translatesAutoresizingMaskIntoConstraints = false
        contview.layer.masksToBounds = true
        return contview
    }()

	let profileImage: UIImageView = {
        let profileImageView = UIImageView()
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.layer.cornerRadius = 80
        profileImageView.clipsToBounds = true
        profileImageView.image = UIImage(named: "green_artsy")
        return profileImageView
    }()
    
    let button: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setTitle("P H O T O", for: .normal)
        bt.titleLabel?.font = UIFont(name: "SFUIDisplay-Light", size: 24)
        bt.setTitleColor(UIColor.white, for: .normal)
        bt.tintColor = .yellow
        bt.backgroundColor = UIColor(r: 183, g: 216, b: 41)
        bt.isHidden = false
        bt.layer.borderWidth = 2.0
        bt.layer.borderColor = UIColor.lightGray.cgColor
        bt.layer.cornerRadius = 30
        bt.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
        //bt.addTarget(self, action: #selector(photoFunctionHandler), for: .touchUpInside)
        return bt
    }()
    
    func photoFunctionHandler() {
        
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            imagePicker = UIImagePickerController()
            imagePicker?.delegate = self
        
        let cameraAction = UIAlertAction(title: "Use Camera", style: .default) { (action) in
            //self.imagePicker?.mediaTypes = UIImagePickerController.availableMediaTypes(for: .camera)!
            self.imagePicker?.sourceType = .camera
            self.imagePicker?.allowsEditing = true
            self.imagePicker?.cameraCaptureMode = .photo
            
            self.present(self.imagePicker!, animated: true, completion: nil)
		}
        
        let photoLibraryAction = UIAlertAction(title: "Use Photo Library", style: .default) { (action) in
        	self.imagePicker?.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
            self.imagePicker?.sourceType = .photoLibrary
            self.imagePicker?.allowsEditing = true
            
            self.present(self.imagePicker!, animated: true, completion: nil)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(cameraAction)
        alertController.addAction(photoLibraryAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
        
    }
/*
	Image handling functions follows ...
*/
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let chosenImage = info[UIImagePickerControllerEditedImage] as! UIImage
        profileImage.contentMode = .scaleAspectFill
        profileImage.image = chosenImage
        
        // Chosen Image will be saved in Photos Album library
        UIImageWriteToSavedPhotosAlbum(profileImage.image!, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
        
        dismiss(animated: true, completion: nil)
    }
    
    func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            // we got back an error!
            let ac = UIAlertController(title: "Save error", message: error.localizedDescription, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        } else {
            let ac = UIAlertController(title: "Saved!", message: "Your chosen image has been saved to your photos.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
    }

	func handleButton() {
        
        let mars = MarsViewController()
        
        mars.delegate = self
        
/*
		pushview produces a hardcoded <[title] back button.
    	navigationController?.pushViewController(<#T##viewController: UIViewController##UIViewController#>, animated: <#T##Bool#>)
        
      pretty much better to avoid this implementation in favor of
      present(viewController, animated: true, completion: nil)
*/

        let blastoff = UINavigationController(rootViewController: mars)
        self.navigationController?.present(blastoff, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        navigationController!.navigationBar.isTranslucent = false
        navigationController!.navigationBar.barTintColor = UIColor(r: 170, g: 204, b: 40)
        navigationItem.title = "StarBoard"
        
        self.view.addSubview(container)
        _ = container.anchor(self.view.topAnchor, left: self.view.leftAnchor, bottom: nil, right: self.view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: self.view.bounds.width, heightConstant: self.view.bounds.height)
        
        container.addSubview(button)
        _ = button.anchor(self.container.bottomAnchor, left: self.view.leftAnchor, bottom: nil, right: nil, topConstant: -90, leftConstant: 10, bottomConstant: 0, rightConstant: -10, widthConstant: self.view.bounds.width-20, heightConstant: 60)
        
        container.addSubview(profileImage)
        _ = profileImage.anchor(self.container.centerYAnchor, left: self.container.centerXAnchor, bottom: nil, right: nil, topConstant: -80, leftConstant: -80, bottomConstant: 0, rightConstant: 0, widthConstant: 160, heightConstant: 160)
        
 		print("hello world!")
 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

