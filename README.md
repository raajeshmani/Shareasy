# Shareasy

***One tap away space to display all your thoughts for every idea***

## Features
- QR Code scan your ideas
- One tap to copy
- One tap to paste
- Supports pagination
- Smooth scroll
- Hash store - To store all the hashes to your unique ideas
<br>

## Shareasy in GiFs

<p float="left">
  <img src="https://drive.google.com/uc?export=view&id=1xS10mBYPkSuCBpnxfsfGy1qM_PbhkUwQ"  height="680em" />
  <img src="https://drive.google.com/uc?export=view&id=1__ruCldqYoVy7WZc5N8Jxsw17_EUVIGc"  height="680em" />
    
</p>
<br>

## Custom changes made to Flutter src 

Changes made to bottom_sheet.dart in Original Flutter Package for text_input_sheet to coerce with keyboard input

    BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return BoxConstraints(
      minWidth: constraints.maxWidth,
      maxWidth: constraints.maxWidth,
      minHeight: 0.0,
      // maxHeight: isScrollControlled
      //   ? constraints.maxHeight
      //   : constraints.maxHeight * 9.0 / 16.0,
      maxHeight: constraints.maxHeight,
    );
  }
