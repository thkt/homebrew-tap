class Notch < Formula
  desc "Notion Page to Markdown CLI"
  homepage "https://github.com/thkt/notch"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/notch/releases/download/v0.4.0/notch-aarch64-apple-darwin.tar.gz"
      sha256 "837e0fb62db0c28bbf090c7fb5bbcdf2db57bf105d632d3e33afc59569aba82a"
    end
    on_intel do
      url "https://github.com/thkt/notch/releases/download/v0.4.0/notch-x86_64-apple-darwin.tar.gz"
      sha256 "e75e210fd745ac4918411d6f9b5a96900550e2c0fc2dfa140943313514a0cbd3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/notch/releases/download/v0.4.0/notch-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6d136f5d512595779f5f66f3ab931a6bf9cb34c0c3e52e277ad842f583168765"
    end
    on_intel do
      url "https://github.com/thkt/notch/releases/download/v0.4.0/notch-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e2dffa4156bf1ce8e6f81edf413a5eea95840808f9d99380d83a3478c67cda81"
    end
  end

  def install
    bin.install "notch"
  end

  test do
    assert_match "notch", shell_output("#{bin}/notch --help 2>&1")
  end
end
