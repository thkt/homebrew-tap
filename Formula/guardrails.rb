class Guardrails < Formula
  desc "PreToolCall hook for Claude Code - security guardrails using biome + custom rules"
  homepage "https://github.com/thkt/claude-guardrails"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.3.0/guardrails-aarch64-apple-darwin"
      sha256 "ea85adf09689cedaa62cfea4ab960c61f08e72b81da8316b96e28fcc06bf8ebe"
    end
    on_intel do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.3.0/guardrails-x86_64-apple-darwin"
      sha256 "3e15d7fe4ff7f786e8bfb4beb3d94065084411de334bfe29c5ee4f8eb04f6131"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.3.0/guardrails-aarch64-unknown-linux-gnu"
      sha256 "e64422240ec6c982faa99225733a4ca7188bd6db1b6bd4465576bb774e2e57fb"
    end
    on_intel do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.3.0/guardrails-x86_64-unknown-linux-gnu"
      sha256 "c82525e6f62fbb483585d9e1bea87f50e6fc1e018369cbad143270a1ed1c4c8e"
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
