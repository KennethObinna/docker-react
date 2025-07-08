import React from 'react';
import { render, screen } from '@testing-library/react';
import App from './App';
import ReactDom from 'react-dom';
 

it('renders without crashing',()=>{
    const div = document.createElement('div');
    ReactDom.render(<App />, div);
    ReactDom.unmountComponentAtNode(div);
});

test('renders learn react link', () => {
  render(<App />);
  // const linkElement = screen.getByText(/learn react/i);
 const linkElement = screen.getByText(/I love God/i);
  expect(linkElement).toBeInTheDocument();
});

 