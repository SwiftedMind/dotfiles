# General Coding Guidelines

- Write clean, readable and well-structured code.

## Naming Conventions

Use **clear, descriptive, English‑like** names for all identifiers. **Do not** use compressed or “python‑esque” abbreviations.

## Requirements

- Prefer clarity over brevity; longer names are fine if they improve readability.
- Spell words out: `memory`, `argument`, `attribute`, `configuration`, `request`, `response`.
- Booleans read as predicates: `isEnabled`, `hasPendingItems`, `shouldRetry`.
- Use argument labels to clarify meaning (Swift style): `loadProfile(from url: URL)`.
- Avoid vague catch‑alls: `data`, `info`, `obj`, `tmp`, `flag`.
- **Never** use cryptic names like `mem`, `arg`, `att`, `cfg`, `req`, `res`, `usr`, `env`, `fn`, `val`, `arr`, `dict`.
- **Allowed abbreviations only:** `id`, `URL`, `UUID`, `JSON`, `HTTP`, `API`, and `x`/`y` for coordinates; `i`/`j` as simple loop indices **only**.
- If an abbreviation is not on the allowed list, **spell it out**.

## Swift Projects

- Design UI in a way that is idiomatic for the iOS platform and follows Apple Human Interface Guidelines.
- Use the most modern iOS APIs.
- In SwiftUI views, always place helper functions below the body and other viewbuilder properties.
- In SwiftUI views, declare all properties a var instead of let.
- Use modern Swift 6 Concurrency.
- In SwiftUI, use LocalizedStringKey by passing string literals; don’t wrap with String(localized:).
- Use String(localized:) only when no LocalizedStringKey initializer exists, or for pre-localized values outside SwiftUI (e.g., model/error strings).
- Use the #Preview macro for SwiftUI previews.
- The projects use the new String Catalog, so NEVER use traditional "keys" for texts. Simply use Text() and LocalizedStringKey with the English translation.
- Use triple-shasl (///) for documentation comments
