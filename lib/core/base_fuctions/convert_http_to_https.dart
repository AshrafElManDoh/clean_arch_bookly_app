String convertHttpToHttps(String? url) {
  if (url == null) return "";
  return url.startsWith('http://')
      ? url.replaceFirst('http://', 'https://')
      : url;
}
