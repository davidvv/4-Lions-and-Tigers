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
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextBarButtonItemPressed(sender: UIBarButtonItem) {
        
        
        var randomIndex:Int //declaro la variable randomIndex
        
        do{randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
        }while randomIndex == currentIndex
        
        currentIndex = randomIndex
        
        //arriba he declarado currentIndex como propiedad. Tiene un valor inicial 0 y despues toma el valor de randomIndex. De esa manera, si al darle al botón y generar un nuevo randomIndex, es igual que el último ( que está guardado en currentIndex, repite el proceso de generación de randomIndex hasta que sea diferente
        

        
        
        let tiger = myTigers[randomIndex]
        
//        myImageView.image = tiger.image
//        nameLabel.text = tiger.name
//        ageLabel.text = "\(tiger.age)"
//        breedLabel.text = tiger.breed
        
        UIView.transitionWithView(self.view, duration: 1, options: UIViewAnimationOptions.TransitionCrossDissolve, animations:{
            
            //en lugar de hacer que se muestre un bicho cualquiera al apretar el botón, hago que además entre con una animación, por eso he comentado ahí arriba las 4 lineas. Tengo que utilizar ".self":
            self.myImageView.image = tiger.image
            self.nameLabel.text = tiger.name
            self.ageLabel.text = "\(tiger.name) is \(tiger.age) years old"
            self.breedLabel.text = tiger.breed
            self.randomFactLabel.text = tiger.randomFact()
            
            },completion: {
                (finished: Bool) -> () in
        })
        
        func updateAnimal(){
            switch currentAnimal{
            case ("Tiger", _): let randomIndex = Int(arc4random_uniform(UInt32(lions.count)))
            currentAnimal = ("Lion", randomIndex)
            
            default: let randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
            currentAnimal = ("Tiger", randomIndex)
                
            }
        }
        
        
    }

}

