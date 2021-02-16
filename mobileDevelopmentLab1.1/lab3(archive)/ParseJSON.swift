//
//  ParseJSON.swift
//  mobileDevelopmentLab1.1
//
//  Created by Anastasiia Poliukovych on 15.02.2021.
//

import Foundation

class ParseJSON {
    
    var onCompletion : ( (currentData) -> Void )?
    
    func getData(forResource resource : String){
        if let path = Bundle.main.path(forResource: resource, ofType: "txt") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                if let currenData = self.parseJSON(withData: data){
                    self.onCompletion?(currenData)
                }
            } catch let error {
                print("parse error: \(error.localizedDescription)")
            }
        } else {
            print("Invalid filename/path.")
        }
    }
    
    func parseJSON(withData data: Data) -> currentData? {
        let decoder1 = JSONDecoder()
        do {
            let fileShortData = try decoder1.decode(Github.self, from: data)
            let fileDetailedData = try decoder1.decode(NewGithub.self, from: data)
            if let currentData = currentData(model: fileShortData, newModel: fileDetailedData){
                
                for i in currentData.title{
                    print("+++ ",i)
                }
                
                for i in currentData.detaileTitle{
                    print("--- ",i)
                }
                
                return currentData
            } else {
                return nil
            }
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
}

