enum DefaultCategories {
  images(
    title: 'Зображення',
    extensions: ['jpg', 'png'],
  ),
  video(
    title: 'Відео',
    extensions: ['mp4'],
  ),
  audio(
    title: 'Музика',
    extensions: ['mp3'],
  ),
  documents(
    title: 'Документи',
    extensions: ['doc', 'docx', 'txt'],
  );

  final String title;
  final List<String> extensions;

  const DefaultCategories({
    required this.title,
    required this.extensions,
  });
}