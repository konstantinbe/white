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

module White
  BACKUP_EXTENSION = "white-backup"
  EXCLUDE_REGEXP = /\.(app|xcdatamodeld|xib|xcodeproj|git)$/i
  SPACES_PER_TAB = 4

  CONFIGS = {}

  CONFIGS[:default] = {}
  CONFIGS[:default][:spaces_per_tab] = SPACES_PER_TAB
  CONFIGS[:default][:convert_tabs_to_spaces] = true
  CONFIGS[:default][:clean_end_of_line] = true
  CONFIGS[:default][:clean_end_of_file] = true
  CONFIGS[:default][:end_of_line_pattern] = /[ \t]+$/
  CONFIGS[:default][:end_of_line_replacement] = ''
  CONFIGS[:default][:end_of_file_pattern] = /(.*\S)\s*\Z/
  CONFIGS[:default][:end_of_file_replacement] = '\1' + "\n"

  # Two or more spaces at the end of line denote an intentional
  # line break in markdown documents. nsert exactly two spaces
  # for two or more spaces or remove single spaces.
  CONFIGS[:markdown] = {}
  CONFIGS[:markdown][:end_of_line_pattern] = /(.*?(?:  )?)[ \t]+$/
  CONFIGS[:markdown][:end_of_line_replacement] = '\1'

  CONFIGS[:ruby] = {}
  CONFIGS[:ruby][:spaces_per_tab] = 2

  CONFIGS[:coffee_script] = {}
  CONFIGS[:coffee_script][:spaces_per_tab] = 2

  def parse_options(args)
    # TODO: implement.
    options = {}
  end

  def find_files_to_be_cleaned(search_paths)
    paths = []
    search_paths.each do |search_path|
      Find.find(search_path) do |path|
        Find.prune if File.directory?(path) && path.match(EXCLUDE_REGEXP)
        is_text_file = `file #{path}`.match /text/
        should_be_included = !path.match(EXCLUDE_REGEXP)
        paths << path if is_text_file && should_be_included
      end
    end
    paths
  end

  def generate_config_for(paths, options = {})
    configs = {}
    paths.each do |path|
      default_config = CONFIGS[:default].clone
      type = type_of path
      custom_config = if type then CONFIGS[type.to_sym] else {} end
      configs[path] = default_config.merge(custom_config).merge(options)
    end
    configs
  end

  def convert_tabs_to_spaces(string, spaces_per_tab = SPACES_PER_TAB)
    cleaned_string = ""
    string.each_line do |line|
      index = 0
      while true
        index = line.index "\t"
        break if index == nil
        line[index] = " " * (spaces_per_tab - index % spaces_per_tab)
      end
      cleaned_string << line
    end
    cleaned_string
  end

  def clean_end_of_line(string, pattern, replacement)
    string.gsub pattern, replacement
  end

  def clean_end_of_file(string, pattern, replacement)
    string.gsub pattern, replacement
  end

  def read_from(path)
    IO.read path
  end

  def write_to(path, string)
    File.open(path, "w") { |file| file.write string }
  end

  def type_of(path)
    type = case File.extname(path).downcase
    when '.rb' then 'ruby'
    when '.coffee' then 'coffee_script'
    when '.md', '.mdown', '.markdown' then 'markdown'
    when '.htm', '.html' then 'html'
    end

    type ||= case File.basename(path).downcase
    when 'rakefile' then 'ruby'
    when 'cakefile' then 'coffee_script'
    end
    type
  end
end

include White
