$(() => {
  $('form').on('submit', e => {
    submitNumber(e)
      .then(res => createTrivia(res))
      .then(res => appendTrivia(res))
      .fail(err => console.log(err));
  });
});

const submitNumber = e => {
  e.preventDefault();
  const num = $('#num').val();
  return $.ajax({
    url: `http://numbersapi.com/${num}?json`
  });
};

const createTrivia = res => (
  $.ajax({
    url: 'http://localhost:3000/trivia',
    method: 'POST',
    data: {
      trivium: {
        fact: res.text
      }
    }
  })
);

const appendTrivia = res => {
  $('ul').append(`<li>${res.fact}</li>`);
  $('#num').val('');
};
