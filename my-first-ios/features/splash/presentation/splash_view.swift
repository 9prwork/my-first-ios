import SwiftUI

struct SplashView: View {
    var onFinished: () -> Void

    @State private var isAnimating = false

    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "book.fill")
                .font(.system(size: 60))
                .foregroundStyle(.blue)
                .scaleEffect(isAnimating ? 1.0 : 0.5)
                .opacity(isAnimating ? 1.0 : 0.0)

            Text("My Books")
                .font(.largeTitle)
                .fontWeight(.bold)
                .opacity(isAnimating ? 1.0 : 0.0)
        }
        .animation(.easeOut(duration: 0.8), value: isAnimating)
        .onAppear {
            isAnimating = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                onFinished()
            }
        }
    }
}
