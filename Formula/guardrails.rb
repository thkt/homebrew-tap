class Guardrails < Formula
  desc "PreToolCall hook for Claude Code - security guardrails using biome + custom rules"
  homepage "https://github.com/thkt/claude-guardrails"
  version "0.4.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.4.1/guardrails-aarch64-apple-darwin"
      sha256 "99304734001c5b2e0b25c4f4b4c33680d359b64cc24c75f830bc31cb506cbd20"
    end
    on_intel do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.4.1/guardrails-x86_64-apple-darwin"
      sha256 "4c82ee0c562219dd6eb5d719fa002d7a674ed17474b3714b24fc7797823d762d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.4.1/guardrails-aarch64-unknown-linux-gnu"
      sha256 "42430feeaa58a745e2064530be0f1d290f21009616c1fd05d571ebf507f57e64"
    end
    on_intel do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.4.1/guardrails-x86_64-unknown-linux-gnu"
      sha256 "73d17bf370c307f87dcb3495a54dde3d4025ff67cc79861a563b6d890ab2e012"
    end
  end

  def install
    binary_name = if OS.mac?
      Hardware::CPU.arm? ? "guardrails-aarch64-apple-darwin" : "guardrails-x86_64-apple-darwin"
    else
      Hardware::CPU.arm? ? "guardrails-aarch64-unknown-linux-gnu" : "guardrails-x86_64-unknown-linux-gnu"
    end
    bin.install binary_name => "guardrails"
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
