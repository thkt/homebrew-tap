class Scout < Formula
  desc "CLI for Brave Search, page fetching, and GitHub exploration"
  homepage "https://github.com/thkt/scout"
  version "2.7.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/scout/releases/download/v2.7.1/scout-aarch64-apple-darwin.tar.gz"
      sha256 "447b9d6554253b8e8cc58a76c0f8b76e37712bf1affb0b3aa6323ad3c296522d"
    end
    on_intel do
      url "https://github.com/thkt/scout/releases/download/v2.7.1/scout-x86_64-apple-darwin.tar.gz"
      sha256 "f2d10e5ff4942bd76099224a2a1391943647735ade69807f1075d38b888f5835"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/scout/releases/download/v2.7.1/scout-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "81f5f2dc043ea4a39e959d10eb697e745b887310299ad0850c2ddf07987da453"
    end
    on_intel do
      url "https://github.com/thkt/scout/releases/download/v2.7.1/scout-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7bf52bd305585e7a431ef00876d7b284c28e8f789e34bb8ba8165cb8485b00bd"
    end
  end

  def install
    bin.install "scout"
  end

  test do
    assert_match "scout", shell_output("#{bin}/scout --help 2>&1", 0)
  end
end
