class Scout < Formula
  desc "CLI for Brave Search, page fetching, and GitHub exploration"
  homepage "https://github.com/thkt/scout"
  version "2.6.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/scout/releases/download/v2.6.1/scout-aarch64-apple-darwin.tar.gz"
      sha256 "a280dc0c41a8f0daa9a665db6145ebb1c0bdf735ba108f6144414595a210a5c3"
    end
    on_intel do
      url "https://github.com/thkt/scout/releases/download/v2.6.1/scout-x86_64-apple-darwin.tar.gz"
      sha256 "c4a0a341fbeae2c222f439e071e65f1bbadce7d4d582eaab5fb615b79867a9b4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/scout/releases/download/v2.6.1/scout-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ed9a8f5fb20f173c78c7c2c41323e4c2afac0555015bd0205596e1e45a08f27c"
    end
    on_intel do
      url "https://github.com/thkt/scout/releases/download/v2.6.1/scout-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8c0a2fb34f2c25863c1cf57419ccc619c0f7333a5d32ed24c1500e6bc1a71b5d"
    end
  end

  def install
    bin.install "scout"
  end

  test do
    assert_match "scout", shell_output("#{bin}/scout --help 2>&1", 0)
  end
end
