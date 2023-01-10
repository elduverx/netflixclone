//
//  APICaller.swift
//  netflix
//
//  Created by Duver on 4/1/23.
//

import Foundation

struct Constants{
  static let API_KEY = "2eed394a9006c346c19e231d8cbe6571"
  static let baseUrl = "https://api.themoviedb.org/"
}

//ERRORS: FOR THE API

enum APIErrors:Error{
  case failedTogetData
}

class APICaller{
  static let shared = APICaller()
  
  //  fetch Data
  func getTrendingMovies(completion: @escaping (Result<[Title], Error>)-> Void){
    
    
    guard let url = URL(string: "\(Constants.baseUrl)/3/trending/movie/day?api_key=\(Constants.API_KEY)") else {return}
    
    let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
      guard let data = data, error == nil else {
        return
      }
      do {
        let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
        completion(.success(results.results))
      } catch {
        completion(.failure(APIErrors.failedTogetData))
      }
    }
    task.resume()
  }
  func getTRendingTvs(completion: @escaping (Result<[Title], Error>)-> Void){
    guard let url = URL(string: "\(Constants.baseUrl)/3/trending/tv/day?api_key=\(Constants.API_KEY)") else {return}
    let task = URLSession.shared.dataTask(with: url) { data, _, error in
      guard let data = data, error == nil else {return}
      
      do {
        let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
        completion(.success(results.results))
      } catch  {
        completion(.failure(APIErrors.failedTogetData))
      }
    }
    task.resume()
  }
  
  func getUpcomingMovies(completion: @escaping (Result<[Title], Error>)-> Void){
    guard let url = URL(string: "\(Constants.baseUrl)/3/movie/upcoming?api_key=\(Constants.API_KEY)&language=en-US&page=1") else {return}
    
    let task = URLSession.shared.dataTask(with: url) { data, _, error in
      guard let data = data, error == nil else {return}
      
      do {
        let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
        completion(.success(results.results))
      } catch {
        completion(.failure(APIErrors.failedTogetData))
      }
    }
    task.resume()
  }
  
  
  
  func getPopularMovies(completion: @escaping (Result<[Title], Error>)-> Void){
    guard let url = URL(string: "\(Constants.baseUrl)/3/movie/popular?api_key=\(Constants.API_KEY)&language=en-USpage=1") else {return}
    
    let task = URLSession.shared.dataTask(with: url){ data,_ , error in
      guard let data = data, error == nil else {return}
      
      do{
        let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
        completion(.success(results.results))
      }catch{
        completion(.failure(APIErrors.failedTogetData))
      }
    }
    task.resume()
  }
  
  func getTopRated(completion: @escaping (Result<[Title], Error>)-> Void){
    
    guard let url = URL(string: "\(Constants.baseUrl)/3/movie/top_rated?api_key=\(Constants.API_KEY)&language=en-US&page=1") else {return}
    let task = URLSession.shared.dataTask(with: url) { data, _, error in
      guard let data = data, error == nil else{return}
      
      do {
        let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
        completion(.success(results.results))
      } catch  {
        completion(.failure(APIErrors.failedTogetData))
      }
      
    }
    task.resume()
  }
  func getDiscoverMovies(completion: @escaping (Result<[Title],Error>)-> Void){
    guard let url = URL(string: "\(Constants.baseUrl)/3/discover/movie?api_key=\(Constants.API_KEY)&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate") else {return}
    let task = URLSession.shared.dataTask(with: url) { data, _, error in
      guard let data = data, error == nil else{return}
      
      do {
        let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
        completion(.success(results.results))
      } catch  {
        completion(.failure(APIErrors.failedTogetData))
      }
      
    }
    task.resume()
  }
  
  func search(with query: String,completion: @escaping (Result<[Title],Error>)-> Void){
    
    guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return}
    
    guard let url = URL(string: "\(Constants.baseUrl)/3/search/movie?api_key=\(Constants.API_KEY)&query=\(query)") else {return}
    
    let task = URLSession.shared.dataTask(with: url) { data, _, error in
      guard let data = data, error == nil else{return}
      
      do {
        let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
        completion(.success(results.results))
      } catch  {
        completion(.failure(APIErrors.failedTogetData))
      }
      
    }
    task.resume()
  }
  
  
}
