export default function (context, options) {
  return {
    name: 'garmin-script-plugin',

    getClientModules() {
      return [require.resolve('./garminrouteupdates.js')];
    },
  };
}
