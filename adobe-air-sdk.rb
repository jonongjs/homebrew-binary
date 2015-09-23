# Find downloads at: https://helpx.adobe.com/air/kb/archived-air-sdk-version.html
class AdobeAirSdk < Formula
  desc "SDK for Adobe Air"
  homepage "https://www.adobe.com/devnet/air/air-sdk-download.html"
  url "http://airdownload.adobe.com/air/mac/download/19.0/AIRSDK_Compiler.tbz2"
  version "19.0.0.190"
  sha256 "a724d7cae0f9602551e714a9e7ac77217e027de0bb957c9dad4f5596ea5d2c8c"

  conflicts_with "adobe-air-sdk-flex"

  def install
    rm_f Dir["bin/*.bat"]
    libexec.install Dir["*"]
    bin.write_exec_script Dir["#{libexec}/bin/*"]
  end

  def caveats; <<-EOS.undent
    To set AIR_HOME:
      export AIR_HOME=#{libexec}
    EOS
  end

  test do
    assert_equal "#{version}\n", shell_output("#{bin}/adt -version")
  end
end
