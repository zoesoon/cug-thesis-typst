#import "../../utils/style.typ": 字号, 字体

// 研究生英文摘要页
#let postgraduate-abstract-en(
  // documentclass 传入的参数
  doctype: "master",
  degree: "academic",
  anonymous: false,
  twoside: false,
  fonts: (:),
  // 其他参数
  keywords: (),
  abstract-title-weight: "bold",
  leading: 20pt - 1.0em,
  spacing: 20pt - 1.0em,
  body,
) = {
  // 默认参数
  fonts = 字体 + fonts

  // 正式渲染
  [
    #align(center, par(
      leading: 1.0em, spacing: 1.0em,
      text(
        font: fonts.宋体, size: 字号.小二, 
        weight: abstract-title-weight, "Abstract", 
        bottom-edge: 0em, top-edge: 1.0em))
    )
    
    #set text(
      font: fonts.宋体, size: 字号.小四,
      bottom-edge: 0em, top-edge: 1.0em,
    )
    #set par(
      leading: leading, justify: true, spacing: spacing, 
      first-line-indent: (amount: 2em, all: true)
      )

    #body

    #h(-2.0em)*Key Words*: #(("",)+ keywords.intersperse("; ")).sum()
  ]
  pagebreak(weak: true) //换页
  if twoside {
    pagebreak() // 空白页
  }
}

// 测试代码
// #postgraduate-abstract-en(
//   keywords: ("keyword1", "keyword2", "keyword3"),
//   [Abstract内容与中文摘要相对应。一般不少于300个英文实词，篇幅以一页为宜。如需要，字数可以略多。]
// )