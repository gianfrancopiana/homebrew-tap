# typed: false
# frozen_string_literal: true

class Vivero < Formula
  desc "Local-first preview and QA nursery for coding agents"
  homepage "https://github.com/gianfrancopiana/vivero"
  version "0.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gianfrancopiana/vivero/releases/download/v0.1.3/vivero_darwin_arm64.tar.gz"
      sha256 "1400ca5d86613ca7a599d8f90d616cd1faba9ebfd32984b5211510ed40a34fbb"
    else
      url "https://github.com/gianfrancopiana/vivero/releases/download/v0.1.3/vivero_darwin_amd64.tar.gz"
      sha256 "596c9541f50ab4b4d3683c46e5858e1c487ff480e013c6ca47bb3000e3acb959"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/gianfrancopiana/vivero/releases/download/v0.1.3/vivero_linux_arm64.tar.gz"
      sha256 "96131556b56ec8f44aec188f9bb3d1acdc224a9e5e3d18c506b611442346a726"
    else
      url "https://github.com/gianfrancopiana/vivero/releases/download/v0.1.3/vivero_linux_amd64.tar.gz"
      sha256 "d6a63550cc019665c4ffbd8f3bb93e313d18ff24404f807ec2df16d50c43e3b8"
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
