class Guardrails < Formula
  desc "PreToolCall hook for Claude Code - security guardrails using biome + custom rules"
  homepage "https://github.com/thkt/claude-guardrails"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.3.0/guardrails-aarch64-apple-darwin"
      sha256 "c52a08a73cd786ebf0bbb561c430b1cb3e555bdbb1a94ddbce76e933c8f7d2ec"
    end
    on_intel do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.3.0/guardrails-x86_64-apple-darwin"
      sha256 "ed7e88515b7fa0ca9a278802919d97c8d0ce68f6e3d3258b94ed13b8aa0bed77"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.3.0/guardrails-aarch64-unknown-linux-gnu"
      sha256 "a2b8e7213368127a5924988e0433e2e12bf4feaeee9c49a3b1f38ec7fcea845c"
    end
    on_intel do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.3.0/guardrails-x86_64-unknown-linux-gnu"
      sha256 "0fc9d6596932474225ab3be5cd0eb68f88e852e98f36c446a25ec84ad0e8c8eb"
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
