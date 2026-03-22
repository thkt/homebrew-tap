class Gates < Formula
  desc "Completion hook for Claude Code - parallel quality gates (knip, tsgo, madge)"
  homepage "https://github.com/thkt/gates"
  version "0.8.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/gates/releases/download/v0.8.1/gates-aarch64-apple-darwin.tar.gz"
      sha256 "315672ce0cfac3f9509fefc5746c69a88965d7d9d5c2ee1db0b0f0838ada15b9"
    end
    on_intel do
      url "https://github.com/thkt/gates/releases/download/v0.8.1/gates-x86_64-apple-darwin.tar.gz"
      sha256 "4ba490810ba2b80a333f2c288899bc8fdaae23ef935b3c2ad06805fd61a18dd6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/gates/releases/download/v0.8.1/gates-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f741e500a0f654341b38d828c7bb2cc0b78d1f6efd2461fca078cff9b4d3b6dc"
    end
    on_intel do
      url "https://github.com/thkt/gates/releases/download/v0.8.1/gates-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a3aafbe1f321c318ca5c7fb6d74a32ea838403a4ca45eaa2ed5c41c01c9006a6"
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
