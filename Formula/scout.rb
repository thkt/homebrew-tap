class Scout < Formula
  desc "CLI for Brave Search, page fetching, and GitHub exploration"
  homepage "https://github.com/thkt/scout"
  version "2.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/scout/releases/download/v2.7.0/scout-aarch64-apple-darwin.tar.gz"
      sha256 "13a1ed50b7c076f2f4fc80c825fc06bc2c93e50bef83f221db34c34fd149ccf6"
    end
    on_intel do
      url "https://github.com/thkt/scout/releases/download/v2.7.0/scout-x86_64-apple-darwin.tar.gz"
      sha256 "c5dcae89085b3ce1df56be9a1699b33e1862173b60376d360b95d47a4a9715b0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/scout/releases/download/v2.7.0/scout-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "80b91dac748e52fb919aa34487ad36ee7ca5e59af1206e18b26e67dba0123a7b"
    end
    on_intel do
      url "https://github.com/thkt/scout/releases/download/v2.7.0/scout-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b818abfc7cac00efb6c784060caf0d7a3c7e499c3cc0c3a4786cede3bf52601b"
    end
  end

  def install
    bin.install "scout"
  end

  test do
    assert_match "scout", shell_output("#{bin}/scout --help 2>&1", 0)
  end
end
