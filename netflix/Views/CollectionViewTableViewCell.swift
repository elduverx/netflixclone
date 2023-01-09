//
//  CollectionViewTableViewCell.swift
//  netflix
//
//  Created by Duver on 2/1/23.
//

import UIKit

class CollectionViewTableViewCell: UITableViewCell {
  
//  MARK: ARRAY TITLES
  
  private var titles: [Title] = [Title]()
  
//  MARK: IDENFIFIER

  static let identifier = "CollectionViewTableViewCell"
  
//  Collections Views
  private let collectionView: UICollectionView = {
    
    let layout = UICollectionViewFlowLayout()
    layout.itemSize = CGSize(width: 140, height: 200)
    layout.scrollDirection = .horizontal
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.register(TitleCollectionViewCell.self, forCellWithReuseIdentifier: TitleCollectionViewCell.identifier)
    return collectionView
  }()
//  MARK: UITABLECELL CONFIG
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    contentView.backgroundColor = .systemPink
    contentView.addSubview(collectionView)
    
//    DELEGATES TO USE DATA SOURCE AND SELF DELEGATE
    collectionView.delegate = self
    collectionView.dataSource = self
  }
  required init(coder: NSCoder) {
    fatalError()
  }
  override func layoutSubviews() {
    super.layoutSubviews()
    collectionView.frame = contentView.bounds
  }
  public func configure(with titles: [Title]){
    self.titles = titles
//    RELOADER
    DispatchQueue.main.async {[weak self] in
      self?.collectionView.reloadData()
    }
  }
}

//Extension

extension CollectionViewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleCollectionViewCell.identifier, for: indexPath) as? TitleCollectionViewCell else {return UICollectionViewCell()
      
    }
    guard let model = titles[indexPath.row].poster_path else {
      return UICollectionViewCell()
    }
    cell.configurate(with: model)
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return titles.count
  }
  
}
