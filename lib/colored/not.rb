require 'colored'

def Colored!
  String.class_eval do
    Colored.instance_methods.each do |m|
      undef_method m
      define_method(m) do |*args|
        Colored.instance_method(m).bind(self).call(*args)
      end
    end
  end
end

module Colored
  class << self
    def not!
      String.class_eval do
        colors = COLORS.keys
        (
          EXTRAS.keys - %w[clear] +
          colors +
          colors.map { |c| "on_#{c}" } +
          colors.product(colors).reject { |p| p.inject(:==) }.map { |p| p.join '_on_' }
        ).map(&:to_sym).each do |m|
          undef_method m
          alias_method m, :dup
        end
      end
    end
  end
end

