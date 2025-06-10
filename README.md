# ☕ CoffeeAI

> An intelligent coffee recommendation app powered by Apple Intelligence

![CoffeeAI Hero Image](coffee-ai-hero.png)

## 🚀 Overview

CoffeeAI is a SwiftUI application that demonstrates the power of Apple's new FoundationModels framework introduced at WWDC 2025. The app uses custom tools with language models to provide personalized coffee recommendations based on user preferences.

This project is a companion to the article: [**Tool calling with Apple Intelligence**](https://alexanderlogan.co.uk/blog/wwdc25/02-apple-intelligence-tools)

## ✨ Features

- **Intelligent Recommendations**: Uses Apple Intelligence to understand user preferences and recommend the perfect coffee
- **Custom Tool Integration**: Implements a `CoffeeTool` that augments the language model with domain-specific knowledge
- **Real-time Streaming**: Displays recommendations as they're generated using async/await
- **SwiftUI Interface**: Clean, modern UI built with SwiftUI

## 🛠️ Technical Highlights

- Built with Apple's new `FoundationModels` framework
- Demonstrates tool calling capabilities in Apple Intelligence
- Uses `@Generable` and `@Guide` property wrappers for structured output
- Implements streaming responses with `streamResponse`
- Follows best practices for Apple Intelligence integration

## 📱 Requirements

- Xcode 16.0 or later
- iOS 18.0+ / macOS 15.0+
- Apple Intelligence-capable device

## 🚦 Getting Started

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/coffeeai.git
   ```

2. Open `coffeeai.xcodeproj` in Xcode

3. Build and run the project on a compatible device or simulator

## 🎯 Usage

Simply type in your coffee preferences, and the AI will recommend the perfect coffee from Alex's Coffee shop menu. The app considers factors like:

- Milk preferences
- Taste preferences
- Strength requirements
- Any specific requests

## 📖 Learn More

For a detailed explanation of how this app works and how to build your own Apple Intelligence tools, check out the full article: [Tool calling with Apple Intelligence](https://alexanderlogan.co.uk/blog/wwdc25/02-apple-intelligence-tools)

## 🤝 Contributing

Contributions are welcome! Feel free to open issues or submit pull requests.

## 📄 License

This project is available under the MIT license. See the LICENSE file for more info.

---

Built with ❤️ and ☕ by [Alex Logan](https://alexanderlogan.co.uk)