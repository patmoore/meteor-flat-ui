# Meteor FlatUI

[Flat UI](http://designmodo.github.io/Flat-UI/) packaged for Meteor using [Meteorite](https://github.com/oortcloud/meteorite).

## Installation

The preferred method is to add this package directly into your Metorite's `smart.json` package file:

```javascript
{
  "packages": {
    "meteor-flat-ui" : { 
	"branch" : "master",
	"git" : "https://github.com/electricjesus/meteor-flat-ui.git"
    }
  }
}
```

### To rebuild with a new version of Flat UI

Copy the new assets into the assets folder and run `ruby process.rb` from root. You can muck with which files are included by changing the IGNORE array in process.rb.

### Disclaimer

This fork's purpose is for my own personal documentation on how I use this package by @erikpukinskis. I cannot guarantee that everything here would work the same way on your respective systems. 

But if you do encounter stuff, please do not hesitate to submit an issue and I'll try to help you out!
