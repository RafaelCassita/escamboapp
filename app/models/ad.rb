class Ad < ApplicationRecord

  before_save :md_to_html


  belongs_to :member
  belongs_to :category, counter_cache: true
  has_many :comments

  validates :title, :description_md, :description_short, :category, :price, :picture, :finish_date, presence: true

  scope :descending_order, -> (page) { 
    order(created_at: :desc).page(page).per(9)  
  } 

  scope :to_the, -> (member) { where(member: member) } 
  scope :by_category, -> (id) { where(category: id) } 
  
  scope :search, -> (q, page) { 
    where("title LIKE ?", "%#{q}%").page(page).per(9) 
  }
  #paperclip
  has_attached_file :picture, styles: { medium:"320x150#", thumb: "100x100>", large: "900x400" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

  #money
  monetize :price_cents

  private
    def md_to_html

      options = {
        filter_html: true,
        link_attributes: {
          rel: "nofollow",
          target: "_blank"
        }
      }

      extensions = {
        space_after_headers: true,
        autolink: true
      }

      renderer = Redcarpet::Render::HTML.new(options)
      markdown = Redcarpet::Markdown.new(renderer, extensions)

      self.description = markdown.render(self.description_md)
    end

end
