# Cubical Agda Codespace

Spin up a GitHub Codespace and start coding in **Cubical Agda** instantly.

## Quick start

1. **Create a repo** with these files.
2. Click **Code → Create codespace on main**.
3. When the container finishes, the post-create script will:
   - Show `agda --version`
   - Confirm library registration
   - Type-check `src/Main.agda`

Open `src/Main.agda`, then in the **Agda** status bar (or command palette),
**load** the file to type-check (the extension maps Emacs’ `C-c C-l`).

## What’s inside

- Devcontainer installs:
  - GHC via `ghcup` (`9.4.x`), `cabal`, and **Agda** via `cabal install Agda`
  - **Cubical Agda** library cloned to `/opt/agda-libs/cubical` and registered
- VS Code extensions:
  - `banacorn.agda-mode` (Agda language support)
  - Haskell syntax helper (optional)
- Project library file `myproject.agda-lib`:
  - `include: src`
  - `depend: cubical`

## Verify locally (optional)

If you build the container locally:

```bash
agda --version
agda -i src src/Main.agda
```

## Notes

- The container registers `cubical` by default (`~/.agda/defaults`).
- The workspace library `myproject.agda-lib` is added to `~/.agda/libraries` on shell start if present.
