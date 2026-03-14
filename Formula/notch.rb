class Notch < Formula
  desc "Notion Page to Markdown CLI"
  homepage "https://github.com/thkt/notch"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/notch/releases/download/v0.3.0/notch-aarch64-apple-darwin.tar.gz"
      sha256 "91875dff85763078931dddf7986790e850fc1f7fb3b5844bbd1d87c35c8e344e"
    end
    on_intel do
      url "https://github.com/thkt/notch/releases/download/v0.3.0/notch-x86_64-apple-darwin.tar.gz"
      sha256 "c438f550f98263df2b76c2f21925ec2c1cb3c147fd5792ad443d1dde8a086de2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/notch/releases/download/v0.3.0/notch-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4ae8e612660f6ab109235b02af4aa515fb2d4f4d2008c77506b5d245a356ce32"
    end
    on_intel do
      url "https://github.com/thkt/notch/releases/download/v0.3.0/notch-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f949a43671102fb6ca55b4a4930d1223be3612a952d498e801244dce6f292244"
    end
  end

  def install
    bin.install "notch"
  end

  test do
    assert_match "notch", shell_output("#{bin}/notch --help 2>&1")
  end
end
