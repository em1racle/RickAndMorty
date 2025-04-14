//
//  CharacterCellViewController.swift
//  RickAndMorty
//
//  Created by Emir Byashimov on 13.04.2025.
//

import UIKit

final class CharacterCellViewController: UICollectionViewCell {
    var viewModel: CharacterCellViewModelProtocol? {
        didSet {
            viewModel?.updateCharacterHandler = { [weak self] character in
                let name = character.name
                let episode = character.episode
                let image = character.image
                
            }
        }
    }
}
