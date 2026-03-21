class Guardrails < Formula
  desc "PreToolCall hook for Claude Code - security guardrails using biome + custom rules"
  homepage "https://github.com/thkt/claude-guardrails"
  version "0.13.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.13.0/guardrails-aarch64-apple-darwin.tar.gz"
      sha256 "49c6bc38b7f14506c547b0af1b19df051104967dac86f5a815a72dc5012ad8d1"
    end
    on_intel do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.13.0/guardrails-x86_64-apple-darwin.tar.gz"
      sha256 "7cbef164b481fef1c0bfab848cb8b87790317bbc905c032d0b772ec264fcb980"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.13.0/guardrails-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "72534cdb4e252766d7c87f7fdcdc743dd2aa8cd67f0f415ff6e175b11eaafe46"
    end
    on_intel do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.13.0/guardrails-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "837699baa06bd7a23f76e5f79dfb0fe43acb0944dd337c497fa640562cb681bd"
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
