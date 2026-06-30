class Guardrails < Formula
  desc "Code quality checker for Claude Code's PreToolUse hook"
  homepage "https://github.com/thkt/guardrails"
  version "0.21.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/guardrails/releases/download/v0.21.0/guardrails-aarch64-apple-darwin.tar.gz"
      sha256 "57ca26807e3f9c4c5c06559a4e70225c15595043d40d270859f7454e20ea4b29"
    end
    on_intel do
      url "https://github.com/thkt/guardrails/releases/download/v0.21.0/guardrails-x86_64-apple-darwin.tar.gz"
      sha256 "f56bd0cec755ef8f6de232ccb04d706a68ce6207cea97de327c2a59e0a6e8f9f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/guardrails/releases/download/v0.21.0/guardrails-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a6ca387a61c486449b21adcf433d4f1770b306419280e488dc3cf6fbdd7f82b4"
    end
    on_intel do
      url "https://github.com/thkt/guardrails/releases/download/v0.21.0/guardrails-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "65306e4eb8040fe1b268fad8c1750fdf1e934169f060e50257fee1abd1ff60e0"
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
