import SwiftUI


struct ContentView: View {
    
    @State private var score = 0
    
    var body: some View {
        NavigationView{
            Text("Score: \(score)")
                .navigationBarTitle("Navigation")
                .navigationBarItems(
                    leading:
                        Button("Subtract 1"){
                            self.score -= 1
                    },
                    trailing: //you can put a V/HStack and stack buttons on the same side
                        Button("Add 1"){
                            self.score += 1
                    }
                )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
