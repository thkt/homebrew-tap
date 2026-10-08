class Scout < Formula
  desc "CLI for Brave Search, page fetching, and GitHub exploration"
  homepage "https://github.com/thkt/scout"
  version "2.6.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/scout/releases/download/v2.6.2/scout-aarch64-apple-darwin.tar.gz"
      sha256 "ad5910f24765bb1117dcc91d727de1a557a91fb9bdea414690d56a314fd5a694"
    end
    on_intel do
      url "https://github.com/thkt/scout/releases/download/v2.6.2/scout-x86_64-apple-darwin.tar.gz"
      sha256 "81e50dab4caec39133166742bff58c6d64fc9d7c5098439328240566224f77f6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/scout/releases/download/v2.6.2/scout-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "894163af249b6e1174ef7eca690a2ee3817dc5fcf20d5030504611fe56c1aeb1"
    end
    on_intel do
      url "https://github.com/thkt/scout/releases/download/v2.6.2/scout-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "217f264e59a061a46ebded766f848fd35b560d3c9ab3a19e3d03dbf55a17b92c"
    end
  end

  def install
    bin.install "scout"
  end

  test do
    assert_match "scout", shell_output("#{bin}/scout --help 2>&1", 0)
  end
end
