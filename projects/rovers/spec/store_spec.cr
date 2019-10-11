require "./spec_helper"
require "rover"
describe Store do
  it "stores a rover" do
    Store.create("number-five")
    Store.get("number-five").status.should eq("North (0, 0)")
  end
  
  it "deletes a rover" do
    Store.create("moon-buggy")
    Store.rovers.keys.includes?("moon-buggy").should eq(true)

    Store.delete("moon-buggy")
    Store.rovers.keys.includes?("moon-buggy").should_not eq(true)
  end

  it "translates a move" do
    Store.translate_move("a").should eq(Forward)
    Store.translate_move("L").should eq(Left)
    Store.translate_move("r").should eq(Right)
  end
  
  it "should move a rover" do
    Store.create("voyager")
    Store.move("voyager", "lff")
    Store.get("voyager").orientation.class.should eq(West)
    Store.pretty("voyager").should eq("West (-2, 0)")
  end  
end
