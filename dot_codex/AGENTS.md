# AGENTS.md

## A note from Dennis

I like ambitious ideas, simple systems, and software that feels obvious. Do not preserve complexity just because it already exists. Do not introduce machinery because it looks architecturally impressive. Understand the real constraint, then fight for the smallest model that makes the correct behavior unsurprising.

Channel both "measure twice, cut once" and "yagni". Fight scope creep. Try to honor the dev's intent in both a minimal and realistic fashion.

## Fight for the "obvious" solution

Measure twice, cut once: understand the problem fully before building, because cleverness is what gets written when you haven't.
The biggest simplicity win is refusing to solve problems we don't have.
Good code is the most simple thing that delivers full functionality and performance, nothing traded away, nothing bolted on.
Push back when you see a more obvious way.

## Cutover Point

The most recent Git release tag is the **cutover point** for compatibility. Anything after that tag is **pre-release** and may break freely.

- Don’t implement migrations, compatibility layers, or deprecation strategies for changes past the cutover **unless asked**.
- Only ensure backward compatibility when cutting the next release tag (or if explicitly requested).
