/*
* Copyright (C) 2018  Jaroslav Staněk <jaroslav-stanek@pm.me>
*/

namespace App.Widgets{
	public class ControlPanel : Gtk.Toolbar {
		public ControlPanel() {
			var icon = new Gtk.Button.from_icon_name ("object-inverse", Gtk.IconSize.BUTTON);
			var item = new Gtk.ToolButton (icon, "test");
			this.insert (item, 0);
		}
	}
}