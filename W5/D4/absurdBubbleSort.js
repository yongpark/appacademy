const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function askIfGreaterThan(el1, el2, callback) {
  reader.question(`Is ${el1} greater than ${el2}? (Please enter yes/no)`, function (response) {
    if (response === "yes") {
      callback(true);
    } else {
      callback(false);
    }
  });
}

function innerBubbleSortLoop(arr, i = 0, madeAnySwaps = false, outerBubbleSortLoop) {
  if (i === arr.length - 1) {
    console.log("finished loop");
    outerBubbleSortLoop(madeAnySwaps);
  } else {
    askIfGreaterThan(arr[i], arr[i+1], function(answer) {
      if (answer === true) {
        let x = arr[i];
        let y = arr[i+1];
        arr[i] = y;
        arr[i + 1] = x;
        madeAnySwaps = true;
        return innerBubbleSortLoop(arr, i + 1, madeAnySwaps, outerBubbleSortLoop);
      } else {
        return innerBubbleSortLoop(arr, i + 1, madeAnySwaps, outerBubbleSortLoop);
      }
    });
  // Do an "async loop":
  // 1. If (i == arr.length - 1), call outerBubbleSortLoop, letting it
  //    know whether any swap was made.
  // 2. Else, use `askIfGreaterThan` to compare `arr[i]` and `arr[i +
  //    1]`. Swap if necessary. Call `innerBubbleSortLoop` again to
  //    continue the inner loop. You'll want to increment i for the
  //    next call, and possibly switch madeAnySwaps if you did swap.
  }
}

// Once you're done testing innerBubbleSortLoop, write outerBubbleSortLoop.
// Once you're done testing outerBubbleSortLoop, write absurdBubbleSort.

function absurdBubbleSort(arr, sortCompletionCallback) {
  function outerBubbleSortLoop(madeAnySwaps) {
    if (madeAnySwaps === true) {
      return innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop);
    } else {
      return sortCompletionCallback(arr);
    }
    // Begin an inner loop if you made any swaps. Otherwise, call
    // `sortCompletionCallback`.
  }
  // Kick the first outer loop off, starting `madeAnySwaps` as true.
  innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop);
}

absurdBubbleSort([3, 2, 1], function (arr) {
  console.log("Sorted array: " + JSON.stringify(arr));
  reader.close();
});
