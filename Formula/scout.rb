class Scout < Formula
  desc "CLI for Brave Search, page fetching, and GitHub exploration"
  homepage "https://github.com/thkt/scout"
  version "2.7.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/scout/releases/download/v2.7.2/scout-aarch64-apple-darwin.tar.gz"
      sha256 "ad6ca05e426049765fcc74f6bfd6d78dd04533885cc0e9b7c170e3a883b30f74"
    end
    on_intel do
      url "https://github.com/thkt/scout/releases/download/v2.7.2/scout-x86_64-apple-darwin.tar.gz"
      sha256 "8b1c4f8b095d0f908f0fe53032a299819853decfb100e84defad42786580fd2c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/scout/releases/download/v2.7.2/scout-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2d0c9a0b190a7c082ed31815b9a18a4d4d5e10fc2c67fab31dab6f5baa9f939b"
    end
    on_intel do
      url "https://github.com/thkt/scout/releases/download/v2.7.2/scout-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d66be4db7a7ff7c48d6991343696d607a8fade1c2bd4b808613c761a6c1da38b"
    end
  end

  def install
    bin.install "scout"
  end

  test do
    assert_match "scout", shell_output("#{bin}/scout --help 2>&1", 0)
  end
end
