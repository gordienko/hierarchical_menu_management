class Menuitem < ApplicationRecord
  validates :name, presence: true
  acts_as_list scope: [:ancestry]
  has_ancestry cache_depth: true, counter_cache: true
  belongs_to :menuitemable, polymorphic: true, optional: true

  validates :name, presence: true, unless: :regular_link?

  def regular_link?
    menuitemable.present?
  end

  def to_s
    if name.present?
      name
    elsif menuitemable.present?
      menuitemable.to_s
    else
      ""
    end
  end

  def the_link
    if menuitemable
      menuitemable.link
    else
      link
    end
  end
end
