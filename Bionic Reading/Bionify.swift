//
//  Bionify.swift
//  Bionic Reading
//
//  Created by Ingo Boehme on 09.02.23.
//

import SwiftUI

class Bionify {
    private var bionifiedText: Text = Text("")
    private let fixationFactor = 1.6
    
    var emphasized: Font = Font.system(size: 20, weight: .bold)
    var normal: Font = Font.system(size: 20, weight: .light)

    func getText() -> Text {
        return bionifiedText
    }
    static func text(_ lines: String, convert: Bool = true) -> Text {
        let bionify = Bionify()
        guard convert else {
            return Text(lines).font(bionify.normal)

        }
        for line in lines.split(separator: "\n") {
            bionify.bionifyLine(line: String(line))
        }
        return bionify.bionifiedText
    }

    func bionifyLine(line: String) {
        for word in line.split(separator: " ") {
            bionifiedText = bionifiedText + Text(" ")
            bionifyWord(word: String(word))
        }
    }

    func bionifyWord(word: String) {
        print("BioWord: \(word)")
        if word == "-" {
            bionifiedText = bionifiedText + Text("-")
        } else if word.contains("-") {
            for part in word.split(separator: "-") {
                bionifyWord(word: String(part))
              // FIXME:  bionifyWord(word: "-")
            }
// bioTokens.removeLast()

        } else {
            let fixation = _getFixation(word: word)
            let bionicText = Text(word.prefix(fixation)).font(emphasized) + Text(word.suffix(word.count - fixation)).font(normal)
            bionifiedText = bionifiedText + bionicText
        }
    }

    func _getFixation(word: String) -> Int {
        let wordStripped = word.filter {
            let char = $0.unicodeScalars.first!
            return !CharacterSet.punctuationCharacters.contains(char)
        }

        let wordLength = Double(wordStripped.count)
        let fixation = Int(wordLength / fixationFactor)
        return fixation == 0 ? 1 : fixation
    }
}
