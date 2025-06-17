import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.cyan[400],
        appBar: AppBar(
          title: Text("My First App"),
          backgroundColor: Colors.cyan[800],
        ),
        body: Align(
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 10,
                      blurRadius: 7,
                      offset: Offset(2, 3),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image(
                    image: AssetImage("images/groot.jpg"),
                    height: 400,
                    width: 400,
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                  ),
                ),
              ),

              SizedBox(height: 20), // Adds some space between the images
              Image.network(
                'https://t3.ftcdn.net/jpg/02/94/09/58/240_F_294095883_tdwtTijiGOvDxP5TXktlPna91f1fJ5N3.jpg', // Replace with your image URL
                height: 400, // Optional: Set height for the network image
                width: 400, // Optional: Set width for the network image
                fit: BoxFit
                    .cover, // Optional: How the image should be inscribed into the space
                alignment: Alignment
                    .center, // Optional: Alignment of the image within the space

                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child; // Image is fully loaded
                  }
                  return Container(
                    // Or any other loading indicator
                    width: 400,
                    height: 400,
                    child: Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null, // Indeterminate progress if total bytes not known
                      ),
                    ),
                  );
                },
                errorBuilder: (BuildContext context, Object error,
                    StackTrace? stackTrace) {
                  // You can return any widget here to display the error.
                  // For example, an icon or a placeholder image.
                  return Container(
                    width: 400,
                    height: 400,
                    color: Colors.grey[300], // Placeholder color
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.error_outline,
                          color: Colors.red,
                          size: 50,
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Could not load image',
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
