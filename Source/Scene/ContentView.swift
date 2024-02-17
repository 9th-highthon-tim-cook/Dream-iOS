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
            NavigationStack {
                MyPageView()
            }
            .tag(2)
            .tabItem {
                Label {
                    Text("마이페이지")
                } icon: {
                    Image(systemName: "person.circle.fill")
                }
            }
        }
        .accentColor(Color(.neturalBlack))
    }
}
