class GitCheckoutPrInWorktree < Formula
  desc "Create or open a worktree for a GitHub pull request"
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
    system "swift", "build", *args, "-c", "release", "--product", "git-checkout-pr-in-worktree"
    bin.install ".build/release/git-checkout-pr-in-worktree"
  end

  test do
    system bin/"git-checkout-pr-in-worktree", "--help"
  end
end
