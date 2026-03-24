class Shields < Formula
  desc "Claude Code security hook - command guard + file ACL"
  homepage "https://github.com/thkt/shields"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/shields/releases/download/v0.3.0/shields-aarch64-apple-darwin.tar.gz"
      sha256 "4abf2df6eb48e4a51d97c8d73b0038b41d59800225b07b5fcf75a754580da872"
    end
    on_intel do
      url "https://github.com/thkt/shields/releases/download/v0.3.0/shields-x86_64-apple-darwin.tar.gz"
      sha256 "a2a39abee9868f917d21ef75ebe560f5b0ccd448dce3d9f9a5d2dc0c407f9385"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/shields/releases/download/v0.3.0/shields-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "81069c822b4ea2a0e83c2565028f55f30e3d2c22f1739e353dfc5313247df6fd"
    end
    on_intel do
      url "https://github.com/thkt/shields/releases/download/v0.3.0/shields-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4fb1f0695432cd80ad23dac28a11936a74757f1804f1a717d0defeeb53c1e621"
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
