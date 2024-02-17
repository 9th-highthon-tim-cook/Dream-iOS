import SwiftUI

struct ContentView: View {
    @State var selection = 0
    var body: some View {
        TabView(selection: $selection) {
            NavigationStack {
                HomeView()
            }
            .tag(0)
            .tabItem {
                Label {
                    Text("홈")
                } icon: {
                    Image(systemName: "house.fill")
                }
            }
        }
        .accentColor(Color(.neturalBlack))
    }
}
