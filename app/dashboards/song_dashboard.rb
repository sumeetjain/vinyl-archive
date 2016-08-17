require "administrate/base_dashboard"

class SongDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    song_file: Field::String,
    song_name: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    album_id: Field::Number,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :song_file,
    :song_name,
    :created_at,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :song_file,
    :song_name,
    :created_at,
    :updated_at,
    :album_id,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :song_file,
    :song_name,
    :album_id,
  ].freeze

  # Overwrite this method to customize how songs are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(song)
  #   "Song ##{song.id}"
  # end
end
