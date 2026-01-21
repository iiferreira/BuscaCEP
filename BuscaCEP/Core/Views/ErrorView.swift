
import SwiftUI

struct ErrorView: View {
    
    @State var error : String
    
    var body: some View {
        VStack {
            Spacer()
            ContentUnavailableView(Constants.errorViewText().errorMessage, systemImage: "exclamationmark.triangle", description: Text(error).foregroundStyle(.red))
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .transition(.opacity)
    }
}
