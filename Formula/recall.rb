class Recall < Formula
  desc "Full-text search CLI for past Claude Code and Codex sessions"
  homepage "https://github.com/thkt/recall"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/recall/releases/download/v0.2.1/recall-aarch64-apple-darwin.tar.gz"
      sha256 "91c00b72b854ae9c6fb6a80b361dcd3fc17b153c5fa06845025a3362f42f61f0"
    end
    on_intel do
      url "https://github.com/thkt/recall/releases/download/v0.2.1/recall-x86_64-apple-darwin.tar.gz"
      sha256 "e0195a6f729dfab1e41bb7ca6b9fe3470a5070a05b1787a7c0405f6fdd854041"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/recall/releases/download/v0.2.1/recall-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5cb387ea716b94239de03f26f3126fe18cb76c1a08e3d5ee75e08abeb114fa95"
    end
    on_intel do
      url "https://github.com/thkt/recall/releases/download/v0.2.1/recall-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0866b30905f0faea3f0eaa58c1b68c836f229529444fdf4d8a62c9f92444fb50"
    end
  end

  def install
    bin.install "recall"
  end

  test do
    assert_match "recall", shell_output("#{bin}/recall --help")
  end
end
