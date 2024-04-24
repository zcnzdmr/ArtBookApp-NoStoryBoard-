//
//  DetailPage.swift
//  ArtBookNoStoryBoard
//
//  Created by Özcan on 24.04.2024.
//

import UIKit

class DetailPage: UIViewController {
    
    var index : Paintings?
    
    init(index:Paintings) {
        super.init(nibName: nil, bundle: nil)
        self.index = index
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var imagem = UIImageView()
    var nameOfPainting = UILabel()
    var nameOfPainter = UILabel()
    var timeOfPainting = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let x = index?.paintingName ,
           let y = index?.painterName ,
           let z = index?.paintingTime,
           let k = index?.imagem {
            nameOfPainting.text = x
            nameOfPainter.text = y
            timeOfPainting.text = z
            imagem.image = UIImage(data: k)
        }
        
        setUpVisiulObjects()

    }
    
    
    private func setUpVisiulObjects() {
        
        let screenWidth = view.frame.size.width
        view.backgroundColor = .systemBackground
        
        imagem.frame = CGRect(x: 10, y: 100, width: screenWidth-20, height: 300)
        imagem.layer.borderWidth = 0.4
        view.addSubview(imagem)
        
        nameOfPainting.frame = CGRect(x: 10, y: 460, width: screenWidth-20, height: 30)
        nameOfPainting.layer.borderWidth = 0.4
        view.addSubview(nameOfPainting)
        
        nameOfPainter.frame = CGRect(x: 10, y: 500, width: screenWidth-20, height: 30)
        nameOfPainter.layer.borderWidth = 0.4
        view.addSubview(nameOfPainter)
        
        
        timeOfPainting.frame = CGRect(x: 10, y: 540, width: screenWidth-20, height: 30)
        timeOfPainting.layer.borderWidth = 0.4
        view.addSubview(timeOfPainting)
    }
}
