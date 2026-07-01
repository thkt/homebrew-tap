class Gates < Formula
  desc "Completion hook for Claude Code - parallel quality gates (knip, tsgo, madge)"
  homepage "https://github.com/thkt/gates"
  version "0.12.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/gates/releases/download/v0.12.1/gates-aarch64-apple-darwin.tar.gz"
      sha256 "6513ae3b58c3f3783343be8af99dcafcea0561a5e292fb33432168e5889d0f4d"
    end
    on_intel do
      url "https://github.com/thkt/gates/releases/download/v0.12.1/gates-x86_64-apple-darwin.tar.gz"
      sha256 "8b387bfd5164450cdf4ad7489f3e87fbf12f2c729d3e782ae0e122a11dca72dc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/gates/releases/download/v0.12.1/gates-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6d39a471bc5f5117b0cb78950adc71cd8980186d5c4c42e3fd3e4c0a8f329ff8"
    end
    on_intel do
      url "https://github.com/thkt/gates/releases/download/v0.12.1/gates-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bf5f22b1cb17bd9c90a90c726b9929a5a0d2697ea9f3c354cc826b311c753192"
    end
  end

  def install
    bin.install "gates"
  end

  test do
    (testpath/".git").mkpath
    assert_equal "", shell_output("#{bin}/gates #{testpath}")
  end
end
