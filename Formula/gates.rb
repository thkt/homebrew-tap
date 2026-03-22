class Gates < Formula
  desc "Completion hook for Claude Code - parallel quality gates (knip, tsgo, madge)"
  homepage "https://github.com/thkt/gates"
  version "0.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/gates/releases/download/v0.9.0/gates-aarch64-apple-darwin.tar.gz"
      sha256 "917c362446f0eb2f527187d1526ca387e97e7aca71d2ec0fa837690b9c61393e"
    end
    on_intel do
      url "https://github.com/thkt/gates/releases/download/v0.9.0/gates-x86_64-apple-darwin.tar.gz"
      sha256 "b0bbb0ff311173a76d79b72c1e74c3ff30f887b4947caaa30fb8cb79476503c0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/gates/releases/download/v0.9.0/gates-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ecf2c51e3d5793250cb45e81689dd12c065431d39947d63157636ea4dd9fa0c0"
    end
    on_intel do
      url "https://github.com/thkt/gates/releases/download/v0.9.0/gates-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6f1e36f19aac7ccbc95c346efa93b4a85f6d3dbd677c1f8cc288020b099f0c76"
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
