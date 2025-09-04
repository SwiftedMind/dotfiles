# Claude Command: Changelog

This command helps you maintain well-structured, concise changelog entries for the SwiftAgent project.

## Usage

To work with changelog entries, just type:

```
/changelog
```

## What This Command Does

1. Analyzes recent commits and changes to understand what needs to be documented
2. Reviews the existing `[Upcoming]` section in CHANGELOG.md to understand current progress
3. Adds new entries to the appropriate sections (Added, Changed, Fixed, Enhanced)
4. Ensures consistent formatting and style with existing entries
5. Provides code examples where appropriate for significant new features

## Changelog Structure

All new changes go into the `[Upcoming]` section at the top of CHANGELOG.md with these subsections:

### Sections (in order)
- **Added**: New features, capabilities, or major functionality
- **Changed**: Changes to existing functionality (especially breaking changes)
- **Fixed**: Bug fixes and issue resolutions  
- **Enhanced**: Improvements to existing features (non-breaking)

## Writing Guidelines

### Style and Voice
- Use **bold titles** followed by a colon for each entry
- Write in past tense ("Added", "Fixed", "Improved")
- Be concise but descriptive - one sentence summary followed by technical details if needed
- Focus on user-facing impact, not internal implementation details
- Include code examples for significant new APIs or breaking changes

### Entry Format
```markdown
- **Feature Name**: Brief description of what was added/changed/fixed, focusing on user benefits and impact.
```

### Code Examples
Include code examples for:
- New public APIs
- Breaking changes that require migration
- Complex features that benefit from usage demonstration
- Features with specific syntax or patterns

Example code should be:
- Concise and focused on the new feature
- Include relevant imports
- Show realistic usage scenarios
- Use proper Swift formatting with 2-space indentation

### Content Guidelines

**Added Section:**
- New public APIs, classes, methods, or protocols
- Major new features or capabilities  
- New configuration options or parameters
- New modules or significant architectural additions

**Changed Section:**
- Breaking changes to existing APIs
- Renamed types, methods, or parameters
- Changes to default behavior
- Structural changes that affect user code

**Fixed Section:**
- Bug fixes that affect user experience
- Performance improvements (use "performance" keyword)
- Resolved issues with existing functionality
- Corrections to previous behavior

**Enhanced Section:**
- Improvements to existing features
- Better error messages or logging
- Performance optimizations
- Code quality improvements that have user-facing benefits

## Examples

### Good Added Entry:
```markdown
- **Token Usage Tracking and Reporting**: Added token usage monitoring across all AI interactions with logging and programmatic access to usage metrics.

  ```swift
  let response = try await session.respond(to: "What's the weather?")
  
  // Access aggregated token usage from the response
  if let usage = response.tokenUsage {
    print("Total tokens used: \(usage.totalTokens ?? 0)")
    print("Input tokens: \(usage.inputTokens ?? 0)")
    print("Output tokens: \(usage.outputTokens ?? 0)")
    print("Cached tokens: \(usage.cachedTokens ?? 0)")
    print("Reasoning tokens: \(usage.reasoningTokens ?? 0)")
  }
  ```
```

### Good Fixed Entry:
```markdown
- **JSON Encoding Determinism**: Enabled sorted keys in OpenAI JSON encoder to ensure consistent property ordering in tool schemas, preventing cache misses and improving prompt caching effectiveness.
```

### Good Changed Entry:
```markdown
- **Breaking Change**: Renamed nearly all the types in the SDK to close align with FoundationModels types. `Agent` is now `ModelSession`, and `OpenAIAgent` is now `OpenAISession`:
  ```swift
  import OpenAISession
  
  // Create an OpenAI session through the ModelSession type
  let session = ModelSession.openAI(
    tools: [WeatherTool(), CalculatorTool()],
    instructions: "You are a helpful assistant.",
    apiKey: "sk-...",
  )
  ```
```

## Breaking Changes

For breaking changes:
- Always prefix with "**Breaking Change**:" 
- Place in the "Changed" section
- Provide before/after code examples
- Explain the migration path clearly

## Version Management

- All new entries go in `[Upcoming]` section
- When releasing, rename `[Upcoming]` to the version number (e.g., `[0.6.0]`)
- Create a new empty `[Upcoming]` section for future changes
- Maintain chronological order (newest versions at top)

## Important Notes

- Review existing entries for consistency in tone and format
- Avoid duplicating information - merge related changes when appropriate
- Focus on what users need to know, not internal implementation details
- Keep entries scannable - use bold headers and concise descriptions
- Update the changelog immediately when making significant changes, don't batch them