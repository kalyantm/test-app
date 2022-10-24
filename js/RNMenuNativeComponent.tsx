import type { ViewProps } from 'ViewPropTypes';
import type { HostComponent } from 'react-native';
import codegenNativeComponent from 'react-native/Libraries/Utilities/codegenNativeComponent';

interface Action {
  readonly identifer: string;
} 

type ActionType = ReadonlyArray<Readonly<Action>>;

export interface NativeProps extends ViewProps {
  text: string;
  title: string;
  actions: ActionType;
}

export default codegenNativeComponent<NativeProps>(
  'RNMenu'
) as HostComponent<NativeProps>;