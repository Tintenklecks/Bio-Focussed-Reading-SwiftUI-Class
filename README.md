# Bionic-Reading-SwiftUI-Class
This is a simple SwiftUI implementation of the Bionic Reading(R) algorithm. It is based on the fact that emphasized text attracts your eye more. By emphasizing the beginning of important words (and sparing out fillers like and or ...) the reading speed increases drastically

| try to read this text      | Compared to this one |
| ----------- | ----------- |
| ![Simulator Screen Shot - iPhone 14 Pro - 2023-02-09 at 15 25 02](https://user-images.githubusercontent.com/1047547/217840085-404e8734-986c-4be2-b7aa-3e9324aefc84.png)  | ![Simulator Screen Shot - iPhone 14 Pro - 2023-02-09 at 15 25 05](https://user-images.githubusercontent.com/1047547/217840155-e0941689-c7c0-41cc-abf3-15b406d60237.png) |
|    |         |


The use of the class  is pretty easy. The static func 

FastReading.text("Some Text to display")

returns a SwiftUI struct of type Text.

The second parameter is a boolean parameter, wether it should be "modified" to be fast readable

    @State private var fastReading: Bool = false
    //...
    var body: some View {
       FastReading.text(text, convert: fastReading)
    }      
