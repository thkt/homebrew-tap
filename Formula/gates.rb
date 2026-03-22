class Gates < Formula
  desc "Completion hook for Claude Code - parallel quality gates (knip, tsgo, madge)"
  homepage "https://github.com/thkt/gates"
  version "0.10.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/gates/releases/download/v0.10.1/gates-aarch64-apple-darwin.tar.gz"
      sha256 "2681ced17034bb1c5720c9f477146225dab232b28e49a22737d7d81f1790dbd1"
    end
    on_intel do
      url "https://github.com/thkt/gates/releases/download/v0.10.1/gates-x86_64-apple-darwin.tar.gz"
      sha256 "b67f05d055c2d4d762721b12087b7e4e76b8dd80646de751a665b475146ee89a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/gates/releases/download/v0.10.1/gates-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7ba5f11dc514036815b699df2e9fcc9f144c41d0d430219749d93a8a1380862a"
    end
    on_intel do
      url "https://github.com/thkt/gates/releases/download/v0.10.1/gates-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "156cf99ea90f1f8ee5e15b7976bbd0dc3fe8acc3a95017a8980963168ae46096"
    end
  end

  def install
    bin.install "gates"
  end

  def caveats
    <<~EOS
      To use gates with Claude Code, add a completion hook to ~/.claude/settings.json.
      See https://github.com/thkt/gates#usage for details.

      Enable gates per project in .claude/tools.json:

        {
          "gates": {
            "knip": true,
            "tsgo": true,
            "madge": true
          }
        }
    EOS
  end

  test do
    (testpath/".git").mkpath
    assert_equal "", shell_output("#{bin}/gates #{testpath}")
  end
end
