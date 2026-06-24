class Guardrails < Formula
  desc "Code quality checker for Claude Code's PreToolUse hook"
  homepage "https://github.com/thkt/guardrails"
  version "0.20.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/guardrails/releases/download/v0.20.0/guardrails-aarch64-apple-darwin.tar.gz"
      sha256 "492e48e96bf3d3292b4d1dbcdb91f754fc61bd70d7afc716afe4c896e9a83aed"
    end
    on_intel do
      url "https://github.com/thkt/guardrails/releases/download/v0.20.0/guardrails-x86_64-apple-darwin.tar.gz"
      sha256 "b6583fd42a3a2fa4cceab3be1a066c959f951022b03dee09a05efb2bb3ed06f2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/guardrails/releases/download/v0.20.0/guardrails-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "97bbc583088623d6bec117dcd843818224698a09a007fac23c3553b67e6fc5c0"
    end
    on_intel do
      url "https://github.com/thkt/guardrails/releases/download/v0.20.0/guardrails-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0e615a37a6a1bc1f201b2585d1e609a105854600f8830954f4fe8e86caad8b60"
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
