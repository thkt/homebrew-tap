class Guardrails < Formula
  desc "PreToolCall hook for Claude Code - security guardrails using biome + custom rules"
  homepage "https://github.com/thkt/claude-guardrails"
  version "0.14.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.14.0/guardrails-aarch64-apple-darwin.tar.gz"
      sha256 "bb5ca35d42ea28f57fea23cebc187f1674b7c6ca058e87f363100091ed3e2847"
    end
    on_intel do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.14.0/guardrails-x86_64-apple-darwin.tar.gz"
      sha256 "5e45b33af4e02ff1bc6f5937f88c6ac35849148a5ab4805e035342d5570fcd5c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.14.0/guardrails-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d103421537dc086c1ff837ece4dc04003ed02ed6ac40b207f313eca3239ff5cc"
    end
    on_intel do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.14.0/guardrails-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3f46dc373d226a6d94104eae7ee526e38ea2084aa7f3c7e0a6b0fd15fa514f2c"
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
