# typed: false
# frozen_string_literal: true

class Vivero < Formula
  desc "Local-first preview and QA nursery for coding agents"
  homepage "https://github.com/gianfrancopiana/vivero"
  version "0.5.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gianfrancopiana/vivero/releases/download/v0.5.3/vivero_darwin_arm64.tar.gz"
      sha256 "c7df05cd09491460345519de11288a870ba798454550f90a29f09f87e7738042"
    else
      url "https://github.com/gianfrancopiana/vivero/releases/download/v0.5.3/vivero_darwin_amd64.tar.gz"
      sha256 "02e0340848cd94c279ef8fad6b28385113e0022be47a22c4ef5c8e06334d02ce"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/gianfrancopiana/vivero/releases/download/v0.5.3/vivero_linux_arm64.tar.gz"
      sha256 "0966a4490b1edd3ecb99ed7ba4521b9050c385e0d9b18147781a213c7e12cc71"
    else
      url "https://github.com/gianfrancopiana/vivero/releases/download/v0.5.3/vivero_linux_amd64.tar.gz"
      sha256 "fec6873c0eac2c87eada3213a90764337eac97e0b400bc5ede43d587c43f5b71"
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
