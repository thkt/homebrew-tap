class Guardrails < Formula
  desc "Code quality checker for Claude Code's PreToolUse hook"
  homepage "https://github.com/thkt/guardrails"
  version "0.19.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/guardrails/releases/download/v0.19.0/guardrails-aarch64-apple-darwin.tar.gz"
      sha256 "75b8cfb065be34ba4f86dcf6e4c1f2627a48b9a9b8c8098bb47a79ef86e817be"
    end
    on_intel do
      url "https://github.com/thkt/guardrails/releases/download/v0.19.0/guardrails-x86_64-apple-darwin.tar.gz"
      sha256 "aa1d823df361888054139ec442d74b72deb371a5c17d26f9e065c5a28c037575"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/guardrails/releases/download/v0.19.0/guardrails-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1c38542cccd7360b883ecba1648c879a1377e9d04fd37c7904c08cc7b971a4ab"
    end
    on_intel do
      url "https://github.com/thkt/guardrails/releases/download/v0.19.0/guardrails-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e60c5f927ab7bfbf7264d6e12f23ee02889d48c57a4715c5d705b462b8a699e9"
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
