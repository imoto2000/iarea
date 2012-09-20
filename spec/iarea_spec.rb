# -*- coding: utf-8 -*-

require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
describe "IArea" do

  before do
    @lat = 35.708057
    @lng = 139.75222
  end
  
  it "should load module" do
    IArea.should be_a_kind_of(Module)
  end

  it "should load data" do
    IArea.load!
    IArea::Record.to_yml.should_not be_nil
  end

  it "convert 1st mesh" do
    IArea::Mesh.latlng2mesh(@lat,@lng,3).should =~ /^\d{7}$/
    IArea::Mesh.latlng2mesh(@lat,@lng,4).should =~ /^\d{8}$/
  end

  context "degree is under 2" do 
    it "should return 2nd degree mesh" do
      IArea::Mesh.latlng2mesh(@lat,@lng,-2).should =~ /^\d{6}$/
    end
  end

  context "get iarea record" do
    it "should get iarea record" do
      IArea.find(@lat,@lng).should be_a_kind_of IArea::Record
    end

    it "test" do
      # puts "キリン横浜ビアビレッジ"
      IArea.find(35.490981,139.667322).name.should == "川崎/鶴見"
      # puts "ミニSL、プレーパーク、交通公園、野菜市も！世田谷公園"
      IArea.find(35.6443898,139.6811171).name.should == "三軒茶屋/三宿"
      # puts "小岩井農場"
      IArea.find(35.6812685,139.7651698).name.should == "有楽町/日比谷"
      # puts "ノースポート・モール"
      IArea.find(35.552089,139.579371).name.should == "港北ニュータウン"
      # puts "養老天命反転地"
      IArea.find(35.284494,136.55209).name.should == "西濃"
      # puts "みんみん"
      IArea.find(36.561572,139.88732).name.should == "宇都宮"
    end
  end

  context "prefecture" do
    it "should return prefecture" do
      IArea.find(35.490981,139.667322).prefecture == "神奈川"
    end
  end
end
