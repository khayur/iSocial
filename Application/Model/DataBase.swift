//
//  DataBase.swift
//  Homework16TMS_Khadatovich
//
//  Created by Yury Khadatovich on 6.11.21.
//

import UIKit



 class UserData {
    var login: String? = nil
    var password: String? = nil
    var firstName: String? = nil
    var lastName: String? = nil
    var age: Int? = nil
    
    init (
        login: String?,
        password: String?,
        firstName: String?,
        lastName: String?,
        age: Int?
    ){
        self.login = login
        self.password = password
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
    }
}

 func rememberUser(toRemember: User, memoryUser: inout User) {
    memoryUser.firstName = toRemember.getFirstName()
    memoryUser.lastName = toRemember.getLastName()
    memoryUser.age = toRemember.age
    memoryUser.login = toRemember.getLogin()
    memoryUser.password = toRemember.getPassword()
}

let user1 = User(firstName: "Yury", lastName: "Khadatovich", age: 25, login: "ykhad@mail.ru", password: "123456")
let user2 = User(firstName: "Andrey", lastName: "Matoshko", age: 18, login: "amat@mail.ru", password: "654321")

internal var currentUser = User(firstName: nil, lastName: nil, age: nil, login: nil, password: nil)

var dataBase: [User] = [user1, user2]


