using Weave
using Base.Test

function publish_test(outfile, format)
  outfile = joinpath("documents/publish", outfile)
  infile = "documents/publish_test.jmd"
  weave(infile, doctype = format, out_path = outfile, template = "templates/mini.tpl")
  result =  readstring(open(outfile))
  ref =  readstring(open(outfile * ".ref"))
  @test result == ref
  rm(outfile)
end

#Test formatters
publish_test("publish_tex.tex", "md2tex")
publish_test("publish_test.html", "md2html")
