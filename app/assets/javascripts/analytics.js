window.dataLayer = window.dataLayer || [];
function gtag() { dataLayer.push(arguments) };

gtag('js', new Date());

const trackGoogleAnalytics = (event) => {
  gtag('config', 'G-NEW605NMVF', {
    'cookie_flags': 'max-age=7200;secure;samesite=none',
    page_location: event.data.url,
    page_path: event.srcElement.location.pathname,
    page_title: event.srcElement.title
  });

  // set body custom loaded data to 'T' to prevent code loading twice
  $('body').attr('data-loaded','T');
};

if ($('body').attr('data-loaded') == 'T') {
  document.addEventListener('turbolinks:load', trackGoogleAnalytics); // load turbolinks if data-loaded is set to 'T'
} else {
  $(document).ready(trackGoogleAnalytics); // call trackGoogleAnalytics function whe user refresh the page
}
