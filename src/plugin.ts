import { AppmetricaPushPlugin as IAppmetricaPushPlugin } from './definitions';
import { Plugins } from '@capacitor/core';

const AppmetricaPushPlugin = Plugins.Appmetrica as IAppmetricaPushPlugin;

export class AppmetricaPush {
  private appmetricaPush = AppmetricaPushPlugin;
}
