class Guardrails < Formula
  desc "Code quality checker for Claude Code's PreToolUse hook"
  homepage "https://github.com/thkt/guardrails"
  version "0.23.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/guardrails/releases/download/v0.23.0/guardrails-aarch64-apple-darwin.tar.gz"
      sha256 "c836c090951521135d7b7f473116fbe03a448b1b6285ec2bf3fd53d19e0e7131"
    end
    on_intel do
      url "https://github.com/thkt/guardrails/releases/download/v0.23.0/guardrails-x86_64-apple-darwin.tar.gz"
      sha256 "04c9eadcb4da3dcf8499af827ed90fc180f0b666a1f5be10d0c2ba352d023930"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/guardrails/releases/download/v0.23.0/guardrails-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8acff416297702fe5f1579434289a7804c71f27c9f5d1eee0ee18102badb721f"
    end
    on_intel do
      url "https://github.com/thkt/guardrails/releases/download/v0.23.0/guardrails-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c374f3f85b2bc9429c4cf516e4c42ff12ed456d9bc6819a6a6a43e1336b25f3b"
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
