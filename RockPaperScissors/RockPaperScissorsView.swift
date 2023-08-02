import SwiftUI

struct RockPaperScissorsView: View {
    @ObservedObject var viewModel: RockPaperScissorsViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                HStack(alignment: .bottom) {
                    ScoreView(color: .blue, image: "desktopcomputer", title: viewModel.computerScore)
                    ScoreView(color: .yellow, image: "equal.square.fill", title: viewModel.ties)
                    ScoreView(color: .red, image: "person.fill", title: viewModel.playerScore)
                }
                .fixedSize(horizontal: false, vertical: true)
                
                Spacer()
                
                VStack {
                    if let weapon = viewModel.computerWeapon {
                        Text(weapon)
                            .font(.system(size: 150))
                    } else {
                        Text("Please choose a weapon...")
                            .padding(.vertical, 50)
                    }
                    
                    if let resultTitle = viewModel.resultTitle {
                        Text(resultTitle)
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(viewModel.resultColor)
                    }
                }
                
                Spacer()
                
                HStack {
                    Button("🪨") {
                        viewModel.weaponChosen(weapon: "🪨")
                    }
                    .font(.system(size: 50))
                    .padding(20)
                    
                    Button("📄") {
                        viewModel.weaponChosen(weapon: "📄")
                    }
                    .font(.system(size: 50))
                    .padding(20)
                    
                    Button("✂️") {
                        viewModel.weaponChosen(weapon: "✂️")
                    }
                    .font(.system(size: 50))
                    .padding(20)
                }
                
                Button("Simulate 1000 rocks") {
                    viewModel.simulate(times: 1000, weapon: "🪨")
                }
            }
            .navigationTitle("Rock, Paper, Scissors")
            .padding(10)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = RockPaperScissorsViewModel()
        RockPaperScissorsView(viewModel: viewModel)
    }
}
