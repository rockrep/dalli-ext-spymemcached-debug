require 'spec_helper'

describe Dalli::Ring do
  let(:server_klass) do
    Struct.new(:hostname, :port, :weight) do
      def alive?
        true
      end
    end
  end
  let(:foo) {server_klass.new("foo.com", 11211, 1)}
  let(:bar) {server_klass.new("bar.com", 11211, 1)}
  let(:baz) {server_klass.new("baz.com", 11211, 1)}
  let(:ring) {Dalli::Ring.new([foo, bar, baz], {})}
  let(:empty_ring) {Dalli::Ring.new([], {})}

  it "should hash as expected" do
    ring.hash_for("foo").should == 101574
    ring.hash_for("bar").should == 97299
    ring.hash_for("baz").should == 97307
    ring.hash_for("1234").should == 1509442
  end

  it "should return the expected server" do
    ring.server_for_key("0123").should == foo
    ring.server_for_key("1234").should == bar
    ring.server_for_key("2345").should == baz

    ring.server_for_key("abc").should == foo
    ring.server_for_key("abcd").should == bar
    ring.server_for_key("abcdef").should == foo

    ring.server_for_key("bb5eiplr").should == foo
    ring.server_for_key("5zvutsib").should == baz
    ring.server_for_key("19yh6i75").should == baz
  end

  it "should raise a Dalli::NetworkError if no server is defined" do
    expect {
      empty_ring.server_for_key("0123")
    }.to raise_error(Dalli::NetworkError, "No servers available")
  end
end
