//
//  ViewController.swift
//  Ahorcado
//
//  Created by DAM on 6/2/17.
//  Copyright © 2017 silverB. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate{
    
    var words = ["charmander","pikachu","greninja","bulbasaur","squirtle","arceus"]
    var images = [#imageLiteral(resourceName: "lisa_cuello.png"), #imageLiteral(resourceName: "lisa_brazo.png"), #imageLiteral(resourceName: "lisa_brazo.png"), #imageLiteral(resourceName: "lisa_cuerpo.png"), #imageLiteral(resourceName: "lisa_pierna.png"), #imageLiteral(resourceName: "lisa_piernas.png"), #imageLiteral(resourceName: "lisa_full.png")]
    var chars = Array<Character>()
    var fails = 0
    var chosenWord = [Character]()
    var chosenWordHiden = [Character]()
    
    
    
    

    @IBOutlet weak var word: UILabel!
    @IBOutlet weak var letter: UITextField!
    @IBOutlet weak var charsUsed: UILabel!
    @IBOutlet weak var hanged: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        letter.delegate = self
        iniciar()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func iniciar(){
        let random = Int(arc4random_uniform(UInt32(words.count)))
        chosenWord = Array(words[random].characters)
        
        for _ in 0 ... chosenWord.count-1{
            chosenWordHiden.append("_")
            chosenWordHiden.append(" ")
        }
        word.text = String(chosenWordHiden)
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let currentCharacterCount = textField.text?.characters.count ?? 0
        if (range.length + range.location > currentCharacterCount){
            return false
        }
        let newLength = currentCharacterCount + string.characters.count - range.length
        return newLength <= 1
    }


}

