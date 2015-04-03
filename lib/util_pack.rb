require "util_pack/version"

module UtilPack
  refine Class do
    def delegate(*methods, to: nil)
      module_eval methods.inject('') { |defines, name|
        defines += "def #{name}(*a, &b)
          #{to}.#{name}(*a, &b)
        end;"
        defines
      }
    end
  end
end
