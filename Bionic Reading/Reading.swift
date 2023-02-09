// Created 16.01.23

import Foundation
import SwiftUI

class Bionic: ObservableObject {
    @Published var bioText = Text("")

    func setText(_ s: String) {
        bioText = Bionify.text(s)
    }
}
