//
//  ViewController.swift
//  AnimationsHomework
//
//  Created by Анна Ереськина on 24.05.2021.
//

import UIKit
import Foundation

class MainVC: UIViewController {
    
    /// Фоновый рисунок
    private let villageImage: UIImageView = {
        let imageView = UIImageView(frame: UIScreen.main.bounds)
        imageView.image = UIImage(named: "village")
        imageView.contentMode = .scaleAspectFill
        return imageView
        
    }()
    
    /// Лиса
    private let foxImage: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: -60,
                                                  y: UIScreen.main.bounds.height - 350,
                                                  width: 120,
                                                  height: 320))
        imageView.image = UIImage(named: "fox")
        return imageView
    }()
    
    /// Колобок
    private let kolobokImage: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: UIScreen.main.bounds.width + 80 ,
                                                  y: UIScreen.main.bounds.height - 130,
                                                  width: 50,
                                                  height: 80))
        
        imageView.image = UIImage(named: "kolobok")
        return imageView
        
    }()
    
    /// Текст завершения сказки
    private var textLabel: UILabel = {
        var label = UILabel(frame: CGRect(x: 0, y: 0, width: 280, height: 160))
        label.center = CGPoint(x: UIScreen.main.bounds.width / 2,
                               y: UIScreen.main.bounds.height / 2)
        label.font = .boldSystemFont(ofSize: 48)
        label.text = "Сказочке конец !!!"
        label.numberOfLines = 2
        label.textColor = .purple
        label.textAlignment = .center
        
        label.alpha = 0
        
        return label
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startAnimate()
    }
}

// MARK: - User Methods
extension MainVC {
    
    private func setupViews() {
        view.backgroundColor = .gray
        
        view.addSubview(villageImage)
        view.addSubview(foxImage)
        view.addSubview(kolobokImage)
        view.addSubview(textLabel)
    }

    /// Метод анимирования объектов
    private func startAnimate() {
        
        UIView.animateKeyframes(withDuration: 5, delay: 0, options: .calculationModeLinear) {
            
            // Анимируем лису
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.3) {
                self.foxImage.frame = CGRect(x: 20,
                                             y: UIScreen.main.bounds.height - 350,
                                             width: 120,
                                             height: 320)
            }
            
            // Анимируем колобка
            UIView.addKeyframe(withRelativeStartTime: 0.1, relativeDuration: 1) {
                self.kolobokImage.frame.origin.x = UIScreen.main.bounds.width - 80
                self.kolobokImage.frame.origin.y = UIScreen.main.bounds.height - 130
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 1) {
                self.kolobokImage.frame.origin.x = UIScreen.main.bounds.width - 90
                self.kolobokImage.frame.origin.y = UIScreen.main.bounds.height - 200
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.55, relativeDuration: 1) {
                self.kolobokImage.frame.origin.x = UIScreen.main.bounds.width - 110
                self.kolobokImage.frame.origin.y = UIScreen.main.bounds.height - 130
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 1) {
                self.kolobokImage.frame.origin.x = UIScreen.main.bounds.width - 130
                self.kolobokImage.frame.origin.y = UIScreen.main.bounds.height - 200
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.65, relativeDuration: 1) {
                self.kolobokImage.frame.origin.x = UIScreen.main.bounds.width - 150
                self.kolobokImage.frame.origin.y = UIScreen.main.bounds.height - 130
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.7, relativeDuration: 1) {
                self.kolobokImage.frame.origin.x = UIScreen.main.bounds.width - 170
                self.kolobokImage.frame.origin.y = UIScreen.main.bounds.height - 200
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 1) {
                self.kolobokImage.frame.origin.x = UIScreen.main.bounds.width - 190
                self.kolobokImage.frame.origin.y = UIScreen.main.bounds.height - 130
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.8, relativeDuration: 1) {
                self.kolobokImage.frame.origin.x = UIScreen.main.bounds.width - 290
                self.kolobokImage.frame.origin.y = UIScreen.main.bounds.height - self.foxImage.frame.height
            }
            
            UIImageView.addKeyframe(withRelativeStartTime: 0.85, relativeDuration: 0.25) {
                self.kolobokImage.frame = CGRect(x: UIScreen.main.bounds.width - 290,
                                                 y: UIScreen.main.bounds.height - self.foxImage.frame.height + 70,
                                                 width: 6,
                                                 height: 6)
            }
        } completion: { _ in
            self.kolobokImage.isHidden = true
            self.villageImage.isHidden = true
            self.foxImage.isHidden = true
            
            // Анимируем текст
            UIView.animate(withDuration: 2) {
                self.textLabel.alpha = 1
            }
        }
    }
}

