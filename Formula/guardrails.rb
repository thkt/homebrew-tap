class Guardrails < Formula
  desc "PreToolCall hook for Claude Code - security guardrails using biome + custom rules"
  homepage "https://github.com/thkt/claude-guardrails"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.7.0/guardrails-aarch64-apple-darwin.tar.gz"
      sha256 "973df11eb7e4e16d51db12b58d86835d91f8b0c660273a99e984c505935e4ca2"
    end
    on_intel do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.7.0/guardrails-x86_64-apple-darwin.tar.gz"
      sha256 "067a171cedb017f41bb39319efbd32ea3bc18ff549001ed975414bdd7199eba1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.7.0/guardrails-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "37fc9ff2803d5f2a02eb1834b5359f832a9528408b5f013c2ed806dd1219ce87"
    end
    on_intel do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.7.0/guardrails-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "140e7c268f1aa0e3cd3415283cd84f2154bcb3607c7d99fb112ef7f7dbd355ce"
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
