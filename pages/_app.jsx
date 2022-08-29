import "../styles/globals.css";

function MyApp({ Component, pageProps }) {
  /* eslint-disable react/jsx-props-no-spreading */
  return <Component {...pageProps} />;
}

export default MyApp;
