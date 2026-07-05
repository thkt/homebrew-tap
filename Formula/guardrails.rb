class Guardrails < Formula
  desc "Code quality checker for Claude Code's PreToolUse hook"
  homepage "https://github.com/thkt/guardrails"
  version "0.21.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/guardrails/releases/download/v0.21.1/guardrails-aarch64-apple-darwin.tar.gz"
      sha256 "445aea3553e403a10d845d1283cea04ff6b0b0a79e96a995bf74be74de2840c9"
    end
    on_intel do
      url "https://github.com/thkt/guardrails/releases/download/v0.21.1/guardrails-x86_64-apple-darwin.tar.gz"
      sha256 "5f40fa0a009985321ee38779cfe87eb2dc5a05f6e861790dc39bb06bf7353e70"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/guardrails/releases/download/v0.21.1/guardrails-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f163d35d2b731bc70bfb174a7f7f8054ee095d3dcd3c0affe15f47b6eff17752"
    end
    on_intel do
      url "https://github.com/thkt/guardrails/releases/download/v0.21.1/guardrails-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "75b4f55f6652070d21fd1a5d53ac8310f3a1aa0b157ddd9f9c6eec91fe26b17d"
    end
  end

  def install
    bin.install "guardrails"
  end

  test do
    output = pipe_output(bin/"guardrails", '{"tool_input":{"content":"test"}}', 0)
    assert_match "pass", output
  end
end
