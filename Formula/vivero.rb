# typed: false
# frozen_string_literal: true

class Vivero < Formula
  desc "Local-first preview and QA nursery for coding agents"
  homepage "https://github.com/gianfrancopiana/vivero"
  version "0.5.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gianfrancopiana/vivero/releases/download/v0.5.1/vivero_darwin_arm64.tar.gz"
      sha256 "0739c5c535872cf7cbdd8782fb1327197230c8cb156b3ba61d02c7ace4bec296"
    else
      url "https://github.com/gianfrancopiana/vivero/releases/download/v0.5.1/vivero_darwin_amd64.tar.gz"
      sha256 "34067693912ebcf34f4320686ddad00cc8949b16a7f2beceae06324aa3608c0f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/gianfrancopiana/vivero/releases/download/v0.5.1/vivero_linux_arm64.tar.gz"
      sha256 "782cd1c8d07c468ae7db0a9e0884a7f53695cac2417896e79c46ca2ecf42ca58"
    else
      url "https://github.com/gianfrancopiana/vivero/releases/download/v0.5.1/vivero_linux_amd64.tar.gz"
      sha256 "3d9226c01165318ab730e324975bcf71ab0c49785710085d9e04d4ab8c21633e"
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
