require 'rails_helper'

RSpec.describe Book, type: :model do
  context "validations" do
    # --- Title ---
    it "is valid with a title" do
      book = Book.new(title: "Valid Title", author: "Author", price: 9.99, published_date: Date.today)
      expect(book).to be_valid
    end

    it "is invalid without a title" do
      book = Book.new(title: "", author: "Author", price: 9.99, published_date: Date.today)
      expect(book).not_to be_valid
      expect(book.errors[:title]).to include("can't be blank")
    end

    # --- Author ---
    it "is valid with an author" do
      book = Book.new(title: "Valid Title", author: "Jane Doe", price: 9.99, published_date: Date.today)
      expect(book).to be_valid
    end

    it "is invalid without an author" do
      book = Book.new(title: "Valid Title", author: "", price: 9.99, published_date: Date.today)
      expect(book).not_to be_valid
      expect(book.errors[:author]).to include("can't be blank")
    end

    # --- Price ---
    it "is valid with a positive price" do
      book = Book.new(title: "Valid Title", author: "Author", price: 19.99, published_date: Date.today)
      expect(book).to be_valid
    end

    it "is invalid with a negative price" do
      book = Book.new(title: "Valid Title", author: "Author", price: -5, published_date: Date.today)
      expect(book).not_to be_valid
      expect(book.errors[:price]).to include("must be greater than or equal to 0")
    end

    # --- Date ---
    it "is valid with a published date" do
      book = Book.new(title: "Valid Title", author: "Author", price: 9.99, published_date: Date.today)
      expect(book).to be_valid
    end

    it "is invalid without a published date" do
      book = Book.new(title: "Valid Title", author: "Author", price: 9.99, published_date: nil)
      expect(book).not_to be_valid
      expect(book.errors[:published_date]).to include("can't be blank")
    end
  end
end