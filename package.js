Package.describe({
  summary: "Flat Web User Interface Kit"
});

Package.on_use(function (api) {

  api.add_files([
    'css/bootstrap.css',
    'css/flat-ui.css',
    'images/checkbox-2x.png',
    'js/jquery-1.8.2.min.js',
    'js/jquery-ui-1.10.0.custom.min.js',
    'js/jquery.dropkick-1.0.0.js',
    'js/custom_checkbox_and_radio.js',
    'js/custom_radio.js',
    'js/jquery.placeholder.js'
  ], 'client');
});