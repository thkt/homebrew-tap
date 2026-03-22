class Shields < Formula
  desc "Claude Code security hook - command guard + file ACL"
  homepage "https://github.com/thkt/shields"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/shields/releases/download/v0.1.0/shields-aarch64-apple-darwin.tar.gz"
      sha256 "87754ea93dcae683d4edcc97226d0b8e054991318e4c72d99de42ca6705c80bf"
    end
    on_intel do
      url "https://github.com/thkt/shields/releases/download/v0.1.0/shields-x86_64-apple-darwin.tar.gz"
      sha256 "fec40d8bdffb37c1f08fef3d8423ab51bd2520c5f99adc45e1edebad2cc708ba"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/shields/releases/download/v0.1.0/shields-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ae304eb664c417461e3d35f4ec6453993643a6b22f39d5a8d24b7d2bd4566109"
    end
    on_intel do
      url "https://github.com/thkt/shields/releases/download/v0.1.0/shields-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fecc409d6ca31184306ea4cadf43e9a368f663cf560c288710f1c7ed5f7a33ae"
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
