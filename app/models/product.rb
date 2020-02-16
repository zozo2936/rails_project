class Product < ApplicationRecord
  include AASM
  belongs_to :user

  enum status: { on_shelves: 0, off: 1, stock: 2 }

  aasm column: 'status', no_direct_assignment: false do
    state :on_shelves, initial: true
    state :off, :stock

    event :down do
      transactions from: :on_shelves, to: [:off, :stock]
    end

    # event :insufficient do
    #   transactions from: :on_shelves, to: :stock
    # end

    event :enough do
      transactions from: [:off, :stock], to: :on_shelves
    end
  end
end
