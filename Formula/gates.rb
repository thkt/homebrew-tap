class Gates < Formula
  desc "Completion hook for Claude Code - parallel quality gates (knip, tsgo, madge)"
  homepage "https://github.com/thkt/gates"
  version "0.10.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/gates/releases/download/v0.10.0/gates-aarch64-apple-darwin.tar.gz"
      sha256 "0606174968a3cdb7299e596200c5ef81a1bb720d2455603084faf59c76b0801c"
    end
    on_intel do
      url "https://github.com/thkt/gates/releases/download/v0.10.0/gates-x86_64-apple-darwin.tar.gz"
      sha256 "cda49edf85f879bdd58d77425ab41f7a79afb53b07f9df98a033864f148b0bb6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/gates/releases/download/v0.10.0/gates-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6801aeb35fa0bb1a78ca502af5f5592caf32df89597d676eb21d53125dabb00e"
    end
    on_intel do
      url "https://github.com/thkt/gates/releases/download/v0.10.0/gates-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "986e51d1afa0dc34ffd2e975a11a2b846ed6a55111b4d185d2c61acea3124706"
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
