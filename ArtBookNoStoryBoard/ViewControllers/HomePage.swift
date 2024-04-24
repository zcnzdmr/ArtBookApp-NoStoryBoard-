//
//  ViewController.swift
//  ArtBookNoStoryBoard
//
//  Created by Özcan on 24.04.2024.
//

import UIKit
import RxSwift

class HomePage: UIViewController {
    
    var tableView = UITableView()
    var viewModel = HomeViewModel()
    var paintingList = [Paintings]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpVisualObjects()
        barButton()
        
        self.navigationItem.title = "Art Book"
        
        _ = viewModel.listOfPaintings.subscribe(onNext: { liste in
            self.paintingList = liste
            self.tableView.reloadData()
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.fetchPaintings()
    }
    
    private func setUpVisualObjects() {
        tableView.frame = view.bounds
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CellClass.self, forCellReuseIdentifier: "hucrem")
    }
    
    func barButton() {
        let butonRight = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addFonk))
        self.navigationItem.rightBarButtonItem = butonRight
    }
    
    @objc func addFonk() {
        show(RegisterPage(), sender: nil)
    }
    
    func toDetail(index:Paintings) {
//        self.present(DetailPage(index: index), animated: true)
        show(DetailPage(index: index), sender: nil)
    }

}

extension HomePage : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return paintingList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let tablo = paintingList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "hucrem", for: indexPath) as! CellClass
        
        cell.label.text = tablo.paintingName
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        toDetail(index: paintingList[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let tablo = paintingList[indexPath.row]
        
        let action = UIContextualAction(style: UIContextualAction.Style.destructive, title: "Delete") { UIContextualAction, UIView, z in
            
            let alert = UIAlertController(title: "Delete", message: "\(tablo.paintingName!) silinsin mi? ", preferredStyle: UIAlertController.Style.alert)
            
            let evet = UIAlertAction(title: "Yes", style: UIAlertAction.Style.destructive) { UIAlertAction in
                self.viewModel.delete(tablo: tablo)
            }
            alert.addAction(evet)
            
            let hayir = UIAlertAction(title: "No", style: UIAlertAction.Style.default)
            alert.addAction(hayir)
            
            self.present(alert, animated: true, completion: nil)
            
        }
        return UISwipeActionsConfiguration(actions: [action])
    }
}

