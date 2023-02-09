//
//  Fast Reading
//
//  Created by Ingo Boehme on 09.02.23.
//

import SwiftUI

extension Font {
    static var fastReadingEmphasized = Font.system(size: 20, weight: .bold)
    static var fastReadingNormal = Font.system(size: 20, weight: .light)
}

// MARK: - FastReading

class FastReading {
    // MARK: - static class methods -

    static func text(_ lines: String, convert: Bool = true) -> Text {
        FastReading().text(lines, convert: convert)
    }

    // MARK: - object methods -

    func text(_ lines: String, convert: Bool = true) -> Text {
        guard convert else {
            return Text(lines).font(.fastReadingNormal)
        }
        for line in lines.split(separator: "\n") {
            frLine(line: String(line))
        }
        return fastReadText
    }

    func frLine(line: String) {
        for word in line.split(separator: " ") {
            fastReadText = fastReadText + Text(" ")
            frWord(word: String(word))
        }
    }

    func frWord(word: String) {
        if word == "-" {
            fastReadText = fastReadText + Text("-")
        } else if word.contains("-") {
            for part in word.split(separator: "-") {
                frWord(word: String(part))
                // FIXME: frWord(word: "-")
            }
            // tokens.removeLast()

        } else {
            let fixation = _getFixation(word: word)
            let fastText = Text(word.prefix(fixation))
                .font(.fastReadingEmphasized)
            + Text(word.suffix(word.count - fixation))
                .font(.fastReadingNormal)
            
            fastReadText = fastReadText + fastText
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

    private var fastReadText = Text("")
    private let fixationFactor = 1.6
}
