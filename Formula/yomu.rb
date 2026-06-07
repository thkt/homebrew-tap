class Yomu < Formula
  desc "Frontend-specialized semantic code search CLI"
  homepage "https://github.com/thkt/yomu"
  version "0.17.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/yomu/releases/download/v0.17.0/yomu-aarch64-apple-darwin.tar.gz"
      sha256 "b74df7ffd9a336b046d68c03be72b5415192145b61d142434370383354df09e3"
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
