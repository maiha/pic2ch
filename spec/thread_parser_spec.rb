require File.join(File.dirname(__FILE__), '/spec_helper')

describe Pic2ch::Parsers::Thread do
  describe "for normal page" do
    subject {
      t = Pic2ch::Parsers::Thread.new(nil)
      def t.html() data('36603.html'); end
      t
    }

    its(:title) { should == "ポニーテールの女の子の画像 11本目 - 2ch画像まとめ" }
    its(:time ) { should == 1259455593 }
    its(:count) { should == 150 }
  end

  describe "for deleted page" do
    subject {
      t = Pic2ch::Parsers::Thread.new(nil)
      def t.html() data('deleted.html'); end
      t
    }

    its(:title) { should == "この世のすべての女子高生画像を集めたい。 - 2ch画像まとめ" }

    it "should raise NotFound when time is called" do
      lambda { subject.time }.should raise_error(Pic2ch::Parsers::NotFound)
    end

    it "should raise DeletedPage when count is called" do
      lambda { subject.count }.should raise_error(Pic2ch::Parsers::DeletedPage)
    end
  end
end
