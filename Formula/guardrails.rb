class Guardrails < Formula
  desc "Code quality checker for Claude Code's PreToolUse hook"
  homepage "https://github.com/thkt/guardrails"
  version "0.22.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/guardrails/releases/download/v0.22.0/guardrails-aarch64-apple-darwin.tar.gz"
      sha256 "8d35bafa387ed8d743cb0c16547528330c530415f049f2dd1bb20c209a10e371"
    end
    on_intel do
      url "https://github.com/thkt/guardrails/releases/download/v0.22.0/guardrails-x86_64-apple-darwin.tar.gz"
      sha256 "675c038c0f9fde4b19e03ffd004f6215e2b5dd5f09e109fd1379917c4ef09b62"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/guardrails/releases/download/v0.22.0/guardrails-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "edb6e8bb1216c3330107e080583d02002ffbb7da436400cb1977ea73bfe506bf"
    end
    on_intel do
      url "https://github.com/thkt/guardrails/releases/download/v0.22.0/guardrails-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "471ceb75eaae55838287c35d2b77c716e84ba4f927facf8be5e4d674acec7b90"
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
