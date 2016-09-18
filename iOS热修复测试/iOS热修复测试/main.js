console.log('run success');
defineClass(
            'ViewController', {
            viewDidLoad : function() {
            self.label().setText("修复bug...");
            self.view().setBackgroundColor(UIColor.redColor());
            },
            })