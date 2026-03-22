class Guardrails < Formula
  desc "PreToolCall hook for Claude Code - security guardrails using biome + custom rules"
  homepage "https://github.com/thkt/claude-guardrails"
  version "0.14.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.14.1/guardrails-aarch64-apple-darwin.tar.gz"
      sha256 "d8153af4b23193c9b654ab708bd098453b33e87321f6352b4787717c8ed3d068"
    end
    on_intel do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.14.1/guardrails-x86_64-apple-darwin.tar.gz"
      sha256 "6c82299d0b4ab3cbe9d73ef024d747cc5e21947fb278291ccd2038282796a7e3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.14.1/guardrails-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a1bf31b660f12cb3d23882e11b76c26c62310b9fd0d57709a2ad0297ee5318eb"
    end
    on_intel do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.14.1/guardrails-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "99fc8e796932302b2fc9d140ff54aad4b44e7f843b39d1c1eb1cf12d4daff8af"
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
