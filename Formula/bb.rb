# typed: false
# frozen_string_literal: true

class Bb < Formula
  desc "Bitbucket CLI - Work seamlessly with Bitbucket from the command line"
  homepage "https://github.com/dlbroadfoot/bitbucket-cli"
  version "2.84.0-rc4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dlbroadfoot/bitbucket-cli/releases/download/v#{version}/bb_#{version}_macOS_arm64.zip"
      sha256 "d8ef0f03151e54176799fd041ef5c221e8e4ccd943fb6ead4a9d9008c6487ee7"
    else
      url "https://github.com/dlbroadfoot/bitbucket-cli/releases/download/v#{version}/bb_#{version}_macOS_amd64.zip"
      sha256 "0e6cc1087421d99f8415172cb571613496d8da0db56dc5eee04113fcdde22477"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dlbroadfoot/bitbucket-cli/releases/download/v#{version}/bb_#{version}_linux_arm64.tar.gz"
      sha256 "df367b8b7106b20b230641aa4c8be47ec781915a3da148af38e7f87727de9365"
    else
      url "https://github.com/dlbroadfoot/bitbucket-cli/releases/download/v#{version}/bb_#{version}_linux_amd64.tar.gz"
      sha256 "11ebb3a42ca29a546ed01be67f72d3a509bd84cdde17ee18d83a02787f2b027b"
    end
  end

  def install
    bin.install "bb"
  end

  test do
    system "#{bin}/bb", "--version"
  end
end
