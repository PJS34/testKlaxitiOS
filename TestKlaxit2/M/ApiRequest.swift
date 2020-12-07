//
//  APIRequest.swift
//  TestKlaxit2
//
//  Created by Julien Dos Santos on 23/11/2020.
//

import Foundation
import Alamofire
public class APIRequest {
    let URL :String = "https://api-adresse.data.gouv.fr/search/?q="
    let URLOptions : String = "&autocomplete=0"
    var JsonResults : JsonRep?
    var myreq : DataRequest?
    init() {
        
    }
   
    func GetJsonResults() -> [String] {
        var s : [String] = []
        for feature in JsonResults?.features ?? [] {
            s.append(feature.properties.label!)
        }
        return s
    }
    func ApiRequest(SearchBarText : String, completion: @escaping () -> Void ) {
        myreq?.cancel()
        let URLComplete :String = URL + SearchBarText
        //Format problem. replace space with %20
        let URLWithGoodFormat : String = URLComplete.replacingOccurrences(of: " ", with: "%20")

        myreq = Alamofire.request(URLWithGoodFormat).responseString { response in
            /*
            switch response.result {
            case .failure(let error) :
                print("ERROR")
                print(error)
                break
            case .success(let success) :
                print("SUCCESS" + success)
            }
 */
            if let JSON : String = response.result.value {
                print("BlaAPI" + JSON)
                    do {
                        
                        let jsonDecoder = JSONDecoder()
                        let dataFromJSON = try jsonDecoder.decode(JsonRep.self, from: JSON.data(using: .utf8)!)
                        self.JsonResults = dataFromJSON
                        completion()
                    }catch {
                        print(error)
                    }
                
            }
        }
        
    }
}
