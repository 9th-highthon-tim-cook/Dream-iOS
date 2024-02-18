import Combine


final class SceneState: ObservableObject {
    enum Scene {
        case home
        case login
    }
    @Published var scene = Scene.login
}
