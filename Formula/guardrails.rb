class Guardrails < Formula
  desc "PreToolCall hook for Claude Code - security guardrails using biome + custom rules"
  homepage "https://github.com/thkt/claude-guardrails"
  version "0.11.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.11.0/guardrails-aarch64-apple-darwin.tar.gz"
      sha256 "44f349e206d77bd8498f57697dbfabab0a9dabb755278c184fa13d94346cc4c3"
    end
    on_intel do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.11.0/guardrails-x86_64-apple-darwin.tar.gz"
      sha256 "a18c440038d8e3eb023ebf9c65fbee33364cd8fdf8dc034b95d549abd6fd84f0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.11.0/guardrails-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0c68556690a4c54a1ff27654ecb9c95bb0a65bd026795e68e5bacfe01fa305c1"
    end
    on_intel do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.11.0/guardrails-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5c285c19e461bebd7b9c001705e093d9c4e7632d62512be84de2beb1d4159501"
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
