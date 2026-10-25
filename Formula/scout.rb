class Scout < Formula
  desc "CLI for Brave Search, page fetching, and GitHub exploration"
  homepage "https://github.com/thkt/scout"
  version "2.6.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/scout/releases/download/v2.6.3/scout-aarch64-apple-darwin.tar.gz"
      sha256 "4f8f18e76339f3d7b22ebc10449245edd3f164f2ca6ab6be5920f4a211628cf8"
    end
    on_intel do
      url "https://github.com/thkt/scout/releases/download/v2.6.3/scout-x86_64-apple-darwin.tar.gz"
      sha256 "c420607ad6eb7e3db83540f7139a311c84c2490fc2d2e9badb082419b2d848ba"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/scout/releases/download/v2.6.3/scout-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "97227fdfa088219e880727fc2e72eb26e01aed2095de63824c414e689545ced4"
    end
    on_intel do
      url "https://github.com/thkt/scout/releases/download/v2.6.3/scout-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2e75759af422304885f8195029bfed928bbb32be97e13e6b3eb349aa2803873b"
    end
  end

  def install
    bin.install "scout"
  end

  test do
    assert_match "scout", shell_output("#{bin}/scout --help 2>&1", 0)
  end
end
