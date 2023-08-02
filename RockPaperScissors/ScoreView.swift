import Foundation
import SwiftUI

struct ScoreView: View {
    let color: Color
    let image: String
    let title: Int
    
    var body: some View {
        HStack {
            Spacer()
            HStack {
                VStack {
                    Image(systemName: image)
                    Spacer()
                    Text("\(title)")
                }
                .font(.largeTitle)
            }
            Spacer()
        }
        .padding(10)
        .background {
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(color)
        }
    }
}
