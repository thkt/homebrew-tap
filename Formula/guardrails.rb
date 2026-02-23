class Guardrails < Formula
  desc "PreToolCall hook for Claude Code - security guardrails using biome + custom rules"
  homepage "https://github.com/thkt/claude-guardrails"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.6.0/guardrails-aarch64-apple-darwin.tar.gz"
      sha256 "dc33ab384e516b47e6e61afba6417eb5b4cdcc5af5a6f70a2db549ac7747704b"
    end
    on_intel do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.6.0/guardrails-x86_64-apple-darwin.tar.gz"
      sha256 "63f558cbd54a0211c5eca685b8a3e7a7cde829b1c974c64325ba7f7d2e3da7f2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.6.0/guardrails-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ffb377555b6166ff15c6135785e84bd54b6a1f1bf9a00a489ebd5499b92f0479"
    end
    on_intel do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.6.0/guardrails-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f6c5b2344d25d93bbdb631614cb5009fb52cc5ea1fa77c68dea34ade513f1c96"
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
