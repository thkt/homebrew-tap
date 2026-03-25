class Yomu < Formula
  desc "Frontend-specialized semantic code search CLI"
  homepage "https://github.com/thkt/yomu"
  version "0.10.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/yomu/releases/download/v0.10.3/yomu-aarch64-apple-darwin.tar.gz"
      sha256 "032cf0e03f3cd24e840aced397fe8d0342f6da9430fde8f44c192a6e72efec8e"
    end
  end

  def install
    bin.install "yomu"
    bin.install "mlx.metallib" if File.exist?("mlx.metallib")
  end

  test do
    assert_predicate bin/"yomu", :executable?
  end
end
