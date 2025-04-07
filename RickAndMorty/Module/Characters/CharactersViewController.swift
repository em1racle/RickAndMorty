//
//  CharactersViewController.swift
//  RickAndMorty
//
//  Created by Emir Byashimov on 05.04.2025.
//

import UIKit

final class CharactersViewController: UIViewController {
    var viewModel: CharactersViewModelDelegate?
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 16
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        
        let screenWidth = UIScreen.main.bounds.width
        layout.itemSize = CGSize(width: screenWidth - 32, height: 357)

        return UICollectionView(frame: .zero, collectionViewLayout: layout)
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
    }
    
    private func setupUI() {
        view.backgroundColor = .white
    }
    
    
}
