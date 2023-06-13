import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool _isLoading = false; // New variable to control the loading state

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_animationController);

    _animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isLoading = true; // Show loading indicator
          _animationController.reset(); // Reset the animation
        });

        // Perform your button click logic here
        // Simulating a delay with Future.delayed for 2 seconds
        Future.delayed(Duration(seconds: 2), () {
          setState(() {
            _isLoading = false; // Hide loading indicator
            _animationController.forward(); // Start the arrow animation
          });
        });
      },
      child: Container(
        height: 50,
        width: 150,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: _animation.value * 120),
                child: _isLoading
                    ? CircularProgressIndicator(
                        // Show loading indicator when isLoading is true
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      )
                    : Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Click Me',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
