# typed: false
# frozen_string_literal: true

class Vivero < Formula
  desc "Local-first preview and QA nursery for coding agents"
  homepage "https://github.com/gianfrancopiana/vivero"
  version "0.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gianfrancopiana/vivero/releases/download/v0.6.0/vivero_darwin_arm64.tar.gz"
      sha256 "ad27a1808da60ac53cdb84206043c016bb1bfeaf1aaa6903a70d18660605b0d8"
    else
      url "https://github.com/gianfrancopiana/vivero/releases/download/v0.6.0/vivero_darwin_amd64.tar.gz"
      sha256 "64726543b5d3f5f9a3cbc2208d0dab0d8b0529826a5451ec2311b62d35141300"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/gianfrancopiana/vivero/releases/download/v0.6.0/vivero_linux_arm64.tar.gz"
      sha256 "a4f076ae0388335874699a5c6227b139e4a504daa2a64950f93c29d38ee8d073"
    else
      url "https://github.com/gianfrancopiana/vivero/releases/download/v0.6.0/vivero_linux_amd64.tar.gz"
      sha256 "50d9e5a1d8ec5ed82a2158974eda6285b6314d0d0d264e5373a99ff317326934"
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
