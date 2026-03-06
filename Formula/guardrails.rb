class Guardrails < Formula
  desc "PreToolCall hook for Claude Code - security guardrails using biome + custom rules"
  homepage "https://github.com/thkt/claude-guardrails"
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.8.0/guardrails-aarch64-apple-darwin.tar.gz"
      sha256 "bec51b8cd170a4acff43e8dcfe525c1c312007d29f471487cef1c9ef5a275f5c"
    end
    on_intel do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.8.0/guardrails-x86_64-apple-darwin.tar.gz"
      sha256 "a2e6870f7cde101b0fa63afbeccd6f315891c4645e1bcccea7ed9598ab8bccbc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.8.0/guardrails-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "85fefa7b7f6941e03761d0870757d3c7cd9c2a5e9e0317865813927f8ce2c92b"
    end
    on_intel do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.8.0/guardrails-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b4c3d64c982a3fcea59ef3ccdfb7f43ce338b9aac2d49b56a576118026a2199e"
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
