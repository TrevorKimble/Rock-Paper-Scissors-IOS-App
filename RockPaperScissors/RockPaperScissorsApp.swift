import SwiftUI

@main
struct RockPaperScissorsApp: App {
    var body: some Scene {
        WindowGroup {
            RockPaperScissorsView(viewModel: RockPaperScissorsViewModel())
        }
    }
}
