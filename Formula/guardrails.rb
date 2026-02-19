class Guardrails < Formula
  desc "PreToolCall hook for Claude Code - security guardrails using biome + custom rules"
  homepage "https://github.com/thkt/claude-guardrails"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.5.0/guardrails-aarch64-apple-darwin.tar.gz"
      sha256 "53a186bfa3125a8ef4eb980d0db0831491677295fee96f4576e0c7e15b553a63"
    end
    on_intel do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.5.0/guardrails-x86_64-apple-darwin.tar.gz"
      sha256 "124d488a188938ae5103dfe5f97f13ccf5c4b527b8e94b8817897aa40b9d24bb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.5.0/guardrails-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "50709e79a1c112e52bc81da1deebe324f49435dd18236ef96721c7d39cdc23bf"
    end
    on_intel do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.5.0/guardrails-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "788381602c4662ce4d77e4e35b55bb41fc5d6fd864a47c0d494647b6d745283f"
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
