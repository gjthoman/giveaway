module Giveaway
  class Entry < Lead::Base
    extend ActiveModel::Naming
    include ActiveModel::Validations
    include ActiveModel::Validations::Callbacks
    include ActiveModel::Conversion
    include ActiveSupport::Configurable

    attribute :first_name, String
    attribute :last_name, String
    attribute :phone, String
    attribute :email, String

    attribute :daves_deals, Boolean
    attribute :money_goals, Boolean
    attribute :daily_reminder, Boolean

    validates :first_name,  presence: true, length: { minimum: 2, maximum: 128 }
    validates :last_name,  presence: true, length: { minimum: 2, maximum: 128 }
    validates :email,       presence: true, length: { maximum: 80 },
                            format: Settings.validation_formats.email
    validates :phone, presence: true, format: Settings.validation_formats.phone


    def persisted?
      false # leads are never considered persisted from an app viewpoint -- there are no updates
    end

    def interested_in
      "urn:lampo:contest:christmas_2014"
    end

    def contact_hash
      {
        first_name: first_name,
        last_name: last_name,
        phone: { primary: phone },
        email: { primary: email },
      }
    end

    def submission_data_hash
      {
        newsletter_lists: newsletter_list,
      }
    end

    private

    def newsletter_list
      newsletters = []
      newsletters << "daves-deals" if daves_deals
      newsletters << "money-goals-2015-reminder" if money_goals
      newsletters << "christmas-2014-daily-reminder" if daily_reminder
      newsletters.sort.join(",")
    end
  end
end