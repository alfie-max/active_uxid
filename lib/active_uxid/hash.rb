# frozen_string_literal: true

module ActiveUxid
  class Hash < ActiveUxid::Base

    ENCODING_BASE ||= ENCODING_CHARS.length

    def initialize(id)
      @id = id
    end

    def self.encode(id)
      klass = new(id)
      klass.encode_uxid
    end

    def self.decode(id)
      klass = new(id)
      klass.decode_uxid
    end

    def encode_uxid
      uxid_encode_chars((@id + ENCODING_SALT) << ENCODING_LENGTH)
    end

    def decode_uxid
      (uxid_decode_chars(@id) >> ENCODING_LENGTH) - ENCODING_SALT
    end

    def uxid_encode_chars(id)
      return '0' if id.zero?
      return nil if id.negative?

      str = ''

      while id.positive?
        str = "#{ENCODING_CHARS[id % ENCODING_BASE]}#{str}"
        id /= ENCODING_BASE
      end

      str
    end

    def uxid_decode_chars(id)
      pos = 0
      num = 0
      len = id.length
      max = len - 1

      while pos < len
        pow = ENCODING_BASE**(max - pos)
        num += ENCODING_CHARS.index(id[pos]) * pow
        pos += 1
      end

      num
    end

  end
end
