class Prescription {
  final disease = {
    "Tomato healthy": "Your plant is already healthy.",
    "Tomato Septoria leaf spot":
        "Septoria leaf spot on tomato is caused by a fungus, and could be treated by removing infected leaves immediately, and be sure to wash your hands and pruners thoroughly before working with uninfected plants and also begin spraying as soon as the first symptoms appear and follow the label directions for continued management.",
    "Tomato Tomato mosaic virus":
        "Remove all infected plants and destroy them. Do NOT put them in the compost pile, as the virus may persist in infected plant matter. Burn infected plants or throw them out with the garbage and also monitor the rest of your plants closely, especially those that were located near infected plants.",
    "Tomato Bacterial spot":
        "Bacterial spot of tomato is caused by Xanthomonas vesicatoria and could be cured by removing symptomatic plants from the field or greenhouse to prevent the spread of bacteria to healthy plants.  Burn, bury or hot compost the affected plants and DO NOT eat symptomatic fruit.  Although bacterial spot pathogens are not human pathogens, the fruit blemishes that they cause can provide entry points for human pathogens that could cause illness.",
    "Potato Late blight":
        "Late blight, also called potato blight, disease of potato and tomato plants that is caused by the water mold Phytophthora infestans and could be cured by eliminating cull piles and volunteer potatoes, using proper harvesting and storage practices, and applying fungicides when necessary. Air drainage to facilitate the drying of foliage each day is important.",
    "Pepper bell healthy": "Your plant is already healthy",
    "Pepper bell Bacterial spot":
        "Bacterial spot could be cured by removing symptomatic plants from the field or greenhouse to prevent the spread of bacteria to healthy plants. Burn, bury or hot compost the affected plants and DO NOT eat symptomatic fruit.",
    "Tomato Early blight":
        "Early blight is one of the most common tomato diseases which could be cured by removing and destroying any affected area of the tomato plant. If you notice any telltale signs, prune those sections from the plant and discard them far away from your garden. .",
    "Potato healthy": "Your plant is already healthy",
    "Tomato Target Spot":
        "Also known as early blight, target spot of tomato is a fungal disease that attacks a diverse assortment of plants, it can be treated as removing old plant debris at the end of the growing season; otherwise, the spores will travel from debris to newly planted tomatoes in the following growing season, thus beginning the disease anew. Dispose of the debris properly and don't place it on your compost pile unless you're sure your compost gets hot enough to kill the spores.",
    "Tomato Spider mites Two-spotted spider mite":
        "Spider mites can occur in tomato, eggplant, potato, vine crops such as melons, cucumbers, and other crops and could be  treating for two-spotted mites is to apply a pesticide specific to mites called a miticide. Ideally, you should start treating for two-spotted mites before your plants are seriously damaged. Apply the miticide for control of two-spotted mites every 7 days or so. Since mites can develop resistance to chemicals, switch to another type of miticide after three applications.",
    "Tomato Tomato Yellow Leaf Curl Virus":
        "Tomato yellow leaf curl virus is a species in the genus Begomovirus and family Geminiviridae. it could be treated as by spraying on the entire plant and below the leaves; eggs and flies are often found below the leaves. Spray every 14-21 days and rotate on a monthly basis with Abamectin so that the whiteflies do not build-up resistance to chemicals..",
    "Potato Early blight":
        "Early blight of potato is caused by the fungal pathogen Alternaria solani. It can be minimized by maintaining optimum growing conditions, including proper fertilization, irrigation, and management of other pests. Grow later maturing, longer season varieties. Fungicide application is justified only when the disease is initiated early enough to cause economic loss..",
    "Tomato Leaf Mold":
        "Tomato leaf mold is a fungal disease that could be minimized by sanitizing the greenhouse between crop seasons. Use fans and avoid overhead watering to minimize leaf wetness. Also, stake and prune plants to increase ventilation. If the disease is detected, apply a fungicide according to the manufacturer's instructions at the first sign of infection..",
    "Tomato Late blight":
        "Spraying fungicides is the most effective way to prevent late blight. For conventional gardeners and commercial producers, protectant fungicides such as chlorothalonil (e.g., Bravo, Echo, Equus, or Daconil) and Mancozeb (Manzate) can be used."
  };
  String? returnPrescription(String name) {
    return disease[name];
  }
}
