RSpec.describe HtmlClass do
  it "has a version number" do
    expect(HtmlClass::VERSION).not_to be nil
  end

  it "generates dynamic class names" do
    c = HtmlClass::Base.new(:a, :b)
    expect(c.to_s).to eq("a b")

    c = HtmlClass::Base.new(:a, :b, c: -> { true })
    expect(c.to_s).to eq("a b c")

    c = HtmlClass::Base.new(:a, :b, c: -> { false })
    expect(c.to_s).to eq("a b")

    c = HtmlClass::Base.new(c: -> { true }, a: -> { true }, b: -> { true} )
    expect(c.to_s).to eq("c a b")
  end

  context 'when HtmlClass::Dsl is included' do
    include HtmlClass::Dsl
    it "uses class with `static` method" do
      c = HtmlClass::Base.new(c: static, a: static, b: static)
      expect(c.to_s).to eq("c a b")
    end

    it "generates class name with `html_class`" do
      expect(html_class(:b, c: -> { true })).to eq("b c")
    end
  end
end
