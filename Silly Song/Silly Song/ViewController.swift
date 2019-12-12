//
//  ViewController.swift
//  Silly Song
//
//  Created by aswini sridhar on 12/12/2019.
//  Copyright © 2019 aswini sridhar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lyricsView: UITextView!
    
    @IBAction func reset(sender: AnyObject) {
        self.nameField.text = ""
        self.lyricsView.text = ""
    }

    @IBAction func displayLyrics(sender: AnyObject) {
        lyricsView.text = String(lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: nameField.text ?? ""))
        print(String(lyricsView.text!))
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
    }
}

let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joined(separator: "\n")


func shortNameFromName(name: String) -> String {
    let lowerName = name.lowercased()
    let vowelSet = CharacterSet(charactersIn: "aeiou")
    let index = lowerName.rangeOfCharacter(from: vowelSet)!.lowerBound
    return String(lowerName[index...])
}

func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
    let shortName = shortNameFromName(name: fullName)
    var lyrics = lyricsTemplate.replacingOccurrences(of: "<SHORT_NAME>", with: shortName)
    lyrics = lyrics.replacingOccurrences(of: "<FULL_NAME>", with: fullName)
    return lyrics
}

func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return false
}
