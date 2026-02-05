class GitNewBranchAndWorktree < Formula
  desc "Create a new git branch and worktree"
  homepage "https://github.com/JosephDuffy/DuffyUtils"
  url "https://github.com/JosephDuffy/DuffyUtils/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "07091789008b48fba04685cb9dc1af5771dae78aee33bb4d4ac52e83293366a3"
  version "0.0.1"
  head "https://github.com/JosephDuffy/DuffyUtils.git", branch: "main"

  uses_from_macos "swift" => :build

  def install
    args = if OS.mac?
      ["--disable-sandbox"]
    else
      ["--static-swift-stdlib"]
    end
    system "swift", "build", *args, "-c", "release", "--product", "git-new-branch-and-worktree"
    bin.install ".build/release/git-new-branch-and-worktree"
  end

  test do
    system bin/"git-new-branch-and-worktree", "--help"
  end
end
