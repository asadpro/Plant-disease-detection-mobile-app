class DiseaseVideo {
  final disease = {
    "Tomato healthy":
        "https://www.youtube.com/watch?v=tPAXxcn5vaE&ab_channel=TheRightGardening",
    "Tomato Septoria leaf spot":
        "https://www.youtube.com/watch?v=bDQ0ZEYNTNc&ab_channel=HeirloomReviews",
    "Tomato Tomato mosaic virus": "https://www.youtube.com/watch?v=mvZ8lnaNCCM",
    "Tomato Bacterial spot": "https://www.youtube.com/watch?v=jYFLMM6NcdE",
    "Potato Late blight": "https://www.youtube.com/watch?v=jANKhuBXvqk",
    "Pepper bell healthy": "https://www.youtube.com/watch?v=Mr6i4s5bSAU",
    "Pepper bell Bacterial spot":
        "https://www.youtube.com/watch?v=1HgsMF4gd7U&ab channel=MinnesotaWallflower",
    "Tomato Early blight": "https://www.youtube.com/watch?v=2GYD7aVBFtg",
    "Potato healthy": "https://www.youtube.com/watch?v=ianApRDflh0",
    "Tomato Target Spot": "https://www.youtube.com/watch?v=rqM7TLqNPcs",
    "Tomato Spider mites Two-spotted spider mite":
        "https://www.youtube.com/watch?v=iRYvw9vRguk",
    "Tomato Tomato Yellow Leaf Curl Virus":
        "https://www.youtube.com/watch?v=1qK6b55bAeg",
    "Potato Early blight": "https://www.youtube.com/watch?v=kCo2U3PJIik&t=1s",
    "Tomato Leaf Mold": "https://www.youtube.com/watch?v=9JTsQMB8H7M",
    "Tomato Late blight": "https://www.youtube.com/watch?v=QEuknYpO7Eo"
  };
  String? returnVideo(String name) {
    return disease[name];
  }
}
