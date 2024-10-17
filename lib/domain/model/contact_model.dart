class Contact {
  final String imageUrl;
  final String name;

  const Contact({
    required this.imageUrl,
    required this.name,
  });
}

const List<Contact> contacts = [
  Contact(name: 'Alice Johnson', imageUrl: 'assets/images/w1.jpg'),
  Contact(name: 'Bob Smith', imageUrl: 'assets/images/w2.jpg'),
  Contact(name: 'Catherine Bell', imageUrl: 'assets/images/w3.jpg'),
  Contact(name: 'David Lee', imageUrl: 'assets/images/w4.jpg'),
  Contact(name: 'Emma Watson', imageUrl: 'assets/images/w5.jpg'),
  Contact(name: 'Frank Miller', imageUrl: 'assets/images/w6.jpg'),
  Contact(name: 'Grace Kim', imageUrl: 'assets/images/w7.jpg'),
  Contact(name: 'Henry Ford', imageUrl: 'assets/images/w8.jpg'),
  Contact(name: 'Isabella Brown', imageUrl: 'assets/images/w9.jpg'),
  Contact(name: 'Jack White', imageUrl: 'assets/images/w10.jpg'),
];