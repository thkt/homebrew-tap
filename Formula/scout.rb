class Scout < Formula
  desc "CLI for Brave Search, page fetching, and GitHub exploration"
  homepage "https://github.com/thkt/scout"
  version "2.6.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/scout/releases/download/v2.6.4/scout-aarch64-apple-darwin.tar.gz"
      sha256 "163280303e790bb6e745cfbbe1e095700e4e5546f409b81ecd4708105fe1460e"
    end
    on_intel do
      url "https://github.com/thkt/scout/releases/download/v2.6.4/scout-x86_64-apple-darwin.tar.gz"
      sha256 "ca79e1e0473782de6c4c42f96f8b0a82a0ad5c1edb6bbd955584fbaeb65b89aa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/scout/releases/download/v2.6.4/scout-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "66f368390ed94dd793a5580748bfa3264b381581f8927600a1e1a4b4690ea96d"
    end
    on_intel do
      url "https://github.com/thkt/scout/releases/download/v2.6.4/scout-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2a002f43bc7622d52f192ac36ae8cc43a36e3a9f2d0cb5071118f6c62116497d"
    end
  end

  def install
    bin.install "scout"
  end

  test do
    assert_match "scout", shell_output("#{bin}/scout --help 2>&1", 0)
  end
end
