# md2book-template

## Installing tools

- Ruby
- Re:View
- md2review
- Node.js

## Getting Started

1. Download a zip from https://github.com/januswel/md2book-template/archive/master.zip
2. Unzip that to your working dir
3. Run following commands

```console
cd <your working dire>

# setup Re:View
review-init review
cd review
mv images/cover.jpg ../images/
rmdir ./images
ln -s ../images ./images

# edit your review/catalog.yml

# install npm packages
cd ..
# edit package.json
npm install
```

## Embedding images

Following line in your markdown will embed sample.png in 50% scale

```markdown
![0.5:sample](../images/sample.png)
```

![0.5:sample](../images/sample.png)

## Showing line numbers for codes

See bin/md2re.sh

## Generating books

```
npm run build
```

Then, see in `dist` dir.
