# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{pic2ch}
  s.version = "0.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["maiha"]
  s.date = %q{2010-02-09}
  s.description = %q{A gem that provides api to pic2ch}
  s.email = %q{maiha@wota.jp}
  s.extra_rdoc_files = ["README", "MIT-LICENSE"]
  s.files = ["MIT-LICENSE", "README", "Rakefile", "lib/pic2ch.rb", "lib/pic2ch", "lib/pic2ch/pages", "lib/pic2ch/pages/index.rb", "lib/pic2ch/parsers", "lib/pic2ch/parsers/thread.rb", "lib/pic2ch/parsers/index.rb", "lib/pic2ch/parsers/errors.rb", "lib/pic2ch/downloaders.rb", "lib/pic2ch/thread.rb", "lib/pic2ch/downloaders", "lib/pic2ch/downloaders/thread.rb", "lib/pic2ch/thread", "lib/pic2ch/thread/element_parser.rb", "lib/pic2ch/thread/static.rb", "lib/pic2ch/parsers.rb", "lib/pic2ch/cached_accessor.rb", "lib/pic2ch/pages.rb", "spec/provide_helper.rb", "spec/fixtures", "spec/fixtures/deleted.html", "spec/fixtures/36603.html", "spec/its_helper.rb", "spec/spec_helper.rb", "spec/thread_parser_spec.rb"]
  s.homepage = %q{http://github.com/maiha/pic2ch}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{asakusarb}
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{A gem that provides api to pic2ch}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<nokogiri>, [">= 1.4.1"])
      s.add_runtime_dependency(%q<dsl_accessor>, [">= 0.4.0"])
    else
      s.add_dependency(%q<nokogiri>, [">= 1.4.1"])
      s.add_dependency(%q<dsl_accessor>, [">= 0.4.0"])
    end
  else
    s.add_dependency(%q<nokogiri>, [">= 1.4.1"])
    s.add_dependency(%q<dsl_accessor>, [">= 0.4.0"])
  end
end
