class Guardrails < Formula
  desc "PreToolCall hook for Claude Code - security guardrails using biome + custom rules"
  homepage "https://github.com/thkt/claude-guardrails"
  version "0.12.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.12.0/guardrails-aarch64-apple-darwin.tar.gz"
      sha256 "c92a6b3ca04960938c372fbcbe1f31fdf06449c892d6af65d178f661666c4046"
    end
    on_intel do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.12.0/guardrails-x86_64-apple-darwin.tar.gz"
      sha256 "396987b1e575d0fd13ca826d2230c5e85a26cdb0ab66c4066975c7a6c463c831"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.12.0/guardrails-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bec631bc7ef264d858bd1e799fb528fe0b03ee9e6319f6154c1b97a70d087634"
    end
    on_intel do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.12.0/guardrails-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3ee4be52e57a47f0545af5e9c1a2ade90ffa2df306f79aa6f64cdba056e34795"
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
