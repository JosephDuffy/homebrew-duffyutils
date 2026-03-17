class OpenInJira < Formula
  desc "Open the Jira ticket for the current git branch"
  homepage "https://github.com/JosephDuffy/DuffyUtils"
  url "https://github.com/JosephDuffy/DuffyUtils/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "893f1eab204a35fbdbc0b71d44d408efce8af0af98ff2c81d5a241495eaae306"
  version "0.1.1"
  head "https://github.com/JosephDuffy/DuffyUtils.git", branch: "main"

  uses_from_macos "swift" => :build

  def install
    args = if OS.mac?
      ["--disable-sandbox"]
    else
      ["--static-swift-stdlib"]
    end
    system "swift", "build", *args, "-c", "release", "--product", "open-in-jira"
    bin.install ".build/release/open-in-jira"
  end

  test do
    system bin/"open-in-jira", "--help"
  end
end
