//
//  SearchResultsViewController.swift
//  netflix
//
//  Created by Duver on 10/1/23.
//

import UIKit

class SearchResultsViewController: UIViewController {
  
  private let titles: [Title] = [Title]()
  
  private let searcResultsCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 3 - 10, height: 200)
    layout.minimumInteritemSpacing = 0
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.register(TitleCollectionViewCell.self, forCellWithReuseIdentifier: TitleCollectionViewCell.identifier)
    return collectionView
  }()

    override func viewDidLoad() {
        super.viewDidLoad()

      view.backgroundColor = .systemBackground
      view.addSubview(searcResultsCollectionView)
      
      searcResultsCollectionView.delegate = self
      searcResultsCollectionView.dataSource = self
      
      
    }
    
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    searcResultsCollectionView.frame = view.bounds
  }

}


extension SearchResultsViewController: UICollectionViewDelegate, UICollectionViewDataSource{
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 12
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleCollectionViewCell.identifier, for: indexPath) as? TitleCollectionViewCell else {return UICollectionViewCell()}
    cell.backgroundColor = .blue
    return cell
  }
  
  
}
