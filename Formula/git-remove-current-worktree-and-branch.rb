class GitRemoveCurrentWorktreeAndBranch < Formula
  desc "Remove the current worktree and its associated branch"
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
    system "swift", "build", *args, "-c", "release", "--product", "git-remove-current-worktree-and-branch"
    bin.install ".build/release/git-remove-current-worktree-and-branch"
  end

  test do
    system bin/"git-remove-current-worktree-and-branch", "--help"
  end
end
