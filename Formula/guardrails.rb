class Guardrails < Formula
  desc "Code quality checker for Claude Code's PreToolUse hook"
  homepage "https://github.com/thkt/guardrails"
  version "0.17.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/guardrails/releases/download/v0.17.0/guardrails-aarch64-apple-darwin.tar.gz"
      sha256 "f4395f80977627b8271167cb79bb74324b9456b12d1b3bdaa54f90209fdee10a"
    end
    on_intel do
      url "https://github.com/thkt/guardrails/releases/download/v0.17.0/guardrails-x86_64-apple-darwin.tar.gz"
      sha256 "ac083d42caf115d2db26bd0f3c0409af9a8c95e9765b45a39bf3b17e88f96404"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/guardrails/releases/download/v0.17.0/guardrails-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d73cc6ff7980b357ea182b69843c0bcda101a9ac22ba0954b6aa8b9e7407d05d"
    end
    on_intel do
      url "https://github.com/thkt/guardrails/releases/download/v0.17.0/guardrails-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ed709a15ae7db66363ab7ca0ce06e931eceaff3a11ee14c55b15fbcb499562f5"
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
