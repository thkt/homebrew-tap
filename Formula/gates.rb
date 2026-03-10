class Gates < Formula
  desc "Completion hook for Claude Code - parallel quality gates (knip, tsgo, madge)"
  homepage "https://github.com/thkt/gates"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/gates/releases/download/v0.3.0/gates-aarch64-apple-darwin.tar.gz"
      sha256 "f3c16822f4a46e302daffff6d4914a70027462d1bcafbda623d5df906469d0f4"
    end
    on_intel do
      url "https://github.com/thkt/gates/releases/download/v0.3.0/gates-x86_64-apple-darwin.tar.gz"
      sha256 "f9d8dc2e8f26191e0ed7c03580f5697347e0ab81df1ebe3aff6c163dededb399"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/gates/releases/download/v0.3.0/gates-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "33ef79c8ab85f52494e1d96a2a412148bd097b1b8318e07416e9e328c911b14a"
    end
    on_intel do
      url "https://github.com/thkt/gates/releases/download/v0.3.0/gates-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "112c66ccf915e940aa724b104bc78ad3afc4b4ca763d890b883005ad1b479d84"
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
