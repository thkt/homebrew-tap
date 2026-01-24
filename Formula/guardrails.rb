class Guardrails < Formula
  desc "PreToolCall hook for Claude Code - security guardrails using biome + custom rules"
  homepage "https://github.com/thkt/claude-guardrails"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.1.0/guardrails-aarch64-apple-darwin"
      sha256 "312d6c0b1449e7e2f7dcce68f14871815a35354cf45cfaf344e3298fd6a2c314"
    end
    on_intel do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.1.0/guardrails-x86_64-apple-darwin"
      sha256 "e3aed9549ad0794f9db965e77e3fe1daac6943347056a6fd3563eafc06728281"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.1.0/guardrails-aarch64-unknown-linux-gnu"
      sha256 "91087c727d3f84ef9a4f955360c99b401e4a99a55fb911ef16ff8c3415b6e231"
    end
    on_intel do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.1.0/guardrails-x86_64-unknown-linux-gnu"
      sha256 "ef1884184e97f258fa5d5b6cb4110ff1bea186a33ab6c0688d3bfcca772137e6"
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
    # Test that binary runs (expects stdin input)
    assert_match(//, pipe_output(bin/"guardrails", "{}", 0))
  end
end
