class Gates < Formula
  desc "Completion hook for Claude Code - parallel quality gates (knip, tsgo, madge)"
  homepage "https://github.com/thkt/gates"
  version "0.11.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/gates/releases/download/v0.11.0/gates-aarch64-apple-darwin.tar.gz"
      sha256 "29154b6265886aa16319ef5055c8dd91ff089e8481b56d8bd3a5cb6a80b97f75"
    end
    on_intel do
      url "https://github.com/thkt/gates/releases/download/v0.11.0/gates-x86_64-apple-darwin.tar.gz"
      sha256 "bb38a91ef86865bebd02e223c306003799b93785eaafa375209b245d0afdfa17"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/gates/releases/download/v0.11.0/gates-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "84961bf3be8d351a85c289a837f480f6aeac1b85954edbefb944f0f63f235cc1"
    end
    on_intel do
      url "https://github.com/thkt/gates/releases/download/v0.11.0/gates-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4b0603509b03a46aa0097546dc33880731c5c99246a05c066b27f59079dd4e22"
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
