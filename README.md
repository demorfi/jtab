# JTab
-------
JTab is “Displays content in tabs for a framework JQuery” [Check out the demo](https://demorfi.github.io/jtab)

Required
========
* jQuery framework >= 1.8
* [* Java for build]

Features
========
* Light weight (min. 5KB code)
* Cross browser support (IE, Chrome, Firefox, Opera, Vivaldi)
* Load contents in tab using Ajax
* Wide API interfaces
* Easy to adapt skins, customize the way you like
* Supports custom animations
* Customize the way you like

How to Use
==========

Install the tab in the footer
```javascript
  <script src="/javascript/jtab.jquery.min.js"></script>
  <script>$(function() {$('#tab').jtab()});</script>
```

Markup is pretty straightforward, it looks something like this
``` html
<ul id="tab" class="jtab-ul">
  <li><a href="#tab1">one</a></li>
  <li><a href="#tab2" data-content="content.html #content">two</a></li>
  <li><a href="#tab3">three</a></li>
  <li><a href="#tab4">four</a></li>
</ul>
<div class="jtab-content-list">
  <div id="tab2" class="jtab-content">...Rescue Content #tab2...</div>
  <div id="tab3" class="jtab-content">...Content #tab3...</div>
  <div id="tab4" class="jtab-content">...Content #tab4...</div>
  <div id="tab1" class="jtab-content">...Content #tab1...</div>
</div>
```

or add special class for your `<ul>` element `<ul class="jtab-trigger jtab-ul">`.
Following the order (tab2, tab3... tab1) used to display the activity tabs even without javascript!

Options
=======
<table>
  <tr>
    <th>Option</th>
    <th>Default</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>start</td>
    <td>1</td>
    <td>[number] Start init tab</td>
  </tr>
  <tr>
    <td>params</td>
    <td>false</td>
    <td>[boolean] or [object] Additional data to be ajax sent</td>
  </tr>
  <tr>
    <td>trackingHash</td>
    <td>true</td>
    <td>[boolean] Tracking browser url - hash</td>
  </tr>
</table>

Callback
========
<table>
  <tr>
    <th>Option</th>
    <th>Default</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>callback.init</td>
    <td>$.noop</td>
    <td>[function] Callback init tab</td>
  </tr>
  <tr>
    <td>callback.trigger</td>
    <td>$.noop</td>
    <td>[function] Callback trigger callback function</td>
  </tr>
  <tr>
    <td>callback.change</td>
    <td>function (data)</td>
    <td>[function] Callback change tab</td>
  </tr>
  <tr>
    <td>callback.select</td>
    <td>function (data, event)</td>
    <td>[function] Callback select tab</td>
  </tr>
  <tr>
    <td>callback.content</td>
    <td>function (data)</td>
    <td>[function] Callback loading content in tab</td>
  </tr>
  <tr>
    <td>callback.hash</td>
    <td>function (data)</td>
    <td>[function] Callback change browser url - hash</td>
  </tr>
</table>

Animate
=======
<table>
  <tr>
    <th>Option</th>
    <th>Default</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>animate.open</td>
    <td>false</td>
    <td>[boolean] or [function] Animate effect open tab</td>
  </tr>
  <tr>
    <td>animate.close</td>
    <td>false</td>
    <td>[boolean] or [function] Animate effect close tab</td>
  </tr>
</table>

Using Animations
=================
```javascript
$('#tab').jtab({
  animate: {
      open: function (obj)
      {
          $(obj).stop().css({'opacity': 0}).show().animate({'opacity': 1}, 800);
      },
      close: function (obj)
      {
          $(obj).stop().animate({'opacity': 0}, 800).hide();
      }
  }
});
```

Build
=====
```bash
cd ~ && git clone https://github.com/demorfi/jtab.git jtab && cd jtab
make && ls builds -lX

# rebuild
make clean && make && ls builds -lX
```

or use ready files in directories.

Change Log
==========
v1.0 - Mar 09, 2015
--------------------
 * Initialize repository version 1.0

License
=======
JiS is licensed under the [MIT License](http://www.opensource.org/licenses/mit-license.php).
