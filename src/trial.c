#include "string.h"
#include "Hacl_SHA2_256.h"

int main() {
  uint32_t input_len = 3U;
  uint8_t output[32U];
  uint8_t input[3U] =
    { 0x53, 0x61, 0x69 }; //"Sai"
  uint8_t expected[32U] =
       { 0xb6, 0xc7, 0xe8, 0x8b, 0x41, 0xb7, 0x64, 0x60, 
         0x66, 0x87, 0x4f, 0xeb, 0x22, 0x0a, 0xca, 0xd3, 
         0x21, 0x2a, 0x9d, 0x7b, 0xc4, 0x2e, 0xcf, 0x39,
         0x5b, 0x51, 0x87, 0x62, 0x21, 0x1f, 0xb7, 0x0b };
  Hacl_SHA2_256_hash(output,input, input_len);
  printf("\nHash: ");
  for(int i=0;i<32;i++)
    printf("%x",output[i]);
  if (memcmp(output, expected, 32U) != 0)
     printf("\nFailure\n");
  else
    printf("\nSUCCESS\n");  
  return 0;
}

//hash: b6c7e88b41b7646066874feb220acad3212a9d7bc42ecf395b518762211fb70b
