//
//  AdressData.swift
//  TestKlaxit2
//
//  Created by Julien Dos Santos on 23/11/2020.
//

import Foundation
struct coordinates : Codable {
    var x : Double
    var y : Double
}
struct geometry : Codable {
    var type : String
    var coo : [coordinates]
}
struct JsonRep : Codable {
    var type : String
    var version : String
    var features : [properties]
    var attribution : String
    var licence : String
    var query : String
    var limit = 5
}
struct properties : Codable {
    var label : String
    var score : Double
    var id : String
    var type : String
    var x : Double
    var y : Double
    var importance : Double
    var name : String
    var postcode : String
    var citycode : String
    var city : String
    var context : String
}
