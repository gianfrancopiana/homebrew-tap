# typed: false
# frozen_string_literal: true

class Vivero < Formula
  desc "Local-first preview and QA nursery for coding agents"
  homepage "https://github.com/gianfrancopiana/vivero"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gianfrancopiana/vivero/releases/download/v0.3.0/vivero_darwin_arm64.tar.gz"
      sha256 "d61c3f0dd228707b951af3ff5901ec7d26645e5ba617065d6d426accfa9e96ad"
    else
      url "https://github.com/gianfrancopiana/vivero/releases/download/v0.3.0/vivero_darwin_amd64.tar.gz"
      sha256 "bf9a2af8409a0b23d9c6dc677946638738a362a67adb5c99268af251bbb69f52"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/gianfrancopiana/vivero/releases/download/v0.3.0/vivero_linux_arm64.tar.gz"
      sha256 "c88a99a64f934cc08be8955a79952211d92379a2418a210ce546364befe7ff3b"
    else
      url "https://github.com/gianfrancopiana/vivero/releases/download/v0.3.0/vivero_linux_amd64.tar.gz"
      sha256 "223452746a31a617b3fb4a8cbf5c3b73b61408f6f28ba3aaa883db538f979da3"
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
