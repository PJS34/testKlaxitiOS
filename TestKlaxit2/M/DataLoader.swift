//
//  DataLoader.swift
//  TestKlaxit2
//
//  Created by Julien Dos Santos on 20/11/2020.
//

import Foundation
public class DataLoader {
    var userData : UserData?
    
    init(){
        load()
    }
    
    func load (){
        if let fileLocation = Bundle.main.url(forResource: "account", withExtension: "json"){
            do {
                let data =  try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                let dataFromJSON = try jsonDecoder.decode(UserData.self, from: data)
                userData = dataFromJSON
            }catch {
                print(error)
            }
        }
    }

    
}
