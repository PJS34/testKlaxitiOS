//
//  UserData.swift
//  TestKlaxit2
//
//  Created by Julien Dos Santos on 20/11/2020.
//

import Foundation

struct UserData : Codable {
    var picture_url : String
    var first_name : String
    var last_name : String
    var phone_number : String
    var company : String
    var job_position : String
    var adress : String?
}
