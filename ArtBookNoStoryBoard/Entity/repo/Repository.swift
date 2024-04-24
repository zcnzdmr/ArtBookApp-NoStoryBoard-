//
//  Repository.swift
//  ArtBookNoStoryBoard
//
//  Created by Özcan on 24.04.2024.
//

import Foundation
import CoreData
import RxSwift

class Repository {
    
    let context = appDelegate.persistentContainer.viewContext
    
    var listOfPaintings = BehaviorSubject<[Paintings]>(value: [])
    
    func save(paintingName  : String,
              painterName   : String,
              paintingTime  : String,
              imagem        : Data) {
        
        let tablo = Paintings(context: context)
        
        tablo.paintingName = paintingName
        tablo.painterName = painterName
        tablo.paintingTime = paintingTime
        tablo.imagem = imagem
        
        appDelegate.saveContext()
        
        print("kayit oluştu")
    }
    
    func fetchPaintings() {
        do {
            let paintings = try context.fetch(Paintings.fetchRequest()) as? [Paintings] ?? []
            listOfPaintings.onNext(paintings)
        } catch {
            print("Hata: \(error.localizedDescription)")
        }
    }
    
    func delete(tablo:Paintings) {
        
        context.delete(tablo)
        appDelegate.saveContext()
        fetchPaintings()
    }
}
