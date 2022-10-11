const { GObject, Gtk, Gdk } = imports.gi;

const ExtensionUtils = imports.misc.extensionUtils;
const Me = ExtensionUtils.getCurrentExtension();
const Settings = Me.imports.settings;
const Configuration = new Settings.Prefs();

const DEFAULT_SETTINGS = {
    showPercentSign: true,
    isCpuUsageEnable: true,
    cpuUsageText: 'U',
    isMemoryUsageEnable: true,
    memoryUsageText: 'M',
    isDownloadSpeedEnable: true,
    downloadSpeedText: '↓',
    isUploadSpeedEnable: true,
    uploadSpeedText: '↑',
    itemSeparator: ' ',
    refreshInterval: 1,
    fontFamily: 'Sans',
    fontSize: '14',
    textColor: '#DDDDDD',
};

const WIDGET_TEMPLATE_FILE = Gtk.get_major_version() === 3 ? 'prefs_gtk3.ui' : 'prefs.ui';

const N_ = function (e) {
    return e;
};

const colorToHex = (color) => {
    return N_('#%02x%02x%02x').format(255 * color.red, 255 * color.green, 255 * color.blue);
};

const SimpleSystemMonitorPrefsWidget = GObject.registerClass(
    {
        GTypeName: 'SimpleSystemMonitorPrefsWidget',
        Template: Me.dir.get_child(WIDGET_TEMPLATE_FILE).get_uri(),
        InternalChildren: [
            'show_percent_sign_switch',
            'cpu_usage_enable_switch',
            'cpu_usage_text',
            'memory_usage_enable_switch',
            'memory_usage_text',
            'download_speed_enable_switch',
            'download_speed_text',
            'upload_speed_enable_switch',
            'upload_speed_text',
            'item_separator',
            'refresh_interval',
            'font_button',
            'text_color',
        ],
    },
    class SimpleSystemMonitorPrefsWidget extends Gtk.Box {
        _init() {
            super._init({
                orientation: Gtk.Orientation.VERTICAL,
                spacing: 30,
            });

            this.update_widget_setting_values();
        }

        update_widget_setting_values() {
            this._show_percent_sign_switch.set_active(Configuration.SHOW_PERCENT_SIGN.get());
            this._cpu_usage_enable_switch.set_active(Configuration.IS_CPU_USAGE_ENABLE.get());
            this._cpu_usage_text.set_text(Configuration.CPU_USAGE_TEXT.get());
            this._memory_usage_enable_switch.set_active(Configuration.IS_MEMORY_USAGE_ENABLE.get());
            this._memory_usage_text.set_text(Configuration.MEMORY_USAGE_TEXT.get());
            this._download_speed_enable_switch.set_active(
                Configuration.IS_DOWNLOAD_SPEED_ENABLE.get(),
            );
            this._download_speed_text.set_text(Configuration.DOWNLOAD_SPEED_TEXT.get());
            this._upload_speed_enable_switch.set_active(Configuration.IS_UPLOAD_SPEED_ENABLE.get());
            this._upload_speed_text.set_text(Configuration.UPLOAD_SPEED_TEXT.get());
            this._item_separator.set_text(Configuration.ITEM_SEPARATOR.get());
            this._refresh_interval.set_value(Configuration.REFRESH_INTERVAL.get());
            this._font_button.set_font(
                `${Configuration.FONT_FAMILY.get()} ${Configuration.FONT_SIZE.get()}`,
            );
            const color = new Gdk.RGBA();
            color.parse(Configuration.TEXT_COLOR.get());
            this._text_color.set_rgba(color);
        }

        reset_settings_to_default() {
            Configuration.SHOW_PERCENT_SIGN.set(DEFAULT_SETTINGS.showPercentSign);
            Configuration.IS_CPU_USAGE_ENABLE.set(DEFAULT_SETTINGS.isCpuUsageEnable);
            Configuration.CPU_USAGE_TEXT.set(DEFAULT_SETTINGS.cpuUsageText);
            Configuration.IS_MEMORY_USAGE_ENABLE.set(DEFAULT_SETTINGS.isMemoryUsageEnable);
            Configuration.MEMORY_USAGE_TEXT.set(DEFAULT_SETTINGS.memoryUsageText);
            Configuration.IS_DOWNLOAD_SPEED_ENABLE.set(DEFAULT_SETTINGS.isDownloadSpeedEnable);
            Configuration.DOWNLOAD_SPEED_TEXT.set(DEFAULT_SETTINGS.downloadSpeedText);
            Configuration.IS_UPLOAD_SPEED_ENABLE.set(DEFAULT_SETTINGS.isUploadSpeedEnable);
            Configuration.UPLOAD_SPEED_TEXT.set(DEFAULT_SETTINGS.uploadSpeedText);
            Configuration.ITEM_SEPARATOR.set(DEFAULT_SETTINGS.itemSeparator);
            Configuration.REFRESH_INTERVAL.set(DEFAULT_SETTINGS.refreshInterval);
            Configuration.FONT_FAMILY.set(DEFAULT_SETTINGS.fontFamily);
            Configuration.FONT_SIZE.set(DEFAULT_SETTINGS.fontSize);
            Configuration.TEXT_COLOR.set(DEFAULT_SETTINGS.textColor);
        }

        color_changed(widget) {
            Configuration.TEXT_COLOR.set(colorToHex(widget.get_rgba()));
        }

        font_changed(widget) {
            const font = widget.get_font();
            const lastSpaceIndex = font.lastIndexOf(' ');
            const fontFamily = font.substring(0, lastSpaceIndex);
            const fontSize = font.substring(lastSpaceIndex, font.length);
            Configuration.FONT_FAMILY.set(fontFamily);
            Configuration.FONT_SIZE.set(fontSize);
        }

        show_percent_sign_switch_changed(widget) {
            Configuration.SHOW_PERCENT_SIGN.set(widget.get_active());
        }

        cpu_usage_enable_switch_changed(widget) {
            Configuration.IS_CPU_USAGE_ENABLE.set(widget.get_active());
        }

        memory_usage_enable_switch_changed(widget) {
            Configuration.IS_MEMORY_USAGE_ENABLE.set(widget.get_active());
        }

        download_speed_enable_switch_changed(widget) {
            Configuration.IS_DOWNLOAD_SPEED_ENABLE.set(widget.get_active());
        }

        upload_speed_enable_switch_changed(widget) {
            Configuration.IS_UPLOAD_SPEED_ENABLE.set(widget.get_active());
        }

        cpu_usage_text_changed(widget) {
            Configuration.CPU_USAGE_TEXT.set(widget.get_text());
        }

        memory_usage_text_changed(widget) {
            Configuration.MEMORY_USAGE_TEXT.set(widget.get_text());
        }

        download_usage_text_changed(widget) {
            Configuration.DOWNLOAD_SPEED_TEXT.set(widget.get_text());
        }

        upload_usage_text_changed(widget) {
            Configuration.UPLOAD_SPEED_TEXT.set(widget.get_text());
        }

        item_separator_changed(widget) {
            Configuration.ITEM_SEPARATOR.set(widget.get_text());
        }

        refresh_interval_changed(widget) {
            Configuration.REFRESH_INTERVAL.set(widget.get_value());
        }

        reset_settings_to_default_clicked(widget) {
            this.reset_settings_to_default();
            this.update_widget_setting_values();
        }
    },
);

function init() {
    ExtensionUtils.initTranslations();
}

function buildPrefsWidget() {
    const widget = new SimpleSystemMonitorPrefsWidget();
    widget.homogeneous = true;
    if (Gtk.get_major_version() === 3) {
        widget.show_all();
    }
    return widget;
}
