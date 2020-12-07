//
//  JsonRep.swift
//  TestKlaxit2
//
//  Created by Julien Dos Santos on 23/11/2020.
//

import Foundation
struct JsonRep : Codable {

    var features : [features]?

}
struct features : Codable {
    var properties : properties
}




struct properties : Codable {
    var label : String?
    var score : Double?
    var id : String?
    var type : String?
    var x : Double?
    var y : Double?
    var importance : Double?
    var name : String?
    var postcode : String?
    var citycode : String?
    var city : String?
    var context : String?
}
