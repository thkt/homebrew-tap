class Guardrails < Formula
  desc "PreToolCall hook for Claude Code - security guardrails using biome + custom rules"
  homepage "https://github.com/thkt/claude-guardrails"
  version "0.15.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.15.0/guardrails-aarch64-apple-darwin.tar.gz"
      sha256 "f74a2bff0d536d03df98f72f702356b9bb5296df628e02924588df47f1464dcc"
    end
    on_intel do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.15.0/guardrails-x86_64-apple-darwin.tar.gz"
      sha256 "1c7a01647577c38a646a78d0cbcfc09bae0e78bfb4c8c3b1176677a25785bca9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.15.0/guardrails-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "34a4e7c4633ac195f58850040a40a0bb136f80d9e10c8debde09f3c80c50d7b3"
    end
    on_intel do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.15.0/guardrails-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9a2690a5c550b979377a8b62351ee8d7fe0ffcaf4deeacfaa4f0190652e71bba"
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
