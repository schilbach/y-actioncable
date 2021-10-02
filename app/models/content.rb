class Content < ApplicationRecord
  has_one :y_doc, as: :record

  after_create :create_initial_y_doc

  private

  def create_initial_y_doc
    self.create_y_doc(xml: '<p>Blubb<p>')
  end
  
end
