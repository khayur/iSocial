//
//  User.swift
//  iSocial
//
//  Created by Yury Khadatovich on 5.12.21.
//

import Foundation

struct User {
    var firstName: String? = String()
    var lastName: String?
    var age: Int?
    var ageToString: String {
        guard age != nil else {
            return "Age is nil"
        }
        
        return "\(age!) y.o."
    }
    
    var login: String?
    var password: String?
    
    init(firstName: String?,
         lastName: String?,
         age: Int?,
         login: String?,
         password: String?
    ) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.login = login
        self.password = password
    }
    
    func getFirstName() -> String {
        guard self.firstName != nil else {
            return "First name is nil"
        }
        
        return self.firstName!
    }
    
    func getLastName() -> String {
        guard self.lastName != nil else {
            return "Last name is nil"
        }
        
        return self.lastName!
    }
    
    func getAge() -> Int {
        guard self.age != nil else {
            return 0
        }
        
        return self.age!
    }
    
    func getLogin() -> String {
        guard self.login != nil else {
            return "Login is nil"
        }
        
        return self.login!
    }
    
    func getPassword() -> String {
        guard self.password != nil else {
            return "Password is nil"
        }
        
        return self.password!
    }
}
