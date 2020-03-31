import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome to your personal Task Manager")
                    .font(.system(.largeTitle, design: .rounded))
                    .padding(.bottom, 70)
                    .multilineTextAlignment(.center)
                Text("Start making todo lists!")
                    .padding(.bottom, 100)
                NavigationLink(destination: ContentView3()) {
                        Text("Get Started!")
                            .padding(.bottom, 150)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .colorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
