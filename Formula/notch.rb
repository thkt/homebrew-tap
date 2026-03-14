class Notch < Formula
  desc "Notion Page to Markdown CLI"
  homepage "https://github.com/thkt/notch"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/notch/releases/download/v0.2.0/notch-aarch64-apple-darwin.tar.gz"
      sha256 "3ed9b62e2aa07cc43358f5f8b17b509a456840ce04e41cd3b7539513351b168b"
    end
    on_intel do
      url "https://github.com/thkt/notch/releases/download/v0.2.0/notch-x86_64-apple-darwin.tar.gz"
      sha256 "08f6c0b25fb942aa7ced9c2fe5927ae8e59fdfde5a604602e3249a183f1b555a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/notch/releases/download/v0.2.0/notch-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "70a229dc256d487d615caed22302203b2dee716545172991a414a8b9affe5cbc"
    end
    on_intel do
      url "https://github.com/thkt/notch/releases/download/v0.2.0/notch-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1a5f0119a5479035e1afa6cedb348c04e0652d0850220799075fc38b7fcf31dd"
    end
  end

  def install
    bin.install "notch"
  end

  test do
    assert_match "notch", shell_output("#{bin}/notch --help 2>&1")
  end
end
