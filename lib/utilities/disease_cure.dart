class DiseaseCure {
  final disease = {
    "Tomato healthy":
        "Tomatoes are the major dietary source of the antioxidant lycopene, which has been linked to many health benefits, including reduced risk of heart disease and cancer. They are also a great source of vitamin C, potassium, folate, and vitamin K.",
    "Tomato Septoria leaf spot":
        "Septoria leaf spot on tomato (Lycopersicon) Septoria leaf spot is caused by a fungus, Septoria lycopersici. It is one of the most destructive diseases of tomato foliage and is particularly severe in areas where wet, humid weather persists for extended periods.",
    "Tomato Tomato mosaic virus":
        "Leftover plant debris is the most common contagion. Tomato mosaic virus of tomatoes can exist in the soil or plant debris for up to two years, and can be spread just by touch a gardener who touches or even brushes up against an infected plant can carry the infection for the rest of the day.",
    "Tomato Bacterial spot":
        "Bacterial spot of tomato is caused by Xanthomonas vesicatoria, Xanthomonas euvesicatoria, Xanthomonas gardneri, and Xanthomonas perforans. These bacterial pathogens can be introduced into a garden on contaminated seed and transplants, which may or may not show symptoms.",
    "Potato Late blight":
        "Late blight, also called potato blight, disease of potato and tomato plants that is caused by the water mold Phytophthora infestans. The disease occurs in humid regions with temperatures ranging between 4 and 29 °C (40 and 80 °F).",
    "Pepper bell healthy":
        "Peppers have a lot going for them. They're low in calories and are loaded with good nutrition. All varieties are excellent sources of vitamins A and C, potassium, folic acid, and fiber. ",
    "Pepper bell Bacterial spot":
        "Bacterial spot is one of the most devastating diseases of pepper and tomato. The disease occurs worldwide where pepper and tomato are grown in warm, moist areas.",
    "Tomato Early blight":
        "Early blight is one of the most common tomato diseases, occurring nearly every season wherever tomatoes are grown. It affects leaves, fruits and stems and can be severely yield limiting when susceptible cultivars are used and weather is favorable. Severe defoliation can occur and result in sunscald on the fruit.",
    "Potato healthy":
        "Potatoes are a good source of fiber, which can help you lose weight by keeping you full longer. Fiber can help prevent heart disease by keeping cholesterol and blood sugar levels in check.",
    "Tomato Target Spot":
        "Also known as early blight, target spot of tomato is a fungal disease that attacks a diverse assortment of plants, including papaya, peppers, snap beans, potatoes, cantaloupe, and squash as well as passion flower and certain ornamentals.",
    "Tomato Spider mites Two-spotted spider mite":
        "Spider mites can occur in tomato, eggplant, potato, vine crops such as melons, cucumbers, and other crops. ... Two-spotted spider mites are one of the most important pests of eggplant. They have up to 20 generations per year and are favored by excess nitrogen and dry and dusty conditions.",
    "Tomato Tomato Yellow Leaf Curl Virus":
        "Tomato yellow leaf curl virus is a species in the genus Begomovirus and family Geminiviridae. Tomato yellow leaf curl virus (TYLCV) infection induces severe symptoms on tomato plants and causes serious yield losses worldwide. TYLCV is persistently transmitted by the sweetpotato whitefly, Bemisia tabaci (Gennadius).",
    "Potato Early blight":
        "Early blight of potato is caused by the fungal pathogen Alternaria solani. The disease affects leaves, stems and tubers and can reduce yield, tuber size, storability of tubers, quality of fresh-market and processing tubers and marketability of the crop.",
    "Tomato Leaf Mold":
        "Tomato leaf mold is a fungal disease that can develop when there are extended periods of leaf wetness and the relative humidity is high (greater than 85 percent). Due to this moisture requirement, the disease is seen primarily in hoophouses and greenhouses.",
    "Tomato Late blight":
        "Late blight is a potentially devastating disease of tomato and potato, infecting leaves, stems, tomato fruit, and potato tubers. The disease spreads quickly in fields and can result in total crop failure if untreated. Late blight does not occur every year in Minnesota."
  };
  String? returnDesc(String description) {
    return disease[description];
  }
}
