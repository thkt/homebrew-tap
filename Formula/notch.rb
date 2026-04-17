class Notch < Formula
  desc "Notion Page to Markdown CLI"
  homepage "https://github.com/thkt/notch"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/notch/releases/download/v0.6.0/notch-aarch64-apple-darwin.tar.gz"
      sha256 "cbdd6d3f149a5986cad580edff42802c30cf7ca56d6210784576c619824ab491"
    end
    on_intel do
      url "https://github.com/thkt/notch/releases/download/v0.6.0/notch-x86_64-apple-darwin.tar.gz"
      sha256 "44a2801a290174074eb61109f486886d8995d23752dfee22b75f3a5f6148407e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/notch/releases/download/v0.6.0/notch-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "63898f10671f9b1e0ad39245a2c09a6008877eb10215dd9fa407e7ca4aa475d2"
    end
    on_intel do
      url "https://github.com/thkt/notch/releases/download/v0.6.0/notch-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5eb836d3868b8e1380b45427c2151768f0c198aa47836a5a4cdc1b3498c8ee0e"
    end
  end

  def install
    bin.install "notch"
  end

  test do
    assert_match "notch", shell_output("#{bin}/notch --help 2>&1")
  end
end
