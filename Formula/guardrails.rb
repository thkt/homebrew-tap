class Guardrails < Formula
  desc "PreToolCall hook for Claude Code - security guardrails using biome + custom rules"
  homepage "https://github.com/thkt/claude-guardrails"
  version "0.5.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.5.1/guardrails-aarch64-apple-darwin.tar.gz"
      sha256 "fcabf55923c7954f4d89d24780f1c41b36a83f0a5df8fa0bbf35058578f791b8"
    end
    on_intel do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.5.1/guardrails-x86_64-apple-darwin.tar.gz"
      sha256 "6718454ecc34ca108a95e5f152c79a024ac34b0de6cfacb7d3909c78e31b6b1b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.5.1/guardrails-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8188b784c2dd652bf52f5d0f84d86e77e9a144df65128343cdde2141570ad98b"
    end
    on_intel do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.5.1/guardrails-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "67a46e3229d47939961c5f963550baa92ff17f5b09230167d3187c0ab1c1760e"
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
