// Created 16.01.23

import SwiftUI

// MARK: - ContentView

struct ContentView: View {
    @State private var bionic: Bool = false

    var body: some View {
        ScrollView {
            Button("Change to \(bionic ? "Normal" : "Bionic") Text") {
                withAnimation {
                    bionic.toggle()
                }
            }
            VStack {
                Bionify.text(text.trimmingCharacters(in: .whitespacesAndNewlines), convert: bionic)
                    .animation(.easeInOut, value: bionic)
                Spacer()
            }
            .padding()
        }
    }

    @State private var text = """
    Good afternoon everyone! I hope you're all ready for a lesson in using the power of artificial intelligence to take your mobile app development game to the next level. But first, let me ask you this: Why did the programmer quit his job? He didn't get arrays. [pause for laughter]

    Okay, let's get down to business.

    [Intro to ChatGPT]
    For those of you who may not be familiar with it, ChatGPT is an AI language model developed by OpenAI. It's capable of generating text based on the input it receives, making it a valuable tool for a variety of applications, including mobile app development.

    [Benefits of using ChatGPT for mobile app development]
    So, why use ChatGPT for developing mobile apps, you ask? Well, for starters, it can help you generate code snippets and sample templates, saving you time and effort. Additionally, it can provide suggestions for app features, user interface designs, and even marketing strategies. It's like having your own personal AI development assistant!

    [How to use ChatGPT in practice]
    Using ChatGPT for your mobile app development is simple. All you need to do is provide it with a prompt, such as "generate code for a login page in React Native", and ChatGPT will generate the relevant code for you. You can then use this code as a starting point for your own development process.

    [Conclusion]
    In conclusion, ChatGPT is a powerful tool that can greatly enhance your mobile app development process. So, next time you're feeling stuck or need a new idea, give ChatGPT a try and see the difference it can make.

    And that's a wrap! Thank you for listening and have a great day!


    """
}

// MARK: - ContentView_Previews

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
