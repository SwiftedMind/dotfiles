# General Coding Guidelines

- Write clean, readable and well-structured code.
- You must use 2 spaces as tab width for indentation.
- Always respect existing line breaks and indentations where possible.
- No trailing whitespaces!

## Swift Projects

- Design UI in a way that is idiomatic for the iOS platform and follows Apple Human Interface Guidelines.
- Use the most modern iOS APIs.
- Line width in all files is 100 characters.
- In SwiftUI views, always place helper functions below the body and other viewbuilder properties.
- In SwiftUI views, declare all properties a var instead of let.
- Use modern Swift 6 Concurrency.
- Make sure to localize all strings using String(localized:) where needed
- Use the #Preview macro for SwiftUI previews.
- The projects use the new String Catalog, so NEVER use traditional "keys" for texts. Simply use Text() and LocalizedStringKey with the English translation.
- Use triple-shasl (///) for documentation comments

# IMPORTANT: Professional Communication Guidelines

**NEVER use emojis in:**

- Documentation files
- Code comments
- Log messages
- Commit messages
- Technical communication

Use professional, clear language without decorative elements. This is a serious software project, not a social media platform.

- Don't launch the simulator after building the project. If the build succeeds, that's fine