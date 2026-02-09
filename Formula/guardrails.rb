class Guardrails < Formula
  desc "PreToolCall hook for Claude Code - security guardrails using biome + custom rules"
  homepage "https://github.com/thkt/claude-guardrails"
  version "0.4.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.4.2/guardrails-aarch64-apple-darwin.tar.gz"
      sha256 "f67a0261a987ca8fee72e80480f4e29e6e4462525c7f077e003b209d5e4363f0"
    end
    on_intel do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.4.2/guardrails-x86_64-apple-darwin.tar.gz"
      sha256 "f703e36a538b435777fbbca468f0549ba50f1009c2ec40d0c68d8caf049b58fa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.4.2/guardrails-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "301588f1c657528f4b3c1029c12543793ed68654382c6c3fc33602ed0f29062b"
    end
    on_intel do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.4.2/guardrails-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7f6801f9ca4b4ef254bbdf03553ff9158de27634294bc132c543cfd50b54a93c"
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
