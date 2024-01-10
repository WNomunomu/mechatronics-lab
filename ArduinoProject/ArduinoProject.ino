int LED = 13;

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

}

int[] resolvData(int dataArray[])
{
  int resolvedData = arrayToNumber(dataArray[]);

  return arrayToNumber;
}

void sendData(int data)
{
  Serial.write(data);
}