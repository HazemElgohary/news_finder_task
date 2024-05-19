extension FormatDuration on Duration {
  String format() {
    final int hours = inHours.remainder(24).toInt();
    final int minutes = inMinutes.remainder(60).toInt();
    final int seconds = inSeconds.remainder(60).toInt();
    final String formattedDuration =
        '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    return formattedDuration;
  }
}
