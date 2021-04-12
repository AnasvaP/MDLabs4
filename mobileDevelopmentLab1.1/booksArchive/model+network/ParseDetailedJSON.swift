//
//  ParseDetailedJSON.swift
//  mobileDevelopmentLab1.1
//
//  Created by Anasva on 03.03.2021.
//

import Foundation

class ParseDetailedJSON {
    
    var onCompletion : ( (currentData2) -> Void )?
    
    func getData(forResource2 resource2 : String){
        if let path2 = Bundle.main.path(forResource: resource2, ofType: "txt")  {
            do {
                let data2 = try Data(contentsOf: URL(fileURLWithPath: path2), options: .alwaysMapped)
                if let currenDetailedData = self.parseJSON(withData: data2) {
                    self.onCompletion?(currenDetailedData)
                }
            } catch let error {
                print("parse error: \(error.localizedDescription)")
            }
        } else {
            print("Invalid filename/path.")
        }
    }
    
    func parseJSON(withData data: Data) -> currentData2? {
        do {
            let fileDetailedData = try JSONDecoder().decode(NewGithub.self, from: data)
            if let currentDetailedData = currentData2(model2: fileDetailedData) {
                return currentDetailedData
            } else {
                return nil
            }
            
        } catch let error as NSError {
            print("error = ", error)
        }
        return nil
    }
}

