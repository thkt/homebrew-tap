class Gates < Formula
  desc "Completion hook for Claude Code - parallel quality gates (knip, tsgo, madge)"
  homepage "https://github.com/thkt/gates"
  version "0.7.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/gates/releases/download/v0.7.1/gates-aarch64-apple-darwin.tar.gz"
      sha256 "fbf588c7bb3c763b8475198024d21fd22eb7db75228f4c184b6f8b03f60fd7df"
    end
    on_intel do
      url "https://github.com/thkt/gates/releases/download/v0.7.1/gates-x86_64-apple-darwin.tar.gz"
      sha256 "fd7b8ce4086ebbb41bb0f38830557a62eccb2a45b705166f1b11cbbee437ac0a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/gates/releases/download/v0.7.1/gates-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "eee6f055f02ced16e8a8c8d7693ae05b40c92212b5d0402908ddc544cf82fca3"
    end
    on_intel do
      url "https://github.com/thkt/gates/releases/download/v0.7.1/gates-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ec71e6d28baba355e336c90b33a16291cde3239396a1bbafac9865bfaa29860c"
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
