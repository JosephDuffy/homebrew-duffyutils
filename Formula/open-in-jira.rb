class OpenInJira < Formula
  desc "Open the Jira ticket for the current git branch"
  homepage "https://github.com/JosephDuffy/DuffyUtils"
  url "https://github.com/JosephDuffy/DuffyUtils/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "2a7a0ee09290a559b9212599e0a2ed05a5ee035e39443ce7836be393967ceebb"
  version "0.1.0"
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
