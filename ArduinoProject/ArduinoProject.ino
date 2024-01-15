const int BOX1_PIN = 2;
const int BOX2_PIN = 4;
const int BOX3_PIN = 7;
const int BOX4_PIN = 8;
const int BOX5_PIN = 12;
const int BOX6_PIN = 13;

const int[] PIN_ARRAY = [
  BOX1_PIN,
  BOX2_PIN,
  BOX3_PIN,
  BOX4_PIN,
  BOX5_PIN,
  BOX6_PIN,
];

int dataArray[6];

const int numOfEgg = 6;
int binaryArray[numOfEgg];

void setup()
{
  Serial.begin(9600);
  pinMode(LED, OUTPUT);
  Serial.println("Start writeing.");
}

void loop()
{
  getData();
  int resolvedData = resolvData(dataArray);
  sendData(resolvedData);
}

void getData()
{
  for (int i = 0; i < 6; i++) {
    int pinValue = digitalRead(PIN_ARRAY[i]);
    dataArray[i] = (pinValue == HIGH) ? 1 : 0;
  }
}

int resolvData(int dataArray[])
{
  int resolvedData = arrayToNumber(dataArray[]);

  return arrayToNumber;
}

void sendData(int data)
{
  Serial.write(data);
}