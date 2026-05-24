# typed: false
# frozen_string_literal: true

class Vivero < Formula
  desc "Local-first preview and QA nursery for coding agents"
  homepage "https://github.com/gianfrancopiana/vivero"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gianfrancopiana/vivero/releases/download/v0.2.0/vivero_darwin_arm64.tar.gz"
      sha256 "c4cfbb38d4ccb9df5eac7ac0870f915e7c657a3046a5dea946b95fb5f2d36784"
    else
      url "https://github.com/gianfrancopiana/vivero/releases/download/v0.2.0/vivero_darwin_amd64.tar.gz"
      sha256 "20c49b22c6bd4cc930a62db69b236da644fd1eed06e2cd47dc9842c6c7399a05"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/gianfrancopiana/vivero/releases/download/v0.2.0/vivero_linux_arm64.tar.gz"
      sha256 "3ba674e36923e3c952bb22f978556d8dac9d1248eb9b4199a1b7b640291c37b0"
    else
      url "https://github.com/gianfrancopiana/vivero/releases/download/v0.2.0/vivero_linux_amd64.tar.gz"
      sha256 "912323c9cde44367b3ea0d6000af80a3c21f39c1b00fd9868055170a0db319f3"
    end
  end

  def install
    bin.install "vivero"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vivero version --json --no-input")
    system "#{bin}/vivero", "doctor", "--json", "--no-input"
  end
end
