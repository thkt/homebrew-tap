class Guardrails < Formula
  desc "PreToolCall hook for Claude Code - security guardrails using biome + custom rules"
  homepage "https://github.com/thkt/claude-guardrails"
  version "0.5.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.5.2/guardrails-aarch64-apple-darwin.tar.gz"
      sha256 "2ebe0499de48fc791358e43d900a5cfc0de225df5bcec0a521f6ad8e19ebe232"
    end
    on_intel do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.5.2/guardrails-x86_64-apple-darwin.tar.gz"
      sha256 "65825c53bf57384e3f95db25888ec7366c1cda501abf86999a7a00c3ded46ced"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.5.2/guardrails-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c6eed2d2beca08de284db874f53fef995de2d0df6db60c163afd32f4cca85cea"
    end
    on_intel do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.5.2/guardrails-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d5b08f133b8e97da2e3f388937fad5e4cd5fd57cbac9312cb3c8d9d1e71a3d41"
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
