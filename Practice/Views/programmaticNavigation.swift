
//WITH BOOLEAN
struct ContentView: View {
    
    @State private var isShowingDetailView = false
    
    var body: some View {
        NavigationView{
            VStack(spacing: 30){
                NavigationLink(destination: Text("Second view"), isActive: $isShowingDetailView){EmptyView()}
                Button("Tap to show detail"){
                    //more code
                    self.isShowingDetailView = true
                }
            }
        .navigationBarTitle("Navigation")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
