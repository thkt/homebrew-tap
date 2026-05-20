class Guardrails < Formula
  desc "PreToolCall hook for Claude Code - security guardrails using biome + custom rules"
  homepage "https://github.com/thkt/claude-guardrails"
  version "0.16.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.16.0/guardrails-aarch64-apple-darwin.tar.gz"
      sha256 "a69c81a5eabcc9ee4a7a860bd573466de215681e67678d91e367524aad427d80"
    end
    on_intel do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.16.0/guardrails-x86_64-apple-darwin.tar.gz"
      sha256 "a68f4c4c2fdea2486a4d3444ac3583f24adaf3f26c5a28f479f681ff255dd2dc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.16.0/guardrails-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4ca568a47bcde3151f885fd13f65d0990b39f771c33e4f5ba034f628268e7d24"
    end
    on_intel do
      url "https://github.com/thkt/claude-guardrails/releases/download/v0.16.0/guardrails-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b7f56fd82e197cd19a2833e0d9cceb6bec87736beb93c6c5730a7886cbe3ff73"
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
