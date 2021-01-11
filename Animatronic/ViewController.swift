//
//  ViewController.swift
//  Animatronic
//
//  Created by Максим Соловьёв on 09.01.2021.
//

import UIKit
import Spring

class ViewController: UIViewController {
    
    let imageView: SpringImageView = {
        let view = SpringImageView()
        view.image = UIImage(named: "logo")
        view.contentMode = .scaleAspectFit
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 50
        return view
    }()
    
    let animateButton: SpringButton = {
        let button = SpringButton()
        button.backgroundColor = .orange
        button.setTitle("Start", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "Copperplate", size: 30)
        button.titleLabel?.textAlignment = .center
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(didTapAnimateButton), for: .touchUpInside)
        return button
    }()
    
    let animationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Copperplate", size: 30)
        label.tintColor = .black
        label.backgroundColor = .clear
        label.textAlignment = .center
        return label
    }()
    
    var stepCounter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        setupConstraints()
    }
    
    @objc func didTapAnimateButton() {
        if stepCounter == 0 {
            animateButton.setTitle("Animate Shake", for: .normal)
            animationLabel.text = ""
        }
        if stepCounter == 1 {
            animateButton.setTitle("Next to Pop", for: .normal)
            animationLabel.text = "Animation Shake"
            imageView.animation = Spring.AnimationPreset.shake.rawValue
            imageView.curve = Spring.AnimationCurve.easeIn.rawValue
            imageView.duration = 1.5
            imageView.animate()
        } else if stepCounter == 2 {
            animateButton.setTitle("Next to Morph", for: .normal)
            animationLabel.text = "Animation Pop"
            imageView.animation = Spring.AnimationPreset.pop.rawValue
            imageView.curve = Spring.AnimationCurve.easeIn.rawValue
            imageView.duration = 1.5
            imageView.animate()
        } else if stepCounter == 3 {
            animateButton.setTitle("Next to Squeeze", for: .normal)
            animationLabel.text = "Animation Morph"
            imageView.animation = Spring.AnimationPreset.morph.rawValue
            imageView.curve = Spring.AnimationCurve.easeIn.rawValue
            imageView.duration = 1.5
            imageView.animate()
        } else if stepCounter == 4 {
            animateButton.setTitle("Next to Wobble", for: .normal)
            animationLabel.text = "Animation Squeeze"
            imageView.animation = Spring.AnimationPreset.squeeze.rawValue
            imageView.curve = Spring.AnimationCurve.easeIn.rawValue
            imageView.duration = 2
            imageView.animate()
        } else if stepCounter == 5 {
            animateButton.setTitle("Next to Swing", for: .normal)
            animationLabel.text = "Animation Wobble"
            imageView.animation = Spring.AnimationPreset.wobble.rawValue
            imageView.curve = Spring.AnimationCurve.easeIn.rawValue
            imageView.duration = 1.5
            imageView.animate()
        } else if stepCounter == 6 {
            animateButton.setTitle("Next to flipX", for: .normal)
            animationLabel.text = "Animation Swing"
            imageView.animation = Spring.AnimationPreset.swing.rawValue
            imageView.curve = Spring.AnimationCurve.easeIn.rawValue
            imageView.duration = 1.5
            imageView.animate()
        } else if stepCounter == 7 {
            animateButton.setTitle("Next to FlipY", for: .normal)
            animationLabel.text = "Animation FlipX"
            imageView.animation = Spring.AnimationPreset.flipX.rawValue
            imageView.curve = Spring.AnimationCurve.easeIn.rawValue
            imageView.duration = 1.5
            imageView.animate()
        } else if stepCounter == 8 {
            animateButton.setTitle("Next to Fall", for: .normal)
            animationLabel.text = "Animation FlipY"
            imageView.animation = Spring.AnimationPreset.flipY.rawValue
            imageView.curve = Spring.AnimationCurve.easeIn.rawValue
            imageView.duration = 1.5
            imageView.animate()
        } else if stepCounter == 9 {
            animateButton.setTitle("Restart", for: .normal)
            animationLabel.text = "Animation Fall"
            imageView.animation = Spring.AnimationPreset.fall.rawValue
            imageView.curve = Spring.AnimationCurve.easeIn.rawValue
            imageView.duration = 2
            imageView.animate()
            stepCounter = 0
        }
        stepCounter += 1
        animateButton.animation = Spring.AnimationPreset.zoomIn.rawValue
        animateButton.curve = Spring.AnimationCurve.easeIn.rawValue
        animateButton.duration = 0.5
        animateButton.animate()
    }
    
    private func setupConstraints() {
        
        view.addSubview(imageView)
        view.addSubview(animateButton)
        view.addSubview(animationLabel)
        
        [imageView,
         animateButton,
         animationLabel].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 200),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 130)
        ])
        
        NSLayoutConstraint.activate([
            animateButton.heightAnchor.constraint(equalToConstant: 100),
            animateButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            animateButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            animateButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            animateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100)
        ])
        
        NSLayoutConstraint.activate([
            animationLabel.heightAnchor.constraint(equalToConstant: 100),
            animationLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            animationLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            animationLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            animationLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50)
        ])
        
    }
    
}

