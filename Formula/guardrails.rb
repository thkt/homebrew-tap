class Guardrails < Formula
  desc "PreToolCall hook for Claude Code - security guardrails using biome + custom rules"
  homepage "https://github.com/thkt/claude-guardrails"
  version "0.10.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.10.0/guardrails-aarch64-apple-darwin.tar.gz"
      sha256 "ce2f25647def556d94ada762335ab27b812651fb913675fcb280121e3738cd8f"
    end
    on_intel do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.10.0/guardrails-x86_64-apple-darwin.tar.gz"
      sha256 "ede24acee854713516a7ea8614b4f3b32ed42220e6061f73b8ca3eeb33c14569"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.10.0/guardrails-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "410d775b1b3f8ced219b04da8c5d915f4720d315e5c4e7a9fecfe8da7c11fd0b"
    end
    on_intel do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.10.0/guardrails-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0b41f0f6355ace24c66d1a95c6cd3b938f12ab72d1c8d34dd179c366a36c68ec"
    end
  end

  def install
    bin.install "guardrails"
  end

  def caveats
    <<~EOS
      To use guardrails with Claude Code, add to your ~/.claude/settings.json:

        "hooks": {
          "PreToolUse": [
            {
              "matcher": "Write|Edit|MultiEdit",
              "hooks": [
                {
                  "type": "command",
                  "command": "#{HOMEBREW_PREFIX}/bin/guardrails",
                  "timeout": 1000
                }
              ]
            }
          ]
        }
    EOS
  end

  test do
    output = pipe_output(bin/"guardrails", '{"tool_input":{"content":"test"}}', 0)
    assert_match "pass", output
  end
end
