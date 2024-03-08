//
//  CarViewController.swift
//  UIPageViewController
//
//  Created by Victor Tormyshev on 08.03.2024.
//

import UIKit

class CarViewController: UIViewController {

    private let carImage: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 20
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var subView: [UIView] = [carImage, nameLabel]
    
    init(carWith: CarsHelper) {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .purple
        edgesForExtendedLayout = []
        
        carImage.image = carWith.image
        nameLabel.text = carWith.name
        
        for view in subView {
            self.view.addSubview(view)
        }
        NSLayoutConstraint.activate([
            carImage.heightAnchor.constraint(equalToConstant: 250),
            carImage.widthAnchor.constraint(equalToConstant: 250),
            carImage.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 150),
            carImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: carImage.bottomAnchor, constant: 50),
            nameLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
         ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
