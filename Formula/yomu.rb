class Yomu < Formula
  desc "Frontend-specialized semantic code search CLI"
  homepage "https://github.com/thkt/yomu"
  version "0.16.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/yomu/releases/download/v0.16.0/yomu-aarch64-apple-darwin.tar.gz"
      sha256 "f39bcc614a695871fcbad350f93d922065c32d15eb7bd37e4bdf8fb1d49cd069"
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
