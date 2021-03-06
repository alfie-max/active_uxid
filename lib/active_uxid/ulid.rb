# frozen_string_literal: true

class ActiveUxid::Ulid < ActiveUxid::Base

  def self.encode
    klass = new
    klass.uxid_encode
  end

  def uxid_encode
    (1..encoding_length).reduce('') do |str, num|
      shift = 128 - 5 * num
      "#{str}#{encoding_chars[(uxid_octect >> shift) & 0x1f]}"
    end
  end

  def uxid_bytes
    "#{uxid_unixtime_48bit}#{SecureRandom.random_bytes(10)}"
  end

  def uxid_octect
    (hi, lo) = uxid_bytes.unpack('Q>Q>')
    (hi << 64) | lo
  end

  def uxid_unixtime_flex
    (Time.current.to_f * 10_000).to_i
  end

  def uxid_unixtime_48bit
    [uxid_unixtime_flex].pack('Q>')[2..-1]
  end

end
