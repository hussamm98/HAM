class Chat {
  final String name, lastMessage, image, time;
  final bool isActive;

  Chat({
    this.name = '',
    this.lastMessage = '',
    this.image = '',
    this.time = '',
    this.isActive = false,
  });
}

List chatsData = [
  Chat(
    name: "Wael Zakaria",
    lastMessage: "Hope you are doing well...",
    image: "assets/images/user.png",
    time: "3m ago",
    isActive: false,
  ),
  Chat(
    name: "Hatem Bahig",
    lastMessage: "Hello Abdullah! I am...",
    image: "assets/images/user_3.png",
    time: "8m ago",
    isActive: true,
  ),
  Chat(
    name: "Mohamed Hashim",
    lastMessage: "Do you have update...",
    image: "assets/images/user_2.png",
    time: "5d ago",
    isActive: false,
  ),
  Chat(
    name: "Azza Abdulrahman",
    lastMessage: "You’re welcome :)",
    image: "assets/images/user_5.png",
    time: "5d ago",
    isActive: true,
  ),
  Chat(
    name: "Kamel Mohamed",
    lastMessage: "Hello Abdullah! I am...",
    image: "assets/images/user_2.png",
    time: "8m ago",
    isActive: true,
  ),
  Chat(
    name: "Dawlat Abdelaziz",
    lastMessage: "Thanks",
    image: "assets/images/user_5.png",
    time: "6d ago",
    isActive: false,
  ),
  Chat(
    name: "Diaa l.Nasser",
    lastMessage: "Do you have update...",
    image: "assets/images/user_3.png",
    time: "5d ago",
    isActive: false,
  ),
];
