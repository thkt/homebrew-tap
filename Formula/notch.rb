class Notch < Formula
  desc "Notion Page to Markdown CLI"
  homepage "https://github.com/thkt/notch"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/notch/releases/download/v0.5.0/notch-aarch64-apple-darwin.tar.gz"
      sha256 "d13f6a0aa33504c3bce3013a1a234a4c9c09ef8551fba22344ca65c6e13d14c3"
    end
    on_intel do
      url "https://github.com/thkt/notch/releases/download/v0.5.0/notch-x86_64-apple-darwin.tar.gz"
      sha256 "ea15e1b65da322223ba6142609f2f0d9d8dbcf6b7e70514e1566e13203eda256"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/notch/releases/download/v0.5.0/notch-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "80d2443fa0e056d0d978a790b3f446c2faa296a51417eacb856ed1c84ccc0849"
    end
    on_intel do
      url "https://github.com/thkt/notch/releases/download/v0.5.0/notch-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1b7e369457f72948e4ac0db89a4035d23e9c7967685324492f7e6b270c5a91c6"
    end
  end

  def install
    bin.install "notch"
  end

  test do
    assert_match "notch", shell_output("#{bin}/notch --help 2>&1")
  end
end
