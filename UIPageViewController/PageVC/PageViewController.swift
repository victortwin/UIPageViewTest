//
//  PageViewController.swift
//  UIPageViewController
//
//  Created by Victor Tormyshev on 08.03.2024.
//

import UIKit

class PageViewController: UIPageViewController {

    var cars = [CarsHelper]()
    
    let firstCarImage = UIImage(named: "4")
    let secondCarImage = UIImage(named: "5")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Cars"
        
        let firstCar = CarsHelper(name: "Jeep 1", image: firstCarImage!)
        let secondCar = CarsHelper(name: "Jeep 2", image: secondCarImage!)
        
        cars.append(firstCar)
        cars.append(secondCar)
    }
    
    lazy var carViewControllerArray: [CarViewController] = {
        
        var carsVC = [CarViewController]()
        for car in cars {
            carsVC.append(CarViewController(carWith: car))
        }
        return carsVC
    }()
    
    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: navigationOrientation)
        self.view.backgroundColor = .green
        self.delegate = self
        self.dataSource = self
        setViewControllers([carViewControllerArray[0]], direction: .forward, animated: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PageViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewController = viewController as? CarViewController else { return nil }
        if let index = carViewControllerArray.firstIndex(of: viewController) {
            if index > 0 {
                return carViewControllerArray[index - 1]
            }
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewController = viewController as? CarViewController else { return nil }
        if let index = carViewControllerArray.firstIndex(of: viewController) {
            if index < cars.count - 1 {
                return carViewControllerArray[index + 1]
            }
        }
        return nil
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return cars.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
}
