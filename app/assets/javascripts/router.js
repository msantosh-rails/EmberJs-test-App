// For more information see: http://emberjs.com/guides/routing/

Emberjsapp.Router.map(function() {
   this.resource('samples');
});

//Emberjsapp.Router.map(function() {
//  this.resource("samples", function() {
//    this.resource("sample", { path: ":sample_id" });
//  });
//});



//Emberjsapp.Router.map(function() {
//  this.route('sample');
//  this.resource('samples', function() {
//    return this.route('new');
//  });
//  return this.resource('sample', {
//    path: '/samples/:sample_id'
//  }, function() {
//    return this.route('edit');
//  });
//});

