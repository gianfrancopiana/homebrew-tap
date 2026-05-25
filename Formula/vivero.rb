# typed: false
# frozen_string_literal: true

class Vivero < Formula
  desc "Local-first preview and QA nursery for coding agents"
  homepage "https://github.com/gianfrancopiana/vivero"
  version "0.5.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gianfrancopiana/vivero/releases/download/v0.5.2/vivero_darwin_arm64.tar.gz"
      sha256 "6d0d742eb3d4e85e9943a21e2a32b086e0265b3c459bb6857c5400094cf208d3"
    else
      url "https://github.com/gianfrancopiana/vivero/releases/download/v0.5.2/vivero_darwin_amd64.tar.gz"
      sha256 "66ba16952893976974e49c588bc6f5ba11e5d697fbe3626d004d92cbc97c3db7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/gianfrancopiana/vivero/releases/download/v0.5.2/vivero_linux_arm64.tar.gz"
      sha256 "4623f113fc16c144e79eb8925a9bb3748d2d2703e8f0dced97e898fc06d6ceeb"
    else
      url "https://github.com/gianfrancopiana/vivero/releases/download/v0.5.2/vivero_linux_amd64.tar.gz"
      sha256 "33b0837e65b5cea2041d51fcb0862a3caa49071909eb9bc1fa1b98471491cdc3"
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
