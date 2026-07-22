class Gates < Formula
  desc "Completion hook for Claude Code - parallel quality gates (knip, tsgo, madge)"
  homepage "https://github.com/thkt/gates"
  version "0.12.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/gates/releases/download/v0.12.2/gates-aarch64-apple-darwin.tar.gz"
      sha256 "fe51cf591d84318146834c39c49dbcd432db041e9e09bbfe6921e175d0669359"
    end
    on_intel do
      url "https://github.com/thkt/gates/releases/download/v0.12.2/gates-x86_64-apple-darwin.tar.gz"
      sha256 "2286e75cc1493850f0556e892b52cc19c2a5e5261694efdc5a028579dfa18cd9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/gates/releases/download/v0.12.2/gates-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "348341abd49662bdbbf32865f9184b13e4393c1ca96d63fca7b8bf8ee47f3d2a"
    end
    on_intel do
      url "https://github.com/thkt/gates/releases/download/v0.12.2/gates-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c16271d0b20999658d27a166c97f102175879365e159918e9b5536d78295b601"
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
