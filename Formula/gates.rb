class Gates < Formula
  desc "Completion hook for Claude Code - parallel quality gates (knip, tsgo, madge)"
  homepage "https://github.com/thkt/gates"
  version "0.12.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/gates/releases/download/v0.12.0/gates-aarch64-apple-darwin.tar.gz"
      sha256 "2b055013151d5c6402521cb28baccc30d1672912df03cfcd50bbc35ff69b1f49"
    end
    on_intel do
      url "https://github.com/thkt/gates/releases/download/v0.12.0/gates-x86_64-apple-darwin.tar.gz"
      sha256 "58c9ce2483460b1fe50fdbf905609e791396e9eca31853f41ad3be5286d15a05"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/gates/releases/download/v0.12.0/gates-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e5ac6dde5ac364d9a7069fb962da13cb52867a820525e9722309a365d5fb3030"
    end
    on_intel do
      url "https://github.com/thkt/gates/releases/download/v0.12.0/gates-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5d9d070a037bfaa39c15d63cd1b09aaf52938c09745bd9e2e1dadcd48b0fb471"
    end
  end

  def install
    bin.install "gates"
  end

  test do
    (testpath/".git").mkpath
    assert_equal "", shell_output("#{bin}/gates #{testpath}")
  end
end
