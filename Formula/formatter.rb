class Formatter < Formula
  desc "PostToolUse hook for Claude Code - auto-formats files using biome"
  homepage "https://github.com/thkt/claude-formatter"
  version "0.9.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/claude-formatter/releases/download/v0.9.1/formatter-aarch64-apple-darwin.tar.gz"
      sha256 "8fa2ab64fe334da49966a14e3c83ec5012ef376db7382615047ff8ffaa2813d7"
    end
    on_intel do
      url "https://github.com/thkt/claude-formatter/releases/download/v0.9.1/formatter-x86_64-apple-darwin.tar.gz"
      sha256 "bf7b06ed086db2fb4d99758dc42e0135610ca299045a2072a6822b6711ccc4dc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/claude-formatter/releases/download/v0.9.1/formatter-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c0d864b6bcdeaca166a13c6b8dd22e572e3a3cbb8454bc58cdfd5462f1fb3977"
    end
    on_intel do
      url "https://github.com/thkt/claude-formatter/releases/download/v0.9.1/formatter-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "41d97c0f7598f50ab52ece53c814f76858d56be5f2c294356e8371d8cf9791c3"
    end
  end

  def install
    bin.install "formatter"
  end

  test do
    output = pipe_output(bin/"formatter", '{"tool_name":"Write","tool_input":{"file_path":"test.txt"}}', 0)
    assert_equal "", output
  end
end
