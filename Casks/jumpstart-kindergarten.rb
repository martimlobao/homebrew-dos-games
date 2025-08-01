cask "jumpstart-kindergarten" do
    version "1.0.0"
    sha256 "2c71433663a84dffcabee568191234bb000084565ee76fd5064675f9e2b9162a"

    url "https://github.com/martimlobao/homebrew-dos-games/releases/download/jumpstart-kindergarten-v#{version}/jumpstart-kindergarten.app.zip"
    name "JumpStart Kindergarten"
    desc "Windows Kindergarten educational game from 1994"
    homepage "https://github.com/martimlobao/homebrew-dos-games"

    app "JumpStart Kindergarten.app"

    zap trash: "~/Library/Application Support/JumpStart Kindergarten"
  end
