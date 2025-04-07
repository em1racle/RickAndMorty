//
//  LaunchViewController.swift
//  RickAndMorty
//
//  Created by Emir Byashimov on 05.04.2025.
//

import UIKit

final class LaunchViewController: UIViewController {
    enum Event {
        case launchComplete
    }
    var didSendEventHandler: ((LaunchViewController.Event) -> Void)?
    
    private lazy var imageYOffset: CGFloat = -138
    
    private lazy var imageView: UIImageView = {
        let image = UIImage(named: ImageName.launchLoadingImage)
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var titleView: UIImageView = {
        let titleImage = UIImage(named: ImageName.launchTitleImage)
        let titleImageView = UIImageView(image: titleImage)
        titleImageView.contentMode = .scaleAspectFit
        return titleImageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        startContinuousRotation()
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor.white
        
        view.addSubview(titleView)
        titleView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            titleView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100)
        ])
        
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 350)
        ])
    }
    
    func startContinuousRotation() {
        print("start")
        let rotation = CABasicAnimation(keyPath: "transform.rotation")
        rotation.toValue = CGFloat.pi * 2
        rotation.duration = 3.0
        rotation.repeatCount = 5
        rotation.isRemovedOnCompletion = false

        imageView.layer.add(rotation, forKey: "rotation")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.didSendEventHandler?(.launchComplete)
        }
    }
}

// MARK: Preview
#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct LaunchViewControllerPreview: PreviewProvider {
    static var previews: some View {
        let dependency = DependenciesMock()
        let viewController = LaunchAssembly.configure(dependency)
        Group {
            PreviewViewController(viewController)
                .edgesIgnoringSafeArea(.all)
                .previewDisplayName("Light")
            PreviewViewController(viewController)
                .edgesIgnoringSafeArea(.all)
                .previewDisplayName("Dark")
                .preferredColorScheme(.dark)
        }
    }
}
#endif
