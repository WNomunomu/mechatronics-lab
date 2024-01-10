const SPREADSHEET_ID = '1BGrAT4XA7IQTlpgK2_3evVybV9S-LjLezA1PsfPnQPc';

const sheetName = "db";
const spreadsheet = SpreadsheetApp.openById(SPREADSHEET_ID);
const sheet = spreadsheet.getSheetByName(sheetName);

const doPost = (e) => {
  if (e == null || e.postData == null || e.postData.contents == null) return;

  const requestJSON = e.postData.contents;
  const requestObj = JSON.parse(requestJSON);

  const events = requestObj.events;

  events.forEach((event) => {
    if (event.type !== 'message') return;
    const message = event.message;
    if (message.type !== 'text') return;

    const text = message.text;

    setData(text);
  })
};

const setData = (msg) => {
  const data = msg.split(/\n/);
  const row = sheet.getLastRow() + 1;

  const dateCell = sheet.getRange(row, 1);
  const eggDataCell = sheet.getRange(row, 2)

  dateCell.setValue(new Date());
  eggDataCell.setValue(data);
};

const doGet = (e) => {
  const spreadsheet = SpreadsheetApp.openById(SPREADSHEET_ID);
  const sheet = spreadsheet.getSheetByName(sheetName);

  const lastRow = sheet.getLastRow();

  console.log(lastRow);

  const date = sheet.getRange(lastRow,1).getValue();
  const egg_data = sheet.getRange(lastRow,2).getValue();

  const eggData = {
    "date": date,
    "egg_data": egg_data,
  }

  const jsonData = JSON.stringify(eggData);

  return ContentService.createTextOutput(jsonData);
}
