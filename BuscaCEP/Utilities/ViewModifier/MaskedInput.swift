import SwiftUI

struct MaskedInput: ViewModifier {
    @Binding var text: String
    let mask: String

    func body(content: Content) -> some View {
        content
            .keyboardType(.numberPad)
            .onChange(of: text) { newValue in
                let digits = newValue.filter { $0.isNumber }
                let masked = applyMask(to: digits)
                if masked != text {
                    text = masked
                }
            }
    }

    private func applyMask(to digits: String) -> String {
        var result = ""
        var index = digits.startIndex
        for ch in mask {
            if index == digits.endIndex {
                break
            }
            if ch == "#" {
                result.append(digits[index])
                index = digits.index(after: index)
            } else {
                result.append(ch)
            }
        }
        return result
    }
}

extension View {
    func maskedInput(text: Binding<String>, mask: String) -> some View {
        self.modifier(MaskedInput(text: text, mask: mask))
    }
}
