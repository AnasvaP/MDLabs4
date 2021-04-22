//
//  Network.swift
//  mobileDevelopmentLab1.1
//
//  Created by Anasva on 05.04.2021.
//

import Foundation

class Network {
    
    func getData(forRequest req: String, completion: @escaping (Result<Welcome, Error>)->Void){
        let urlString = "https://api.itbook.store/1.0/search/\(req)"
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error{
                    print("we have some error")
                    completion(.failure(error))
                    return
                }
                guard let data = data else {return}
                do{
                    let books = try JSONDecoder().decode(Welcome.self, from:  data)
                    completion(.success(books))
                }catch let jsonError{
                    print("jsonError - ", jsonError )
                    completion(.failure(jsonError))
                }
            }
        }.resume()
    }
    
    func getDetailedData(forRequest req: String, completion: @escaping (Result<Detailed, Error>)->Void){
        let urlString = "https://api.itbook.store/1.0/books/\(req)"
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error{
                    print("we have some error")
                    completion(.failure(error))
                    return
                }
                guard let data = data else {return}
                do{
                    let booksDetail = try JSONDecoder().decode(Detailed.self, from:  data)
                    completion(.success(booksDetail))
                }catch let jsonError{
                    print("jsonError - ", jsonError )
                    completion(.failure(jsonError))
                }
            }
        }.resume()
    }
    
    func getDataForPhotos (completion: @escaping (Result<Photos, Error>) -> Void){
        let apiKey: String = "19193969-87191e5db266905fe8936d565"
        let req: String = "night+city"
        let count: String = "27"
        let urlString = "https://pixabay.com/api/?key=\(apiKey)&q=\(req)&image_type=photo&per_page=\(count)"
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error{
                    print("we have some error")
                    completion(.failure(error))
                    return
                }
                guard let data = data else {return}
                do{
                    let photos = try JSONDecoder().decode(Photos.self, from:  data)
                    completion(.success(photos))
                }catch let jsonError{
                    print("jsonError - ", jsonError )
                    completion(.failure(jsonError))
                }
            }
        }.resume()
    }
}
