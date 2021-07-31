
//Rotation
struct ContentView: View {
     @State private var angle: Double = 0

      var body: some View {
          Button("Press here") {
            self.angle += 45
          }
          .padding()
          .rotationEffect(.degrees(angle))
          .animation(.spring(), value: angle)
      }
}
