class Notch < Formula
  desc "Notion Page to Markdown CLI"
  homepage "https://github.com/thkt/notch"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/notch/releases/download/v0.1.0/notch-aarch64-apple-darwin.tar.gz"
      sha256 "3be97ab92fed7cfe20040b1ca53787b7405fab9ed57e48b49a6c30d505316c36"
    end
    on_intel do
      url "https://github.com/thkt/notch/releases/download/v0.1.0/notch-x86_64-apple-darwin.tar.gz"
      sha256 "969c5bde377eaf9040fa42add5b83a3897071697faf7cbd0ff0504b8943f3cf5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/notch/releases/download/v0.1.0/notch-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3f02c649d0941f566814a7433f71cb8e704409d3cc893c997ddb31b32f4f0689"
    end
    on_intel do
      url "https://github.com/thkt/notch/releases/download/v0.1.0/notch-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1c3f8e800f17d1767be010ac881171e5e60b91ce22a8ab4c67e10ee5c2dd9118"
    end
  end

  def install
    bin.install "notch"
  end

  test do
    assert_match "notch", shell_output("#{bin}/notch --help 2>&1")
  end
end
