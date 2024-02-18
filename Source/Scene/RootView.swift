import SwiftUI

struct RootView: View {
    @EnvironmentObject var sceneState: SceneState

    var body: some View {
        switch sceneState.scene {
        case .login:
            OnboardingView()

        case .home:
            HomeView()
        }
    }
}
