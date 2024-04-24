//
//  RegisterViewModel.swift
//  ArtBookNoStoryBoard
//
//  Created by Özcan on 24.04.2024.
//

import Foundation
import CoreData

class RegisterViewModel {
    
    var repoNesnesi = Repository()
    
    func save(paintingName  : String,
                painterName   : String,
                paintingTime  : String,
                imagem : Data) {
        repoNesnesi.save(paintingName: paintingName, painterName: painterName, paintingTime: paintingTime, imagem: imagem)
    }
    
}
