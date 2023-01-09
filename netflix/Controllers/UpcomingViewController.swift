//
//  UpcomingViewController.swift
//  netflix
//
//  Created by Duver on 29/12/22.
//

import UIKit

class UpcomingViewController: UIViewController {
  
  private var titles: [Title] = [Title]()
  
  private let upcomingTable: UITableView = {
  
    let table = UITableView()
    table.register(TitleTableviewCell.self, forCellReuseIdentifier: TitleTableviewCell.identifier)
    return table
  }()

    override func viewDidLoad() {
        super.viewDidLoad()
      view.backgroundColor = .systemBackground
      title = "Upcoming"
      navigationController?.navigationBar.prefersLargeTitles = true
      navigationController?.navigationItem.largeTitleDisplayMode = .always
      
      view.addSubview(upcomingTable)
      upcomingTable.delegate = self
      upcomingTable.dataSource = self
      
      fetchUpcoming()
      
    }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    upcomingTable.frame = view.bounds
  }
    
  
  private func fetchUpcoming(){
    APICaller.shared.getUpcomingMovies { [weak self] result in
      switch result {
      case .success(let titles):
        self?.titles = titles
        DispatchQueue.main.async {
          self?.upcomingTable.reloadData()

        }
      case .failure(let error):
        print(error.localizedDescription)
      }
    }
  }
  

}

extension UpcomingViewController: UITableViewDelegate,UITableViewDataSource{
//  numeros de flechas en la seccion
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return titles.count
    
  }
//   celda identificada
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: TitleTableviewCell.identifier,for: indexPath) as? TitleTableviewCell else {return UITableViewCell()
      
    }
    let title = titles[indexPath.row]
    cell.configure(with: TitleViewModel(titleName: (title.original_title ?? title.original_name) ?? "unkown", posterURL: title.poster_path ?? "unkwon"))
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 140
  }
  
}
