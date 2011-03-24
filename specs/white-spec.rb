#
# Copyright (c) 2010 Konstantin Bender.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

$: << File.join(File.dirname(__FILE__), "/../source")

require 'white'

describe "White" do
  describe "convert_tabs_to_spaces(string, spaces_per_tab = 4)" do
    it "replaces each indentation tab with 4 spaces" do
      White.convert_tabs_to_spaces("\t").should == "    "
      White.convert_tabs_to_spaces("\t\t\t").should == "            "
    end

    it "replaces each indentation tab with N spaces" do
      White.convert_tabs_to_spaces("\t", 2).should == "  "
      White.convert_tabs_to_spaces("\t\t\t", 2).should == "      "
    end

    it "handles tab and space mixes properly" do
      White.convert_tabs_to_spaces("  \t", 2).should == "    "
      White.convert_tabs_to_spaces("   \t", 2).should == "    "
      White.convert_tabs_to_spaces("\t ", 2).should == "   "
    end
  end
end
