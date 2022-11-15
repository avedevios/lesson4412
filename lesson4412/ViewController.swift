//
//  ViewController.swift
//  lesson4412
//
//  Created by ake11a on 2022-11-09.
//

import UIKit

class ViewController: UIViewController {
    
    var beers: [Beer] = []
    
    private lazy var beersTableView: UITableView = {
        let tableView = UITableView()
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "beer_cell")
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkApi().getBeerList { result in
            self.beers = result
            self.beersTableView.reloadData()
        }
        
        setupSubviews()
    }
    
    func setupSubviews() {
        view.addSubview(beersTableView)
        let beersTableViewTop = beersTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0)
        let beersTableViewLeft = beersTableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0)
        let beersTableViewRight = beersTableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0)
        let beersTableViewBottom = beersTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        
        NSLayoutConstraint.activate([
            beersTableViewTop, beersTableViewLeft, beersTableViewRight, beersTableViewBottom
        ])
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "beer_cell", for: indexPath)
        cell.textLabel?.text = beers[indexPath.row].name
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let beerDescriptionView = BeerDescriptionView()
            
        if let bottomSheet = beerDescriptionView.sheetPresentationController {
            bottomSheet.detents = [.medium()]
        }
        
        beerDescriptionView.beerNameLabel.text = beers[indexPath.row].name
        beerDescriptionView.beerDescriptionLabel.text = beers[indexPath.row].description
        
        present(beerDescriptionView, animated: true, completion: nil)
    }
}
