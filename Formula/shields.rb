class Shields < Formula
  desc "Claude Code security hook - command guard + file ACL"
  homepage "https://github.com/thkt/shields"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/shields/releases/download/v0.2.0/shields-aarch64-apple-darwin.tar.gz"
      sha256 "6f5f6853c2eb2d0dbe6f9a473f0c4410ea0a1d678b02fc2df37a73298043170f"
    end
    on_intel do
      url "https://github.com/thkt/shields/releases/download/v0.2.0/shields-x86_64-apple-darwin.tar.gz"
      sha256 "145ad3a732673cec8e19a8b4364db165d43089f2c46e4c9289789381f504c945"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/shields/releases/download/v0.2.0/shields-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "015de4a66a77831f2704fa611b3719628505a0b8abd2216ea766615be1096ef8"
    end
    on_intel do
      url "https://github.com/thkt/shields/releases/download/v0.2.0/shields-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cdf4a36f25fa57842ddb2f7258af46528e353c37a2a358cc1b1f1488329a4c1b"
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
