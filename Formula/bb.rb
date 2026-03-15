# typed: false
# frozen_string_literal: true

class Bb < Formula
  desc "Bitbucket CLI - Work seamlessly with Bitbucket from the command line"
  homepage "https://github.com/dlbroadfoot/bitbucket-cli"
  version "2.85.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dlbroadfoot/bitbucket-cli/releases/download/v#{version}/bb_#{version}_macOS_arm64.zip"
      sha256 "a716a4afdcbf4d637d42b77b2789ca0ac21f491b10da1db2d8b0c9e78d14f222"
    else
      url "https://github.com/dlbroadfoot/bitbucket-cli/releases/download/v#{version}/bb_#{version}_macOS_amd64.zip"
      sha256 "b2f34faa30ba7f92d46b77090a3bf80edbc4152917aa7fc2150cf37d20d4509c"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dlbroadfoot/bitbucket-cli/releases/download/v#{version}/bb_#{version}_linux_arm64.tar.gz"
      sha256 "160ebfe79fd32ab94659ccc5a896da31605bc78fa8220081ec795dc8e965f8c7"
    else
      url "https://github.com/dlbroadfoot/bitbucket-cli/releases/download/v#{version}/bb_#{version}_linux_amd64.tar.gz"
      sha256 "bd7c0dc5957aea726e65a33bb169cd90ec112d03a057248db83e4861c613ecaf"
    end
  end

  def install
    if File.exist?("bb")
      bin.install "bb"
    else
      bb_binary = Dir.glob("*/bb").first || Dir.glob("bb_*/bb").first
      bin.install bb_binary => "bb" if bb_binary
    end
  end

  test do
    system "#{bin}/bb", "--version"
  end
end
