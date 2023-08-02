import Foundation
import SwiftUI

class RockPaperScissorsViewModel: ObservableObject {
    @Published private(set) var computerScore = 0
    @Published private(set) var ties = 0
    @Published private(set) var playerScore = 0
    
    @Published private(set) var computerWeapon: String?
    @Published private(set) var playerWeapon: String?
    
    var result: GameResult? {
        guard let computerWeapon = computerWeapon, let playerWeapon = playerWeapon else { return nil }
        
        guard let result = compareWeapons(computerWeapon: computerWeapon, playerWeapon: playerWeapon) else {
            return .tie
        }
        
        return result ? .win : .lose
    }
    
    var resultTitle: String? {
        switch result {
        case .lose: return "You lose! 😞"
        case .win: return "You win! 😄"
        case .tie: return "All tied up! 🟰"
        default: return nil
        }
    }
    
    var resultColor: Color? {
        switch result {
        case .lose: return .red
        case .win: return .green
        case .tie: return .yellow
        default: return nil
        }
    }
    
    func weaponChosen(weapon: String) {
        playerWeapon = weapon
        chooseComputerWeapon()
        updateScore(result: result)
    }
    
    func chooseComputerWeapon() {
        computerWeapon = ["🪨", "📄", "✂️"].randomElement()!
    }
    
    func simulate(times: Int, weapon: String) {
        for _ in 0 ..< times {
            self.weaponChosen(weapon: weapon)
        }
    }
    
    private func updateScore(result: GameResult?) {
        switch result {
        case .lose: computerScore += 1
        case .win: playerScore += 1
        case .tie: ties += 1
        default: break
        }
    }
    
    private func compareWeapons(computerWeapon: String, playerWeapon: String) -> Bool? {
        guard computerWeapon != playerWeapon else { return nil }
        
        switch (computerWeapon, playerWeapon) {
        case ("🪨", "📄"): return true
        case ("📄", "✂️"): return true
        case ("✂️", "🪨"): return true
        default: return false
        }
    }
}
