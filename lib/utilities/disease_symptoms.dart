class DiseaseSymptom {
  final disease = {
    "Tomato healthy":
        "A healthy tomato plant has softly fuzzed, medium-green leaves.",
    "Tomato Septoria leaf spot":
        "Septoria leaf spot usually appears on the lower leaves after the first fruit sets. Spots are circular, about 1/16 to 1/4 inch in diameter with dark brown margins and tan to gray centers with small black fruiting structures. Characteristically, there are many spots per leaf.",
    "Tomato Tomato mosaic virus":
        "If tomatoes are infected by mosaic virus, they may appear yellow and stunted overall. Mottled light and dark green on leaves. Leaves may be curled, malformed, or reduced in size. Spots of dead leaf tissue may become apparent with certain varieties at warm temperatures.",
    "Tomato Bacterial spot":
        "Bacterial spot appears on leaves as small (less than ⅛ inch), sometimes water-soaked (i.e., wet-looking) circular areas. Spots may initially be yellow-green, but darken to brownish-red as they age. When the disease is severe, extensive leaf yellowing and leaf loss can also occur.",
    "Potato Late blight":
        "The first symptoms of potato late blight in the field are small, light to dark green, circular to irregular-shaped water-soaked spots. These lesions usually appear first on the lower leaves. Lesions often begin to develop near the leaf tips or edges, where dew is retained the longest.",
    "Pepper bell healthy":
        "healthy pepper plants require loose, well-drained soil. ",
    "Pepper bell Bacterial spot":
        "Symptoms begin as small, yellow-green lesions on young leaves which usually appear deformed and twisted, or as dark, water soaked, greasy-appearing lesions on older foliage ",
    "Tomato Early blight":
        "Leaf spots are round, brown and can grow up to half inch in diameter. Larger spots have target-like concentric rings. The tissue around spots often turns yellow. Severely infected leaves turn brown and fall off, or dead, dried leaves may cling to the stem.",
    "Potato healthy":
        "Potatoes grow best in cool, well-drained, loose soil that is about 45° to 55°F (7° to 13°C). Choose a location that gets full sun—at least 6 hours of sunlight each day. Grow potatoes in rows spaced about 3 feet apart.",
    "Tomato Target Spot":
        "Target spot. Target spot symptoms begin as small dark lesions which enlarges to form light brown lesions with concentric pattern and a yellow halo around it in the transplants. Lesions can be seen inside the canopy and the micro-climate favors the infection process.",
    "Tomato Spider mites Two-spotted spider mite":
        "Leaves of mite-infested plants may turn yellow and dry up, and plants may lose vigor and die when infestations are severe. The undersides of affected leaves appear tan or yellow and have a crusty texture. Heavy infestations of the two-spotted spider mite produce fine webbing that may cover the entire plant.",
    "Tomato Tomato Yellow Leaf Curl Virus":
        "Two to three weeks after inoculation, the infected tomato plant displays pronounced disease symptoms that include upward cupping of the leaves, chlorosis of the leaf margins and severe stunting of the entire plant.",
    "Potato Early blight":
        "Symptoms of early blight infection on potato appear as dark and sunken lesions on the surface. Tuber lesions may be circular or irregular in shape and can be surrounded by a raised dark-brown border. The underlying tissue is dry with a corky texture and a dark-brown color ",
    "Tomato Leaf Mold":
        "Symptoms start as pale green to yellowish spots on upper leaf surfaces that turn a bright yellow. The spots merge as the disease progresses and the foliage then dies. Infected leaves curl, wither, and often drop from the plant. Flowers, stems, and fruit may be infected, although usually only leaf tissue is affected.",
    "Tomato Late blight":
        "The first symptoms of late blight on tomato leaves are irregularly shaped, water-soaked lesions, often with a lighter halo or ring around them."
  };
  String? returnSymptom(String symptom) {
    return disease[symptom];
  }
}
