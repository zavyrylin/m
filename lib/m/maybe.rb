module M
  class Maybe < Monad
    def self.return(value)
      return value if value == Nothing
      Just(value)
    end

    def self.join(value)
      return Nothing if value == Nothing
      super
    end
  end

  class Just < Maybe; end

  class Nothing < Maybe
    class << self
      def bind(_); self; end
      def fmap(_); self; end
      def >=(_); self; end

      def to_s(*)
        "Nothing"
      end

      def inspect
        "Nothing"
      end
    end
  end

  def Maybe(v); Maybe.return(v); end
  def Just(v); Just.new(v); end
end
