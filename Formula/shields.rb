class Shields < Formula
  desc "Claude Code security hook - command guard + file ACL"
  homepage "https://github.com/thkt/shields"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/shields/releases/download/v0.2.0/shields-aarch64-apple-darwin.tar.gz"
      sha256 "d634e23d75e1a3de97b5e0c9610d26919e9bfa56b9d2edbb5820f2e0ca984d0f"
    end
    on_intel do
      url "https://github.com/thkt/shields/releases/download/v0.2.0/shields-x86_64-apple-darwin.tar.gz"
      sha256 "34bb46e97762cb58139d182ae5e4f76eb41163e5866c6bebd9de79cba4bded7b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/shields/releases/download/v0.2.0/shields-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d8b122b4b71e47cd48edba57402ecbc986439a52e64f980e92dbafb18ae63770"
    end
    on_intel do
      url "https://github.com/thkt/shields/releases/download/v0.2.0/shields-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5ee379984536c3696fcc2619ac904892ee6fac780bdc7789da7ff3db6e2750fa"
    end
  end

  def install
    bin.install "shields"
  end

  def caveats
    <<~EOS
      shields provides two Claude Code hooks:

        shields check  — PreToolUse Bash guard (command patterns + secrets)
        shields acl    — PermissionRequest file ACL

      Configure per-project in .claude/tools.json:

        {
          "shields": {
            "check": true,
            "acl": true,
            "custom_patterns": [],
            "safe_dirs": [],
            "deny_subagent": []
          }
        }
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/shields --version")
  end
end
