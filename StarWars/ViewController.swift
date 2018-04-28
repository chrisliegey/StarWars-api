//
//  ViewController.swift
//  StarWars
//
//  Created by Christophe Jean Liegey (Étudiant) on 18-04-21.
//  Copyright © 2018 Christophe Jean Liegey (Étudiant). All rights reserved.
//

import UIKit
import Alamofire


class ViewController: UIViewController {
    
    let baseURL = "https://swapi.co/api/"
    let getPersonEndPoint = "people/"
    
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // instance de Person
        let person = Person(name: "Luke", height: 180)
        let person2 = Person(name: "Toto", height: 185)
        print(person)
        
        // print avec getter car private = accessible avec getter seulement
        print(person.getName())
        
        
        label1.text = person.name
        label2.text = "\(person.mass)"
        label3.text = person.hairColor.rawValue
        label4.text = person.homeWorld
        
        // création d'un objet URL (string)
        let getPersonURL = URL(string: baseURL + getPersonEndPoint)!
        Alamofire.request(getPersonURL).responseJSON { response in
            if response.result.isSuccess {
                print("This was a succes!!!")
            }
            else {
                print("Oh non, there is an aerror")
            }
            
            
            let json = response.value
            print(json)
        }
    }
}


enum HairColor: String {
    case light
    case brown
    case dark
    case blond
}



struct Person {
    var name: String = ""
    var height: Int = 0
    var mass: Int = 0
    var hairColor: HairColor = .blond
    var skinColor: String = ""
    var eyeColor: String = ""
    var gender: String = ""
    var homeWorld: String = ""
    
    
    /*init() {
     self .name = "Luke"
     self .height = 123
     self .mass = 11
     self .hairColor = "Blond"
     self .skinColor = "Light"
     self .eyeColor = "Blue"
     self .gender = "Male"
     self .homeWorld = "www.google.com"
     }
     */
    
    init(name: String, height: Int) {
        self .name = name
        self.height = height
    }
    
    // getter pour le name
    func getName() -> String {
        return self.name
    }
    
}



