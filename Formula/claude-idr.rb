class ClaudeIdr < Formula
  desc "Generate Implementation Decision Records from git diffs using Claude CLI"
  homepage "https://github.com/thkt/claude-idr"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/claude-idr/releases/download/v0.1.1/claude-idr-aarch64-apple-darwin"
      sha256 "ad82df64d563de9536480b2a422fd7f114ebd9ee0e6fcf34d8d40be20880df75"
    end
    on_intel do
      url "https://github.com/thkt/claude-idr/releases/download/v0.1.1/claude-idr-x86_64-apple-darwin"
      sha256 "71c8492601069147bbe5dc1d31cafc87ec5900b7776aea35e8e605f2ac2cc29c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/claude-idr/releases/download/v0.1.1/claude-idr-aarch64-unknown-linux-gnu"
      sha256 "0b349f833bd2a3ac6b8ecdc95cf72f140a6d1105fb1196ecbe1b787ee762e1d7"
    end
    on_intel do
      url "https://github.com/thkt/claude-idr/releases/download/v0.1.1/claude-idr-x86_64-unknown-linux-gnu"
      sha256 "da4c7237b9a98ca811802e6aea51063983d83e7eb940f1c103a9ecd347852772"
    end
  end

  def install
    binary_name = if OS.mac?
      Hardware::CPU.arm? ? "claude-idr-aarch64-apple-darwin" : "claude-idr-x86_64-apple-darwin"
    else
      Hardware::CPU.arm? ? "claude-idr-aarch64-unknown-linux-gnu" : "claude-idr-x86_64-unknown-linux-gnu"
    end
    bin.install binary_name => "claude-idr"
  end

  def caveats
    <<~EOS
      Install as a git pre-commit hook in your project:

        cd your-project
        echo -e '#!/bin/bash\\nclaude-idr || true' > .git/hooks/pre-commit
        chmod +x .git/hooks/pre-commit

      IDRs are generated automatically when you commit after a Claude Code session.
      See: https://github.com/thkt/claude-idr#setup
    EOS
  end

  test do
    assert_match "claude-idr", shell_output("#{bin}/claude-idr --version")
  end
end
