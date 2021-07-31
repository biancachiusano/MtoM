
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

//Interpolating Spring
    @State private var angle: Double = 0

    var body: some View {
        Button("Press here") {
            angle += 45
        }
        .padding()
        .rotationEffect(.degrees(angle))
        .animation(.interpolatingSpring(mass: 1, stiffness: 1, damping: 0.5, initialVelocity: 10), value: angle)
    }
