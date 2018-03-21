Book.where(
  title: 'Harry Potter',
  author: 'JK Rowling',
  description: 'Fiction',
  summary: 'A book about magic and coming of age'
).first_or_create
