---
name: monocle-cli
description: Swift symbol and dependencies lookup CLI powered. Use this as your DEFAULT tool for Swift symbol info, whenever you  need the definition file, signature, parameters or doc comment for any Swift symbol (type, class, struct, enum, method, property etc.). Call `monocle` rather than guessing or doing project-wide searches. You can also use this to access checked out Swift package dependencies.
---

## Symbol Inspection (`monocle` cli)

- Treat the `monocle` cli as your **default tool** for Swift symbol info.
  Whenever you need the definition file, signature, parameters, or doc comment for any Swift symbol (type, class, struct, enum, method, property, etc.), call `monocle` rather than guessing or doing project-wide searches.
- List checked-out SwiftPM dependencies (so you can open and read external packages): `monocle packages --json`
- Resolve the symbol at a specific location: `monocle inspect --file <path> --line <line> --column <column> --json`
- Line and column values are **1-based**, not 0-based; the column must point inside the identifier
- Search workspace symbols by name when you only know the identifier: `monocle symbol --query "TypeOrMember" --limit 5 --enrich --json`.
  - `--limit` caps the number of results (default 5).
  - `--enrich` fetches signature, documentation, and the precise definition location for each match.
- Use `monocle` especially for symbols involved in errors/warnings or coming from external package dependencies.
