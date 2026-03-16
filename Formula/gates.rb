class Gates < Formula
  desc "Completion hook for Claude Code - parallel quality gates (knip, tsgo, madge)"
  homepage "https://github.com/thkt/gates"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/gates/releases/download/v0.5.0/gates-aarch64-apple-darwin.tar.gz"
      sha256 "46d17516c93487e7602805425d4c60799978f7de81da1bedee2b4b223cc7e2ab"
    end
    on_intel do
      url "https://github.com/thkt/gates/releases/download/v0.5.0/gates-x86_64-apple-darwin.tar.gz"
      sha256 "3594e6ddb13e87ddab5143b48a457f11e8c713f580ff07c6ab90f0b755fd4e44"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/gates/releases/download/v0.5.0/gates-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ec5a71951c28b3fc770b8d4f3ba134c3c75a612a7a347cd0507522a109223d0a"
    end
    on_intel do
      url "https://github.com/thkt/gates/releases/download/v0.5.0/gates-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a2d6ab4de1ffc433c919139202ccaa581b3f9edbf5798d603d1534d18e122e35"
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
