//
//  RegisterPage.swift
//  ArtBookNoStoryBoard
//
//  Created by Özcan on 24.04.2024.
//

import UIKit

class RegisterPage: UIViewController {
    
    var imagem = UIImageView()
    var nameOfPainting = UITextField()
    var nameOfPainter = UITextField()
    var timeOfPainting = UITextField()
    var butonSave = UIButton()
    
    var viewModel = RegisterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        butonSave.isEnabled = false
        setUpUI()
        tapGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.title = "Register Your Art"
    }
    
    func tapGesture() {
        
        imagem.isUserInteractionEnabled = true
        let gR = UITapGestureRecognizer(target: self, action: #selector(showImagePickerController))
        imagem.addGestureRecognizer(gR)
    }
    
    private func setUpUI() {
        
        let screenWidth = view.frame.size.width
        view.backgroundColor = .systemBackground
        
        imagem.frame = CGRect(x: 10, y: 100, width: screenWidth-20, height: 300)
//        imagem.layer.borderWidth = 0.4
        imagem.image = UIImage(named: "select")
        view.addSubview(imagem)
        
        nameOfPainting.frame = CGRect(x: 30, y: 460, width: screenWidth-60, height: 30)
        nameOfPainting.layer.borderWidth = 0.4
        nameOfPainting.placeholder = "Painting name"
        view.addSubview(nameOfPainting)
        
        nameOfPainter.frame = CGRect(x: 30, y: 510, width: screenWidth-60, height: 30)
        nameOfPainter.placeholder = "Painter name"
        nameOfPainter.layer.borderWidth = 0.4
        view.addSubview(nameOfPainter)
        
        
        timeOfPainting.frame = CGRect(x: 30, y: 560, width: screenWidth-60, height: 30)
        timeOfPainting.placeholder = "Time of painting"
        timeOfPainting.layer.borderWidth = 0.4
        view.addSubview(timeOfPainting)
        
        butonSave.setTitle("Save", for: UIControl.State.normal)
        butonSave.frame = CGRect(x: (screenWidth-50) / 2, y: 640, width: 50, height: 30)
        if butonSave.isEnabled == true {
            butonSave.setTitleColor(UIColor.blue, for: UIControl.State.normal)
        } else {
            butonSave.setTitleColor(UIColor.gray, for: UIControl.State.normal)
        }
        butonSave.addTarget(self, action: #selector(save), for: UIControl.Event.touchUpInside)
        view.addSubview(butonSave)
    }
    
    @objc func save() {
        if  let x = nameOfPainting.text,
            let y = nameOfPainter.text,
            let z = timeOfPainting.text,
            let k = imagem.image?.pngData()
            /*let k = imagem.image?.jpegData(compressionQuality: 0.5)*/ {
            
            viewModel.save(paintingName: x, painterName: y, paintingTime: z, imagem: k)
        }
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension RegisterPage : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @objc func showImagePickerController() {
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        //        imagePickerController.sourceType = .photoLibrary
        imagePickerController.allowsEditing = true
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            imagem.image = editedImage
        }
        butonSave.isEnabled = true
        butonSave.setTitleColor(UIColor.blue, for: UIControl.State.normal)
        dismiss(animated: true)
    }
}

