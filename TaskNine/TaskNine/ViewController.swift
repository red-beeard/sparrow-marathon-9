//
//  ViewController.swift
//  TaskNine
//
//  Created by Alexander Nifontov on 24.03.2023.
//

import UIKit

class ViewController: UICollectionViewController {
	
	// MARK: - Lifecycle

	override func viewDidLoad() {
		super.viewDidLoad()
		
		if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
			layout.scrollDirection = .horizontal
			layout.sectionInset.left = 16
			layout.sectionInset.right = 16
		}
		
		collectionView.backgroundColor = .systemBackground
		collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
	
	}
}

// MARK: - UICollectionViewDataSource

extension ViewController {
	override func numberOfSections(in collectionView: UICollectionView) -> Int {
		1
	}
	
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 10
	}
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
		cell.layer.cornerRadius = 15
		cell.backgroundColor = .systemGroupedBackground
		return cell
	}
}

// MARK: - UICollectionViewDelegateFlowLayout

extension ViewController: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let height = collectionView.frame.height * 0.5
		let width = collectionView.frame.width * 0.8
		return CGSize(width: width, height: height)
	}
}

extension UICollectionViewFlowLayout {
	open override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
		let target = proposedContentOffset.y - sectionInset.left
		let itemWidth = (collectionView?.frame.width ?? 0) * 0.8 + minimumInteritemSpacing
		let numberOfItems = round(proposedContentOffset.x / itemWidth)
		let targetX = numberOfItems * itemWidth - 16
		
		return CGPoint(x: targetX, y: proposedContentOffset.y)
	}
}


