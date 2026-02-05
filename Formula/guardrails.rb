class Guardrails < Formula
  desc "PreToolCall hook for Claude Code - security guardrails using biome + custom rules"
  homepage "https://github.com/thkt/claude-guardrails"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.4.0/guardrails-aarch64-apple-darwin"
      sha256 "d25d6f4b1c6f6e10f01218aa23e2d7c0023c5cf3950065cb87859c374e1cafc4"
    end
    on_intel do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.4.0/guardrails-x86_64-apple-darwin"
      sha256 "8ef1d12c0775377f171d76ac554d2ada88bc00c3ecc166b17f6e1688a311f47c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.4.0/guardrails-aarch64-unknown-linux-gnu"
      sha256 "04243455ef58c24b6ecd6ec61ee5bf7a8e672a8d659007d89a930604e3dd6b17"
    end
    on_intel do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.4.0/guardrails-x86_64-unknown-linux-gnu"
      sha256 "e37ce0e4d732ca1ed9ae1123f5a7247817c882d0f8b12709b702939d86ffc8a4"
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
