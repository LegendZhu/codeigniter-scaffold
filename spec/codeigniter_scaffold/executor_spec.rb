require "spec_helper"

describe CodeigniterScaffold::Executor do

  let(:executor) { CodeigniterScaffold::Executor.new  }

  context "when arguments are not sent" do

    it "show help for user" do
      executor.run(nil).should == CodeigniterScaffold::Command::Help.new.run(nil)
    end
  end
  context "when arguments are sent" do
    context "and argument is '-h'" do
      it "show help for user" do
        executor.run(['-h']).should == CodeigniterScaffold::Command::Help.new.run(['-h'])
      end
    end

    context "and argument is '--help'" do
      it "show help for user" do
        executor.run(['--help']).should == CodeigniterScaffold::Command::Help.new.run(['--help'])
      end
    end

    context "and argument is '-i'" do
      after(:all) do
        unziped = ["application","index.php","system","user_guide"]
        unziped.each { |f| FileUtils.rm_rf Dir.glob(f) }
      end

      it "unzip codeigniter for user" do
        executor.run(['-i']).should == CodeigniterScaffold::Command::Init.new.run(['-i'])
      end
    end

  end
end
