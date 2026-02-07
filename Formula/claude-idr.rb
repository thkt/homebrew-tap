class ClaudeIdr < Formula
  desc "Generate Implementation Decision Records from git diffs using Claude CLI"
  homepage "https://github.com/thkt/claude-idr"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/claude-idr/releases/download/v0.1.0/claude-idr-aarch64-apple-darwin"
      sha256 "7358f0602e5de25f7f0eab2fe465cff35ea330048abdcdfed62d16c3dc2a8dac"
    end
    on_intel do
      url "https://github.com/thkt/claude-idr/releases/download/v0.1.0/claude-idr-x86_64-apple-darwin"
      sha256 "be6402c34636e35e71907908f5ee355382e5236776089f1a22a5152f53eaa4ed"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/claude-idr/releases/download/v0.1.0/claude-idr-aarch64-unknown-linux-gnu"
      sha256 "6e0a14154f12c5b9a77f4fccef6c40c79c3b34a47fb65af5b94db7f4a91bf737"
    end
    on_intel do
      url "https://github.com/thkt/claude-idr/releases/download/v0.1.0/claude-idr-x86_64-unknown-linux-gnu"
      sha256 "6709444d0e88c91ac1e6c2ae4cd06d2fe650660e38e52db344f3acffe7bb459e"
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
      To use claude-idr as a git pre-commit hook, add to your ~/.claude/settings.json:

        "hooks": {
          "PostToolUse": [
            {
              "matcher": "Write|Edit",
              "hooks": [
                {
                  "type": "command",
                  "command": "#{HOMEBREW_PREFIX}/bin/claude-idr"
                }
              ]
            }
          ]
        }
    EOS
  end

  test do
    assert_match "claude-idr", shell_output("#{bin}/claude-idr --version")
  end
end
