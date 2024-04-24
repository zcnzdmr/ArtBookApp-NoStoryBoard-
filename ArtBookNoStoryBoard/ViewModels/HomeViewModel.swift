//
//  HomeViewModel.swift
//  ArtBookNoStoryBoard
//
//  Created by Özcan on 24.04.2024.
//

import Foundation
import RxSwift

class HomeViewModel {
    
    var listOfPaintings = BehaviorSubject<[Paintings]>(value: [Paintings]())
    
    var repoNesnesi = Repository()
    
    init() {
        self.listOfPaintings = repoNesnesi.listOfPaintings
        fetchPaintings()
    }
    
    func fetchPaintings() {
        repoNesnesi.fetchPaintings()
    }
    
    func delete(tablo:Paintings) {
        repoNesnesi.delete(tablo: tablo)
    }
    
}
