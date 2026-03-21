class Gates < Formula
  desc "Completion hook for Claude Code - parallel quality gates (knip, tsgo, madge)"
  homepage "https://github.com/thkt/gates"
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/gates/releases/download/v0.8.0/gates-aarch64-apple-darwin.tar.gz"
      sha256 "6e269f9a68535aa48d20e0cef6ee802dadb25be7b81e3c721e5be35a190e7a95"
    end
    on_intel do
      url "https://github.com/thkt/gates/releases/download/v0.8.0/gates-x86_64-apple-darwin.tar.gz"
      sha256 "d96316501bee505fae277cd56625594764e24cfad799528ffd79d849007ffbdf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/gates/releases/download/v0.8.0/gates-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "278eb42fa38c998511381934add874d0270fae1e67b986d3afb40a06fa8319f3"
    end
    on_intel do
      url "https://github.com/thkt/gates/releases/download/v0.8.0/gates-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2503b354f8cba2553521a316306e580b04029c4e3dfe184b3f5acebd855f8140"
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
