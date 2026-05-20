class Guardrails < Formula
  desc "PreToolCall hook for Claude Code - security guardrails using biome + custom rules"
  homepage "https://github.com/thkt/claude-guardrails"
  version "0.15.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.15.1/guardrails-aarch64-apple-darwin.tar.gz"
      sha256 "2201d739dde2b1f58cb8118065081d9642414d8ed164edb27f677aabebbeadaa"
    end
    on_intel do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.15.1/guardrails-x86_64-apple-darwin.tar.gz"
      sha256 "f8a50a28677e0c524c4508d564901875778e01d3358ce138bc4170aa52192a6f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.15.1/guardrails-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d53dbe42a6892d9623bd39cc7cd5b2072753e76060a0b4b60e024688a91ec44a"
    end
    on_intel do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.15.1/guardrails-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "00b304be159699f7e48178f7054bb3943d6a70f69e00a05fb2a17073be9f0c4e"
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
