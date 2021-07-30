
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
                     //but after a certain period of time hide it again
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                        self.isShowingDetailView = false //hiding
                    }
                }
            }
        .navigationBarTitle("Navigation")
        }
    }
}
//WITH SELECTION
struct ContentView: View {
    
    @State private var selection: String? = nil
    
    var body: some View {
        NavigationView{
            VStack(spacing: 30){
                NavigationLink(destination: Text("Second view"), tag: "Second", selection: $selection){EmptyView()}
                NavigationLink(destination: Text("Third view"), tag: "Third", selection: $selection){EmptyView()}
                
                Button("Tap to show second"){
                    //more code
                    self.selection = "Second"
                }
                Button("Tap to show third"){
                    //more code
                    self.selection = "Third"
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
