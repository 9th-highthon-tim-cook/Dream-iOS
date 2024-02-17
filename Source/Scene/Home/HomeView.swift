import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            HStack {
                
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Image(.timeMarketLogo)
            }

            ToolbarItem(placement: .topBarTrailing) {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(Color(.neturalBlack))
            }
        }
    }

    @ViewBuilder
    func categoryButton(
        title: String,
        @ViewBuilder icon: () -> some View
    ) -> some View {
        HStack(spacing: 6) {
            icon()

            Text(title)
        }
    }
}
