import { Controller } from '@hotwired/stimulus';

// Connects to data-controller="categories"
export default class extends Controller {
  connect() {
    const btn = document.getElementById('icon-popup');
    btn.onclick = () => createIconPopup();
  }
}

const createIconPopup = () => {
  const popupWrapper = document.createElement('div');
  popupWrapper.classList.add('popup-wrapper');
  popupWrapper.id='popup-wrapper'
  const popup = document.createElement('div');
  popup.classList.add('popup');
  popup.id = 'popup-container';
  const header = document.createElement('h2');
  header.textContent = 'Select An Icon';
  popup.appendChild(header);

  const iconsContainer = document.createElement('div');
  iconsContainer.classList.add('icons-container');

  icons.forEach((icon) => {
    const newdiv = document.createElement('div');
    newdiv.classList.add('radio-grouping');
    newdiv.innerHTML = `<input type="radio" name="icon" id=${icon.name} value=${icon.name} >
     <i class="material-icons outlined md-48">
      ${icon.name}
     </i>
    `;
    iconsContainer.appendChild(newdiv);
  });
  popup.appendChild(iconsContainer);
  const popupBtnGroup = document.createElement('div');
  popupBtnGroup.classList.add('popup-btn-group');

  const okbutton = document.createElement('button');
  okbutton.classList.add('popup-btn','bg-primary', 'text-secondary')
  okbutton.setAttribute('type', 'button');
  okbutton.textContent = 'Select';
  okbutton.onclick = () => setTextField();
  const cancelbutton = document.createElement('button');
  cancelbutton.classList.add('popup-btn','bg-primary', 'text-secondary')
  cancelbutton.setAttribute('type', 'button');
  cancelbutton.textContent = 'Cancel';
  cancelbutton.onclick = () => dismisspopup();
  popupBtnGroup.appendChild(cancelbutton);
  popupBtnGroup.appendChild(okbutton);
  popup.appendChild(popupBtnGroup);
  const errMsg = document.createElement('h5');
  errMsg.id='popup-err-msg';
  errMsg.textContent=' '
  popup.appendChild(errMsg)
  popupWrapper.appendChild(popup);
  document.body.appendChild(popupWrapper);
};

const setTextField = () => {
  const txtfield = document.getElementById('new_category_icon');
  const selected_radio = document.querySelector(
    "input[type='radio'][name=icon]:checked"
  );
  if (selected_radio === null){
    const erMsg = document.getElementById('popup-err-msg');
    erMsg.textContent='Please select an Icon'
  }
  else{
    txtfield.value = selected_radio.value;
    dismisspopup();
  }
};

const dismisspopup = () => {
  const popup = document.getElementById('popup-wrapper');
  document.body.removeChild(popup);
};

const icons = [
  { class: 'material-icons-outlined', name: 'payments' },
  { class: 'material-icons-outlined', name: 'shopping_cart' },
  { class: 'material-icons-outlined', name: 'shopping_bag' },
  { class: 'material-icons-outlined', name: 'store' },
  { class: 'material-icons-outlined', name: 'credit_card' },
  { class: 'material-icons-outlined', name: 'medical_services' },
  { class: 'material-icons-outlined', name: 'school' },
  { class: 'material-icons-outlined', name: 'games' },
  { class: 'material-icons-outlined', name: 'flight_takeoff' },
  { class: 'material-icons-outlined', name: 'receipt_long' },
  { class: 'material-icons-outlined', name: 'laptop_chromebook' },
  { class: 'material-icons-outlined', name: 'directions_car' },
  { class: 'material-icons-outlined', name: 'star' },
  { class: 'material-icons-outlined', name: 'favorite' },
];
