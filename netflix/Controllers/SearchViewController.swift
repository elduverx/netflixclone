//
//  SearchViewController.swift
//  netflix
//
//  Created by Duver on 29/12/22.
//

import UIKit

class SearchViewController: UIViewController {
  
  private var titles:[Title] = [Title]()
  
  private let discoverTable: UITableView = {
  
    let table = UITableView()
    table.register(TitleTableviewCell.self, forCellReuseIdentifier: TitleTableviewCell.identifier)
    return table
  }()

    override func viewDidLoad() {
        super.viewDidLoad()
      view.backgroundColor = .systemBackground
      title = "Search"
      navigationController?.navigationBar.prefersLargeTitles = true
      navigationController?.navigationItem.largeTitleDisplayMode = .always
      
//      delegado y datasource
      view.addSubview(discoverTable)
      discoverTable.delegate = self
      discoverTable.dataSource = self
      
      
      fetchDiscoverMovies()
    }
    
  private func  fetchDiscoverMovies(){
    APICaller.shared.getDiscoverMovies { [weak self] result in
      switch result{
      case .success(let titles):
        self?.titles = titles
        DispatchQueue.main.async {
          self?.discoverTable.reloadData()
        }
      case .failure(let error):
        print(error.localizedDescription)
      }
    }
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    discoverTable.frame = view.bounds
  }


}


extension SearchViewController: UITableViewDataSource,UITableViewDelegate{

  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return titles.count;
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: TitleTableviewCell.identifier,for: indexPath) as? TitleTableviewCell else {return UITableViewCell()
      
    }
    let title = titles[indexPath.row]
    let model = TitleViewModel(titleName: title.original_name ?? title.original_title ?? "unknown name", posterURL: title.poster_path ?? "unknown")
    cell.configure(with: model )
    
    return cell;
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 140
  }
  
}
