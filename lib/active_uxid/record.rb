# frozen_string_literal: true

module ActiveUxid
  module Record
    extend ActiveSupport::Concern
  end
end

# rubocop:disable Metrics/LineLength
ActiveUxid::Record.include(ActiveUxid::Record::Hash) if ActiveUxid::Settings.config.encoder_type == 'hash'
ActiveUxid::Record.include(ActiveUxid::Record::Ulid) if ActiveUxid::Settings.config.encoder_type == 'ulid'
# rubocop:enable Metrics/LineLength
