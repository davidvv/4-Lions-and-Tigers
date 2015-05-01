//
//  ViewController.swift
//  Lions and Tigers
//
//  Created by David Vences Vaquero on 27/2/15.
//  Copyright (c) 2015 David. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var breedLabel: UILabel!
    @IBOutlet weak var randomFactLabel: UILabel!
    
    //defino myTigers como Property, para que esté accesible dentro de todas las funciones (las de botones, así como la de viewDidLoad() y demás
    var myTigers:[Tiger] = []
    var lions:[Lion] = []
    var lionCubs:[LionCub] = []

    //defino una variable currentIndex para evitar que se muestre siempre el mismo gato
    var currentIndex = 0
    
    //defino un Tuple para guardar el animal mostrado actualmente
    var currentAnimal = (Species: "Tiger", Index: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var myTiger = Tiger()
        myTiger.name = "Tigger"
        myTiger.age = 3
        myTiger.breed = "Bengal"
        myTiger.image = UIImage(named: "BengalTiger.jpg")
        //actualizo la edad de myTiger utilizando la función que he creado dentro de la struct Tiger.swift
        myTiger.age = myTiger.ageInTigerYearsFromAge(myTiger.age)
        
        myTiger.chuff()
        myTiger.chuffANumberOfTimes(5, isLoud: false)
    
        
        //puedo añadir tigres a mi property "myTigers" en cualquier momento, porque definí arriba myTigers como una property para entidades de Tiger.swift
        myTigers.append(myTiger)
        
        println("myTiger's name is \(myTiger.name), its' age is \(myTiger.age), its' breed is \(myTiger.breed) and my image is \(myTiger.image!)")
        
        self.myImageView.image = myTiger.image
        self.nameLabel.text = myTiger.name
        self.ageLabel.text = "\(myTiger.age) years old"
        self.breedLabel.text = myTiger.breed
        self.randomFactLabel.text = myTiger.randomFact()
        
        var secondTiger =  Tiger()
        secondTiger.name = "Tigress"
        secondTiger.age = 2
        secondTiger.breed = "Indochinese tiger"
        secondTiger.image = UIImage(named: "IndochineseTiger.jpg")
        
        secondTiger.age = secondTiger.ageInTigerYearsFromAge(secondTiger.age)
        
        var thirdTiger = Tiger()
        thirdTiger.name = "Jacob"
        thirdTiger.age = 4
        thirdTiger.breed = "Malayan Tiger"
        thirdTiger.image = UIImage(named: "malayanTiger.jpg")
        
        thirdTiger.age = thirdTiger.ageInTigerYearsFromAge(thirdTiger.age)
        
        var fourthTiger = Tiger()
        fourthTiger.name = "Spar"
        fourthTiger.age = 5
        fourthTiger.breed = "Siberian Tiger"
        fourthTiger.image = UIImage(named: "SiberianTiger.jpg")
        
        fourthTiger.age = fourthTiger.ageInTigerYearsFromAge(fourthTiger.age)
        
        //las otras instancias de tigres que he generado, las puedo unir también al array myTigers
        
        myTigers += [secondTiger, thirdTiger, fourthTiger]
        
        myTiger.chuffANumberOfTimes(3)
        
        var lion = Lion()
        lion.age = 4
        lion.isAlphaMale = false
        lion.image = UIImage(named: "Lion.jpg")
        lion.name = "Mufasa"
        lion.subspecies = "West African"
        
        var lioness = Lion()
        lioness.age = 3
        lioness.isAlphaMale = false
        lioness.image = UIImage(named: "Lioness.jpeg")
        lioness.name = "Sarabi"
        lioness.subspecies = "Barbary"
        
        self.lions += [lion, lioness]
        
        lion.roar()
        lioness.roar()
        
        lion.changeToAlphaMale()
        println(lion.isAlphaMale)
        
        var lionCub = LionCub()
        lionCub.name = "Simba"
        lionCub.age = 1
        lionCub.image = UIImage(named: "LionCub1.jpg")
        lionCub.subspecies = "Masai"
        lionCub.isAlphaMale = true
        
        lionCub.roar()
        lionCub.rubLionCubsBelly()
        
        var femaleLionCub = LionCub()
        femaleLionCub.name = "Nala"
        femaleLionCub.age = 1
        femaleLionCub.image = UIImage(named: "LionCub2.jpeg")
        femaleLionCub.subspecies = "Transvaal"
        femaleLionCub.isAlphaMale = false
        
        self.lionCubs += [lionCub, femaleLionCub]
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextBarButtonItemPressed(sender: UIBarButtonItem) {
        updateAnimal()
        updateView()
        }
    
    
        func updateAnimal(){
            switch currentAnimal{
            case ("Tiger", _): let randomIndex = Int(arc4random_uniform(UInt32(lions.count)))
            currentAnimal = ("Lion", randomIndex)
            
            case ("Lion", _): let randomIndex = Int(arc4random_uniform(UInt32(lionCubs.count)))
            currentAnimal = ("Lion Cub", randomIndex)
            
            default: let randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
            currentAnimal = ("Tiger", randomIndex)
                
            }
        }
    func updateView(){
        

        
        UIView.transitionWithView(self.view, duration: 0.5, options: UIViewAnimationOptions.TransitionCrossDissolve, animations:{
            if self.currentAnimal.Species == "Tiger" {
                let tiger = self.myTigers[self.currentAnimal.Index]
                self.myImageView.image = tiger.image
                self.nameLabel.text = tiger.name
                self.ageLabel.text = "\(tiger.age) years old"
                self.breedLabel.text = tiger.breed
                self.randomFactLabel.text = tiger.randomFact()
                
            } else if self.currentAnimal.Species == "Lion" {
                let lion = self.lions[self.currentAnimal.Index]
                self.myImageView.image = lion.image
                self.nameLabel.text = lion.name
                self.ageLabel.text = "\(lion.age) years old"
                self.breedLabel.text = lion.subspecies
                self.randomFactLabel.text = lion.randomFact()
                
            } else if self.currentAnimal.Species == "Lion Cub" {
                let lionCub = self.lionCubs[self.currentAnimal.Index]
                self.myImageView.image = lionCub.image
                self.nameLabel.text = lionCub.name
                self.ageLabel.text = "\(lionCub.age) years old"
                self.breedLabel.text = lionCub.subspecies
                self.randomFactLabel.text = lionCub.randomFact()
                
            }
            
            
            },completion: {
                (finished: Bool) -> () in
        })

    }

    
}

