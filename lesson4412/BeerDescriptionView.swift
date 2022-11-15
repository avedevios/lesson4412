//
//  BeerDescriptionView.swift
//  lesson4412
//
//  Created by ake11a on 2022-11-09.
//

import UIKit

class BeerDescriptionView: UIViewController {
    
    lazy var beerNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var beerDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .cyan
        
        setupSubviews()
    }
    
    func setupSubviews() {
        view.addSubview(beerNameLabel)
        let beerNameLabelTop = beerNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50)
        let beerNameLabelCenterX = beerNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0)
        
        view.addSubview(beerDescriptionLabel)
        let beerDescriptionLabelTop = beerDescriptionLabel.topAnchor.constraint(equalTo: beerNameLabel.bottomAnchor, constant: 20)
        let beerDescriptionLabelLeft = beerDescriptionLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10)
        let beerDescriptionLabelRight = beerDescriptionLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -10)
//        let beerDescriptionLabelBottom = beerDescriptionLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100)
        
        NSLayoutConstraint.activate([
            beerNameLabelTop, beerNameLabelCenterX,
            beerDescriptionLabelTop, beerDescriptionLabelLeft, beerDescriptionLabelRight
        ])
    }
}
