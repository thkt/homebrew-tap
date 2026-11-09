class Scout < Formula
  desc "CLI for Brave Search, page fetching, and GitHub exploration"
  homepage "https://github.com/thkt/scout"
  version "2.6.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/scout/releases/download/v2.6.5/scout-aarch64-apple-darwin.tar.gz"
      sha256 "7dad7be9cd046814ebde2b778f5a2649c327d7e97c7ed68518c0e658d457d6a2"
    end
    on_intel do
      url "https://github.com/thkt/scout/releases/download/v2.6.5/scout-x86_64-apple-darwin.tar.gz"
      sha256 "41ff0bc9456968386e89b769caefd72d4c4fe64895bb14c16b45035a97e5acf1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/scout/releases/download/v2.6.5/scout-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d9470b0b40eceaa4f9f5b100d7b851669f5c3b98f400032a17704b23444df5a4"
    end
    on_intel do
      url "https://github.com/thkt/scout/releases/download/v2.6.5/scout-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0f0093df411add8b4268b566df1ad1a6772fb769f696c340776cb133eac12e6a"
    end
  end

  def install
    bin.install "scout"
  end

  test do
    assert_match "scout", shell_output("#{bin}/scout --help 2>&1", 0)
  end
end
