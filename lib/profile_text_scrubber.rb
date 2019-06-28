class ProfileTextScrubber < Rails::Html::PermitScrubber
  #
  # FYI
  #
  # <タグ 属性="値">
  #
  # self.tags        許可するタグ
  # self.attributes  許可する属性
  #
  #
  def initialize
    super
    # form関連とscript以外はだいたい許可している
    self.tags = %w(
      html head body title meta div span h1 h2 h3 h4 h5 h6 address p br em strong del ins abbr acronym
      dfn blockquote q cite sup sub pre code var kbd samp bdo font basefont big small b i s strike u tt
      center hr a base link ul ol li dl dt dd dir menu img map area object applet param table caption
      thead tfoot tbody colgroup col tr td th frameset frame noframes style
    )
  end

  def skip_node?(node)
    node.text?
  end
end
