# typed: false
# frozen_string_literal: true

class Vivero < Formula
  desc "Local-first preview and QA nursery for coding agents"
  homepage "https://github.com/gianfrancopiana/vivero"
  version "0.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gianfrancopiana/vivero/releases/download/v0.3.1/vivero_darwin_arm64.tar.gz"
      sha256 "2c1a415840ecd1862dc9c5480d598d26a2465896c958296a34e85173e27cb4ec"
    else
      url "https://github.com/gianfrancopiana/vivero/releases/download/v0.3.1/vivero_darwin_amd64.tar.gz"
      sha256 "6ec3b1677de79121f43367e55c121f1e72530711f1766acae8809dba058bdc6c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/gianfrancopiana/vivero/releases/download/v0.3.1/vivero_linux_arm64.tar.gz"
      sha256 "ee384f359e9351288815ebbdfecb676f2bf050686d78f169fef4da653155025a"
    else
      url "https://github.com/gianfrancopiana/vivero/releases/download/v0.3.1/vivero_linux_amd64.tar.gz"
      sha256 "cc36c49dcd1fc22e48a9e2ea4bf35e0e18eff9fe0276507bdbdaeffc2047ea4a"
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
