class Guardrails < Formula
  desc "PreToolCall hook for Claude Code - security guardrails using biome + custom rules"
  homepage "https://github.com/thkt/claude-guardrails"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.2.0/guardrails-aarch64-apple-darwin"
      sha256 "a75a88ae3e4882b70137a7904149710a405a484cc095c7f51f9c9b33586d92be"
    end
    on_intel do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.2.0/guardrails-x86_64-apple-darwin"
      sha256 "16503996ae282075f37462c824a6d2679530dbd5eba6f5c868f3672d74721065"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.2.0/guardrails-aarch64-unknown-linux-gnu"
      sha256 "e09ee0410302da738fc97ed7ee18b98714938f6fef1a05418cc8769213267993"
    end
    on_intel do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.2.0/guardrails-x86_64-unknown-linux-gnu"
      sha256 "9d7d079745a1ba6b55a844635e5900315ef96957b20dc18a8b634904108fc4e3"
    end
  end

  def install
    binary_name = if OS.mac?
      Hardware::CPU.arm? ? "guardrails-aarch64-apple-darwin" : "guardrails-x86_64-apple-darwin"
    else
      Hardware::CPU.arm? ? "guardrails-aarch64-unknown-linux-gnu" : "guardrails-x86_64-unknown-linux-gnu"
    end
    bin.install binary_name => "guardrails"
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
