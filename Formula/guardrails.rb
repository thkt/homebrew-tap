class Guardrails < Formula
  desc "Code quality checker for Claude Code's PreToolUse hook"
  homepage "https://github.com/thkt/guardrails"
  version "0.18.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/guardrails/releases/download/v0.18.0/guardrails-aarch64-apple-darwin.tar.gz"
      sha256 "e7f77d0035d88bc7e1a1a45e653e809f0d629cf48f1c6e168dd6512a71c71617"
    end
    on_intel do
      url "https://github.com/thkt/guardrails/releases/download/v0.18.0/guardrails-x86_64-apple-darwin.tar.gz"
      sha256 "852023a0c0ace62003c456dbdf2c14f9226f193caa5c08e3087262b2b6a1cab0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/guardrails/releases/download/v0.18.0/guardrails-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "37b8ce3ced8930c94e7fba726053ac5fa999901a360d6b5aaff20fb36e831d05"
    end
    on_intel do
      url "https://github.com/thkt/guardrails/releases/download/v0.18.0/guardrails-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c7dd3ff6b4c3e9f358a8e92faa730c098b7aabf14410a1c676a35a3a26b2321f"
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
