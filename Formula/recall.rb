class Recall < Formula
  desc "Full-text search CLI for past Claude Code and Codex sessions"
  homepage "https://github.com/thkt/recall"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/recall/releases/download/v0.1.1/recall-aarch64-apple-darwin.tar.gz"
      sha256 "810bc89759e297952d1882291f4d6fffdee7c098163526982bc0bfad46d645d5"
    end
    on_intel do
      url "https://github.com/thkt/recall/releases/download/v0.1.1/recall-x86_64-apple-darwin.tar.gz"
      sha256 "e6c5c4ed645da8ae59f59db88747ce04f0caf07532afb72eaa9b94670a8afdc8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/recall/releases/download/v0.1.1/recall-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3d5df1fbc051ba80c89dfc0f29d135959d69d97864d83a87b2f314739884df60"
    end
    on_intel do
      url "https://github.com/thkt/recall/releases/download/v0.1.1/recall-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e1458862be1bdf3f7ffed16c1ec8cfc8055fdaa12941abac62a47850a9d6e245"
    end
  end

  def install
    bin.install "recall"
  end

  test do
    assert_match "recall", shell_output("#{bin}/recall --help")
  end
end
