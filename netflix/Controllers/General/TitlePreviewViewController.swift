//
//  TitlePreviewViewController.swift
//  netflix
//
//  Created by Duver on 10/1/23.
//

import UIKit
import WebKit
class TitlePreviewViewController: UIViewController {
  
  
  private let titleLabel: UILabel = {
    
    let label = UILabel()
      label.translatesAutoresizingMaskIntoConstraints = false
    label.font = .systemFont(ofSize: 22,weight: .bold)
    label.text = "me follo a la madre de mi mejor amiga"
    return label
    
  }()
  
  private let overviewLabel: UILabel = {
    
    let label = UILabel()
    label.font = .systemFont(ofSize: 18, weight: .regular)
    label.translatesAutoresizingMaskIntoConstraints = false
    label.numberOfLines = 0
    label.text = "Monchi El Zorro, Sara la Perra"
    return label
  }()
  
  private let downloadbutton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.backgroundColor = .red
    button.setTitle("Download", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.layer.cornerRadius = 12
    button.layer.masksToBounds = true
    return button
  }()
  
  
  private let webView: WKWebView = {
    let webView = WKWebView()
    webView.translatesAutoresizingMaskIntoConstraints = false
    return webView
  }()
  

    override func viewDidLoad() {
        super.viewDidLoad()

      view.backgroundColor = .systemBackground
      view.addSubview(webView)
      view.addSubview(titleLabel)
      view.addSubview(overviewLabel)
      view.addSubview(downloadbutton)
      
      configureConstraints()
      
      
    }
    
  func  configureConstraints(){
    let webViewConstraints = [
      webView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
      webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      webView.heightAnchor.constraint(equalToConstant: 250)
    ]
    
    let titleLabelConstraints = [
      titleLabel.topAnchor.constraint(equalTo: webView.bottomAnchor, constant: 20),
      titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
      
    
    ]
    
    let overViewLabelConstraints = [
      overviewLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 15),
      overviewLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20)
    ]
    
    let downloadButtonConstraints = [
      downloadbutton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      downloadbutton.topAnchor.constraint(equalTo: overviewLabel.bottomAnchor,constant: 25),
      downloadbutton.widthAnchor.constraint(equalToConstant: 140),
      downloadbutton.heightAnchor.constraint(equalToConstant: 40),
      
    ]
    
    NSLayoutConstraint.activate(webViewConstraints)
    NSLayoutConstraint.activate(titleLabelConstraints)
    NSLayoutConstraint.activate(overViewLabelConstraints)
    NSLayoutConstraint.activate(downloadButtonConstraints)
  }
  
  func configure(with model: TitlePreviewViewModel){
    titleLabel.text = model.title
    overviewLabel.text = model.titleOverview
    
    guard let url = URL(string: "https://www.youtube.com/embed/\(model.youtubeView.id.videoId)") else {return}
    webView.load(URLRequest(url: url))
  }


}
