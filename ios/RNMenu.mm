#import "RNMenu.h"

#import <react/renderer/components/RNMenuSpecs/ComponentDescriptors.h>
#import <react/renderer/components/RNMenuSpecs/EventEmitters.h>
#import <react/renderer/components/RNMenuSpecs/Props.h>
#import <react/renderer/components/RNMenuSpecs/RCTComponentViewHelpers.h>

#import "RCTFabricComponentsPlugins.h"


using namespace facebook::react;

// Conform to this protocol generated by codegen
@interface RNMenu () <RCTRNMenuViewProtocol>
@end

@implementation RNMenu {
  UIView *_view;
  UIButton *_button;
  UIMenu *_menu;
  NSArray *_actions;
  NSString *_title;
}

// Static method fabric uses to retreive descriptor provider to instantiate the object
+ (ComponentDescriptorProvider)componentDescriptorProvider
{
  return concreteComponentDescriptorProvider<RNMenuComponentDescriptor>();
}

// init: constructor of view
// create defaultPRips using RNMenuProps, as gen by codegen
// assign to private _props and rest is obj c code to create view and layou with AutoLayour
- (instancetype)initWithFrame:(CGRect)frame
{
  if (self = [super initWithFrame:frame]) {
    static const auto defaultProps = std::make_shared<const RNMenuProps>();
    _props = defaultProps;

      NSMutableArray* actions = [[NSMutableArray alloc] init];

      for (int i=0; i< [_actions count]; i++) {
        UIAction *act = [_actions objectAtIndex:i];
        [actions addObject:[UIAction actionWithTitle:act.title image:nil identifier:act.identifier handler:nil]];
      }

      // [actions addObject:[UIAction actionWithTitle:@"Edit"
      //                                        image:nil
      //                                   identifier:nil
      //                                      handler:^(__kindof UIAction* _Nonnull action) {}
          
      // ]];
      _menu = [UIMenu menuWithTitle:@"" children:actions];
      
    _view = [[UIView alloc] init];
    _view.backgroundColor = [UIColor whiteColor];
      
      _button = [[UIButton alloc] init];
      [_button setTitle:@"TEST" forState:UIControlStateNormal];
      _button.backgroundColor = [UIColor blueColor];
      [_button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
      [_button sizeToFit];
      _button.showsMenuAsPrimaryAction = YES;
      _button.menu = _menu;
      [_view addSubview:_button];
      
      // _button.translatesAutoresizingMaskIntoConstraints = false;
      // [NSLayoutConstraint activateConstraints:@[
      //   [_button.leadingAnchor constraintEqualToAnchor:_view.leadingAnchor],
      //   [_button.topAnchor constraintEqualToAnchor:_view.topAnchor],
      //   [_button.trailingAnchor constraintEqualToAnchor:_view.trailingAnchor],
      //   [_button.bottomAnchor constraintEqualToAnchor:_view.bottomAnchor],
      // ]];

    self.contentView = _view;
  }

  return self;
}


// updateProps is invoked by fabric each time a props changes in JS
// downcasted to proper RNMenuProps and used to update native code (and view)
// [super updateProps] should be invoked at the end always to update component
- (void)updateProps:(Props::Shared const &)props oldProps:(Props::Shared const &)oldProps
{
  const auto &oldViewProps = *std::static_pointer_cast<RNMenuProps const>(_props);
  const auto &newViewProps = *std::static_pointer_cast<RNMenuProps const>(props);

  // if (oldViewProps.text != newViewProps.text) {
  //   _label.text = [[NSString alloc] initWithCString:newViewProps.text.c_str() encoding:NSASCIIStringEncoding];
  // }

  if (oldViewProps.title != newViewProps.title) {
    _title = [[NSString alloc] initWithCString:newViewProps.title.c_str() encoding:NSASCIIStringEncoding];
    [_button setTitle:_title forState:UIControlStateNormal];
  }

  [super updateProps:props oldProps:oldProps];
}

@end

// static method to retrieve correct instance of class at runtime
Class<RCTComponentViewProtocol> RNMenuCls(void)
{
  return RNMenu.class;
}
