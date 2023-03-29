class Xtermcontrol < Formula
  desc "Enable dynamic control of xterm properties"
  homepage "https://thrysoee.dk/xtermcontrol/"
  url "https://github.com/JessThrysoee/xtermcontrol/archive/refs/tags/3.8.tar.gz"
  sha256 "a87e0fbb44b19989c08189cf1220b7ae359fc51e979730da404e5fe96707d41f"
  license "GPL-2.0-or-later"

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--libdir=#{lib}",
                          "--disable-silent-rules"
    system "make", "install"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test xtermcontrol`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    assert_match "xtermcontrol 3.8", shell_output("#{bin}/xtermcontrol --version").strip
  end
end
