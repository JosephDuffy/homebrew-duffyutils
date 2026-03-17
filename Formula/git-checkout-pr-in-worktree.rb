class GitCheckoutPrInWorktree < Formula
  desc "Create or open a worktree for a GitHub pull request"
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
    system "swift", "build", *args, "-c", "release", "--product", "git-checkout-pr-in-worktree"
    bin.install ".build/release/git-checkout-pr-in-worktree"
  end

  test do
    system bin/"git-checkout-pr-in-worktree", "--help"
  end
end
