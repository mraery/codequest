import '../models/code_track_model.dart';
import '../models/curriculum_models.dart';

final List<LearningUnit> cUnits = [
  LearningUnit(
    id: "c_unit_1",
    unitNumber: 1,
    title: "C Dili Temelleri & GCC Derleme Boru Hattı",
    language: CodeLanguage.c,
    category: "Temeller & Tipler",
    colorHex: 0xFF0284C7,
    cheatSheetTitle: "C Derleme Hile Kağıdı",
    cheatSheetContent: r'''#include <stdio.h>
int main(int argc, char *argv[]) {
    printf('Merhaba C!\n');
    return 0;
}''',
    lessons: [
      Lesson(
        id: "c_unit_1_l1",
        title: "C Dilinin Tarihi & Sistem Programlama Felsefesi",
        description: "Donanıma doğrudan erişim ve performans",
        xpReward: 35,
        gemReward: 12,
        isUnitExam: false,
        questions: [
          Question(
            id: "c_unit_1_l1_q1",
            type: QuestionType.conceptCard,
            conceptTitle: "C Dilinin Tarihi & Sistem Programlama Felsefesi - Hap Bilgi",
            rule: "C dilinde işaretçiler (pointers) doğrudan bellek adreslerini saklar. '&' operatörü bir değişkenin adresini alırken, '*' (dereference) o adresteki veriye erişir veya değiştirir.",
            codeExample: r'''#include <stdio.h>
#include <stdlib.h>

int main() {
    int x = 100;
    int *ptr = &x;
    
    printf("x Degeri: %d\n", *ptr);
    printf("x Bellek Adresi: %p\n", (void*)ptr);
    return 0;
}''',
            devTip: "malloc ile tahsis edilen her bayt bellek için mutlaka bir free() çağrısı yapılmalıdır, aksi halde Memory Leak oluşur.",
            iconEmoji: "⚡",
          ),
          Question(
            id: "c_unit_1_l1_q2",
            type: QuestionType.multipleChoice,
            prompt: "Heap bellekte dinamik olarak bayt cinsinden bellek tahsis etmek için hangi standart kütüphane fonksiyonu kullanılır?",
            codeSnippet: r'''int *arr = (int*)___(10 * sizeof(int));''',
            options: ["malloc", "alloc", "new", "heap_get"],
            correctIndex: 0,
            explanation: "'malloc(size_t size)' heap bölgesinde istenen bayt kadar bellek ayırır ve void* işaretçi döner.",
          ),
          Question(
            id: "c_unit_1_l1_q3",
            type: QuestionType.multipleChoice,
            prompt: "malloc veya calloc ile tahsis edilen dinamik belleğin sisteme iade edilmesi için hangi fonksiyon çağrılmalıdır?",
            codeSnippet: r'''int *buf = malloc(1024);
// ... kullanim ...
___(buf);''',
            options: ["free", "delete", "release", "dispose"],
            correctIndex: 0,
            explanation: "'free(ptr)' heap bellekte ayrılan alanı serbest bırakır. Çağrılmazsa 'Memory Leak' oluşur.",
          ),
          Question(
            id: "c_unit_1_l1_q4",
            type: QuestionType.multipleChoice,
            prompt: "Tahsis ettiği belleği otomatik olarak sıfırlarla (0 baytları) dolduran dinamik bellek fonksiyonu hangisidir?",
            codeSnippet: r'''int *p = ___(100, sizeof(int));''',
            options: ["calloc", "malloc", "realloc", "zalloc"],
            correctIndex: 0,
            explanation: "'calloc(num, size)' eleman sayısı ve eleman boyutu alır, ayrılan tüm bellek hücrelerini 0 ile başlatır.",
          ),
          Question(
            id: "c_unit_1_l1_q5",
            type: QuestionType.multipleChoice,
            prompt: "Daha önce ayrılmış dinamik bir bellek bloğunun boyutunu veri kaybı olmadan büyütmek veya küçültmek için ne kullanılır?",
            codeSnippet: r'''ptr = ___(ptr, new_size);''',
            options: ["realloc", "resize", "remalloc", "expand"],
            correctIndex: 0,
            explanation: "'realloc' mevcut bloğu genişletir veya yeni bir konuma taşıyarak eski veriyi kopyalar.",
          ),
          Question(
            id: "c_unit_1_l1_q6",
            type: QuestionType.multipleChoice,
            prompt: "C programlama dilinde GCC derleme sürecinin doğru sırası aşağıdakilerden hangisidir?",
            options: ["Preprocessor -> Compiler -> Assembler -> Linker", "Compiler -> Preprocessor -> Linker -> Assembler", "Assembler -> Compiler -> Linker -> Preprocessor", "Linker -> Assembler -> Compiler -> Preprocessor"],
            correctIndex: 0,
            explanation: "Önce makrolar ve headerlar çözülür (cpp), C kodu Assembly'ye derlenir (cc1), makine koduna çevrilir (as), kütüphaneler bağlanır (ld).",
          ),
          Question(
            id: "c_unit_1_l1_q7",
            type: QuestionType.multipleChoice,
            prompt: "64-bit modern bir mimaride standart bir işaretçi (pointer - int*, char*, void*) değişkeni bellekte kaç bayt yer kaplar?",
            codeSnippet: r'''printf("%zu", sizeof(int*));''',
            options: ["8 bayt", "4 bayt", "2 bayt", "16 bayt"],
            correctIndex: 0,
            explanation: "64-bit mimarilerde bellek adresleri 64 bit yani tam 8 bayttır. İşaretçinin tipi ne olursa olsun adres boyutu 8 bayttır.",
          ),
          Question(
            id: "c_unit_1_l1_q8",
            type: QuestionType.multipleChoice,
            prompt: "Bir struct içindeki bir işaretçi elemana erişirken '.' yerine hangi pratik operatör kullanılır?",
            codeSnippet: r'''struct User *u = getUser();
u___name = "Ahmet";''',
            options: ["-> (Ok operatörü)", ".", "::", "=>"],
            correctIndex: 0,
            explanation: "'u->name', '(*u).name' yazımının daha okunaklı ve standart kısayoludur.",
          ),
          Question(
            id: "c_unit_1_l1_q9",
            type: QuestionType.multipleChoice,
            prompt: "Herhangi bir veri tipine ait bellek adresini tutabilen jenerik (tip bağımsız) işaretçi tipi hangisidir?",
            codeSnippet: r'''___ generic_ptr = &x;''',
            options: ["void*", "any*", "object*", "generic*"],
            correctIndex: 0,
            explanation: "'void*' tipi belirsiz jenerik bir işaretçidir; doğrudan dereference edilemez, cast edilmesi gerekir.",
          ),
          Question(
            id: "c_unit_1_l1_q10",
            type: QuestionType.multipleChoice,
            prompt: "Serbest bırakılmış (free edilmiş) bir işaretçiyi kullanmaya devam etme hatasına ne ad verilir?",
            codeSnippet: r'''free(ptr);
printf("%d", *ptr); // HATA!''',
            options: ["Dangling Pointer (Askıda Kalan İşaretçi)", "Stack Overflow", "Memory Leak", "Deadlock"],
            correctIndex: 0,
            explanation: "free edildikten sonra hala o adresi göstermeye devam eden işaretçiye dangling pointer denir; 'ptr = NULL' yapılarak önlenir.",
          ),
          Question(
            id: "c_unit_1_l1_q11",
            type: QuestionType.multipleChoice,
            prompt: "C programlarında bellek sızıntılarını (memory leak) ve geçersiz bellek erişimlerini tespit etmek için en popüler Linux aracı hangisidir?",
            codeSnippet: r'''$ ___ --leak-check=full ./program''',
            options: ["valgrind", "gdb", "perf", "strace"],
            correctIndex: 0,
            explanation: "Valgrind (özellikle memcheck aracı) C/C++ programlarında bellek yönetim hatalarını ayrıntılı raporlar.",
          ),
          Question(
            id: "c_unit_1_l1_q12",
            type: QuestionType.multipleChoice,
            prompt: "Aşağıdaki bit düzeyinde (bitwise) operatörlerden hangisi bitleri 1 basamak sola kaydırarak 2 ile çarpmayı sağlar?",
            codeSnippet: r'''int x = 5;
int y = x ___ 1; // y = 10 olur''',
            options: ["<<", ">>", "&", "|"],
            correctIndex: 0,
            explanation: "Sola kaydırma (<< n) operatörü sayının değerini 2^n ile çarpar.",
          ),
          Question(
            id: "c_unit_1_l1_q13",
            type: QuestionType.fillInTheBlank,
            prompt: "Geçersiz veya henüz atanmamış bir işaretçiye güvenli başlangıç değeri olarak _____ atanmalıdır.",
            explanation: "İşaretçilere NULL atamak tanımsız belleğe erişimi ve segmentation fault hatalarını engellemeye yardımcı olur.",
            blankOptions: ["NULL", "0xFF", "void", "NaN"],
            correctBlankAnswer: "NULL",
          ),
          Question(
            id: "c_unit_1_l1_q14",
            type: QuestionType.fillInTheBlank,
            prompt: "Bir veri tipinin bellekte kaç bayt yer kapladığını öğrenmek için derleme zamanı operatörü olan _____ kullanılır.",
            explanation: "sizeof(tip) veya sizeof(degisken) bayt cinsinden bellek boyutunu size_t olarak döner.",
            blankOptions: ["sizeof", "lengthof", "bytesize", "countof"],
            correctBlankAnswer: "sizeof",
          ),
          Question(
            id: "c_unit_1_l1_q15",
            type: QuestionType.fillInTheBlank,
            prompt: "Açılmış bir dosya işaretçisini işletim sistemine geri iade etmek için _____ fonksiyonu çağrılır.",
            explanation: "fclose(FILE *stream) dosya tamponlarını diske yazar ve kaynakları kapatır.",
            blankOptions: ["fclose", "close", "file_exit", "dispose"],
            correctBlankAnswer: "fclose",
          ),
          Question(
            id: "c_unit_1_l1_q16",
            type: QuestionType.trueFalse,
            prompt: "C dilinde dizi isimleri ifadeler içinde kullanıldığında dizinin ilk elemanının bellek adresine (pointer) dönüşür (decay).",
            explanation: "Doğrudur, 'arr' ifadesi '&arr[0]' adresi ile eşdeğerdir.",
            isTrue: true,
          ),
          Question(
            id: "c_unit_1_l1_q17",
            type: QuestionType.trueFalse,
            prompt: "Stack belleğinde oluşturulan yerel değişkenler fonksiyon sonlandığında da bellekte kalmaya devam eder ve serbest bırakılması için free() gerekir.",
            explanation: "Yanlıştır! Stack bellek fonksiyon bitiminde otomatik temizlenir; free() sadece heap (malloc) için geçerlidir.",
            isTrue: false,
          ),
          Question(
            id: "c_unit_1_l1_q18",
            type: QuestionType.matching,
            prompt: "C bellek kavramlarını doğru açıklamalarıyla eşleştirin.",
            explanation: "C'de bellek güvenliği doğrudan yazılımcının sorumluluğundadır.",
            matchingPairs: [MatchingPair(left: "malloc", right: "Heap üzerinde başlatılmamış bellek tahsisi"), MatchingPair(left: "free", right: "Dinamik belleği sisteme iade etme"), MatchingPair(left: "Valgrind", right: "Bellek sızıntılarını tespit eden analiz aracı")],
          ),
        ],
      ),
      Lesson(
        id: "c_unit_1_l2",
        title: "main() Fonksiyonu & Çıkış Kodları (exit codes)",
        description: "argc, argv ve return 0 standartları",
        xpReward: 35,
        gemReward: 12,
        isUnitExam: false,
        questions: [
          Question(
            id: "c_unit_1_l2_q1",
            type: QuestionType.conceptCard,
            conceptTitle: "main() Fonksiyonu & Çıkış Kodları (exit codes) - Hap Bilgi",
            rule: "C dilinde işaretçiler (pointers) doğrudan bellek adreslerini saklar. '&' operatörü bir değişkenin adresini alırken, '*' (dereference) o adresteki veriye erişir veya değiştirir.",
            codeExample: r'''#include <stdio.h>
#include <stdlib.h>

int main() {
    int x = 100;
    int *ptr = &x;
    
    printf("x Degeri: %d\n", *ptr);
    printf("x Bellek Adresi: %p\n", (void*)ptr);
    return 0;
}''',
            devTip: "malloc ile tahsis edilen her bayt bellek için mutlaka bir free() çağrısı yapılmalıdır, aksi halde Memory Leak oluşur.",
            iconEmoji: "⚡",
          ),
          Question(
            id: "c_unit_1_l2_q2",
            type: QuestionType.multipleChoice,
            prompt: "Tahsis ettiği belleği otomatik olarak sıfırlarla (0 baytları) dolduran dinamik bellek fonksiyonu hangisidir?",
            codeSnippet: r'''int *p = ___(100, sizeof(int));''',
            options: ["calloc", "malloc", "realloc", "zalloc"],
            correctIndex: 0,
            explanation: "'calloc(num, size)' eleman sayısı ve eleman boyutu alır, ayrılan tüm bellek hücrelerini 0 ile başlatır.",
          ),
          Question(
            id: "c_unit_1_l2_q3",
            type: QuestionType.multipleChoice,
            prompt: "Daha önce ayrılmış dinamik bir bellek bloğunun boyutunu veri kaybı olmadan büyütmek veya küçültmek için ne kullanılır?",
            codeSnippet: r'''ptr = ___(ptr, new_size);''',
            options: ["realloc", "resize", "remalloc", "expand"],
            correctIndex: 0,
            explanation: "'realloc' mevcut bloğu genişletir veya yeni bir konuma taşıyarak eski veriyi kopyalar.",
          ),
          Question(
            id: "c_unit_1_l2_q4",
            type: QuestionType.multipleChoice,
            prompt: "C programlama dilinde GCC derleme sürecinin doğru sırası aşağıdakilerden hangisidir?",
            options: ["Preprocessor -> Compiler -> Assembler -> Linker", "Compiler -> Preprocessor -> Linker -> Assembler", "Assembler -> Compiler -> Linker -> Preprocessor", "Linker -> Assembler -> Compiler -> Preprocessor"],
            correctIndex: 0,
            explanation: "Önce makrolar ve headerlar çözülür (cpp), C kodu Assembly'ye derlenir (cc1), makine koduna çevrilir (as), kütüphaneler bağlanır (ld).",
          ),
          Question(
            id: "c_unit_1_l2_q5",
            type: QuestionType.multipleChoice,
            prompt: "64-bit modern bir mimaride standart bir işaretçi (pointer - int*, char*, void*) değişkeni bellekte kaç bayt yer kaplar?",
            codeSnippet: r'''printf("%zu", sizeof(int*));''',
            options: ["8 bayt", "4 bayt", "2 bayt", "16 bayt"],
            correctIndex: 0,
            explanation: "64-bit mimarilerde bellek adresleri 64 bit yani tam 8 bayttır. İşaretçinin tipi ne olursa olsun adres boyutu 8 bayttır.",
          ),
          Question(
            id: "c_unit_1_l2_q6",
            type: QuestionType.multipleChoice,
            prompt: "Bir struct içindeki bir işaretçi elemana erişirken '.' yerine hangi pratik operatör kullanılır?",
            codeSnippet: r'''struct User *u = getUser();
u___name = "Ahmet";''',
            options: ["-> (Ok operatörü)", ".", "::", "=>"],
            correctIndex: 0,
            explanation: "'u->name', '(*u).name' yazımının daha okunaklı ve standart kısayoludur.",
          ),
          Question(
            id: "c_unit_1_l2_q7",
            type: QuestionType.multipleChoice,
            prompt: "Herhangi bir veri tipine ait bellek adresini tutabilen jenerik (tip bağımsız) işaretçi tipi hangisidir?",
            codeSnippet: r'''___ generic_ptr = &x;''',
            options: ["void*", "any*", "object*", "generic*"],
            correctIndex: 0,
            explanation: "'void*' tipi belirsiz jenerik bir işaretçidir; doğrudan dereference edilemez, cast edilmesi gerekir.",
          ),
          Question(
            id: "c_unit_1_l2_q8",
            type: QuestionType.multipleChoice,
            prompt: "Serbest bırakılmış (free edilmiş) bir işaretçiyi kullanmaya devam etme hatasına ne ad verilir?",
            codeSnippet: r'''free(ptr);
printf("%d", *ptr); // HATA!''',
            options: ["Dangling Pointer (Askıda Kalan İşaretçi)", "Stack Overflow", "Memory Leak", "Deadlock"],
            correctIndex: 0,
            explanation: "free edildikten sonra hala o adresi göstermeye devam eden işaretçiye dangling pointer denir; 'ptr = NULL' yapılarak önlenir.",
          ),
          Question(
            id: "c_unit_1_l2_q9",
            type: QuestionType.multipleChoice,
            prompt: "C programlarında bellek sızıntılarını (memory leak) ve geçersiz bellek erişimlerini tespit etmek için en popüler Linux aracı hangisidir?",
            codeSnippet: r'''$ ___ --leak-check=full ./program''',
            options: ["valgrind", "gdb", "perf", "strace"],
            correctIndex: 0,
            explanation: "Valgrind (özellikle memcheck aracı) C/C++ programlarında bellek yönetim hatalarını ayrıntılı raporlar.",
          ),
          Question(
            id: "c_unit_1_l2_q10",
            type: QuestionType.multipleChoice,
            prompt: "Aşağıdaki bit düzeyinde (bitwise) operatörlerden hangisi bitleri 1 basamak sola kaydırarak 2 ile çarpmayı sağlar?",
            codeSnippet: r'''int x = 5;
int y = x ___ 1; // y = 10 olur''',
            options: ["<<", ">>", "&", "|"],
            correctIndex: 0,
            explanation: "Sola kaydırma (<< n) operatörü sayının değerini 2^n ile çarpar.",
          ),
          Question(
            id: "c_unit_1_l2_q11",
            type: QuestionType.multipleChoice,
            prompt: "C'de dosya açmak ve bir dosya işaretçisi (FILE*) elde etmek için hangi standart fonksiyon kullanılır?",
            codeSnippet: r'''FILE *f = ___("data.txt", "r");''',
            options: ["fopen", "open", "file_open", "create_file"],
            correctIndex: 0,
            explanation: "'fopen(dosya_adi, mod)' dosyayı belirtilen modda (r, w, a, rb, wb) açar.",
          ),
          Question(
            id: "c_unit_1_l2_q12",
            type: QuestionType.multipleChoice,
            prompt: "Bir header dosyasının birden fazla kez derlemeye dahil edilmesini (redefinition) önlemek için ne kullanılır?",
            codeSnippet: r'''#ifndef MY_HEADER_H
#define MY_HEADER_H
// ...
#endif''',
            options: ["Header Guards (#ifndef / #define)", "namespace", "pragma private", "module"],
            correctIndex: 0,
            explanation: "Header guards veya '#pragma once' başlık dosyalarının mükerrer include edilmesini engeller.",
          ),
          Question(
            id: "c_unit_1_l2_q13",
            type: QuestionType.fillInTheBlank,
            prompt: "Geçersiz veya henüz atanmamış bir işaretçiye güvenli başlangıç değeri olarak _____ atanmalıdır.",
            explanation: "İşaretçilere NULL atamak tanımsız belleğe erişimi ve segmentation fault hatalarını engellemeye yardımcı olur.",
            blankOptions: ["NULL", "0xFF", "void", "NaN"],
            correctBlankAnswer: "NULL",
          ),
          Question(
            id: "c_unit_1_l2_q14",
            type: QuestionType.fillInTheBlank,
            prompt: "Bir veri tipinin bellekte kaç bayt yer kapladığını öğrenmek için derleme zamanı operatörü olan _____ kullanılır.",
            explanation: "sizeof(tip) veya sizeof(degisken) bayt cinsinden bellek boyutunu size_t olarak döner.",
            blankOptions: ["sizeof", "lengthof", "bytesize", "countof"],
            correctBlankAnswer: "sizeof",
          ),
          Question(
            id: "c_unit_1_l2_q15",
            type: QuestionType.fillInTheBlank,
            prompt: "Açılmış bir dosya işaretçisini işletim sistemine geri iade etmek için _____ fonksiyonu çağrılır.",
            explanation: "fclose(FILE *stream) dosya tamponlarını diske yazar ve kaynakları kapatır.",
            blankOptions: ["fclose", "close", "file_exit", "dispose"],
            correctBlankAnswer: "fclose",
          ),
          Question(
            id: "c_unit_1_l2_q16",
            type: QuestionType.trueFalse,
            prompt: "C dilinde dizi isimleri ifadeler içinde kullanıldığında dizinin ilk elemanının bellek adresine (pointer) dönüşür (decay).",
            explanation: "Doğrudur, 'arr' ifadesi '&arr[0]' adresi ile eşdeğerdir.",
            isTrue: true,
          ),
          Question(
            id: "c_unit_1_l2_q17",
            type: QuestionType.trueFalse,
            prompt: "Stack belleğinde oluşturulan yerel değişkenler fonksiyon sonlandığında da bellekte kalmaya devam eder ve serbest bırakılması için free() gerekir.",
            explanation: "Yanlıştır! Stack bellek fonksiyon bitiminde otomatik temizlenir; free() sadece heap (malloc) için geçerlidir.",
            isTrue: false,
          ),
          Question(
            id: "c_unit_1_l2_q18",
            type: QuestionType.matching,
            prompt: "C bellek kavramlarını doğru açıklamalarıyla eşleştirin.",
            explanation: "C'de bellek güvenliği doğrudan yazılımcının sorumluluğundadır.",
            matchingPairs: [MatchingPair(left: "malloc", right: "Heap üzerinde başlatılmamış bellek tahsisi"), MatchingPair(left: "free", right: "Dinamik belleği sisteme iade etme"), MatchingPair(left: "Valgrind", right: "Bellek sızıntılarını tespit eden analiz aracı")],
          ),
        ],
      ),
      Lesson(
        id: "c_unit_1_l3",
        title: "GCC Derleme Aşaması 1: Preprocessor (Önişlemci)",
        description: "#include, #define ve makro genişlemeleri",
        xpReward: 35,
        gemReward: 12,
        isUnitExam: false,
        questions: [
          Question(
            id: "c_unit_1_l3_q1",
            type: QuestionType.conceptCard,
            conceptTitle: "GCC Derleme Aşaması 1: Preprocessor (Önişlemci) - Hap Bilgi",
            rule: "C dilinde işaretçiler (pointers) doğrudan bellek adreslerini saklar. '&' operatörü bir değişkenin adresini alırken, '*' (dereference) o adresteki veriye erişir veya değiştirir.",
            codeExample: r'''#include <stdio.h>
#include <stdlib.h>

int main() {
    int x = 100;
    int *ptr = &x;
    
    printf("x Degeri: %d\n", *ptr);
    printf("x Bellek Adresi: %p\n", (void*)ptr);
    return 0;
}''',
            devTip: "malloc ile tahsis edilen her bayt bellek için mutlaka bir free() çağrısı yapılmalıdır, aksi halde Memory Leak oluşur.",
            iconEmoji: "⚡",
          ),
          Question(
            id: "c_unit_1_l3_q2",
            type: QuestionType.multipleChoice,
            prompt: "C programlama dilinde GCC derleme sürecinin doğru sırası aşağıdakilerden hangisidir?",
            options: ["Preprocessor -> Compiler -> Assembler -> Linker", "Compiler -> Preprocessor -> Linker -> Assembler", "Assembler -> Compiler -> Linker -> Preprocessor", "Linker -> Assembler -> Compiler -> Preprocessor"],
            correctIndex: 0,
            explanation: "Önce makrolar ve headerlar çözülür (cpp), C kodu Assembly'ye derlenir (cc1), makine koduna çevrilir (as), kütüphaneler bağlanır (ld).",
          ),
          Question(
            id: "c_unit_1_l3_q3",
            type: QuestionType.multipleChoice,
            prompt: "64-bit modern bir mimaride standart bir işaretçi (pointer - int*, char*, void*) değişkeni bellekte kaç bayt yer kaplar?",
            codeSnippet: r'''printf("%zu", sizeof(int*));''',
            options: ["8 bayt", "4 bayt", "2 bayt", "16 bayt"],
            correctIndex: 0,
            explanation: "64-bit mimarilerde bellek adresleri 64 bit yani tam 8 bayttır. İşaretçinin tipi ne olursa olsun adres boyutu 8 bayttır.",
          ),
          Question(
            id: "c_unit_1_l3_q4",
            type: QuestionType.multipleChoice,
            prompt: "Bir struct içindeki bir işaretçi elemana erişirken '.' yerine hangi pratik operatör kullanılır?",
            codeSnippet: r'''struct User *u = getUser();
u___name = "Ahmet";''',
            options: ["-> (Ok operatörü)", ".", "::", "=>"],
            correctIndex: 0,
            explanation: "'u->name', '(*u).name' yazımının daha okunaklı ve standart kısayoludur.",
          ),
          Question(
            id: "c_unit_1_l3_q5",
            type: QuestionType.multipleChoice,
            prompt: "Herhangi bir veri tipine ait bellek adresini tutabilen jenerik (tip bağımsız) işaretçi tipi hangisidir?",
            codeSnippet: r'''___ generic_ptr = &x;''',
            options: ["void*", "any*", "object*", "generic*"],
            correctIndex: 0,
            explanation: "'void*' tipi belirsiz jenerik bir işaretçidir; doğrudan dereference edilemez, cast edilmesi gerekir.",
          ),
          Question(
            id: "c_unit_1_l3_q6",
            type: QuestionType.multipleChoice,
            prompt: "Serbest bırakılmış (free edilmiş) bir işaretçiyi kullanmaya devam etme hatasına ne ad verilir?",
            codeSnippet: r'''free(ptr);
printf("%d", *ptr); // HATA!''',
            options: ["Dangling Pointer (Askıda Kalan İşaretçi)", "Stack Overflow", "Memory Leak", "Deadlock"],
            correctIndex: 0,
            explanation: "free edildikten sonra hala o adresi göstermeye devam eden işaretçiye dangling pointer denir; 'ptr = NULL' yapılarak önlenir.",
          ),
          Question(
            id: "c_unit_1_l3_q7",
            type: QuestionType.multipleChoice,
            prompt: "C programlarında bellek sızıntılarını (memory leak) ve geçersiz bellek erişimlerini tespit etmek için en popüler Linux aracı hangisidir?",
            codeSnippet: r'''$ ___ --leak-check=full ./program''',
            options: ["valgrind", "gdb", "perf", "strace"],
            correctIndex: 0,
            explanation: "Valgrind (özellikle memcheck aracı) C/C++ programlarında bellek yönetim hatalarını ayrıntılı raporlar.",
          ),
          Question(
            id: "c_unit_1_l3_q8",
            type: QuestionType.multipleChoice,
            prompt: "Aşağıdaki bit düzeyinde (bitwise) operatörlerden hangisi bitleri 1 basamak sola kaydırarak 2 ile çarpmayı sağlar?",
            codeSnippet: r'''int x = 5;
int y = x ___ 1; // y = 10 olur''',
            options: ["<<", ">>", "&", "|"],
            correctIndex: 0,
            explanation: "Sola kaydırma (<< n) operatörü sayının değerini 2^n ile çarpar.",
          ),
          Question(
            id: "c_unit_1_l3_q9",
            type: QuestionType.multipleChoice,
            prompt: "C'de dosya açmak ve bir dosya işaretçisi (FILE*) elde etmek için hangi standart fonksiyon kullanılır?",
            codeSnippet: r'''FILE *f = ___("data.txt", "r");''',
            options: ["fopen", "open", "file_open", "create_file"],
            correctIndex: 0,
            explanation: "'fopen(dosya_adi, mod)' dosyayı belirtilen modda (r, w, a, rb, wb) açar.",
          ),
          Question(
            id: "c_unit_1_l3_q10",
            type: QuestionType.multipleChoice,
            prompt: "Bir header dosyasının birden fazla kez derlemeye dahil edilmesini (redefinition) önlemek için ne kullanılır?",
            codeSnippet: r'''#ifndef MY_HEADER_H
#define MY_HEADER_H
// ...
#endif''',
            options: ["Header Guards (#ifndef / #define)", "namespace", "pragma private", "module"],
            correctIndex: 0,
            explanation: "Header guards veya '#pragma once' başlık dosyalarının mükerrer include edilmesini engeller.",
          ),
          Question(
            id: "c_unit_1_l3_q11",
            type: QuestionType.multipleChoice,
            prompt: "Tüm üyelerinin bellekte AYNI başlangıç adresini paylaştığı ve en büyük üyesi kadar yer kaplayan yapı hangisidir?",
            codeSnippet: r'''___ Data {
    int i;
    float f;
    char str[20];
};''',
            options: ["union", "struct", "class", "shared"],
            correctIndex: 0,
            explanation: "'union' içindeki tüm elemanlar aynı bellek alanını ortaklaşa kullanır; aynı anda sadece biri geçerli değer tutar.",
          ),
          Question(
            id: "c_unit_1_l3_q12",
            type: QuestionType.multipleChoice,
            prompt: "C dilinde bir değişkenin bellekteki adresini elde etmek için hangi operatör kullanılır?",
            codeSnippet: r'''int x = 10;
int *ptr = ___x;''',
            options: ["& (Address-of)", "* (Dereference)", "% (Mod)", "\$ (Value)"],
            correctIndex: 0,
            explanation: "'&' operatörü bir değişkenin RAM üzerindeki başlangıç adresini döner.",
          ),
          Question(
            id: "c_unit_1_l3_q13",
            type: QuestionType.fillInTheBlank,
            prompt: "Geçersiz veya henüz atanmamış bir işaretçiye güvenli başlangıç değeri olarak _____ atanmalıdır.",
            explanation: "İşaretçilere NULL atamak tanımsız belleğe erişimi ve segmentation fault hatalarını engellemeye yardımcı olur.",
            blankOptions: ["NULL", "0xFF", "void", "NaN"],
            correctBlankAnswer: "NULL",
          ),
          Question(
            id: "c_unit_1_l3_q14",
            type: QuestionType.fillInTheBlank,
            prompt: "Bir veri tipinin bellekte kaç bayt yer kapladığını öğrenmek için derleme zamanı operatörü olan _____ kullanılır.",
            explanation: "sizeof(tip) veya sizeof(degisken) bayt cinsinden bellek boyutunu size_t olarak döner.",
            blankOptions: ["sizeof", "lengthof", "bytesize", "countof"],
            correctBlankAnswer: "sizeof",
          ),
          Question(
            id: "c_unit_1_l3_q15",
            type: QuestionType.fillInTheBlank,
            prompt: "Açılmış bir dosya işaretçisini işletim sistemine geri iade etmek için _____ fonksiyonu çağrılır.",
            explanation: "fclose(FILE *stream) dosya tamponlarını diske yazar ve kaynakları kapatır.",
            blankOptions: ["fclose", "close", "file_exit", "dispose"],
            correctBlankAnswer: "fclose",
          ),
          Question(
            id: "c_unit_1_l3_q16",
            type: QuestionType.trueFalse,
            prompt: "C dilinde dizi isimleri ifadeler içinde kullanıldığında dizinin ilk elemanının bellek adresine (pointer) dönüşür (decay).",
            explanation: "Doğrudur, 'arr' ifadesi '&arr[0]' adresi ile eşdeğerdir.",
            isTrue: true,
          ),
          Question(
            id: "c_unit_1_l3_q17",
            type: QuestionType.trueFalse,
            prompt: "Stack belleğinde oluşturulan yerel değişkenler fonksiyon sonlandığında da bellekte kalmaya devam eder ve serbest bırakılması için free() gerekir.",
            explanation: "Yanlıştır! Stack bellek fonksiyon bitiminde otomatik temizlenir; free() sadece heap (malloc) için geçerlidir.",
            isTrue: false,
          ),
          Question(
            id: "c_unit_1_l3_q18",
            type: QuestionType.matching,
            prompt: "C bellek kavramlarını doğru açıklamalarıyla eşleştirin.",
            explanation: "C'de bellek güvenliği doğrudan yazılımcının sorumluluğundadır.",
            matchingPairs: [MatchingPair(left: "malloc", right: "Heap üzerinde başlatılmamış bellek tahsisi"), MatchingPair(left: "free", right: "Dinamik belleği sisteme iade etme"), MatchingPair(left: "Valgrind", right: "Bellek sızıntılarını tespit eden analiz aracı")],
          ),
        ],
      ),
      Lesson(
        id: "c_unit_1_l4",
        title: "GCC Derleme Aşaması 2: Compiler (Derleme)",
        description: "C kodunun assembly'ye (.s) çevrimi",
        xpReward: 35,
        gemReward: 12,
        isUnitExam: false,
        questions: [
          Question(
            id: "c_unit_1_l4_q1",
            type: QuestionType.conceptCard,
            conceptTitle: "GCC Derleme Aşaması 2: Compiler (Derleme) - Hap Bilgi",
            rule: "C dilinde işaretçiler (pointers) doğrudan bellek adreslerini saklar. '&' operatörü bir değişkenin adresini alırken, '*' (dereference) o adresteki veriye erişir veya değiştirir.",
            codeExample: r'''#include <stdio.h>
#include <stdlib.h>

int main() {
    int x = 100;
    int *ptr = &x;
    
    printf("x Degeri: %d\n", *ptr);
    printf("x Bellek Adresi: %p\n", (void*)ptr);
    return 0;
}''',
            devTip: "malloc ile tahsis edilen her bayt bellek için mutlaka bir free() çağrısı yapılmalıdır, aksi halde Memory Leak oluşur.",
            iconEmoji: "⚡",
          ),
          Question(
            id: "c_unit_1_l4_q2",
            type: QuestionType.multipleChoice,
            prompt: "Bir struct içindeki bir işaretçi elemana erişirken '.' yerine hangi pratik operatör kullanılır?",
            codeSnippet: r'''struct User *u = getUser();
u___name = "Ahmet";''',
            options: ["-> (Ok operatörü)", ".", "::", "=>"],
            correctIndex: 0,
            explanation: "'u->name', '(*u).name' yazımının daha okunaklı ve standart kısayoludur.",
          ),
          Question(
            id: "c_unit_1_l4_q3",
            type: QuestionType.multipleChoice,
            prompt: "Herhangi bir veri tipine ait bellek adresini tutabilen jenerik (tip bağımsız) işaretçi tipi hangisidir?",
            codeSnippet: r'''___ generic_ptr = &x;''',
            options: ["void*", "any*", "object*", "generic*"],
            correctIndex: 0,
            explanation: "'void*' tipi belirsiz jenerik bir işaretçidir; doğrudan dereference edilemez, cast edilmesi gerekir.",
          ),
          Question(
            id: "c_unit_1_l4_q4",
            type: QuestionType.multipleChoice,
            prompt: "Serbest bırakılmış (free edilmiş) bir işaretçiyi kullanmaya devam etme hatasına ne ad verilir?",
            codeSnippet: r'''free(ptr);
printf("%d", *ptr); // HATA!''',
            options: ["Dangling Pointer (Askıda Kalan İşaretçi)", "Stack Overflow", "Memory Leak", "Deadlock"],
            correctIndex: 0,
            explanation: "free edildikten sonra hala o adresi göstermeye devam eden işaretçiye dangling pointer denir; 'ptr = NULL' yapılarak önlenir.",
          ),
          Question(
            id: "c_unit_1_l4_q5",
            type: QuestionType.multipleChoice,
            prompt: "C programlarında bellek sızıntılarını (memory leak) ve geçersiz bellek erişimlerini tespit etmek için en popüler Linux aracı hangisidir?",
            codeSnippet: r'''$ ___ --leak-check=full ./program''',
            options: ["valgrind", "gdb", "perf", "strace"],
            correctIndex: 0,
            explanation: "Valgrind (özellikle memcheck aracı) C/C++ programlarında bellek yönetim hatalarını ayrıntılı raporlar.",
          ),
          Question(
            id: "c_unit_1_l4_q6",
            type: QuestionType.multipleChoice,
            prompt: "Aşağıdaki bit düzeyinde (bitwise) operatörlerden hangisi bitleri 1 basamak sola kaydırarak 2 ile çarpmayı sağlar?",
            codeSnippet: r'''int x = 5;
int y = x ___ 1; // y = 10 olur''',
            options: ["<<", ">>", "&", "|"],
            correctIndex: 0,
            explanation: "Sola kaydırma (<< n) operatörü sayının değerini 2^n ile çarpar.",
          ),
          Question(
            id: "c_unit_1_l4_q7",
            type: QuestionType.multipleChoice,
            prompt: "C'de dosya açmak ve bir dosya işaretçisi (FILE*) elde etmek için hangi standart fonksiyon kullanılır?",
            codeSnippet: r'''FILE *f = ___("data.txt", "r");''',
            options: ["fopen", "open", "file_open", "create_file"],
            correctIndex: 0,
            explanation: "'fopen(dosya_adi, mod)' dosyayı belirtilen modda (r, w, a, rb, wb) açar.",
          ),
          Question(
            id: "c_unit_1_l4_q8",
            type: QuestionType.multipleChoice,
            prompt: "Bir header dosyasının birden fazla kez derlemeye dahil edilmesini (redefinition) önlemek için ne kullanılır?",
            codeSnippet: r'''#ifndef MY_HEADER_H
#define MY_HEADER_H
// ...
#endif''',
            options: ["Header Guards (#ifndef / #define)", "namespace", "pragma private", "module"],
            correctIndex: 0,
            explanation: "Header guards veya '#pragma once' başlık dosyalarının mükerrer include edilmesini engeller.",
          ),
          Question(
            id: "c_unit_1_l4_q9",
            type: QuestionType.multipleChoice,
            prompt: "Tüm üyelerinin bellekte AYNI başlangıç adresini paylaştığı ve en büyük üyesi kadar yer kaplayan yapı hangisidir?",
            codeSnippet: r'''___ Data {
    int i;
    float f;
    char str[20];
};''',
            options: ["union", "struct", "class", "shared"],
            correctIndex: 0,
            explanation: "'union' içindeki tüm elemanlar aynı bellek alanını ortaklaşa kullanır; aynı anda sadece biri geçerli değer tutar.",
          ),
          Question(
            id: "c_unit_1_l4_q10",
            type: QuestionType.multipleChoice,
            prompt: "C dilinde bir değişkenin bellekteki adresini elde etmek için hangi operatör kullanılır?",
            codeSnippet: r'''int x = 10;
int *ptr = ___x;''',
            options: ["& (Address-of)", "* (Dereference)", "% (Mod)", "\$ (Value)"],
            correctIndex: 0,
            explanation: "'&' operatörü bir değişkenin RAM üzerindeki başlangıç adresini döner.",
          ),
          Question(
            id: "c_unit_1_l4_q11",
            type: QuestionType.multipleChoice,
            prompt: "Bir işaretçinin (pointer) işaret ettiği bellek adresindeki veriye erişmek veya onu değiştirmek için hangi işlem yapılır?",
            codeSnippet: r'''int x = 5;
int *p = &x;
___p = 20; // x artik 20 olur''',
            options: ["* (Dereference)", "&", "->", "."],
            correctIndex: 0,
            explanation: "'*p' dereferencing yaparak işaretçinin tuttuğu adresteki asıl değere erişir.",
          ),
          Question(
            id: "c_unit_1_l4_q12",
            type: QuestionType.multipleChoice,
            prompt: "Heap bellekte dinamik olarak bayt cinsinden bellek tahsis etmek için hangi standart kütüphane fonksiyonu kullanılır?",
            codeSnippet: r'''int *arr = (int*)___(10 * sizeof(int));''',
            options: ["malloc", "alloc", "new", "heap_get"],
            correctIndex: 0,
            explanation: "'malloc(size_t size)' heap bölgesinde istenen bayt kadar bellek ayırır ve void* işaretçi döner.",
          ),
          Question(
            id: "c_unit_1_l4_q13",
            type: QuestionType.fillInTheBlank,
            prompt: "Geçersiz veya henüz atanmamış bir işaretçiye güvenli başlangıç değeri olarak _____ atanmalıdır.",
            explanation: "İşaretçilere NULL atamak tanımsız belleğe erişimi ve segmentation fault hatalarını engellemeye yardımcı olur.",
            blankOptions: ["NULL", "0xFF", "void", "NaN"],
            correctBlankAnswer: "NULL",
          ),
          Question(
            id: "c_unit_1_l4_q14",
            type: QuestionType.fillInTheBlank,
            prompt: "Bir veri tipinin bellekte kaç bayt yer kapladığını öğrenmek için derleme zamanı operatörü olan _____ kullanılır.",
            explanation: "sizeof(tip) veya sizeof(degisken) bayt cinsinden bellek boyutunu size_t olarak döner.",
            blankOptions: ["sizeof", "lengthof", "bytesize", "countof"],
            correctBlankAnswer: "sizeof",
          ),
          Question(
            id: "c_unit_1_l4_q15",
            type: QuestionType.fillInTheBlank,
            prompt: "Açılmış bir dosya işaretçisini işletim sistemine geri iade etmek için _____ fonksiyonu çağrılır.",
            explanation: "fclose(FILE *stream) dosya tamponlarını diske yazar ve kaynakları kapatır.",
            blankOptions: ["fclose", "close", "file_exit", "dispose"],
            correctBlankAnswer: "fclose",
          ),
          Question(
            id: "c_unit_1_l4_q16",
            type: QuestionType.trueFalse,
            prompt: "C dilinde dizi isimleri ifadeler içinde kullanıldığında dizinin ilk elemanının bellek adresine (pointer) dönüşür (decay).",
            explanation: "Doğrudur, 'arr' ifadesi '&arr[0]' adresi ile eşdeğerdir.",
            isTrue: true,
          ),
          Question(
            id: "c_unit_1_l4_q17",
            type: QuestionType.trueFalse,
            prompt: "Stack belleğinde oluşturulan yerel değişkenler fonksiyon sonlandığında da bellekte kalmaya devam eder ve serbest bırakılması için free() gerekir.",
            explanation: "Yanlıştır! Stack bellek fonksiyon bitiminde otomatik temizlenir; free() sadece heap (malloc) için geçerlidir.",
            isTrue: false,
          ),
          Question(
            id: "c_unit_1_l4_q18",
            type: QuestionType.matching,
            prompt: "C bellek kavramlarını doğru açıklamalarıyla eşleştirin.",
            explanation: "C'de bellek güvenliği doğrudan yazılımcının sorumluluğundadır.",
            matchingPairs: [MatchingPair(left: "malloc", right: "Heap üzerinde başlatılmamış bellek tahsisi"), MatchingPair(left: "free", right: "Dinamik belleği sisteme iade etme"), MatchingPair(left: "Valgrind", right: "Bellek sızıntılarını tespit eden analiz aracı")],
          ),
        ],
      ),
      Lesson(
        id: "c_unit_1_l5",
        title: "GCC Derleme Aşaması 3: Assembler (Birleştirici)",
        description: "Assembly'nin makine koduna (.o) çevrimi",
        xpReward: 35,
        gemReward: 12,
        isUnitExam: false,
        questions: [
          Question(
            id: "c_unit_1_l5_q1",
            type: QuestionType.conceptCard,
            conceptTitle: "GCC Derleme Aşaması 3: Assembler (Birleştirici) - Hap Bilgi",
            rule: "C dilinde işaretçiler (pointers) doğrudan bellek adreslerini saklar. '&' operatörü bir değişkenin adresini alırken, '*' (dereference) o adresteki veriye erişir veya değiştirir.",
            codeExample: r'''#include <stdio.h>
#include <stdlib.h>

int main() {
    int x = 100;
    int *ptr = &x;
    
    printf("x Degeri: %d\n", *ptr);
    printf("x Bellek Adresi: %p\n", (void*)ptr);
    return 0;
}''',
            devTip: "malloc ile tahsis edilen her bayt bellek için mutlaka bir free() çağrısı yapılmalıdır, aksi halde Memory Leak oluşur.",
            iconEmoji: "⚡",
          ),
          Question(
            id: "c_unit_1_l5_q2",
            type: QuestionType.multipleChoice,
            prompt: "Serbest bırakılmış (free edilmiş) bir işaretçiyi kullanmaya devam etme hatasına ne ad verilir?",
            codeSnippet: r'''free(ptr);
printf("%d", *ptr); // HATA!''',
            options: ["Dangling Pointer (Askıda Kalan İşaretçi)", "Stack Overflow", "Memory Leak", "Deadlock"],
            correctIndex: 0,
            explanation: "free edildikten sonra hala o adresi göstermeye devam eden işaretçiye dangling pointer denir; 'ptr = NULL' yapılarak önlenir.",
          ),
          Question(
            id: "c_unit_1_l5_q3",
            type: QuestionType.multipleChoice,
            prompt: "C programlarında bellek sızıntılarını (memory leak) ve geçersiz bellek erişimlerini tespit etmek için en popüler Linux aracı hangisidir?",
            codeSnippet: r'''$ ___ --leak-check=full ./program''',
            options: ["valgrind", "gdb", "perf", "strace"],
            correctIndex: 0,
            explanation: "Valgrind (özellikle memcheck aracı) C/C++ programlarında bellek yönetim hatalarını ayrıntılı raporlar.",
          ),
          Question(
            id: "c_unit_1_l5_q4",
            type: QuestionType.multipleChoice,
            prompt: "Aşağıdaki bit düzeyinde (bitwise) operatörlerden hangisi bitleri 1 basamak sola kaydırarak 2 ile çarpmayı sağlar?",
            codeSnippet: r'''int x = 5;
int y = x ___ 1; // y = 10 olur''',
            options: ["<<", ">>", "&", "|"],
            correctIndex: 0,
            explanation: "Sola kaydırma (<< n) operatörü sayının değerini 2^n ile çarpar.",
          ),
          Question(
            id: "c_unit_1_l5_q5",
            type: QuestionType.multipleChoice,
            prompt: "C'de dosya açmak ve bir dosya işaretçisi (FILE*) elde etmek için hangi standart fonksiyon kullanılır?",
            codeSnippet: r'''FILE *f = ___("data.txt", "r");''',
            options: ["fopen", "open", "file_open", "create_file"],
            correctIndex: 0,
            explanation: "'fopen(dosya_adi, mod)' dosyayı belirtilen modda (r, w, a, rb, wb) açar.",
          ),
          Question(
            id: "c_unit_1_l5_q6",
            type: QuestionType.multipleChoice,
            prompt: "Bir header dosyasının birden fazla kez derlemeye dahil edilmesini (redefinition) önlemek için ne kullanılır?",
            codeSnippet: r'''#ifndef MY_HEADER_H
#define MY_HEADER_H
// ...
#endif''',
            options: ["Header Guards (#ifndef / #define)", "namespace", "pragma private", "module"],
            correctIndex: 0,
            explanation: "Header guards veya '#pragma once' başlık dosyalarının mükerrer include edilmesini engeller.",
          ),
          Question(
            id: "c_unit_1_l5_q7",
            type: QuestionType.multipleChoice,
            prompt: "Tüm üyelerinin bellekte AYNI başlangıç adresini paylaştığı ve en büyük üyesi kadar yer kaplayan yapı hangisidir?",
            codeSnippet: r'''___ Data {
    int i;
    float f;
    char str[20];
};''',
            options: ["union", "struct", "class", "shared"],
            correctIndex: 0,
            explanation: "'union' içindeki tüm elemanlar aynı bellek alanını ortaklaşa kullanır; aynı anda sadece biri geçerli değer tutar.",
          ),
          Question(
            id: "c_unit_1_l5_q8",
            type: QuestionType.multipleChoice,
            prompt: "C dilinde bir değişkenin bellekteki adresini elde etmek için hangi operatör kullanılır?",
            codeSnippet: r'''int x = 10;
int *ptr = ___x;''',
            options: ["& (Address-of)", "* (Dereference)", "% (Mod)", "\$ (Value)"],
            correctIndex: 0,
            explanation: "'&' operatörü bir değişkenin RAM üzerindeki başlangıç adresini döner.",
          ),
          Question(
            id: "c_unit_1_l5_q9",
            type: QuestionType.multipleChoice,
            prompt: "Bir işaretçinin (pointer) işaret ettiği bellek adresindeki veriye erişmek veya onu değiştirmek için hangi işlem yapılır?",
            codeSnippet: r'''int x = 5;
int *p = &x;
___p = 20; // x artik 20 olur''',
            options: ["* (Dereference)", "&", "->", "."],
            correctIndex: 0,
            explanation: "'*p' dereferencing yaparak işaretçinin tuttuğu adresteki asıl değere erişir.",
          ),
          Question(
            id: "c_unit_1_l5_q10",
            type: QuestionType.multipleChoice,
            prompt: "Heap bellekte dinamik olarak bayt cinsinden bellek tahsis etmek için hangi standart kütüphane fonksiyonu kullanılır?",
            codeSnippet: r'''int *arr = (int*)___(10 * sizeof(int));''',
            options: ["malloc", "alloc", "new", "heap_get"],
            correctIndex: 0,
            explanation: "'malloc(size_t size)' heap bölgesinde istenen bayt kadar bellek ayırır ve void* işaretçi döner.",
          ),
          Question(
            id: "c_unit_1_l5_q11",
            type: QuestionType.multipleChoice,
            prompt: "malloc veya calloc ile tahsis edilen dinamik belleğin sisteme iade edilmesi için hangi fonksiyon çağrılmalıdır?",
            codeSnippet: r'''int *buf = malloc(1024);
// ... kullanim ...
___(buf);''',
            options: ["free", "delete", "release", "dispose"],
            correctIndex: 0,
            explanation: "'free(ptr)' heap bellekte ayrılan alanı serbest bırakır. Çağrılmazsa 'Memory Leak' oluşur.",
          ),
          Question(
            id: "c_unit_1_l5_q12",
            type: QuestionType.multipleChoice,
            prompt: "Tahsis ettiği belleği otomatik olarak sıfırlarla (0 baytları) dolduran dinamik bellek fonksiyonu hangisidir?",
            codeSnippet: r'''int *p = ___(100, sizeof(int));''',
            options: ["calloc", "malloc", "realloc", "zalloc"],
            correctIndex: 0,
            explanation: "'calloc(num, size)' eleman sayısı ve eleman boyutu alır, ayrılan tüm bellek hücrelerini 0 ile başlatır.",
          ),
          Question(
            id: "c_unit_1_l5_q13",
            type: QuestionType.fillInTheBlank,
            prompt: "Geçersiz veya henüz atanmamış bir işaretçiye güvenli başlangıç değeri olarak _____ atanmalıdır.",
            explanation: "İşaretçilere NULL atamak tanımsız belleğe erişimi ve segmentation fault hatalarını engellemeye yardımcı olur.",
            blankOptions: ["NULL", "0xFF", "void", "NaN"],
            correctBlankAnswer: "NULL",
          ),
          Question(
            id: "c_unit_1_l5_q14",
            type: QuestionType.fillInTheBlank,
            prompt: "Bir veri tipinin bellekte kaç bayt yer kapladığını öğrenmek için derleme zamanı operatörü olan _____ kullanılır.",
            explanation: "sizeof(tip) veya sizeof(degisken) bayt cinsinden bellek boyutunu size_t olarak döner.",
            blankOptions: ["sizeof", "lengthof", "bytesize", "countof"],
            correctBlankAnswer: "sizeof",
          ),
          Question(
            id: "c_unit_1_l5_q15",
            type: QuestionType.fillInTheBlank,
            prompt: "Açılmış bir dosya işaretçisini işletim sistemine geri iade etmek için _____ fonksiyonu çağrılır.",
            explanation: "fclose(FILE *stream) dosya tamponlarını diske yazar ve kaynakları kapatır.",
            blankOptions: ["fclose", "close", "file_exit", "dispose"],
            correctBlankAnswer: "fclose",
          ),
          Question(
            id: "c_unit_1_l5_q16",
            type: QuestionType.trueFalse,
            prompt: "C dilinde dizi isimleri ifadeler içinde kullanıldığında dizinin ilk elemanının bellek adresine (pointer) dönüşür (decay).",
            explanation: "Doğrudur, 'arr' ifadesi '&arr[0]' adresi ile eşdeğerdir.",
            isTrue: true,
          ),
          Question(
            id: "c_unit_1_l5_q17",
            type: QuestionType.trueFalse,
            prompt: "Stack belleğinde oluşturulan yerel değişkenler fonksiyon sonlandığında da bellekte kalmaya devam eder ve serbest bırakılması için free() gerekir.",
            explanation: "Yanlıştır! Stack bellek fonksiyon bitiminde otomatik temizlenir; free() sadece heap (malloc) için geçerlidir.",
            isTrue: false,
          ),
          Question(
            id: "c_unit_1_l5_q18",
            type: QuestionType.matching,
            prompt: "C bellek kavramlarını doğru açıklamalarıyla eşleştirin.",
            explanation: "C'de bellek güvenliği doğrudan yazılımcının sorumluluğundadır.",
            matchingPairs: [MatchingPair(left: "malloc", right: "Heap üzerinde başlatılmamış bellek tahsisi"), MatchingPair(left: "free", right: "Dinamik belleği sisteme iade etme"), MatchingPair(left: "Valgrind", right: "Bellek sızıntılarını tespit eden analiz aracı")],
          ),
        ],
      ),
      Lesson(
        id: "c_unit_1_l6",
        title: "GCC Derleme Aşaması 4: Linker (Bağlayıcı)",
        description: "Nesne dosyaları ve standart kütüphane bağı",
        xpReward: 35,
        gemReward: 12,
        isUnitExam: false,
        questions: [
          Question(
            id: "c_unit_1_l6_q1",
            type: QuestionType.conceptCard,
            conceptTitle: "GCC Derleme Aşaması 4: Linker (Bağlayıcı) - Hap Bilgi",
            rule: "C dilinde işaretçiler (pointers) doğrudan bellek adreslerini saklar. '&' operatörü bir değişkenin adresini alırken, '*' (dereference) o adresteki veriye erişir veya değiştirir.",
            codeExample: r'''#include <stdio.h>
#include <stdlib.h>

int main() {
    int x = 100;
    int *ptr = &x;
    
    printf("x Degeri: %d\n", *ptr);
    printf("x Bellek Adresi: %p\n", (void*)ptr);
    return 0;
}''',
            devTip: "malloc ile tahsis edilen her bayt bellek için mutlaka bir free() çağrısı yapılmalıdır, aksi halde Memory Leak oluşur.",
            iconEmoji: "⚡",
          ),
          Question(
            id: "c_unit_1_l6_q2",
            type: QuestionType.multipleChoice,
            prompt: "Aşağıdaki bit düzeyinde (bitwise) operatörlerden hangisi bitleri 1 basamak sola kaydırarak 2 ile çarpmayı sağlar?",
            codeSnippet: r'''int x = 5;
int y = x ___ 1; // y = 10 olur''',
            options: ["<<", ">>", "&", "|"],
            correctIndex: 0,
            explanation: "Sola kaydırma (<< n) operatörü sayının değerini 2^n ile çarpar.",
          ),
          Question(
            id: "c_unit_1_l6_q3",
            type: QuestionType.multipleChoice,
            prompt: "C'de dosya açmak ve bir dosya işaretçisi (FILE*) elde etmek için hangi standart fonksiyon kullanılır?",
            codeSnippet: r'''FILE *f = ___("data.txt", "r");''',
            options: ["fopen", "open", "file_open", "create_file"],
            correctIndex: 0,
            explanation: "'fopen(dosya_adi, mod)' dosyayı belirtilen modda (r, w, a, rb, wb) açar.",
          ),
          Question(
            id: "c_unit_1_l6_q4",
            type: QuestionType.multipleChoice,
            prompt: "Bir header dosyasının birden fazla kez derlemeye dahil edilmesini (redefinition) önlemek için ne kullanılır?",
            codeSnippet: r'''#ifndef MY_HEADER_H
#define MY_HEADER_H
// ...
#endif''',
            options: ["Header Guards (#ifndef / #define)", "namespace", "pragma private", "module"],
            correctIndex: 0,
            explanation: "Header guards veya '#pragma once' başlık dosyalarının mükerrer include edilmesini engeller.",
          ),
          Question(
            id: "c_unit_1_l6_q5",
            type: QuestionType.multipleChoice,
            prompt: "Tüm üyelerinin bellekte AYNI başlangıç adresini paylaştığı ve en büyük üyesi kadar yer kaplayan yapı hangisidir?",
            codeSnippet: r'''___ Data {
    int i;
    float f;
    char str[20];
};''',
            options: ["union", "struct", "class", "shared"],
            correctIndex: 0,
            explanation: "'union' içindeki tüm elemanlar aynı bellek alanını ortaklaşa kullanır; aynı anda sadece biri geçerli değer tutar.",
          ),
          Question(
            id: "c_unit_1_l6_q6",
            type: QuestionType.multipleChoice,
            prompt: "C dilinde bir değişkenin bellekteki adresini elde etmek için hangi operatör kullanılır?",
            codeSnippet: r'''int x = 10;
int *ptr = ___x;''',
            options: ["& (Address-of)", "* (Dereference)", "% (Mod)", "\$ (Value)"],
            correctIndex: 0,
            explanation: "'&' operatörü bir değişkenin RAM üzerindeki başlangıç adresini döner.",
          ),
          Question(
            id: "c_unit_1_l6_q7",
            type: QuestionType.multipleChoice,
            prompt: "Bir işaretçinin (pointer) işaret ettiği bellek adresindeki veriye erişmek veya onu değiştirmek için hangi işlem yapılır?",
            codeSnippet: r'''int x = 5;
int *p = &x;
___p = 20; // x artik 20 olur''',
            options: ["* (Dereference)", "&", "->", "."],
            correctIndex: 0,
            explanation: "'*p' dereferencing yaparak işaretçinin tuttuğu adresteki asıl değere erişir.",
          ),
          Question(
            id: "c_unit_1_l6_q8",
            type: QuestionType.multipleChoice,
            prompt: "Heap bellekte dinamik olarak bayt cinsinden bellek tahsis etmek için hangi standart kütüphane fonksiyonu kullanılır?",
            codeSnippet: r'''int *arr = (int*)___(10 * sizeof(int));''',
            options: ["malloc", "alloc", "new", "heap_get"],
            correctIndex: 0,
            explanation: "'malloc(size_t size)' heap bölgesinde istenen bayt kadar bellek ayırır ve void* işaretçi döner.",
          ),
          Question(
            id: "c_unit_1_l6_q9",
            type: QuestionType.multipleChoice,
            prompt: "malloc veya calloc ile tahsis edilen dinamik belleğin sisteme iade edilmesi için hangi fonksiyon çağrılmalıdır?",
            codeSnippet: r'''int *buf = malloc(1024);
// ... kullanim ...
___(buf);''',
            options: ["free", "delete", "release", "dispose"],
            correctIndex: 0,
            explanation: "'free(ptr)' heap bellekte ayrılan alanı serbest bırakır. Çağrılmazsa 'Memory Leak' oluşur.",
          ),
          Question(
            id: "c_unit_1_l6_q10",
            type: QuestionType.multipleChoice,
            prompt: "Tahsis ettiği belleği otomatik olarak sıfırlarla (0 baytları) dolduran dinamik bellek fonksiyonu hangisidir?",
            codeSnippet: r'''int *p = ___(100, sizeof(int));''',
            options: ["calloc", "malloc", "realloc", "zalloc"],
            correctIndex: 0,
            explanation: "'calloc(num, size)' eleman sayısı ve eleman boyutu alır, ayrılan tüm bellek hücrelerini 0 ile başlatır.",
          ),
          Question(
            id: "c_unit_1_l6_q11",
            type: QuestionType.multipleChoice,
            prompt: "Daha önce ayrılmış dinamik bir bellek bloğunun boyutunu veri kaybı olmadan büyütmek veya küçültmek için ne kullanılır?",
            codeSnippet: r'''ptr = ___(ptr, new_size);''',
            options: ["realloc", "resize", "remalloc", "expand"],
            correctIndex: 0,
            explanation: "'realloc' mevcut bloğu genişletir veya yeni bir konuma taşıyarak eski veriyi kopyalar.",
          ),
          Question(
            id: "c_unit_1_l6_q12",
            type: QuestionType.multipleChoice,
            prompt: "C programlama dilinde GCC derleme sürecinin doğru sırası aşağıdakilerden hangisidir?",
            options: ["Preprocessor -> Compiler -> Assembler -> Linker", "Compiler -> Preprocessor -> Linker -> Assembler", "Assembler -> Compiler -> Linker -> Preprocessor", "Linker -> Assembler -> Compiler -> Preprocessor"],
            correctIndex: 0,
            explanation: "Önce makrolar ve headerlar çözülür (cpp), C kodu Assembly'ye derlenir (cc1), makine koduna çevrilir (as), kütüphaneler bağlanır (ld).",
          ),
          Question(
            id: "c_unit_1_l6_q13",
            type: QuestionType.fillInTheBlank,
            prompt: "Geçersiz veya henüz atanmamış bir işaretçiye güvenli başlangıç değeri olarak _____ atanmalıdır.",
            explanation: "İşaretçilere NULL atamak tanımsız belleğe erişimi ve segmentation fault hatalarını engellemeye yardımcı olur.",
            blankOptions: ["NULL", "0xFF", "void", "NaN"],
            correctBlankAnswer: "NULL",
          ),
          Question(
            id: "c_unit_1_l6_q14",
            type: QuestionType.fillInTheBlank,
            prompt: "Bir veri tipinin bellekte kaç bayt yer kapladığını öğrenmek için derleme zamanı operatörü olan _____ kullanılır.",
            explanation: "sizeof(tip) veya sizeof(degisken) bayt cinsinden bellek boyutunu size_t olarak döner.",
            blankOptions: ["sizeof", "lengthof", "bytesize", "countof"],
            correctBlankAnswer: "sizeof",
          ),
          Question(
            id: "c_unit_1_l6_q15",
            type: QuestionType.fillInTheBlank,
            prompt: "Açılmış bir dosya işaretçisini işletim sistemine geri iade etmek için _____ fonksiyonu çağrılır.",
            explanation: "fclose(FILE *stream) dosya tamponlarını diske yazar ve kaynakları kapatır.",
            blankOptions: ["fclose", "close", "file_exit", "dispose"],
            correctBlankAnswer: "fclose",
          ),
          Question(
            id: "c_unit_1_l6_q16",
            type: QuestionType.trueFalse,
            prompt: "C dilinde dizi isimleri ifadeler içinde kullanıldığında dizinin ilk elemanının bellek adresine (pointer) dönüşür (decay).",
            explanation: "Doğrudur, 'arr' ifadesi '&arr[0]' adresi ile eşdeğerdir.",
            isTrue: true,
          ),
          Question(
            id: "c_unit_1_l6_q17",
            type: QuestionType.trueFalse,
            prompt: "Stack belleğinde oluşturulan yerel değişkenler fonksiyon sonlandığında da bellekte kalmaya devam eder ve serbest bırakılması için free() gerekir.",
            explanation: "Yanlıştır! Stack bellek fonksiyon bitiminde otomatik temizlenir; free() sadece heap (malloc) için geçerlidir.",
            isTrue: false,
          ),
          Question(
            id: "c_unit_1_l6_q18",
            type: QuestionType.matching,
            prompt: "C bellek kavramlarını doğru açıklamalarıyla eşleştirin.",
            explanation: "C'de bellek güvenliği doğrudan yazılımcının sorumluluğundadır.",
            matchingPairs: [MatchingPair(left: "malloc", right: "Heap üzerinde başlatılmamış bellek tahsisi"), MatchingPair(left: "free", right: "Dinamik belleği sisteme iade etme"), MatchingPair(left: "Valgrind", right: "Bellek sızıntılarını tespit eden analiz aracı")],
          ),
        ],
      ),
      Lesson(
        id: "c_unit_1_l7",
        title: "Derleyici Bayrakları: -Wall, -Wextra, -O2, -g",
        description: "Uyarıları açma, hata ayıklama ve optimizasyon",
        xpReward: 35,
        gemReward: 12,
        isUnitExam: false,
        questions: [
          Question(
            id: "c_unit_1_l7_q1",
            type: QuestionType.conceptCard,
            conceptTitle: "Derleyici Bayrakları: -Wall, -Wextra, -O2, -g - Hap Bilgi",
            rule: "C dilinde işaretçiler (pointers) doğrudan bellek adreslerini saklar. '&' operatörü bir değişkenin adresini alırken, '*' (dereference) o adresteki veriye erişir veya değiştirir.",
            codeExample: r'''#include <stdio.h>
#include <stdlib.h>

int main() {
    int x = 100;
    int *ptr = &x;
    
    printf("x Degeri: %d\n", *ptr);
    printf("x Bellek Adresi: %p\n", (void*)ptr);
    return 0;
}''',
            devTip: "malloc ile tahsis edilen her bayt bellek için mutlaka bir free() çağrısı yapılmalıdır, aksi halde Memory Leak oluşur.",
            iconEmoji: "⚡",
          ),
          Question(
            id: "c_unit_1_l7_q2",
            type: QuestionType.multipleChoice,
            prompt: "Bir header dosyasının birden fazla kez derlemeye dahil edilmesini (redefinition) önlemek için ne kullanılır?",
            codeSnippet: r'''#ifndef MY_HEADER_H
#define MY_HEADER_H
// ...
#endif''',
            options: ["Header Guards (#ifndef / #define)", "namespace", "pragma private", "module"],
            correctIndex: 0,
            explanation: "Header guards veya '#pragma once' başlık dosyalarının mükerrer include edilmesini engeller.",
          ),
          Question(
            id: "c_unit_1_l7_q3",
            type: QuestionType.multipleChoice,
            prompt: "Tüm üyelerinin bellekte AYNI başlangıç adresini paylaştığı ve en büyük üyesi kadar yer kaplayan yapı hangisidir?",
            codeSnippet: r'''___ Data {
    int i;
    float f;
    char str[20];
};''',
            options: ["union", "struct", "class", "shared"],
            correctIndex: 0,
            explanation: "'union' içindeki tüm elemanlar aynı bellek alanını ortaklaşa kullanır; aynı anda sadece biri geçerli değer tutar.",
          ),
          Question(
            id: "c_unit_1_l7_q4",
            type: QuestionType.multipleChoice,
            prompt: "C dilinde bir değişkenin bellekteki adresini elde etmek için hangi operatör kullanılır?",
            codeSnippet: r'''int x = 10;
int *ptr = ___x;''',
            options: ["& (Address-of)", "* (Dereference)", "% (Mod)", "\$ (Value)"],
            correctIndex: 0,
            explanation: "'&' operatörü bir değişkenin RAM üzerindeki başlangıç adresini döner.",
          ),
          Question(
            id: "c_unit_1_l7_q5",
            type: QuestionType.multipleChoice,
            prompt: "Bir işaretçinin (pointer) işaret ettiği bellek adresindeki veriye erişmek veya onu değiştirmek için hangi işlem yapılır?",
            codeSnippet: r'''int x = 5;
int *p = &x;
___p = 20; // x artik 20 olur''',
            options: ["* (Dereference)", "&", "->", "."],
            correctIndex: 0,
            explanation: "'*p' dereferencing yaparak işaretçinin tuttuğu adresteki asıl değere erişir.",
          ),
          Question(
            id: "c_unit_1_l7_q6",
            type: QuestionType.multipleChoice,
            prompt: "Heap bellekte dinamik olarak bayt cinsinden bellek tahsis etmek için hangi standart kütüphane fonksiyonu kullanılır?",
            codeSnippet: r'''int *arr = (int*)___(10 * sizeof(int));''',
            options: ["malloc", "alloc", "new", "heap_get"],
            correctIndex: 0,
            explanation: "'malloc(size_t size)' heap bölgesinde istenen bayt kadar bellek ayırır ve void* işaretçi döner.",
          ),
          Question(
            id: "c_unit_1_l7_q7",
            type: QuestionType.multipleChoice,
            prompt: "malloc veya calloc ile tahsis edilen dinamik belleğin sisteme iade edilmesi için hangi fonksiyon çağrılmalıdır?",
            codeSnippet: r'''int *buf = malloc(1024);
// ... kullanim ...
___(buf);''',
            options: ["free", "delete", "release", "dispose"],
            correctIndex: 0,
            explanation: "'free(ptr)' heap bellekte ayrılan alanı serbest bırakır. Çağrılmazsa 'Memory Leak' oluşur.",
          ),
          Question(
            id: "c_unit_1_l7_q8",
            type: QuestionType.multipleChoice,
            prompt: "Tahsis ettiği belleği otomatik olarak sıfırlarla (0 baytları) dolduran dinamik bellek fonksiyonu hangisidir?",
            codeSnippet: r'''int *p = ___(100, sizeof(int));''',
            options: ["calloc", "malloc", "realloc", "zalloc"],
            correctIndex: 0,
            explanation: "'calloc(num, size)' eleman sayısı ve eleman boyutu alır, ayrılan tüm bellek hücrelerini 0 ile başlatır.",
          ),
          Question(
            id: "c_unit_1_l7_q9",
            type: QuestionType.multipleChoice,
            prompt: "Daha önce ayrılmış dinamik bir bellek bloğunun boyutunu veri kaybı olmadan büyütmek veya küçültmek için ne kullanılır?",
            codeSnippet: r'''ptr = ___(ptr, new_size);''',
            options: ["realloc", "resize", "remalloc", "expand"],
            correctIndex: 0,
            explanation: "'realloc' mevcut bloğu genişletir veya yeni bir konuma taşıyarak eski veriyi kopyalar.",
          ),
          Question(
            id: "c_unit_1_l7_q10",
            type: QuestionType.multipleChoice,
            prompt: "C programlama dilinde GCC derleme sürecinin doğru sırası aşağıdakilerden hangisidir?",
            options: ["Preprocessor -> Compiler -> Assembler -> Linker", "Compiler -> Preprocessor -> Linker -> Assembler", "Assembler -> Compiler -> Linker -> Preprocessor", "Linker -> Assembler -> Compiler -> Preprocessor"],
            correctIndex: 0,
            explanation: "Önce makrolar ve headerlar çözülür (cpp), C kodu Assembly'ye derlenir (cc1), makine koduna çevrilir (as), kütüphaneler bağlanır (ld).",
          ),
          Question(
            id: "c_unit_1_l7_q11",
            type: QuestionType.multipleChoice,
            prompt: "64-bit modern bir mimaride standart bir işaretçi (pointer - int*, char*, void*) değişkeni bellekte kaç bayt yer kaplar?",
            codeSnippet: r'''printf("%zu", sizeof(int*));''',
            options: ["8 bayt", "4 bayt", "2 bayt", "16 bayt"],
            correctIndex: 0,
            explanation: "64-bit mimarilerde bellek adresleri 64 bit yani tam 8 bayttır. İşaretçinin tipi ne olursa olsun adres boyutu 8 bayttır.",
          ),
          Question(
            id: "c_unit_1_l7_q12",
            type: QuestionType.multipleChoice,
            prompt: "Bir struct içindeki bir işaretçi elemana erişirken '.' yerine hangi pratik operatör kullanılır?",
            codeSnippet: r'''struct User *u = getUser();
u___name = "Ahmet";''',
            options: ["-> (Ok operatörü)", ".", "::", "=>"],
            correctIndex: 0,
            explanation: "'u->name', '(*u).name' yazımının daha okunaklı ve standart kısayoludur.",
          ),
          Question(
            id: "c_unit_1_l7_q13",
            type: QuestionType.fillInTheBlank,
            prompt: "Geçersiz veya henüz atanmamış bir işaretçiye güvenli başlangıç değeri olarak _____ atanmalıdır.",
            explanation: "İşaretçilere NULL atamak tanımsız belleğe erişimi ve segmentation fault hatalarını engellemeye yardımcı olur.",
            blankOptions: ["NULL", "0xFF", "void", "NaN"],
            correctBlankAnswer: "NULL",
          ),
          Question(
            id: "c_unit_1_l7_q14",
            type: QuestionType.fillInTheBlank,
            prompt: "Bir veri tipinin bellekte kaç bayt yer kapladığını öğrenmek için derleme zamanı operatörü olan _____ kullanılır.",
            explanation: "sizeof(tip) veya sizeof(degisken) bayt cinsinden bellek boyutunu size_t olarak döner.",
            blankOptions: ["sizeof", "lengthof", "bytesize", "countof"],
            correctBlankAnswer: "sizeof",
          ),
          Question(
            id: "c_unit_1_l7_q15",
            type: QuestionType.fillInTheBlank,
            prompt: "Açılmış bir dosya işaretçisini işletim sistemine geri iade etmek için _____ fonksiyonu çağrılır.",
            explanation: "fclose(FILE *stream) dosya tamponlarını diske yazar ve kaynakları kapatır.",
            blankOptions: ["fclose", "close", "file_exit", "dispose"],
            correctBlankAnswer: "fclose",
          ),
          Question(
            id: "c_unit_1_l7_q16",
            type: QuestionType.trueFalse,
            prompt: "C dilinde dizi isimleri ifadeler içinde kullanıldığında dizinin ilk elemanının bellek adresine (pointer) dönüşür (decay).",
            explanation: "Doğrudur, 'arr' ifadesi '&arr[0]' adresi ile eşdeğerdir.",
            isTrue: true,
          ),
          Question(
            id: "c_unit_1_l7_q17",
            type: QuestionType.trueFalse,
            prompt: "Stack belleğinde oluşturulan yerel değişkenler fonksiyon sonlandığında da bellekte kalmaya devam eder ve serbest bırakılması için free() gerekir.",
            explanation: "Yanlıştır! Stack bellek fonksiyon bitiminde otomatik temizlenir; free() sadece heap (malloc) için geçerlidir.",
            isTrue: false,
          ),
          Question(
            id: "c_unit_1_l7_q18",
            type: QuestionType.matching,
            prompt: "C bellek kavramlarını doğru açıklamalarıyla eşleştirin.",
            explanation: "C'de bellek güvenliği doğrudan yazılımcının sorumluluğundadır.",
            matchingPairs: [MatchingPair(left: "malloc", right: "Heap üzerinde başlatılmamış bellek tahsisi"), MatchingPair(left: "free", right: "Dinamik belleği sisteme iade etme"), MatchingPair(left: "Valgrind", right: "Bellek sızıntılarını tespit eden analiz aracı")],
          ),
        ],
      ),
      Lesson(
        id: "c_unit_1_l8",
        title: "1. Ünite C Temelleri & Derleme Sınavı",
        description: "C derleme boru hattı sınavı",
        xpReward: 50,
        gemReward: 25,
        isUnitExam: true,
        questions: [
          Question(
            id: "c_unit_1_l8_q1",
            type: QuestionType.conceptCard,
            conceptTitle: "1. Ünite C Temelleri & Derleme Sınavı - Hap Bilgi",
            rule: "C dilinde işaretçiler (pointers) doğrudan bellek adreslerini saklar. '&' operatörü bir değişkenin adresini alırken, '*' (dereference) o adresteki veriye erişir veya değiştirir.",
            codeExample: r'''#include <stdio.h>
#include <stdlib.h>

int main() {
    int x = 100;
    int *ptr = &x;
    
    printf("x Degeri: %d\n", *ptr);
    printf("x Bellek Adresi: %p\n", (void*)ptr);
    return 0;
}''',
            devTip: "malloc ile tahsis edilen her bayt bellek için mutlaka bir free() çağrısı yapılmalıdır, aksi halde Memory Leak oluşur.",
            iconEmoji: "⚡",
          ),
          Question(
            id: "c_unit_1_l8_q2",
            type: QuestionType.multipleChoice,
            prompt: "C dilinde bir değişkenin bellekteki adresini elde etmek için hangi operatör kullanılır?",
            codeSnippet: r'''int x = 10;
int *ptr = ___x;''',
            options: ["& (Address-of)", "* (Dereference)", "% (Mod)", "\$ (Value)"],
            correctIndex: 0,
            explanation: "'&' operatörü bir değişkenin RAM üzerindeki başlangıç adresini döner.",
          ),
          Question(
            id: "c_unit_1_l8_q3",
            type: QuestionType.multipleChoice,
            prompt: "Bir işaretçinin (pointer) işaret ettiği bellek adresindeki veriye erişmek veya onu değiştirmek için hangi işlem yapılır?",
            codeSnippet: r'''int x = 5;
int *p = &x;
___p = 20; // x artik 20 olur''',
            options: ["* (Dereference)", "&", "->", "."],
            correctIndex: 0,
            explanation: "'*p' dereferencing yaparak işaretçinin tuttuğu adresteki asıl değere erişir.",
          ),
          Question(
            id: "c_unit_1_l8_q4",
            type: QuestionType.multipleChoice,
            prompt: "Heap bellekte dinamik olarak bayt cinsinden bellek tahsis etmek için hangi standart kütüphane fonksiyonu kullanılır?",
            codeSnippet: r'''int *arr = (int*)___(10 * sizeof(int));''',
            options: ["malloc", "alloc", "new", "heap_get"],
            correctIndex: 0,
            explanation: "'malloc(size_t size)' heap bölgesinde istenen bayt kadar bellek ayırır ve void* işaretçi döner.",
          ),
          Question(
            id: "c_unit_1_l8_q5",
            type: QuestionType.multipleChoice,
            prompt: "malloc veya calloc ile tahsis edilen dinamik belleğin sisteme iade edilmesi için hangi fonksiyon çağrılmalıdır?",
            codeSnippet: r'''int *buf = malloc(1024);
// ... kullanim ...
___(buf);''',
            options: ["free", "delete", "release", "dispose"],
            correctIndex: 0,
            explanation: "'free(ptr)' heap bellekte ayrılan alanı serbest bırakır. Çağrılmazsa 'Memory Leak' oluşur.",
          ),
          Question(
            id: "c_unit_1_l8_q6",
            type: QuestionType.multipleChoice,
            prompt: "Tahsis ettiği belleği otomatik olarak sıfırlarla (0 baytları) dolduran dinamik bellek fonksiyonu hangisidir?",
            codeSnippet: r'''int *p = ___(100, sizeof(int));''',
            options: ["calloc", "malloc", "realloc", "zalloc"],
            correctIndex: 0,
            explanation: "'calloc(num, size)' eleman sayısı ve eleman boyutu alır, ayrılan tüm bellek hücrelerini 0 ile başlatır.",
          ),
          Question(
            id: "c_unit_1_l8_q7",
            type: QuestionType.multipleChoice,
            prompt: "Daha önce ayrılmış dinamik bir bellek bloğunun boyutunu veri kaybı olmadan büyütmek veya küçültmek için ne kullanılır?",
            codeSnippet: r'''ptr = ___(ptr, new_size);''',
            options: ["realloc", "resize", "remalloc", "expand"],
            correctIndex: 0,
            explanation: "'realloc' mevcut bloğu genişletir veya yeni bir konuma taşıyarak eski veriyi kopyalar.",
          ),
          Question(
            id: "c_unit_1_l8_q8",
            type: QuestionType.multipleChoice,
            prompt: "C programlama dilinde GCC derleme sürecinin doğru sırası aşağıdakilerden hangisidir?",
            options: ["Preprocessor -> Compiler -> Assembler -> Linker", "Compiler -> Preprocessor -> Linker -> Assembler", "Assembler -> Compiler -> Linker -> Preprocessor", "Linker -> Assembler -> Compiler -> Preprocessor"],
            correctIndex: 0,
            explanation: "Önce makrolar ve headerlar çözülür (cpp), C kodu Assembly'ye derlenir (cc1), makine koduna çevrilir (as), kütüphaneler bağlanır (ld).",
          ),
          Question(
            id: "c_unit_1_l8_q9",
            type: QuestionType.multipleChoice,
            prompt: "64-bit modern bir mimaride standart bir işaretçi (pointer - int*, char*, void*) değişkeni bellekte kaç bayt yer kaplar?",
            codeSnippet: r'''printf("%zu", sizeof(int*));''',
            options: ["8 bayt", "4 bayt", "2 bayt", "16 bayt"],
            correctIndex: 0,
            explanation: "64-bit mimarilerde bellek adresleri 64 bit yani tam 8 bayttır. İşaretçinin tipi ne olursa olsun adres boyutu 8 bayttır.",
          ),
          Question(
            id: "c_unit_1_l8_q10",
            type: QuestionType.multipleChoice,
            prompt: "Bir struct içindeki bir işaretçi elemana erişirken '.' yerine hangi pratik operatör kullanılır?",
            codeSnippet: r'''struct User *u = getUser();
u___name = "Ahmet";''',
            options: ["-> (Ok operatörü)", ".", "::", "=>"],
            correctIndex: 0,
            explanation: "'u->name', '(*u).name' yazımının daha okunaklı ve standart kısayoludur.",
          ),
          Question(
            id: "c_unit_1_l8_q11",
            type: QuestionType.multipleChoice,
            prompt: "Herhangi bir veri tipine ait bellek adresini tutabilen jenerik (tip bağımsız) işaretçi tipi hangisidir?",
            codeSnippet: r'''___ generic_ptr = &x;''',
            options: ["void*", "any*", "object*", "generic*"],
            correctIndex: 0,
            explanation: "'void*' tipi belirsiz jenerik bir işaretçidir; doğrudan dereference edilemez, cast edilmesi gerekir.",
          ),
          Question(
            id: "c_unit_1_l8_q12",
            type: QuestionType.multipleChoice,
            prompt: "Serbest bırakılmış (free edilmiş) bir işaretçiyi kullanmaya devam etme hatasına ne ad verilir?",
            codeSnippet: r'''free(ptr);
printf("%d", *ptr); // HATA!''',
            options: ["Dangling Pointer (Askıda Kalan İşaretçi)", "Stack Overflow", "Memory Leak", "Deadlock"],
            correctIndex: 0,
            explanation: "free edildikten sonra hala o adresi göstermeye devam eden işaretçiye dangling pointer denir; 'ptr = NULL' yapılarak önlenir.",
          ),
          Question(
            id: "c_unit_1_l8_q13",
            type: QuestionType.fillInTheBlank,
            prompt: "Geçersiz veya henüz atanmamış bir işaretçiye güvenli başlangıç değeri olarak _____ atanmalıdır.",
            explanation: "İşaretçilere NULL atamak tanımsız belleğe erişimi ve segmentation fault hatalarını engellemeye yardımcı olur.",
            blankOptions: ["NULL", "0xFF", "void", "NaN"],
            correctBlankAnswer: "NULL",
          ),
          Question(
            id: "c_unit_1_l8_q14",
            type: QuestionType.fillInTheBlank,
            prompt: "Bir veri tipinin bellekte kaç bayt yer kapladığını öğrenmek için derleme zamanı operatörü olan _____ kullanılır.",
            explanation: "sizeof(tip) veya sizeof(degisken) bayt cinsinden bellek boyutunu size_t olarak döner.",
            blankOptions: ["sizeof", "lengthof", "bytesize", "countof"],
            correctBlankAnswer: "sizeof",
          ),
          Question(
            id: "c_unit_1_l8_q15",
            type: QuestionType.fillInTheBlank,
            prompt: "Açılmış bir dosya işaretçisini işletim sistemine geri iade etmek için _____ fonksiyonu çağrılır.",
            explanation: "fclose(FILE *stream) dosya tamponlarını diske yazar ve kaynakları kapatır.",
            blankOptions: ["fclose", "close", "file_exit", "dispose"],
            correctBlankAnswer: "fclose",
          ),
          Question(
            id: "c_unit_1_l8_q16",
            type: QuestionType.trueFalse,
            prompt: "C dilinde dizi isimleri ifadeler içinde kullanıldığında dizinin ilk elemanının bellek adresine (pointer) dönüşür (decay).",
            explanation: "Doğrudur, 'arr' ifadesi '&arr[0]' adresi ile eşdeğerdir.",
            isTrue: true,
          ),
          Question(
            id: "c_unit_1_l8_q17",
            type: QuestionType.trueFalse,
            prompt: "Stack belleğinde oluşturulan yerel değişkenler fonksiyon sonlandığında da bellekte kalmaya devam eder ve serbest bırakılması için free() gerekir.",
            explanation: "Yanlıştır! Stack bellek fonksiyon bitiminde otomatik temizlenir; free() sadece heap (malloc) için geçerlidir.",
            isTrue: false,
          ),
          Question(
            id: "c_unit_1_l8_q18",
            type: QuestionType.matching,
            prompt: "C bellek kavramlarını doğru açıklamalarıyla eşleştirin.",
            explanation: "C'de bellek güvenliği doğrudan yazılımcının sorumluluğundadır.",
            matchingPairs: [MatchingPair(left: "malloc", right: "Heap üzerinde başlatılmamış bellek tahsisi"), MatchingPair(left: "free", right: "Dinamik belleği sisteme iade etme"), MatchingPair(left: "Valgrind", right: "Bellek sızıntılarını tespit eden analiz aracı")],
          ),
        ],
      ),
    ],
  ),
  LearningUnit(
    id: "c_unit_2",
    unitNumber: 2,
    title: "İlkel Veri Tipleri, Boyutlar & Formatlı G/Ç",
    language: CodeLanguage.c,
    category: "Temeller & Tipler",
    colorHex: 0xFF0369A1,
    cheatSheetTitle: "C Tipler & G/Ç Hile Kağıdı",
    cheatSheetContent: r'''int a; float b; double c; char d;
printf('%d, %.2f, %p\n', a, b, (void*)&a);
scanf('%d', &a);''',
    lessons: [
      Lesson(
        id: "c_unit_2_l1",
        title: "Tamsayı Tipleri: char, short, int, long",
        description: "İşaretli (signed) vs işaretsiz (unsigned)",
        xpReward: 35,
        gemReward: 12,
        isUnitExam: false,
        questions: [
          Question(
            id: "c_unit_2_l1_q1",
            type: QuestionType.conceptCard,
            conceptTitle: "Tamsayı Tipleri: char, short, int, long - Hap Bilgi",
            rule: "C dilinde işaretçiler (pointers) doğrudan bellek adreslerini saklar. '&' operatörü bir değişkenin adresini alırken, '*' (dereference) o adresteki veriye erişir veya değiştirir.",
            codeExample: r'''#include <stdio.h>
#include <stdlib.h>

int main() {
    int x = 100;
    int *ptr = &x;
    
    printf("x Degeri: %d\n", *ptr);
    printf("x Bellek Adresi: %p\n", (void*)ptr);
    return 0;
}''',
            devTip: "malloc ile tahsis edilen her bayt bellek için mutlaka bir free() çağrısı yapılmalıdır, aksi halde Memory Leak oluşur.",
            iconEmoji: "⚡",
          ),
          Question(
            id: "c_unit_2_l1_q2",
            type: QuestionType.multipleChoice,
            prompt: "Heap bellekte dinamik olarak bayt cinsinden bellek tahsis etmek için hangi standart kütüphane fonksiyonu kullanılır?",
            codeSnippet: r'''int *arr = (int*)___(10 * sizeof(int));''',
            options: ["malloc", "alloc", "new", "heap_get"],
            correctIndex: 0,
            explanation: "'malloc(size_t size)' heap bölgesinde istenen bayt kadar bellek ayırır ve void* işaretçi döner.",
          ),
          Question(
            id: "c_unit_2_l1_q3",
            type: QuestionType.multipleChoice,
            prompt: "malloc veya calloc ile tahsis edilen dinamik belleğin sisteme iade edilmesi için hangi fonksiyon çağrılmalıdır?",
            codeSnippet: r'''int *buf = malloc(1024);
// ... kullanim ...
___(buf);''',
            options: ["free", "delete", "release", "dispose"],
            correctIndex: 0,
            explanation: "'free(ptr)' heap bellekte ayrılan alanı serbest bırakır. Çağrılmazsa 'Memory Leak' oluşur.",
          ),
          Question(
            id: "c_unit_2_l1_q4",
            type: QuestionType.multipleChoice,
            prompt: "Tahsis ettiği belleği otomatik olarak sıfırlarla (0 baytları) dolduran dinamik bellek fonksiyonu hangisidir?",
            codeSnippet: r'''int *p = ___(100, sizeof(int));''',
            options: ["calloc", "malloc", "realloc", "zalloc"],
            correctIndex: 0,
            explanation: "'calloc(num, size)' eleman sayısı ve eleman boyutu alır, ayrılan tüm bellek hücrelerini 0 ile başlatır.",
          ),
          Question(
            id: "c_unit_2_l1_q5",
            type: QuestionType.multipleChoice,
            prompt: "Daha önce ayrılmış dinamik bir bellek bloğunun boyutunu veri kaybı olmadan büyütmek veya küçültmek için ne kullanılır?",
            codeSnippet: r'''ptr = ___(ptr, new_size);''',
            options: ["realloc", "resize", "remalloc", "expand"],
            correctIndex: 0,
            explanation: "'realloc' mevcut bloğu genişletir veya yeni bir konuma taşıyarak eski veriyi kopyalar.",
          ),
          Question(
            id: "c_unit_2_l1_q6",
            type: QuestionType.multipleChoice,
            prompt: "C programlama dilinde GCC derleme sürecinin doğru sırası aşağıdakilerden hangisidir?",
            options: ["Preprocessor -> Compiler -> Assembler -> Linker", "Compiler -> Preprocessor -> Linker -> Assembler", "Assembler -> Compiler -> Linker -> Preprocessor", "Linker -> Assembler -> Compiler -> Preprocessor"],
            correctIndex: 0,
            explanation: "Önce makrolar ve headerlar çözülür (cpp), C kodu Assembly'ye derlenir (cc1), makine koduna çevrilir (as), kütüphaneler bağlanır (ld).",
          ),
          Question(
            id: "c_unit_2_l1_q7",
            type: QuestionType.multipleChoice,
            prompt: "64-bit modern bir mimaride standart bir işaretçi (pointer - int*, char*, void*) değişkeni bellekte kaç bayt yer kaplar?",
            codeSnippet: r'''printf("%zu", sizeof(int*));''',
            options: ["8 bayt", "4 bayt", "2 bayt", "16 bayt"],
            correctIndex: 0,
            explanation: "64-bit mimarilerde bellek adresleri 64 bit yani tam 8 bayttır. İşaretçinin tipi ne olursa olsun adres boyutu 8 bayttır.",
          ),
          Question(
            id: "c_unit_2_l1_q8",
            type: QuestionType.multipleChoice,
            prompt: "Bir struct içindeki bir işaretçi elemana erişirken '.' yerine hangi pratik operatör kullanılır?",
            codeSnippet: r'''struct User *u = getUser();
u___name = "Ahmet";''',
            options: ["-> (Ok operatörü)", ".", "::", "=>"],
            correctIndex: 0,
            explanation: "'u->name', '(*u).name' yazımının daha okunaklı ve standart kısayoludur.",
          ),
          Question(
            id: "c_unit_2_l1_q9",
            type: QuestionType.multipleChoice,
            prompt: "Herhangi bir veri tipine ait bellek adresini tutabilen jenerik (tip bağımsız) işaretçi tipi hangisidir?",
            codeSnippet: r'''___ generic_ptr = &x;''',
            options: ["void*", "any*", "object*", "generic*"],
            correctIndex: 0,
            explanation: "'void*' tipi belirsiz jenerik bir işaretçidir; doğrudan dereference edilemez, cast edilmesi gerekir.",
          ),
          Question(
            id: "c_unit_2_l1_q10",
            type: QuestionType.multipleChoice,
            prompt: "Serbest bırakılmış (free edilmiş) bir işaretçiyi kullanmaya devam etme hatasına ne ad verilir?",
            codeSnippet: r'''free(ptr);
printf("%d", *ptr); // HATA!''',
            options: ["Dangling Pointer (Askıda Kalan İşaretçi)", "Stack Overflow", "Memory Leak", "Deadlock"],
            correctIndex: 0,
            explanation: "free edildikten sonra hala o adresi göstermeye devam eden işaretçiye dangling pointer denir; 'ptr = NULL' yapılarak önlenir.",
          ),
          Question(
            id: "c_unit_2_l1_q11",
            type: QuestionType.multipleChoice,
            prompt: "C programlarında bellek sızıntılarını (memory leak) ve geçersiz bellek erişimlerini tespit etmek için en popüler Linux aracı hangisidir?",
            codeSnippet: r'''$ ___ --leak-check=full ./program''',
            options: ["valgrind", "gdb", "perf", "strace"],
            correctIndex: 0,
            explanation: "Valgrind (özellikle memcheck aracı) C/C++ programlarında bellek yönetim hatalarını ayrıntılı raporlar.",
          ),
          Question(
            id: "c_unit_2_l1_q12",
            type: QuestionType.multipleChoice,
            prompt: "Aşağıdaki bit düzeyinde (bitwise) operatörlerden hangisi bitleri 1 basamak sola kaydırarak 2 ile çarpmayı sağlar?",
            codeSnippet: r'''int x = 5;
int y = x ___ 1; // y = 10 olur''',
            options: ["<<", ">>", "&", "|"],
            correctIndex: 0,
            explanation: "Sola kaydırma (<< n) operatörü sayının değerini 2^n ile çarpar.",
          ),
          Question(
            id: "c_unit_2_l1_q13",
            type: QuestionType.fillInTheBlank,
            prompt: "Geçersiz veya henüz atanmamış bir işaretçiye güvenli başlangıç değeri olarak _____ atanmalıdır.",
            explanation: "İşaretçilere NULL atamak tanımsız belleğe erişimi ve segmentation fault hatalarını engellemeye yardımcı olur.",
            blankOptions: ["NULL", "0xFF", "void", "NaN"],
            correctBlankAnswer: "NULL",
          ),
          Question(
            id: "c_unit_2_l1_q14",
            type: QuestionType.fillInTheBlank,
            prompt: "Bir veri tipinin bellekte kaç bayt yer kapladığını öğrenmek için derleme zamanı operatörü olan _____ kullanılır.",
            explanation: "sizeof(tip) veya sizeof(degisken) bayt cinsinden bellek boyutunu size_t olarak döner.",
            blankOptions: ["sizeof", "lengthof", "bytesize", "countof"],
            correctBlankAnswer: "sizeof",
          ),
          Question(
            id: "c_unit_2_l1_q15",
            type: QuestionType.fillInTheBlank,
            prompt: "Açılmış bir dosya işaretçisini işletim sistemine geri iade etmek için _____ fonksiyonu çağrılır.",
            explanation: "fclose(FILE *stream) dosya tamponlarını diske yazar ve kaynakları kapatır.",
            blankOptions: ["fclose", "close", "file_exit", "dispose"],
            correctBlankAnswer: "fclose",
          ),
          Question(
            id: "c_unit_2_l1_q16",
            type: QuestionType.trueFalse,
            prompt: "C dilinde dizi isimleri ifadeler içinde kullanıldığında dizinin ilk elemanının bellek adresine (pointer) dönüşür (decay).",
            explanation: "Doğrudur, 'arr' ifadesi '&arr[0]' adresi ile eşdeğerdir.",
            isTrue: true,
          ),
          Question(
            id: "c_unit_2_l1_q17",
            type: QuestionType.trueFalse,
            prompt: "Stack belleğinde oluşturulan yerel değişkenler fonksiyon sonlandığında da bellekte kalmaya devam eder ve serbest bırakılması için free() gerekir.",
            explanation: "Yanlıştır! Stack bellek fonksiyon bitiminde otomatik temizlenir; free() sadece heap (malloc) için geçerlidir.",
            isTrue: false,
          ),
          Question(
            id: "c_unit_2_l1_q18",
            type: QuestionType.matching,
            prompt: "C bellek kavramlarını doğru açıklamalarıyla eşleştirin.",
            explanation: "C'de bellek güvenliği doğrudan yazılımcının sorumluluğundadır.",
            matchingPairs: [MatchingPair(left: "malloc", right: "Heap üzerinde başlatılmamış bellek tahsisi"), MatchingPair(left: "free", right: "Dinamik belleği sisteme iade etme"), MatchingPair(left: "Valgrind", right: "Bellek sızıntılarını tespit eden analiz aracı")],
          ),
        ],
      ),
      Lesson(
        id: "c_unit_2_l2",
        title: "Kayan Noktalı Tipler: float vs double",
        description: "IEEE 754 standardı ve hassasiyet farkları",
        xpReward: 35,
        gemReward: 12,
        isUnitExam: false,
        questions: [
          Question(
            id: "c_unit_2_l2_q1",
            type: QuestionType.conceptCard,
            conceptTitle: "Kayan Noktalı Tipler: float vs double - Hap Bilgi",
            rule: "C dilinde işaretçiler (pointers) doğrudan bellek adreslerini saklar. '&' operatörü bir değişkenin adresini alırken, '*' (dereference) o adresteki veriye erişir veya değiştirir.",
            codeExample: r'''#include <stdio.h>
#include <stdlib.h>

int main() {
    int x = 100;
    int *ptr = &x;
    
    printf("x Degeri: %d\n", *ptr);
    printf("x Bellek Adresi: %p\n", (void*)ptr);
    return 0;
}''',
            devTip: "malloc ile tahsis edilen her bayt bellek için mutlaka bir free() çağrısı yapılmalıdır, aksi halde Memory Leak oluşur.",
            iconEmoji: "⚡",
          ),
          Question(
            id: "c_unit_2_l2_q2",
            type: QuestionType.multipleChoice,
            prompt: "Tahsis ettiği belleği otomatik olarak sıfırlarla (0 baytları) dolduran dinamik bellek fonksiyonu hangisidir?",
            codeSnippet: r'''int *p = ___(100, sizeof(int));''',
            options: ["calloc", "malloc", "realloc", "zalloc"],
            correctIndex: 0,
            explanation: "'calloc(num, size)' eleman sayısı ve eleman boyutu alır, ayrılan tüm bellek hücrelerini 0 ile başlatır.",
          ),
          Question(
            id: "c_unit_2_l2_q3",
            type: QuestionType.multipleChoice,
            prompt: "Daha önce ayrılmış dinamik bir bellek bloğunun boyutunu veri kaybı olmadan büyütmek veya küçültmek için ne kullanılır?",
            codeSnippet: r'''ptr = ___(ptr, new_size);''',
            options: ["realloc", "resize", "remalloc", "expand"],
            correctIndex: 0,
            explanation: "'realloc' mevcut bloğu genişletir veya yeni bir konuma taşıyarak eski veriyi kopyalar.",
          ),
          Question(
            id: "c_unit_2_l2_q4",
            type: QuestionType.multipleChoice,
            prompt: "C programlama dilinde GCC derleme sürecinin doğru sırası aşağıdakilerden hangisidir?",
            options: ["Preprocessor -> Compiler -> Assembler -> Linker", "Compiler -> Preprocessor -> Linker -> Assembler", "Assembler -> Compiler -> Linker -> Preprocessor", "Linker -> Assembler -> Compiler -> Preprocessor"],
            correctIndex: 0,
            explanation: "Önce makrolar ve headerlar çözülür (cpp), C kodu Assembly'ye derlenir (cc1), makine koduna çevrilir (as), kütüphaneler bağlanır (ld).",
          ),
          Question(
            id: "c_unit_2_l2_q5",
            type: QuestionType.multipleChoice,
            prompt: "64-bit modern bir mimaride standart bir işaretçi (pointer - int*, char*, void*) değişkeni bellekte kaç bayt yer kaplar?",
            codeSnippet: r'''printf("%zu", sizeof(int*));''',
            options: ["8 bayt", "4 bayt", "2 bayt", "16 bayt"],
            correctIndex: 0,
            explanation: "64-bit mimarilerde bellek adresleri 64 bit yani tam 8 bayttır. İşaretçinin tipi ne olursa olsun adres boyutu 8 bayttır.",
          ),
          Question(
            id: "c_unit_2_l2_q6",
            type: QuestionType.multipleChoice,
            prompt: "Bir struct içindeki bir işaretçi elemana erişirken '.' yerine hangi pratik operatör kullanılır?",
            codeSnippet: r'''struct User *u = getUser();
u___name = "Ahmet";''',
            options: ["-> (Ok operatörü)", ".", "::", "=>"],
            correctIndex: 0,
            explanation: "'u->name', '(*u).name' yazımının daha okunaklı ve standart kısayoludur.",
          ),
          Question(
            id: "c_unit_2_l2_q7",
            type: QuestionType.multipleChoice,
            prompt: "Herhangi bir veri tipine ait bellek adresini tutabilen jenerik (tip bağımsız) işaretçi tipi hangisidir?",
            codeSnippet: r'''___ generic_ptr = &x;''',
            options: ["void*", "any*", "object*", "generic*"],
            correctIndex: 0,
            explanation: "'void*' tipi belirsiz jenerik bir işaretçidir; doğrudan dereference edilemez, cast edilmesi gerekir.",
          ),
          Question(
            id: "c_unit_2_l2_q8",
            type: QuestionType.multipleChoice,
            prompt: "Serbest bırakılmış (free edilmiş) bir işaretçiyi kullanmaya devam etme hatasına ne ad verilir?",
            codeSnippet: r'''free(ptr);
printf("%d", *ptr); // HATA!''',
            options: ["Dangling Pointer (Askıda Kalan İşaretçi)", "Stack Overflow", "Memory Leak", "Deadlock"],
            correctIndex: 0,
            explanation: "free edildikten sonra hala o adresi göstermeye devam eden işaretçiye dangling pointer denir; 'ptr = NULL' yapılarak önlenir.",
          ),
          Question(
            id: "c_unit_2_l2_q9",
            type: QuestionType.multipleChoice,
            prompt: "C programlarında bellek sızıntılarını (memory leak) ve geçersiz bellek erişimlerini tespit etmek için en popüler Linux aracı hangisidir?",
            codeSnippet: r'''$ ___ --leak-check=full ./program''',
            options: ["valgrind", "gdb", "perf", "strace"],
            correctIndex: 0,
            explanation: "Valgrind (özellikle memcheck aracı) C/C++ programlarında bellek yönetim hatalarını ayrıntılı raporlar.",
          ),
          Question(
            id: "c_unit_2_l2_q10",
            type: QuestionType.multipleChoice,
            prompt: "Aşağıdaki bit düzeyinde (bitwise) operatörlerden hangisi bitleri 1 basamak sola kaydırarak 2 ile çarpmayı sağlar?",
            codeSnippet: r'''int x = 5;
int y = x ___ 1; // y = 10 olur''',
            options: ["<<", ">>", "&", "|"],
            correctIndex: 0,
            explanation: "Sola kaydırma (<< n) operatörü sayının değerini 2^n ile çarpar.",
          ),
          Question(
            id: "c_unit_2_l2_q11",
            type: QuestionType.multipleChoice,
            prompt: "C'de dosya açmak ve bir dosya işaretçisi (FILE*) elde etmek için hangi standart fonksiyon kullanılır?",
            codeSnippet: r'''FILE *f = ___("data.txt", "r");''',
            options: ["fopen", "open", "file_open", "create_file"],
            correctIndex: 0,
            explanation: "'fopen(dosya_adi, mod)' dosyayı belirtilen modda (r, w, a, rb, wb) açar.",
          ),
          Question(
            id: "c_unit_2_l2_q12",
            type: QuestionType.multipleChoice,
            prompt: "Bir header dosyasının birden fazla kez derlemeye dahil edilmesini (redefinition) önlemek için ne kullanılır?",
            codeSnippet: r'''#ifndef MY_HEADER_H
#define MY_HEADER_H
// ...
#endif''',
            options: ["Header Guards (#ifndef / #define)", "namespace", "pragma private", "module"],
            correctIndex: 0,
            explanation: "Header guards veya '#pragma once' başlık dosyalarının mükerrer include edilmesini engeller.",
          ),
          Question(
            id: "c_unit_2_l2_q13",
            type: QuestionType.fillInTheBlank,
            prompt: "Geçersiz veya henüz atanmamış bir işaretçiye güvenli başlangıç değeri olarak _____ atanmalıdır.",
            explanation: "İşaretçilere NULL atamak tanımsız belleğe erişimi ve segmentation fault hatalarını engellemeye yardımcı olur.",
            blankOptions: ["NULL", "0xFF", "void", "NaN"],
            correctBlankAnswer: "NULL",
          ),
          Question(
            id: "c_unit_2_l2_q14",
            type: QuestionType.fillInTheBlank,
            prompt: "Bir veri tipinin bellekte kaç bayt yer kapladığını öğrenmek için derleme zamanı operatörü olan _____ kullanılır.",
            explanation: "sizeof(tip) veya sizeof(degisken) bayt cinsinden bellek boyutunu size_t olarak döner.",
            blankOptions: ["sizeof", "lengthof", "bytesize", "countof"],
            correctBlankAnswer: "sizeof",
          ),
          Question(
            id: "c_unit_2_l2_q15",
            type: QuestionType.fillInTheBlank,
            prompt: "Açılmış bir dosya işaretçisini işletim sistemine geri iade etmek için _____ fonksiyonu çağrılır.",
            explanation: "fclose(FILE *stream) dosya tamponlarını diske yazar ve kaynakları kapatır.",
            blankOptions: ["fclose", "close", "file_exit", "dispose"],
            correctBlankAnswer: "fclose",
          ),
          Question(
            id: "c_unit_2_l2_q16",
            type: QuestionType.trueFalse,
            prompt: "C dilinde dizi isimleri ifadeler içinde kullanıldığında dizinin ilk elemanının bellek adresine (pointer) dönüşür (decay).",
            explanation: "Doğrudur, 'arr' ifadesi '&arr[0]' adresi ile eşdeğerdir.",
            isTrue: true,
          ),
          Question(
            id: "c_unit_2_l2_q17",
            type: QuestionType.trueFalse,
            prompt: "Stack belleğinde oluşturulan yerel değişkenler fonksiyon sonlandığında da bellekte kalmaya devam eder ve serbest bırakılması için free() gerekir.",
            explanation: "Yanlıştır! Stack bellek fonksiyon bitiminde otomatik temizlenir; free() sadece heap (malloc) için geçerlidir.",
            isTrue: false,
          ),
          Question(
            id: "c_unit_2_l2_q18",
            type: QuestionType.matching,
            prompt: "C bellek kavramlarını doğru açıklamalarıyla eşleştirin.",
            explanation: "C'de bellek güvenliği doğrudan yazılımcının sorumluluğundadır.",
            matchingPairs: [MatchingPair(left: "malloc", right: "Heap üzerinde başlatılmamış bellek tahsisi"), MatchingPair(left: "free", right: "Dinamik belleği sisteme iade etme"), MatchingPair(left: "Valgrind", right: "Bellek sızıntılarını tespit eden analiz aracı")],
          ),
        ],
      ),
      Lesson(
        id: "c_unit_2_l3",
        title: "sizeof Operatörü & 32/64-Bit Mimari Farkları",
        description: "Veri tiplerinin bellekteki bayt boyutları",
        xpReward: 35,
        gemReward: 12,
        isUnitExam: false,
        questions: [
          Question(
            id: "c_unit_2_l3_q1",
            type: QuestionType.conceptCard,
            conceptTitle: "sizeof Operatörü & 32/64-Bit Mimari Farkları - Hap Bilgi",
            rule: "C dilinde işaretçiler (pointers) doğrudan bellek adreslerini saklar. '&' operatörü bir değişkenin adresini alırken, '*' (dereference) o adresteki veriye erişir veya değiştirir.",
            codeExample: r'''#include <stdio.h>
#include <stdlib.h>

int main() {
    int x = 100;
    int *ptr = &x;
    
    printf("x Degeri: %d\n", *ptr);
    printf("x Bellek Adresi: %p\n", (void*)ptr);
    return 0;
}''',
            devTip: "malloc ile tahsis edilen her bayt bellek için mutlaka bir free() çağrısı yapılmalıdır, aksi halde Memory Leak oluşur.",
            iconEmoji: "⚡",
          ),
          Question(
            id: "c_unit_2_l3_q2",
            type: QuestionType.multipleChoice,
            prompt: "C programlama dilinde GCC derleme sürecinin doğru sırası aşağıdakilerden hangisidir?",
            options: ["Preprocessor -> Compiler -> Assembler -> Linker", "Compiler -> Preprocessor -> Linker -> Assembler", "Assembler -> Compiler -> Linker -> Preprocessor", "Linker -> Assembler -> Compiler -> Preprocessor"],
            correctIndex: 0,
            explanation: "Önce makrolar ve headerlar çözülür (cpp), C kodu Assembly'ye derlenir (cc1), makine koduna çevrilir (as), kütüphaneler bağlanır (ld).",
          ),
          Question(
            id: "c_unit_2_l3_q3",
            type: QuestionType.multipleChoice,
            prompt: "64-bit modern bir mimaride standart bir işaretçi (pointer - int*, char*, void*) değişkeni bellekte kaç bayt yer kaplar?",
            codeSnippet: r'''printf("%zu", sizeof(int*));''',
            options: ["8 bayt", "4 bayt", "2 bayt", "16 bayt"],
            correctIndex: 0,
            explanation: "64-bit mimarilerde bellek adresleri 64 bit yani tam 8 bayttır. İşaretçinin tipi ne olursa olsun adres boyutu 8 bayttır.",
          ),
          Question(
            id: "c_unit_2_l3_q4",
            type: QuestionType.multipleChoice,
            prompt: "Bir struct içindeki bir işaretçi elemana erişirken '.' yerine hangi pratik operatör kullanılır?",
            codeSnippet: r'''struct User *u = getUser();
u___name = "Ahmet";''',
            options: ["-> (Ok operatörü)", ".", "::", "=>"],
            correctIndex: 0,
            explanation: "'u->name', '(*u).name' yazımının daha okunaklı ve standart kısayoludur.",
          ),
          Question(
            id: "c_unit_2_l3_q5",
            type: QuestionType.multipleChoice,
            prompt: "Herhangi bir veri tipine ait bellek adresini tutabilen jenerik (tip bağımsız) işaretçi tipi hangisidir?",
            codeSnippet: r'''___ generic_ptr = &x;''',
            options: ["void*", "any*", "object*", "generic*"],
            correctIndex: 0,
            explanation: "'void*' tipi belirsiz jenerik bir işaretçidir; doğrudan dereference edilemez, cast edilmesi gerekir.",
          ),
          Question(
            id: "c_unit_2_l3_q6",
            type: QuestionType.multipleChoice,
            prompt: "Serbest bırakılmış (free edilmiş) bir işaretçiyi kullanmaya devam etme hatasına ne ad verilir?",
            codeSnippet: r'''free(ptr);
printf("%d", *ptr); // HATA!''',
            options: ["Dangling Pointer (Askıda Kalan İşaretçi)", "Stack Overflow", "Memory Leak", "Deadlock"],
            correctIndex: 0,
            explanation: "free edildikten sonra hala o adresi göstermeye devam eden işaretçiye dangling pointer denir; 'ptr = NULL' yapılarak önlenir.",
          ),
          Question(
            id: "c_unit_2_l3_q7",
            type: QuestionType.multipleChoice,
            prompt: "C programlarında bellek sızıntılarını (memory leak) ve geçersiz bellek erişimlerini tespit etmek için en popüler Linux aracı hangisidir?",
            codeSnippet: r'''$ ___ --leak-check=full ./program''',
            options: ["valgrind", "gdb", "perf", "strace"],
            correctIndex: 0,
            explanation: "Valgrind (özellikle memcheck aracı) C/C++ programlarında bellek yönetim hatalarını ayrıntılı raporlar.",
          ),
          Question(
            id: "c_unit_2_l3_q8",
            type: QuestionType.multipleChoice,
            prompt: "Aşağıdaki bit düzeyinde (bitwise) operatörlerden hangisi bitleri 1 basamak sola kaydırarak 2 ile çarpmayı sağlar?",
            codeSnippet: r'''int x = 5;
int y = x ___ 1; // y = 10 olur''',
            options: ["<<", ">>", "&", "|"],
            correctIndex: 0,
            explanation: "Sola kaydırma (<< n) operatörü sayının değerini 2^n ile çarpar.",
          ),
          Question(
            id: "c_unit_2_l3_q9",
            type: QuestionType.multipleChoice,
            prompt: "C'de dosya açmak ve bir dosya işaretçisi (FILE*) elde etmek için hangi standart fonksiyon kullanılır?",
            codeSnippet: r'''FILE *f = ___("data.txt", "r");''',
            options: ["fopen", "open", "file_open", "create_file"],
            correctIndex: 0,
            explanation: "'fopen(dosya_adi, mod)' dosyayı belirtilen modda (r, w, a, rb, wb) açar.",
          ),
          Question(
            id: "c_unit_2_l3_q10",
            type: QuestionType.multipleChoice,
            prompt: "Bir header dosyasının birden fazla kez derlemeye dahil edilmesini (redefinition) önlemek için ne kullanılır?",
            codeSnippet: r'''#ifndef MY_HEADER_H
#define MY_HEADER_H
// ...
#endif''',
            options: ["Header Guards (#ifndef / #define)", "namespace", "pragma private", "module"],
            correctIndex: 0,
            explanation: "Header guards veya '#pragma once' başlık dosyalarının mükerrer include edilmesini engeller.",
          ),
          Question(
            id: "c_unit_2_l3_q11",
            type: QuestionType.multipleChoice,
            prompt: "Tüm üyelerinin bellekte AYNI başlangıç adresini paylaştığı ve en büyük üyesi kadar yer kaplayan yapı hangisidir?",
            codeSnippet: r'''___ Data {
    int i;
    float f;
    char str[20];
};''',
            options: ["union", "struct", "class", "shared"],
            correctIndex: 0,
            explanation: "'union' içindeki tüm elemanlar aynı bellek alanını ortaklaşa kullanır; aynı anda sadece biri geçerli değer tutar.",
          ),
          Question(
            id: "c_unit_2_l3_q12",
            type: QuestionType.multipleChoice,
            prompt: "C dilinde bir değişkenin bellekteki adresini elde etmek için hangi operatör kullanılır?",
            codeSnippet: r'''int x = 10;
int *ptr = ___x;''',
            options: ["& (Address-of)", "* (Dereference)", "% (Mod)", "\$ (Value)"],
            correctIndex: 0,
            explanation: "'&' operatörü bir değişkenin RAM üzerindeki başlangıç adresini döner.",
          ),
          Question(
            id: "c_unit_2_l3_q13",
            type: QuestionType.fillInTheBlank,
            prompt: "Geçersiz veya henüz atanmamış bir işaretçiye güvenli başlangıç değeri olarak _____ atanmalıdır.",
            explanation: "İşaretçilere NULL atamak tanımsız belleğe erişimi ve segmentation fault hatalarını engellemeye yardımcı olur.",
            blankOptions: ["NULL", "0xFF", "void", "NaN"],
            correctBlankAnswer: "NULL",
          ),
          Question(
            id: "c_unit_2_l3_q14",
            type: QuestionType.fillInTheBlank,
            prompt: "Bir veri tipinin bellekte kaç bayt yer kapladığını öğrenmek için derleme zamanı operatörü olan _____ kullanılır.",
            explanation: "sizeof(tip) veya sizeof(degisken) bayt cinsinden bellek boyutunu size_t olarak döner.",
            blankOptions: ["sizeof", "lengthof", "bytesize", "countof"],
            correctBlankAnswer: "sizeof",
          ),
          Question(
            id: "c_unit_2_l3_q15",
            type: QuestionType.fillInTheBlank,
            prompt: "Açılmış bir dosya işaretçisini işletim sistemine geri iade etmek için _____ fonksiyonu çağrılır.",
            explanation: "fclose(FILE *stream) dosya tamponlarını diske yazar ve kaynakları kapatır.",
            blankOptions: ["fclose", "close", "file_exit", "dispose"],
            correctBlankAnswer: "fclose",
          ),
          Question(
            id: "c_unit_2_l3_q16",
            type: QuestionType.trueFalse,
            prompt: "C dilinde dizi isimleri ifadeler içinde kullanıldığında dizinin ilk elemanının bellek adresine (pointer) dönüşür (decay).",
            explanation: "Doğrudur, 'arr' ifadesi '&arr[0]' adresi ile eşdeğerdir.",
            isTrue: true,
          ),
          Question(
            id: "c_unit_2_l3_q17",
            type: QuestionType.trueFalse,
            prompt: "Stack belleğinde oluşturulan yerel değişkenler fonksiyon sonlandığında da bellekte kalmaya devam eder ve serbest bırakılması için free() gerekir.",
            explanation: "Yanlıştır! Stack bellek fonksiyon bitiminde otomatik temizlenir; free() sadece heap (malloc) için geçerlidir.",
            isTrue: false,
          ),
          Question(
            id: "c_unit_2_l3_q18",
            type: QuestionType.matching,
            prompt: "C bellek kavramlarını doğru açıklamalarıyla eşleştirin.",
            explanation: "C'de bellek güvenliği doğrudan yazılımcının sorumluluğundadır.",
            matchingPairs: [MatchingPair(left: "malloc", right: "Heap üzerinde başlatılmamış bellek tahsisi"), MatchingPair(left: "free", right: "Dinamik belleği sisteme iade etme"), MatchingPair(left: "Valgrind", right: "Bellek sızıntılarını tespit eden analiz aracı")],
          ),
        ],
      ),
      Lesson(
        id: "c_unit_2_l4",
        title: "Formatlı Çıktı: printf() Format Belirteçleri",
        description: "%d, %f, %s, %p, %x formatları ve hizalama",
        xpReward: 35,
        gemReward: 12,
        isUnitExam: false,
        questions: [
          Question(
            id: "c_unit_2_l4_q1",
            type: QuestionType.conceptCard,
            conceptTitle: "Formatlı Çıktı: printf() Format Belirteçleri - Hap Bilgi",
            rule: "C dilinde işaretçiler (pointers) doğrudan bellek adreslerini saklar. '&' operatörü bir değişkenin adresini alırken, '*' (dereference) o adresteki veriye erişir veya değiştirir.",
            codeExample: r'''#include <stdio.h>
#include <stdlib.h>

int main() {
    int x = 100;
    int *ptr = &x;
    
    printf("x Degeri: %d\n", *ptr);
    printf("x Bellek Adresi: %p\n", (void*)ptr);
    return 0;
}''',
            devTip: "malloc ile tahsis edilen her bayt bellek için mutlaka bir free() çağrısı yapılmalıdır, aksi halde Memory Leak oluşur.",
            iconEmoji: "⚡",
          ),
          Question(
            id: "c_unit_2_l4_q2",
            type: QuestionType.multipleChoice,
            prompt: "Bir struct içindeki bir işaretçi elemana erişirken '.' yerine hangi pratik operatör kullanılır?",
            codeSnippet: r'''struct User *u = getUser();
u___name = "Ahmet";''',
            options: ["-> (Ok operatörü)", ".", "::", "=>"],
            correctIndex: 0,
            explanation: "'u->name', '(*u).name' yazımının daha okunaklı ve standart kısayoludur.",
          ),
          Question(
            id: "c_unit_2_l4_q3",
            type: QuestionType.multipleChoice,
            prompt: "Herhangi bir veri tipine ait bellek adresini tutabilen jenerik (tip bağımsız) işaretçi tipi hangisidir?",
            codeSnippet: r'''___ generic_ptr = &x;''',
            options: ["void*", "any*", "object*", "generic*"],
            correctIndex: 0,
            explanation: "'void*' tipi belirsiz jenerik bir işaretçidir; doğrudan dereference edilemez, cast edilmesi gerekir.",
          ),
          Question(
            id: "c_unit_2_l4_q4",
            type: QuestionType.multipleChoice,
            prompt: "Serbest bırakılmış (free edilmiş) bir işaretçiyi kullanmaya devam etme hatasına ne ad verilir?",
            codeSnippet: r'''free(ptr);
printf("%d", *ptr); // HATA!''',
            options: ["Dangling Pointer (Askıda Kalan İşaretçi)", "Stack Overflow", "Memory Leak", "Deadlock"],
            correctIndex: 0,
            explanation: "free edildikten sonra hala o adresi göstermeye devam eden işaretçiye dangling pointer denir; 'ptr = NULL' yapılarak önlenir.",
          ),
          Question(
            id: "c_unit_2_l4_q5",
            type: QuestionType.multipleChoice,
            prompt: "C programlarında bellek sızıntılarını (memory leak) ve geçersiz bellek erişimlerini tespit etmek için en popüler Linux aracı hangisidir?",
            codeSnippet: r'''$ ___ --leak-check=full ./program''',
            options: ["valgrind", "gdb", "perf", "strace"],
            correctIndex: 0,
            explanation: "Valgrind (özellikle memcheck aracı) C/C++ programlarında bellek yönetim hatalarını ayrıntılı raporlar.",
          ),
          Question(
            id: "c_unit_2_l4_q6",
            type: QuestionType.multipleChoice,
            prompt: "Aşağıdaki bit düzeyinde (bitwise) operatörlerden hangisi bitleri 1 basamak sola kaydırarak 2 ile çarpmayı sağlar?",
            codeSnippet: r'''int x = 5;
int y = x ___ 1; // y = 10 olur''',
            options: ["<<", ">>", "&", "|"],
            correctIndex: 0,
            explanation: "Sola kaydırma (<< n) operatörü sayının değerini 2^n ile çarpar.",
          ),
          Question(
            id: "c_unit_2_l4_q7",
            type: QuestionType.multipleChoice,
            prompt: "C'de dosya açmak ve bir dosya işaretçisi (FILE*) elde etmek için hangi standart fonksiyon kullanılır?",
            codeSnippet: r'''FILE *f = ___("data.txt", "r");''',
            options: ["fopen", "open", "file_open", "create_file"],
            correctIndex: 0,
            explanation: "'fopen(dosya_adi, mod)' dosyayı belirtilen modda (r, w, a, rb, wb) açar.",
          ),
          Question(
            id: "c_unit_2_l4_q8",
            type: QuestionType.multipleChoice,
            prompt: "Bir header dosyasının birden fazla kez derlemeye dahil edilmesini (redefinition) önlemek için ne kullanılır?",
            codeSnippet: r'''#ifndef MY_HEADER_H
#define MY_HEADER_H
// ...
#endif''',
            options: ["Header Guards (#ifndef / #define)", "namespace", "pragma private", "module"],
            correctIndex: 0,
            explanation: "Header guards veya '#pragma once' başlık dosyalarının mükerrer include edilmesini engeller.",
          ),
          Question(
            id: "c_unit_2_l4_q9",
            type: QuestionType.multipleChoice,
            prompt: "Tüm üyelerinin bellekte AYNI başlangıç adresini paylaştığı ve en büyük üyesi kadar yer kaplayan yapı hangisidir?",
            codeSnippet: r'''___ Data {
    int i;
    float f;
    char str[20];
};''',
            options: ["union", "struct", "class", "shared"],
            correctIndex: 0,
            explanation: "'union' içindeki tüm elemanlar aynı bellek alanını ortaklaşa kullanır; aynı anda sadece biri geçerli değer tutar.",
          ),
          Question(
            id: "c_unit_2_l4_q10",
            type: QuestionType.multipleChoice,
            prompt: "C dilinde bir değişkenin bellekteki adresini elde etmek için hangi operatör kullanılır?",
            codeSnippet: r'''int x = 10;
int *ptr = ___x;''',
            options: ["& (Address-of)", "* (Dereference)", "% (Mod)", "\$ (Value)"],
            correctIndex: 0,
            explanation: "'&' operatörü bir değişkenin RAM üzerindeki başlangıç adresini döner.",
          ),
          Question(
            id: "c_unit_2_l4_q11",
            type: QuestionType.multipleChoice,
            prompt: "Bir işaretçinin (pointer) işaret ettiği bellek adresindeki veriye erişmek veya onu değiştirmek için hangi işlem yapılır?",
            codeSnippet: r'''int x = 5;
int *p = &x;
___p = 20; // x artik 20 olur''',
            options: ["* (Dereference)", "&", "->", "."],
            correctIndex: 0,
            explanation: "'*p' dereferencing yaparak işaretçinin tuttuğu adresteki asıl değere erişir.",
          ),
          Question(
            id: "c_unit_2_l4_q12",
            type: QuestionType.multipleChoice,
            prompt: "Heap bellekte dinamik olarak bayt cinsinden bellek tahsis etmek için hangi standart kütüphane fonksiyonu kullanılır?",
            codeSnippet: r'''int *arr = (int*)___(10 * sizeof(int));''',
            options: ["malloc", "alloc", "new", "heap_get"],
            correctIndex: 0,
            explanation: "'malloc(size_t size)' heap bölgesinde istenen bayt kadar bellek ayırır ve void* işaretçi döner.",
          ),
          Question(
            id: "c_unit_2_l4_q13",
            type: QuestionType.fillInTheBlank,
            prompt: "Geçersiz veya henüz atanmamış bir işaretçiye güvenli başlangıç değeri olarak _____ atanmalıdır.",
            explanation: "İşaretçilere NULL atamak tanımsız belleğe erişimi ve segmentation fault hatalarını engellemeye yardımcı olur.",
            blankOptions: ["NULL", "0xFF", "void", "NaN"],
            correctBlankAnswer: "NULL",
          ),
          Question(
            id: "c_unit_2_l4_q14",
            type: QuestionType.fillInTheBlank,
            prompt: "Bir veri tipinin bellekte kaç bayt yer kapladığını öğrenmek için derleme zamanı operatörü olan _____ kullanılır.",
            explanation: "sizeof(tip) veya sizeof(degisken) bayt cinsinden bellek boyutunu size_t olarak döner.",
            blankOptions: ["sizeof", "lengthof", "bytesize", "countof"],
            correctBlankAnswer: "sizeof",
          ),
          Question(
            id: "c_unit_2_l4_q15",
            type: QuestionType.fillInTheBlank,
            prompt: "Açılmış bir dosya işaretçisini işletim sistemine geri iade etmek için _____ fonksiyonu çağrılır.",
            explanation: "fclose(FILE *stream) dosya tamponlarını diske yazar ve kaynakları kapatır.",
            blankOptions: ["fclose", "close", "file_exit", "dispose"],
            correctBlankAnswer: "fclose",
          ),
          Question(
            id: "c_unit_2_l4_q16",
            type: QuestionType.trueFalse,
            prompt: "C dilinde dizi isimleri ifadeler içinde kullanıldığında dizinin ilk elemanının bellek adresine (pointer) dönüşür (decay).",
            explanation: "Doğrudur, 'arr' ifadesi '&arr[0]' adresi ile eşdeğerdir.",
            isTrue: true,
          ),
          Question(
            id: "c_unit_2_l4_q17",
            type: QuestionType.trueFalse,
            prompt: "Stack belleğinde oluşturulan yerel değişkenler fonksiyon sonlandığında da bellekte kalmaya devam eder ve serbest bırakılması için free() gerekir.",
            explanation: "Yanlıştır! Stack bellek fonksiyon bitiminde otomatik temizlenir; free() sadece heap (malloc) için geçerlidir.",
            isTrue: false,
          ),
          Question(
            id: "c_unit_2_l4_q18",
            type: QuestionType.matching,
            prompt: "C bellek kavramlarını doğru açıklamalarıyla eşleştirin.",
            explanation: "C'de bellek güvenliği doğrudan yazılımcının sorumluluğundadır.",
            matchingPairs: [MatchingPair(left: "malloc", right: "Heap üzerinde başlatılmamış bellek tahsisi"), MatchingPair(left: "free", right: "Dinamik belleği sisteme iade etme"), MatchingPair(left: "Valgrind", right: "Bellek sızıntılarını tespit eden analiz aracı")],
          ),
        ],
      ),
      Lesson(
        id: "c_unit_2_l5",
        title: "Formatlı Girdi: scanf() & Adres Geçişi (&)",
        description: "Kullanıcıdan veri alma ve tampon tuzakları",
        xpReward: 35,
        gemReward: 12,
        isUnitExam: false,
        questions: [
          Question(
            id: "c_unit_2_l5_q1",
            type: QuestionType.conceptCard,
            conceptTitle: "Formatlı Girdi: scanf() & Adres Geçişi (&) - Hap Bilgi",
            rule: "C dilinde işaretçiler (pointers) doğrudan bellek adreslerini saklar. '&' operatörü bir değişkenin adresini alırken, '*' (dereference) o adresteki veriye erişir veya değiştirir.",
            codeExample: r'''#include <stdio.h>
#include <stdlib.h>

int main() {
    int x = 100;
    int *ptr = &x;
    
    printf("x Degeri: %d\n", *ptr);
    printf("x Bellek Adresi: %p\n", (void*)ptr);
    return 0;
}''',
            devTip: "malloc ile tahsis edilen her bayt bellek için mutlaka bir free() çağrısı yapılmalıdır, aksi halde Memory Leak oluşur.",
            iconEmoji: "⚡",
          ),
          Question(
            id: "c_unit_2_l5_q2",
            type: QuestionType.multipleChoice,
            prompt: "Serbest bırakılmış (free edilmiş) bir işaretçiyi kullanmaya devam etme hatasına ne ad verilir?",
            codeSnippet: r'''free(ptr);
printf("%d", *ptr); // HATA!''',
            options: ["Dangling Pointer (Askıda Kalan İşaretçi)", "Stack Overflow", "Memory Leak", "Deadlock"],
            correctIndex: 0,
            explanation: "free edildikten sonra hala o adresi göstermeye devam eden işaretçiye dangling pointer denir; 'ptr = NULL' yapılarak önlenir.",
          ),
          Question(
            id: "c_unit_2_l5_q3",
            type: QuestionType.multipleChoice,
            prompt: "C programlarında bellek sızıntılarını (memory leak) ve geçersiz bellek erişimlerini tespit etmek için en popüler Linux aracı hangisidir?",
            codeSnippet: r'''$ ___ --leak-check=full ./program''',
            options: ["valgrind", "gdb", "perf", "strace"],
            correctIndex: 0,
            explanation: "Valgrind (özellikle memcheck aracı) C/C++ programlarında bellek yönetim hatalarını ayrıntılı raporlar.",
          ),
          Question(
            id: "c_unit_2_l5_q4",
            type: QuestionType.multipleChoice,
            prompt: "Aşağıdaki bit düzeyinde (bitwise) operatörlerden hangisi bitleri 1 basamak sola kaydırarak 2 ile çarpmayı sağlar?",
            codeSnippet: r'''int x = 5;
int y = x ___ 1; // y = 10 olur''',
            options: ["<<", ">>", "&", "|"],
            correctIndex: 0,
            explanation: "Sola kaydırma (<< n) operatörü sayının değerini 2^n ile çarpar.",
          ),
          Question(
            id: "c_unit_2_l5_q5",
            type: QuestionType.multipleChoice,
            prompt: "C'de dosya açmak ve bir dosya işaretçisi (FILE*) elde etmek için hangi standart fonksiyon kullanılır?",
            codeSnippet: r'''FILE *f = ___("data.txt", "r");''',
            options: ["fopen", "open", "file_open", "create_file"],
            correctIndex: 0,
            explanation: "'fopen(dosya_adi, mod)' dosyayı belirtilen modda (r, w, a, rb, wb) açar.",
          ),
          Question(
            id: "c_unit_2_l5_q6",
            type: QuestionType.multipleChoice,
            prompt: "Bir header dosyasının birden fazla kez derlemeye dahil edilmesini (redefinition) önlemek için ne kullanılır?",
            codeSnippet: r'''#ifndef MY_HEADER_H
#define MY_HEADER_H
// ...
#endif''',
            options: ["Header Guards (#ifndef / #define)", "namespace", "pragma private", "module"],
            correctIndex: 0,
            explanation: "Header guards veya '#pragma once' başlık dosyalarının mükerrer include edilmesini engeller.",
          ),
          Question(
            id: "c_unit_2_l5_q7",
            type: QuestionType.multipleChoice,
            prompt: "Tüm üyelerinin bellekte AYNI başlangıç adresini paylaştığı ve en büyük üyesi kadar yer kaplayan yapı hangisidir?",
            codeSnippet: r'''___ Data {
    int i;
    float f;
    char str[20];
};''',
            options: ["union", "struct", "class", "shared"],
            correctIndex: 0,
            explanation: "'union' içindeki tüm elemanlar aynı bellek alanını ortaklaşa kullanır; aynı anda sadece biri geçerli değer tutar.",
          ),
          Question(
            id: "c_unit_2_l5_q8",
            type: QuestionType.multipleChoice,
            prompt: "C dilinde bir değişkenin bellekteki adresini elde etmek için hangi operatör kullanılır?",
            codeSnippet: r'''int x = 10;
int *ptr = ___x;''',
            options: ["& (Address-of)", "* (Dereference)", "% (Mod)", "\$ (Value)"],
            correctIndex: 0,
            explanation: "'&' operatörü bir değişkenin RAM üzerindeki başlangıç adresini döner.",
          ),
          Question(
            id: "c_unit_2_l5_q9",
            type: QuestionType.multipleChoice,
            prompt: "Bir işaretçinin (pointer) işaret ettiği bellek adresindeki veriye erişmek veya onu değiştirmek için hangi işlem yapılır?",
            codeSnippet: r'''int x = 5;
int *p = &x;
___p = 20; // x artik 20 olur''',
            options: ["* (Dereference)", "&", "->", "."],
            correctIndex: 0,
            explanation: "'*p' dereferencing yaparak işaretçinin tuttuğu adresteki asıl değere erişir.",
          ),
          Question(
            id: "c_unit_2_l5_q10",
            type: QuestionType.multipleChoice,
            prompt: "Heap bellekte dinamik olarak bayt cinsinden bellek tahsis etmek için hangi standart kütüphane fonksiyonu kullanılır?",
            codeSnippet: r'''int *arr = (int*)___(10 * sizeof(int));''',
            options: ["malloc", "alloc", "new", "heap_get"],
            correctIndex: 0,
            explanation: "'malloc(size_t size)' heap bölgesinde istenen bayt kadar bellek ayırır ve void* işaretçi döner.",
          ),
          Question(
            id: "c_unit_2_l5_q11",
            type: QuestionType.multipleChoice,
            prompt: "malloc veya calloc ile tahsis edilen dinamik belleğin sisteme iade edilmesi için hangi fonksiyon çağrılmalıdır?",
            codeSnippet: r'''int *buf = malloc(1024);
// ... kullanim ...
___(buf);''',
            options: ["free", "delete", "release", "dispose"],
            correctIndex: 0,
            explanation: "'free(ptr)' heap bellekte ayrılan alanı serbest bırakır. Çağrılmazsa 'Memory Leak' oluşur.",
          ),
          Question(
            id: "c_unit_2_l5_q12",
            type: QuestionType.multipleChoice,
            prompt: "Tahsis ettiği belleği otomatik olarak sıfırlarla (0 baytları) dolduran dinamik bellek fonksiyonu hangisidir?",
            codeSnippet: r'''int *p = ___(100, sizeof(int));''',
            options: ["calloc", "malloc", "realloc", "zalloc"],
            correctIndex: 0,
            explanation: "'calloc(num, size)' eleman sayısı ve eleman boyutu alır, ayrılan tüm bellek hücrelerini 0 ile başlatır.",
          ),
          Question(
            id: "c_unit_2_l5_q13",
            type: QuestionType.fillInTheBlank,
            prompt: "Geçersiz veya henüz atanmamış bir işaretçiye güvenli başlangıç değeri olarak _____ atanmalıdır.",
            explanation: "İşaretçilere NULL atamak tanımsız belleğe erişimi ve segmentation fault hatalarını engellemeye yardımcı olur.",
            blankOptions: ["NULL", "0xFF", "void", "NaN"],
            correctBlankAnswer: "NULL",
          ),
          Question(
            id: "c_unit_2_l5_q14",
            type: QuestionType.fillInTheBlank,
            prompt: "Bir veri tipinin bellekte kaç bayt yer kapladığını öğrenmek için derleme zamanı operatörü olan _____ kullanılır.",
            explanation: "sizeof(tip) veya sizeof(degisken) bayt cinsinden bellek boyutunu size_t olarak döner.",
            blankOptions: ["sizeof", "lengthof", "bytesize", "countof"],
            correctBlankAnswer: "sizeof",
          ),
          Question(
            id: "c_unit_2_l5_q15",
            type: QuestionType.fillInTheBlank,
            prompt: "Açılmış bir dosya işaretçisini işletim sistemine geri iade etmek için _____ fonksiyonu çağrılır.",
            explanation: "fclose(FILE *stream) dosya tamponlarını diske yazar ve kaynakları kapatır.",
            blankOptions: ["fclose", "close", "file_exit", "dispose"],
            correctBlankAnswer: "fclose",
          ),
          Question(
            id: "c_unit_2_l5_q16",
            type: QuestionType.trueFalse,
            prompt: "C dilinde dizi isimleri ifadeler içinde kullanıldığında dizinin ilk elemanının bellek adresine (pointer) dönüşür (decay).",
            explanation: "Doğrudur, 'arr' ifadesi '&arr[0]' adresi ile eşdeğerdir.",
            isTrue: true,
          ),
          Question(
            id: "c_unit_2_l5_q17",
            type: QuestionType.trueFalse,
            prompt: "Stack belleğinde oluşturulan yerel değişkenler fonksiyon sonlandığında da bellekte kalmaya devam eder ve serbest bırakılması için free() gerekir.",
            explanation: "Yanlıştır! Stack bellek fonksiyon bitiminde otomatik temizlenir; free() sadece heap (malloc) için geçerlidir.",
            isTrue: false,
          ),
          Question(
            id: "c_unit_2_l5_q18",
            type: QuestionType.matching,
            prompt: "C bellek kavramlarını doğru açıklamalarıyla eşleştirin.",
            explanation: "C'de bellek güvenliği doğrudan yazılımcının sorumluluğundadır.",
            matchingPairs: [MatchingPair(left: "malloc", right: "Heap üzerinde başlatılmamış bellek tahsisi"), MatchingPair(left: "free", right: "Dinamik belleği sisteme iade etme"), MatchingPair(left: "Valgrind", right: "Bellek sızıntılarını tespit eden analiz aracı")],
          ),
        ],
      ),
      Lesson(
        id: "c_unit_2_l6",
        title: "Aritmetik, Karşılaştırma & Mantık Operatörleri",
        description: "Tamsayı bölmesi ve mod operatörü",
        xpReward: 35,
        gemReward: 12,
        isUnitExam: false,
        questions: [
          Question(
            id: "c_unit_2_l6_q1",
            type: QuestionType.conceptCard,
            conceptTitle: "Aritmetik, Karşılaştırma & Mantık Operatörleri - Hap Bilgi",
            rule: "C dilinde işaretçiler (pointers) doğrudan bellek adreslerini saklar. '&' operatörü bir değişkenin adresini alırken, '*' (dereference) o adresteki veriye erişir veya değiştirir.",
            codeExample: r'''#include <stdio.h>
#include <stdlib.h>

int main() {
    int x = 100;
    int *ptr = &x;
    
    printf("x Degeri: %d\n", *ptr);
    printf("x Bellek Adresi: %p\n", (void*)ptr);
    return 0;
}''',
            devTip: "malloc ile tahsis edilen her bayt bellek için mutlaka bir free() çağrısı yapılmalıdır, aksi halde Memory Leak oluşur.",
            iconEmoji: "⚡",
          ),
          Question(
            id: "c_unit_2_l6_q2",
            type: QuestionType.multipleChoice,
            prompt: "Aşağıdaki bit düzeyinde (bitwise) operatörlerden hangisi bitleri 1 basamak sola kaydırarak 2 ile çarpmayı sağlar?",
            codeSnippet: r'''int x = 5;
int y = x ___ 1; // y = 10 olur''',
            options: ["<<", ">>", "&", "|"],
            correctIndex: 0,
            explanation: "Sola kaydırma (<< n) operatörü sayının değerini 2^n ile çarpar.",
          ),
          Question(
            id: "c_unit_2_l6_q3",
            type: QuestionType.multipleChoice,
            prompt: "C'de dosya açmak ve bir dosya işaretçisi (FILE*) elde etmek için hangi standart fonksiyon kullanılır?",
            codeSnippet: r'''FILE *f = ___("data.txt", "r");''',
            options: ["fopen", "open", "file_open", "create_file"],
            correctIndex: 0,
            explanation: "'fopen(dosya_adi, mod)' dosyayı belirtilen modda (r, w, a, rb, wb) açar.",
          ),
          Question(
            id: "c_unit_2_l6_q4",
            type: QuestionType.multipleChoice,
            prompt: "Bir header dosyasının birden fazla kez derlemeye dahil edilmesini (redefinition) önlemek için ne kullanılır?",
            codeSnippet: r'''#ifndef MY_HEADER_H
#define MY_HEADER_H
// ...
#endif''',
            options: ["Header Guards (#ifndef / #define)", "namespace", "pragma private", "module"],
            correctIndex: 0,
            explanation: "Header guards veya '#pragma once' başlık dosyalarının mükerrer include edilmesini engeller.",
          ),
          Question(
            id: "c_unit_2_l6_q5",
            type: QuestionType.multipleChoice,
            prompt: "Tüm üyelerinin bellekte AYNI başlangıç adresini paylaştığı ve en büyük üyesi kadar yer kaplayan yapı hangisidir?",
            codeSnippet: r'''___ Data {
    int i;
    float f;
    char str[20];
};''',
            options: ["union", "struct", "class", "shared"],
            correctIndex: 0,
            explanation: "'union' içindeki tüm elemanlar aynı bellek alanını ortaklaşa kullanır; aynı anda sadece biri geçerli değer tutar.",
          ),
          Question(
            id: "c_unit_2_l6_q6",
            type: QuestionType.multipleChoice,
            prompt: "C dilinde bir değişkenin bellekteki adresini elde etmek için hangi operatör kullanılır?",
            codeSnippet: r'''int x = 10;
int *ptr = ___x;''',
            options: ["& (Address-of)", "* (Dereference)", "% (Mod)", "\$ (Value)"],
            correctIndex: 0,
            explanation: "'&' operatörü bir değişkenin RAM üzerindeki başlangıç adresini döner.",
          ),
          Question(
            id: "c_unit_2_l6_q7",
            type: QuestionType.multipleChoice,
            prompt: "Bir işaretçinin (pointer) işaret ettiği bellek adresindeki veriye erişmek veya onu değiştirmek için hangi işlem yapılır?",
            codeSnippet: r'''int x = 5;
int *p = &x;
___p = 20; // x artik 20 olur''',
            options: ["* (Dereference)", "&", "->", "."],
            correctIndex: 0,
            explanation: "'*p' dereferencing yaparak işaretçinin tuttuğu adresteki asıl değere erişir.",
          ),
          Question(
            id: "c_unit_2_l6_q8",
            type: QuestionType.multipleChoice,
            prompt: "Heap bellekte dinamik olarak bayt cinsinden bellek tahsis etmek için hangi standart kütüphane fonksiyonu kullanılır?",
            codeSnippet: r'''int *arr = (int*)___(10 * sizeof(int));''',
            options: ["malloc", "alloc", "new", "heap_get"],
            correctIndex: 0,
            explanation: "'malloc(size_t size)' heap bölgesinde istenen bayt kadar bellek ayırır ve void* işaretçi döner.",
          ),
          Question(
            id: "c_unit_2_l6_q9",
            type: QuestionType.multipleChoice,
            prompt: "malloc veya calloc ile tahsis edilen dinamik belleğin sisteme iade edilmesi için hangi fonksiyon çağrılmalıdır?",
            codeSnippet: r'''int *buf = malloc(1024);
// ... kullanim ...
___(buf);''',
            options: ["free", "delete", "release", "dispose"],
            correctIndex: 0,
            explanation: "'free(ptr)' heap bellekte ayrılan alanı serbest bırakır. Çağrılmazsa 'Memory Leak' oluşur.",
          ),
          Question(
            id: "c_unit_2_l6_q10",
            type: QuestionType.multipleChoice,
            prompt: "Tahsis ettiği belleği otomatik olarak sıfırlarla (0 baytları) dolduran dinamik bellek fonksiyonu hangisidir?",
            codeSnippet: r'''int *p = ___(100, sizeof(int));''',
            options: ["calloc", "malloc", "realloc", "zalloc"],
            correctIndex: 0,
            explanation: "'calloc(num, size)' eleman sayısı ve eleman boyutu alır, ayrılan tüm bellek hücrelerini 0 ile başlatır.",
          ),
          Question(
            id: "c_unit_2_l6_q11",
            type: QuestionType.multipleChoice,
            prompt: "Daha önce ayrılmış dinamik bir bellek bloğunun boyutunu veri kaybı olmadan büyütmek veya küçültmek için ne kullanılır?",
            codeSnippet: r'''ptr = ___(ptr, new_size);''',
            options: ["realloc", "resize", "remalloc", "expand"],
            correctIndex: 0,
            explanation: "'realloc' mevcut bloğu genişletir veya yeni bir konuma taşıyarak eski veriyi kopyalar.",
          ),
          Question(
            id: "c_unit_2_l6_q12",
            type: QuestionType.multipleChoice,
            prompt: "C programlama dilinde GCC derleme sürecinin doğru sırası aşağıdakilerden hangisidir?",
            options: ["Preprocessor -> Compiler -> Assembler -> Linker", "Compiler -> Preprocessor -> Linker -> Assembler", "Assembler -> Compiler -> Linker -> Preprocessor", "Linker -> Assembler -> Compiler -> Preprocessor"],
            correctIndex: 0,
            explanation: "Önce makrolar ve headerlar çözülür (cpp), C kodu Assembly'ye derlenir (cc1), makine koduna çevrilir (as), kütüphaneler bağlanır (ld).",
          ),
          Question(
            id: "c_unit_2_l6_q13",
            type: QuestionType.fillInTheBlank,
            prompt: "Geçersiz veya henüz atanmamış bir işaretçiye güvenli başlangıç değeri olarak _____ atanmalıdır.",
            explanation: "İşaretçilere NULL atamak tanımsız belleğe erişimi ve segmentation fault hatalarını engellemeye yardımcı olur.",
            blankOptions: ["NULL", "0xFF", "void", "NaN"],
            correctBlankAnswer: "NULL",
          ),
          Question(
            id: "c_unit_2_l6_q14",
            type: QuestionType.fillInTheBlank,
            prompt: "Bir veri tipinin bellekte kaç bayt yer kapladığını öğrenmek için derleme zamanı operatörü olan _____ kullanılır.",
            explanation: "sizeof(tip) veya sizeof(degisken) bayt cinsinden bellek boyutunu size_t olarak döner.",
            blankOptions: ["sizeof", "lengthof", "bytesize", "countof"],
            correctBlankAnswer: "sizeof",
          ),
          Question(
            id: "c_unit_2_l6_q15",
            type: QuestionType.fillInTheBlank,
            prompt: "Açılmış bir dosya işaretçisini işletim sistemine geri iade etmek için _____ fonksiyonu çağrılır.",
            explanation: "fclose(FILE *stream) dosya tamponlarını diske yazar ve kaynakları kapatır.",
            blankOptions: ["fclose", "close", "file_exit", "dispose"],
            correctBlankAnswer: "fclose",
          ),
          Question(
            id: "c_unit_2_l6_q16",
            type: QuestionType.trueFalse,
            prompt: "C dilinde dizi isimleri ifadeler içinde kullanıldığında dizinin ilk elemanının bellek adresine (pointer) dönüşür (decay).",
            explanation: "Doğrudur, 'arr' ifadesi '&arr[0]' adresi ile eşdeğerdir.",
            isTrue: true,
          ),
          Question(
            id: "c_unit_2_l6_q17",
            type: QuestionType.trueFalse,
            prompt: "Stack belleğinde oluşturulan yerel değişkenler fonksiyon sonlandığında da bellekte kalmaya devam eder ve serbest bırakılması için free() gerekir.",
            explanation: "Yanlıştır! Stack bellek fonksiyon bitiminde otomatik temizlenir; free() sadece heap (malloc) için geçerlidir.",
            isTrue: false,
          ),
          Question(
            id: "c_unit_2_l6_q18",
            type: QuestionType.matching,
            prompt: "C bellek kavramlarını doğru açıklamalarıyla eşleştirin.",
            explanation: "C'de bellek güvenliği doğrudan yazılımcının sorumluluğundadır.",
            matchingPairs: [MatchingPair(left: "malloc", right: "Heap üzerinde başlatılmamış bellek tahsisi"), MatchingPair(left: "free", right: "Dinamik belleği sisteme iade etme"), MatchingPair(left: "Valgrind", right: "Bellek sızıntılarını tespit eden analiz aracı")],
          ),
        ],
      ),
      Lesson(
        id: "c_unit_2_l7",
        title: "Açık ve Örtük Tür Dönüşümleri (Type Casting)",
        description: "Hassasiyet kaybı ve (type) casting kuralları",
        xpReward: 35,
        gemReward: 12,
        isUnitExam: false,
        questions: [
          Question(
            id: "c_unit_2_l7_q1",
            type: QuestionType.conceptCard,
            conceptTitle: "Açık ve Örtük Tür Dönüşümleri (Type Casting) - Hap Bilgi",
            rule: "C dilinde işaretçiler (pointers) doğrudan bellek adreslerini saklar. '&' operatörü bir değişkenin adresini alırken, '*' (dereference) o adresteki veriye erişir veya değiştirir.",
            codeExample: r'''#include <stdio.h>
#include <stdlib.h>

int main() {
    int x = 100;
    int *ptr = &x;
    
    printf("x Degeri: %d\n", *ptr);
    printf("x Bellek Adresi: %p\n", (void*)ptr);
    return 0;
}''',
            devTip: "malloc ile tahsis edilen her bayt bellek için mutlaka bir free() çağrısı yapılmalıdır, aksi halde Memory Leak oluşur.",
            iconEmoji: "⚡",
          ),
          Question(
            id: "c_unit_2_l7_q2",
            type: QuestionType.multipleChoice,
            prompt: "Bir header dosyasının birden fazla kez derlemeye dahil edilmesini (redefinition) önlemek için ne kullanılır?",
            codeSnippet: r'''#ifndef MY_HEADER_H
#define MY_HEADER_H
// ...
#endif''',
            options: ["Header Guards (#ifndef / #define)", "namespace", "pragma private", "module"],
            correctIndex: 0,
            explanation: "Header guards veya '#pragma once' başlık dosyalarının mükerrer include edilmesini engeller.",
          ),
          Question(
            id: "c_unit_2_l7_q3",
            type: QuestionType.multipleChoice,
            prompt: "Tüm üyelerinin bellekte AYNI başlangıç adresini paylaştığı ve en büyük üyesi kadar yer kaplayan yapı hangisidir?",
            codeSnippet: r'''___ Data {
    int i;
    float f;
    char str[20];
};''',
            options: ["union", "struct", "class", "shared"],
            correctIndex: 0,
            explanation: "'union' içindeki tüm elemanlar aynı bellek alanını ortaklaşa kullanır; aynı anda sadece biri geçerli değer tutar.",
          ),
          Question(
            id: "c_unit_2_l7_q4",
            type: QuestionType.multipleChoice,
            prompt: "C dilinde bir değişkenin bellekteki adresini elde etmek için hangi operatör kullanılır?",
            codeSnippet: r'''int x = 10;
int *ptr = ___x;''',
            options: ["& (Address-of)", "* (Dereference)", "% (Mod)", "\$ (Value)"],
            correctIndex: 0,
            explanation: "'&' operatörü bir değişkenin RAM üzerindeki başlangıç adresini döner.",
          ),
          Question(
            id: "c_unit_2_l7_q5",
            type: QuestionType.multipleChoice,
            prompt: "Bir işaretçinin (pointer) işaret ettiği bellek adresindeki veriye erişmek veya onu değiştirmek için hangi işlem yapılır?",
            codeSnippet: r'''int x = 5;
int *p = &x;
___p = 20; // x artik 20 olur''',
            options: ["* (Dereference)", "&", "->", "."],
            correctIndex: 0,
            explanation: "'*p' dereferencing yaparak işaretçinin tuttuğu adresteki asıl değere erişir.",
          ),
          Question(
            id: "c_unit_2_l7_q6",
            type: QuestionType.multipleChoice,
            prompt: "Heap bellekte dinamik olarak bayt cinsinden bellek tahsis etmek için hangi standart kütüphane fonksiyonu kullanılır?",
            codeSnippet: r'''int *arr = (int*)___(10 * sizeof(int));''',
            options: ["malloc", "alloc", "new", "heap_get"],
            correctIndex: 0,
            explanation: "'malloc(size_t size)' heap bölgesinde istenen bayt kadar bellek ayırır ve void* işaretçi döner.",
          ),
          Question(
            id: "c_unit_2_l7_q7",
            type: QuestionType.multipleChoice,
            prompt: "malloc veya calloc ile tahsis edilen dinamik belleğin sisteme iade edilmesi için hangi fonksiyon çağrılmalıdır?",
            codeSnippet: r'''int *buf = malloc(1024);
// ... kullanim ...
___(buf);''',
            options: ["free", "delete", "release", "dispose"],
            correctIndex: 0,
            explanation: "'free(ptr)' heap bellekte ayrılan alanı serbest bırakır. Çağrılmazsa 'Memory Leak' oluşur.",
          ),
          Question(
            id: "c_unit_2_l7_q8",
            type: QuestionType.multipleChoice,
            prompt: "Tahsis ettiği belleği otomatik olarak sıfırlarla (0 baytları) dolduran dinamik bellek fonksiyonu hangisidir?",
            codeSnippet: r'''int *p = ___(100, sizeof(int));''',
            options: ["calloc", "malloc", "realloc", "zalloc"],
            correctIndex: 0,
            explanation: "'calloc(num, size)' eleman sayısı ve eleman boyutu alır, ayrılan tüm bellek hücrelerini 0 ile başlatır.",
          ),
          Question(
            id: "c_unit_2_l7_q9",
            type: QuestionType.multipleChoice,
            prompt: "Daha önce ayrılmış dinamik bir bellek bloğunun boyutunu veri kaybı olmadan büyütmek veya küçültmek için ne kullanılır?",
            codeSnippet: r'''ptr = ___(ptr, new_size);''',
            options: ["realloc", "resize", "remalloc", "expand"],
            correctIndex: 0,
            explanation: "'realloc' mevcut bloğu genişletir veya yeni bir konuma taşıyarak eski veriyi kopyalar.",
          ),
          Question(
            id: "c_unit_2_l7_q10",
            type: QuestionType.multipleChoice,
            prompt: "C programlama dilinde GCC derleme sürecinin doğru sırası aşağıdakilerden hangisidir?",
            options: ["Preprocessor -> Compiler -> Assembler -> Linker", "Compiler -> Preprocessor -> Linker -> Assembler", "Assembler -> Compiler -> Linker -> Preprocessor", "Linker -> Assembler -> Compiler -> Preprocessor"],
            correctIndex: 0,
            explanation: "Önce makrolar ve headerlar çözülür (cpp), C kodu Assembly'ye derlenir (cc1), makine koduna çevrilir (as), kütüphaneler bağlanır (ld).",
          ),
          Question(
            id: "c_unit_2_l7_q11",
            type: QuestionType.multipleChoice,
            prompt: "64-bit modern bir mimaride standart bir işaretçi (pointer - int*, char*, void*) değişkeni bellekte kaç bayt yer kaplar?",
            codeSnippet: r'''printf("%zu", sizeof(int*));''',
            options: ["8 bayt", "4 bayt", "2 bayt", "16 bayt"],
            correctIndex: 0,
            explanation: "64-bit mimarilerde bellek adresleri 64 bit yani tam 8 bayttır. İşaretçinin tipi ne olursa olsun adres boyutu 8 bayttır.",
          ),
          Question(
            id: "c_unit_2_l7_q12",
            type: QuestionType.multipleChoice,
            prompt: "Bir struct içindeki bir işaretçi elemana erişirken '.' yerine hangi pratik operatör kullanılır?",
            codeSnippet: r'''struct User *u = getUser();
u___name = "Ahmet";''',
            options: ["-> (Ok operatörü)", ".", "::", "=>"],
            correctIndex: 0,
            explanation: "'u->name', '(*u).name' yazımının daha okunaklı ve standart kısayoludur.",
          ),
          Question(
            id: "c_unit_2_l7_q13",
            type: QuestionType.fillInTheBlank,
            prompt: "Geçersiz veya henüz atanmamış bir işaretçiye güvenli başlangıç değeri olarak _____ atanmalıdır.",
            explanation: "İşaretçilere NULL atamak tanımsız belleğe erişimi ve segmentation fault hatalarını engellemeye yardımcı olur.",
            blankOptions: ["NULL", "0xFF", "void", "NaN"],
            correctBlankAnswer: "NULL",
          ),
          Question(
            id: "c_unit_2_l7_q14",
            type: QuestionType.fillInTheBlank,
            prompt: "Bir veri tipinin bellekte kaç bayt yer kapladığını öğrenmek için derleme zamanı operatörü olan _____ kullanılır.",
            explanation: "sizeof(tip) veya sizeof(degisken) bayt cinsinden bellek boyutunu size_t olarak döner.",
            blankOptions: ["sizeof", "lengthof", "bytesize", "countof"],
            correctBlankAnswer: "sizeof",
          ),
          Question(
            id: "c_unit_2_l7_q15",
            type: QuestionType.fillInTheBlank,
            prompt: "Açılmış bir dosya işaretçisini işletim sistemine geri iade etmek için _____ fonksiyonu çağrılır.",
            explanation: "fclose(FILE *stream) dosya tamponlarını diske yazar ve kaynakları kapatır.",
            blankOptions: ["fclose", "close", "file_exit", "dispose"],
            correctBlankAnswer: "fclose",
          ),
          Question(
            id: "c_unit_2_l7_q16",
            type: QuestionType.trueFalse,
            prompt: "C dilinde dizi isimleri ifadeler içinde kullanıldığında dizinin ilk elemanının bellek adresine (pointer) dönüşür (decay).",
            explanation: "Doğrudur, 'arr' ifadesi '&arr[0]' adresi ile eşdeğerdir.",
            isTrue: true,
          ),
          Question(
            id: "c_unit_2_l7_q17",
            type: QuestionType.trueFalse,
            prompt: "Stack belleğinde oluşturulan yerel değişkenler fonksiyon sonlandığında da bellekte kalmaya devam eder ve serbest bırakılması için free() gerekir.",
            explanation: "Yanlıştır! Stack bellek fonksiyon bitiminde otomatik temizlenir; free() sadece heap (malloc) için geçerlidir.",
            isTrue: false,
          ),
          Question(
            id: "c_unit_2_l7_q18",
            type: QuestionType.matching,
            prompt: "C bellek kavramlarını doğru açıklamalarıyla eşleştirin.",
            explanation: "C'de bellek güvenliği doğrudan yazılımcının sorumluluğundadır.",
            matchingPairs: [MatchingPair(left: "malloc", right: "Heap üzerinde başlatılmamış bellek tahsisi"), MatchingPair(left: "free", right: "Dinamik belleği sisteme iade etme"), MatchingPair(left: "Valgrind", right: "Bellek sızıntılarını tespit eden analiz aracı")],
          ),
        ],
      ),
      Lesson(
        id: "c_unit_2_l8",
        title: "2. Ünite Veri Tipleri & Formatlı Girdi/Çıktı Sınavı",
        description: "Tip boyutları ve G/Ç sınavı",
        xpReward: 50,
        gemReward: 25,
        isUnitExam: true,
        questions: [
          Question(
            id: "c_unit_2_l8_q1",
            type: QuestionType.conceptCard,
            conceptTitle: "2. Ünite Veri Tipleri & Formatlı Girdi/Çıktı Sınavı - Hap Bilgi",
            rule: "C dilinde işaretçiler (pointers) doğrudan bellek adreslerini saklar. '&' operatörü bir değişkenin adresini alırken, '*' (dereference) o adresteki veriye erişir veya değiştirir.",
            codeExample: r'''#include <stdio.h>
#include <stdlib.h>

int main() {
    int x = 100;
    int *ptr = &x;
    
    printf("x Degeri: %d\n", *ptr);
    printf("x Bellek Adresi: %p\n", (void*)ptr);
    return 0;
}''',
            devTip: "malloc ile tahsis edilen her bayt bellek için mutlaka bir free() çağrısı yapılmalıdır, aksi halde Memory Leak oluşur.",
            iconEmoji: "⚡",
          ),
          Question(
            id: "c_unit_2_l8_q2",
            type: QuestionType.multipleChoice,
            prompt: "C dilinde bir değişkenin bellekteki adresini elde etmek için hangi operatör kullanılır?",
            codeSnippet: r'''int x = 10;
int *ptr = ___x;''',
            options: ["& (Address-of)", "* (Dereference)", "% (Mod)", "\$ (Value)"],
            correctIndex: 0,
            explanation: "'&' operatörü bir değişkenin RAM üzerindeki başlangıç adresini döner.",
          ),
          Question(
            id: "c_unit_2_l8_q3",
            type: QuestionType.multipleChoice,
            prompt: "Bir işaretçinin (pointer) işaret ettiği bellek adresindeki veriye erişmek veya onu değiştirmek için hangi işlem yapılır?",
            codeSnippet: r'''int x = 5;
int *p = &x;
___p = 20; // x artik 20 olur''',
            options: ["* (Dereference)", "&", "->", "."],
            correctIndex: 0,
            explanation: "'*p' dereferencing yaparak işaretçinin tuttuğu adresteki asıl değere erişir.",
          ),
          Question(
            id: "c_unit_2_l8_q4",
            type: QuestionType.multipleChoice,
            prompt: "Heap bellekte dinamik olarak bayt cinsinden bellek tahsis etmek için hangi standart kütüphane fonksiyonu kullanılır?",
            codeSnippet: r'''int *arr = (int*)___(10 * sizeof(int));''',
            options: ["malloc", "alloc", "new", "heap_get"],
            correctIndex: 0,
            explanation: "'malloc(size_t size)' heap bölgesinde istenen bayt kadar bellek ayırır ve void* işaretçi döner.",
          ),
          Question(
            id: "c_unit_2_l8_q5",
            type: QuestionType.multipleChoice,
            prompt: "malloc veya calloc ile tahsis edilen dinamik belleğin sisteme iade edilmesi için hangi fonksiyon çağrılmalıdır?",
            codeSnippet: r'''int *buf = malloc(1024);
// ... kullanim ...
___(buf);''',
            options: ["free", "delete", "release", "dispose"],
            correctIndex: 0,
            explanation: "'free(ptr)' heap bellekte ayrılan alanı serbest bırakır. Çağrılmazsa 'Memory Leak' oluşur.",
          ),
          Question(
            id: "c_unit_2_l8_q6",
            type: QuestionType.multipleChoice,
            prompt: "Tahsis ettiği belleği otomatik olarak sıfırlarla (0 baytları) dolduran dinamik bellek fonksiyonu hangisidir?",
            codeSnippet: r'''int *p = ___(100, sizeof(int));''',
            options: ["calloc", "malloc", "realloc", "zalloc"],
            correctIndex: 0,
            explanation: "'calloc(num, size)' eleman sayısı ve eleman boyutu alır, ayrılan tüm bellek hücrelerini 0 ile başlatır.",
          ),
          Question(
            id: "c_unit_2_l8_q7",
            type: QuestionType.multipleChoice,
            prompt: "Daha önce ayrılmış dinamik bir bellek bloğunun boyutunu veri kaybı olmadan büyütmek veya küçültmek için ne kullanılır?",
            codeSnippet: r'''ptr = ___(ptr, new_size);''',
            options: ["realloc", "resize", "remalloc", "expand"],
            correctIndex: 0,
            explanation: "'realloc' mevcut bloğu genişletir veya yeni bir konuma taşıyarak eski veriyi kopyalar.",
          ),
          Question(
            id: "c_unit_2_l8_q8",
            type: QuestionType.multipleChoice,
            prompt: "C programlama dilinde GCC derleme sürecinin doğru sırası aşağıdakilerden hangisidir?",
            options: ["Preprocessor -> Compiler -> Assembler -> Linker", "Compiler -> Preprocessor -> Linker -> Assembler", "Assembler -> Compiler -> Linker -> Preprocessor", "Linker -> Assembler -> Compiler -> Preprocessor"],
            correctIndex: 0,
            explanation: "Önce makrolar ve headerlar çözülür (cpp), C kodu Assembly'ye derlenir (cc1), makine koduna çevrilir (as), kütüphaneler bağlanır (ld).",
          ),
          Question(
            id: "c_unit_2_l8_q9",
            type: QuestionType.multipleChoice,
            prompt: "64-bit modern bir mimaride standart bir işaretçi (pointer - int*, char*, void*) değişkeni bellekte kaç bayt yer kaplar?",
            codeSnippet: r'''printf("%zu", sizeof(int*));''',
            options: ["8 bayt", "4 bayt", "2 bayt", "16 bayt"],
            correctIndex: 0,
            explanation: "64-bit mimarilerde bellek adresleri 64 bit yani tam 8 bayttır. İşaretçinin tipi ne olursa olsun adres boyutu 8 bayttır.",
          ),
          Question(
            id: "c_unit_2_l8_q10",
            type: QuestionType.multipleChoice,
            prompt: "Bir struct içindeki bir işaretçi elemana erişirken '.' yerine hangi pratik operatör kullanılır?",
            codeSnippet: r'''struct User *u = getUser();
u___name = "Ahmet";''',
            options: ["-> (Ok operatörü)", ".", "::", "=>"],
            correctIndex: 0,
            explanation: "'u->name', '(*u).name' yazımının daha okunaklı ve standart kısayoludur.",
          ),
          Question(
            id: "c_unit_2_l8_q11",
            type: QuestionType.multipleChoice,
            prompt: "Herhangi bir veri tipine ait bellek adresini tutabilen jenerik (tip bağımsız) işaretçi tipi hangisidir?",
            codeSnippet: r'''___ generic_ptr = &x;''',
            options: ["void*", "any*", "object*", "generic*"],
            correctIndex: 0,
            explanation: "'void*' tipi belirsiz jenerik bir işaretçidir; doğrudan dereference edilemez, cast edilmesi gerekir.",
          ),
          Question(
            id: "c_unit_2_l8_q12",
            type: QuestionType.multipleChoice,
            prompt: "Serbest bırakılmış (free edilmiş) bir işaretçiyi kullanmaya devam etme hatasına ne ad verilir?",
            codeSnippet: r'''free(ptr);
printf("%d", *ptr); // HATA!''',
            options: ["Dangling Pointer (Askıda Kalan İşaretçi)", "Stack Overflow", "Memory Leak", "Deadlock"],
            correctIndex: 0,
            explanation: "free edildikten sonra hala o adresi göstermeye devam eden işaretçiye dangling pointer denir; 'ptr = NULL' yapılarak önlenir.",
          ),
          Question(
            id: "c_unit_2_l8_q13",
            type: QuestionType.fillInTheBlank,
            prompt: "Geçersiz veya henüz atanmamış bir işaretçiye güvenli başlangıç değeri olarak _____ atanmalıdır.",
            explanation: "İşaretçilere NULL atamak tanımsız belleğe erişimi ve segmentation fault hatalarını engellemeye yardımcı olur.",
            blankOptions: ["NULL", "0xFF", "void", "NaN"],
            correctBlankAnswer: "NULL",
          ),
          Question(
            id: "c_unit_2_l8_q14",
            type: QuestionType.fillInTheBlank,
            prompt: "Bir veri tipinin bellekte kaç bayt yer kapladığını öğrenmek için derleme zamanı operatörü olan _____ kullanılır.",
            explanation: "sizeof(tip) veya sizeof(degisken) bayt cinsinden bellek boyutunu size_t olarak döner.",
            blankOptions: ["sizeof", "lengthof", "bytesize", "countof"],
            correctBlankAnswer: "sizeof",
          ),
          Question(
            id: "c_unit_2_l8_q15",
            type: QuestionType.fillInTheBlank,
            prompt: "Açılmış bir dosya işaretçisini işletim sistemine geri iade etmek için _____ fonksiyonu çağrılır.",
            explanation: "fclose(FILE *stream) dosya tamponlarını diske yazar ve kaynakları kapatır.",
            blankOptions: ["fclose", "close", "file_exit", "dispose"],
            correctBlankAnswer: "fclose",
          ),
          Question(
            id: "c_unit_2_l8_q16",
            type: QuestionType.trueFalse,
            prompt: "C dilinde dizi isimleri ifadeler içinde kullanıldığında dizinin ilk elemanının bellek adresine (pointer) dönüşür (decay).",
            explanation: "Doğrudur, 'arr' ifadesi '&arr[0]' adresi ile eşdeğerdir.",
            isTrue: true,
          ),
          Question(
            id: "c_unit_2_l8_q17",
            type: QuestionType.trueFalse,
            prompt: "Stack belleğinde oluşturulan yerel değişkenler fonksiyon sonlandığında da bellekte kalmaya devam eder ve serbest bırakılması için free() gerekir.",
            explanation: "Yanlıştır! Stack bellek fonksiyon bitiminde otomatik temizlenir; free() sadece heap (malloc) için geçerlidir.",
            isTrue: false,
          ),
          Question(
            id: "c_unit_2_l8_q18",
            type: QuestionType.matching,
            prompt: "C bellek kavramlarını doğru açıklamalarıyla eşleştirin.",
            explanation: "C'de bellek güvenliği doğrudan yazılımcının sorumluluğundadır.",
            matchingPairs: [MatchingPair(left: "malloc", right: "Heap üzerinde başlatılmamış bellek tahsisi"), MatchingPair(left: "free", right: "Dinamik belleği sisteme iade etme"), MatchingPair(left: "Valgrind", right: "Bellek sızıntılarını tespit eden analiz aracı")],
          ),
        ],
      ),
    ],
  ),
  LearningUnit(
    id: "c_unit_3",
    unitNumber: 3,
    title: "Bellek Adresleri & İşaretçi (Pointer) Temelleri",
    language: CodeLanguage.c,
    category: "İşaretçiler (Pointers)",
    colorHex: 0xFF38BDF8,
    cheatSheetTitle: "C Pointer Hile Kağıdı",
    cheatSheetContent: r'''int x = 42;
int *p = &x;  // Adresi al
*p = 100;     // Dereference
int **pp = &p;// Cift isaretci''',
    lessons: [
      Lesson(
        id: "c_unit_3_l1",
        title: "RAM Mimarisi & Bellek Adresi Kavramı",
        description: "Bayt bayt adreslenebilir bellek modeli",
        xpReward: 35,
        gemReward: 12,
        isUnitExam: false,
        questions: [
          Question(
            id: "c_unit_3_l1_q1",
            type: QuestionType.conceptCard,
            conceptTitle: "RAM Mimarisi & Bellek Adresi Kavramı - Hap Bilgi",
            rule: "C dilinde işaretçiler (pointers) doğrudan bellek adreslerini saklar. '&' operatörü bir değişkenin adresini alırken, '*' (dereference) o adresteki veriye erişir veya değiştirir.",
            codeExample: r'''#include <stdio.h>
#include <stdlib.h>

int main() {
    int x = 100;
    int *ptr = &x;
    
    printf("x Degeri: %d\n", *ptr);
    printf("x Bellek Adresi: %p\n", (void*)ptr);
    return 0;
}''',
            devTip: "malloc ile tahsis edilen her bayt bellek için mutlaka bir free() çağrısı yapılmalıdır, aksi halde Memory Leak oluşur.",
            iconEmoji: "⚡",
          ),
          Question(
            id: "c_unit_3_l1_q2",
            type: QuestionType.multipleChoice,
            prompt: "Heap bellekte dinamik olarak bayt cinsinden bellek tahsis etmek için hangi standart kütüphane fonksiyonu kullanılır?",
            codeSnippet: r'''int *arr = (int*)___(10 * sizeof(int));''',
            options: ["malloc", "alloc", "new", "heap_get"],
            correctIndex: 0,
            explanation: "'malloc(size_t size)' heap bölgesinde istenen bayt kadar bellek ayırır ve void* işaretçi döner.",
          ),
          Question(
            id: "c_unit_3_l1_q3",
            type: QuestionType.multipleChoice,
            prompt: "malloc veya calloc ile tahsis edilen dinamik belleğin sisteme iade edilmesi için hangi fonksiyon çağrılmalıdır?",
            codeSnippet: r'''int *buf = malloc(1024);
// ... kullanim ...
___(buf);''',
            options: ["free", "delete", "release", "dispose"],
            correctIndex: 0,
            explanation: "'free(ptr)' heap bellekte ayrılan alanı serbest bırakır. Çağrılmazsa 'Memory Leak' oluşur.",
          ),
          Question(
            id: "c_unit_3_l1_q4",
            type: QuestionType.multipleChoice,
            prompt: "Tahsis ettiği belleği otomatik olarak sıfırlarla (0 baytları) dolduran dinamik bellek fonksiyonu hangisidir?",
            codeSnippet: r'''int *p = ___(100, sizeof(int));''',
            options: ["calloc", "malloc", "realloc", "zalloc"],
            correctIndex: 0,
            explanation: "'calloc(num, size)' eleman sayısı ve eleman boyutu alır, ayrılan tüm bellek hücrelerini 0 ile başlatır.",
          ),
          Question(
            id: "c_unit_3_l1_q5",
            type: QuestionType.multipleChoice,
            prompt: "Daha önce ayrılmış dinamik bir bellek bloğunun boyutunu veri kaybı olmadan büyütmek veya küçültmek için ne kullanılır?",
            codeSnippet: r'''ptr = ___(ptr, new_size);''',
            options: ["realloc", "resize", "remalloc", "expand"],
            correctIndex: 0,
            explanation: "'realloc' mevcut bloğu genişletir veya yeni bir konuma taşıyarak eski veriyi kopyalar.",
          ),
          Question(
            id: "c_unit_3_l1_q6",
            type: QuestionType.multipleChoice,
            prompt: "C programlama dilinde GCC derleme sürecinin doğru sırası aşağıdakilerden hangisidir?",
            options: ["Preprocessor -> Compiler -> Assembler -> Linker", "Compiler -> Preprocessor -> Linker -> Assembler", "Assembler -> Compiler -> Linker -> Preprocessor", "Linker -> Assembler -> Compiler -> Preprocessor"],
            correctIndex: 0,
            explanation: "Önce makrolar ve headerlar çözülür (cpp), C kodu Assembly'ye derlenir (cc1), makine koduna çevrilir (as), kütüphaneler bağlanır (ld).",
          ),
          Question(
            id: "c_unit_3_l1_q7",
            type: QuestionType.multipleChoice,
            prompt: "64-bit modern bir mimaride standart bir işaretçi (pointer - int*, char*, void*) değişkeni bellekte kaç bayt yer kaplar?",
            codeSnippet: r'''printf("%zu", sizeof(int*));''',
            options: ["8 bayt", "4 bayt", "2 bayt", "16 bayt"],
            correctIndex: 0,
            explanation: "64-bit mimarilerde bellek adresleri 64 bit yani tam 8 bayttır. İşaretçinin tipi ne olursa olsun adres boyutu 8 bayttır.",
          ),
          Question(
            id: "c_unit_3_l1_q8",
            type: QuestionType.multipleChoice,
            prompt: "Bir struct içindeki bir işaretçi elemana erişirken '.' yerine hangi pratik operatör kullanılır?",
            codeSnippet: r'''struct User *u = getUser();
u___name = "Ahmet";''',
            options: ["-> (Ok operatörü)", ".", "::", "=>"],
            correctIndex: 0,
            explanation: "'u->name', '(*u).name' yazımının daha okunaklı ve standart kısayoludur.",
          ),
          Question(
            id: "c_unit_3_l1_q9",
            type: QuestionType.multipleChoice,
            prompt: "Herhangi bir veri tipine ait bellek adresini tutabilen jenerik (tip bağımsız) işaretçi tipi hangisidir?",
            codeSnippet: r'''___ generic_ptr = &x;''',
            options: ["void*", "any*", "object*", "generic*"],
            correctIndex: 0,
            explanation: "'void*' tipi belirsiz jenerik bir işaretçidir; doğrudan dereference edilemez, cast edilmesi gerekir.",
          ),
          Question(
            id: "c_unit_3_l1_q10",
            type: QuestionType.multipleChoice,
            prompt: "Serbest bırakılmış (free edilmiş) bir işaretçiyi kullanmaya devam etme hatasına ne ad verilir?",
            codeSnippet: r'''free(ptr);
printf("%d", *ptr); // HATA!''',
            options: ["Dangling Pointer (Askıda Kalan İşaretçi)", "Stack Overflow", "Memory Leak", "Deadlock"],
            correctIndex: 0,
            explanation: "free edildikten sonra hala o adresi göstermeye devam eden işaretçiye dangling pointer denir; 'ptr = NULL' yapılarak önlenir.",
          ),
          Question(
            id: "c_unit_3_l1_q11",
            type: QuestionType.multipleChoice,
            prompt: "C programlarında bellek sızıntılarını (memory leak) ve geçersiz bellek erişimlerini tespit etmek için en popüler Linux aracı hangisidir?",
            codeSnippet: r'''$ ___ --leak-check=full ./program''',
            options: ["valgrind", "gdb", "perf", "strace"],
            correctIndex: 0,
            explanation: "Valgrind (özellikle memcheck aracı) C/C++ programlarında bellek yönetim hatalarını ayrıntılı raporlar.",
          ),
          Question(
            id: "c_unit_3_l1_q12",
            type: QuestionType.multipleChoice,
            prompt: "Aşağıdaki bit düzeyinde (bitwise) operatörlerden hangisi bitleri 1 basamak sola kaydırarak 2 ile çarpmayı sağlar?",
            codeSnippet: r'''int x = 5;
int y = x ___ 1; // y = 10 olur''',
            options: ["<<", ">>", "&", "|"],
            correctIndex: 0,
            explanation: "Sola kaydırma (<< n) operatörü sayının değerini 2^n ile çarpar.",
          ),
          Question(
            id: "c_unit_3_l1_q13",
            type: QuestionType.fillInTheBlank,
            prompt: "Geçersiz veya henüz atanmamış bir işaretçiye güvenli başlangıç değeri olarak _____ atanmalıdır.",
            explanation: "İşaretçilere NULL atamak tanımsız belleğe erişimi ve segmentation fault hatalarını engellemeye yardımcı olur.",
            blankOptions: ["NULL", "0xFF", "void", "NaN"],
            correctBlankAnswer: "NULL",
          ),
          Question(
            id: "c_unit_3_l1_q14",
            type: QuestionType.fillInTheBlank,
            prompt: "Bir veri tipinin bellekte kaç bayt yer kapladığını öğrenmek için derleme zamanı operatörü olan _____ kullanılır.",
            explanation: "sizeof(tip) veya sizeof(degisken) bayt cinsinden bellek boyutunu size_t olarak döner.",
            blankOptions: ["sizeof", "lengthof", "bytesize", "countof"],
            correctBlankAnswer: "sizeof",
          ),
          Question(
            id: "c_unit_3_l1_q15",
            type: QuestionType.fillInTheBlank,
            prompt: "Açılmış bir dosya işaretçisini işletim sistemine geri iade etmek için _____ fonksiyonu çağrılır.",
            explanation: "fclose(FILE *stream) dosya tamponlarını diske yazar ve kaynakları kapatır.",
            blankOptions: ["fclose", "close", "file_exit", "dispose"],
            correctBlankAnswer: "fclose",
          ),
          Question(
            id: "c_unit_3_l1_q16",
            type: QuestionType.trueFalse,
            prompt: "C dilinde dizi isimleri ifadeler içinde kullanıldığında dizinin ilk elemanının bellek adresine (pointer) dönüşür (decay).",
            explanation: "Doğrudur, 'arr' ifadesi '&arr[0]' adresi ile eşdeğerdir.",
            isTrue: true,
          ),
          Question(
            id: "c_unit_3_l1_q17",
            type: QuestionType.trueFalse,
            prompt: "Stack belleğinde oluşturulan yerel değişkenler fonksiyon sonlandığında da bellekte kalmaya devam eder ve serbest bırakılması için free() gerekir.",
            explanation: "Yanlıştır! Stack bellek fonksiyon bitiminde otomatik temizlenir; free() sadece heap (malloc) için geçerlidir.",
            isTrue: false,
          ),
          Question(
            id: "c_unit_3_l1_q18",
            type: QuestionType.matching,
            prompt: "C bellek kavramlarını doğru açıklamalarıyla eşleştirin.",
            explanation: "C'de bellek güvenliği doğrudan yazılımcının sorumluluğundadır.",
            matchingPairs: [MatchingPair(left: "malloc", right: "Heap üzerinde başlatılmamış bellek tahsisi"), MatchingPair(left: "free", right: "Dinamik belleği sisteme iade etme"), MatchingPair(left: "Valgrind", right: "Bellek sızıntılarını tespit eden analiz aracı")],
          ),
        ],
      ),
      Lesson(
        id: "c_unit_3_l2",
        title: "Address-of (&) Operatörü ile Adres Yakalama",
        description: "Değişkenlerin RAM'deki konumunu bulma",
        xpReward: 35,
        gemReward: 12,
        isUnitExam: false,
        questions: [
          Question(
            id: "c_unit_3_l2_q1",
            type: QuestionType.conceptCard,
            conceptTitle: "Address-of (&) Operatörü ile Adres Yakalama - Hap Bilgi",
            rule: "C dilinde işaretçiler (pointers) doğrudan bellek adreslerini saklar. '&' operatörü bir değişkenin adresini alırken, '*' (dereference) o adresteki veriye erişir veya değiştirir.",
            codeExample: r'''#include <stdio.h>
#include <stdlib.h>

int main() {
    int x = 100;
    int *ptr = &x;
    
    printf("x Degeri: %d\n", *ptr);
    printf("x Bellek Adresi: %p\n", (void*)ptr);
    return 0;
}''',
            devTip: "malloc ile tahsis edilen her bayt bellek için mutlaka bir free() çağrısı yapılmalıdır, aksi halde Memory Leak oluşur.",
            iconEmoji: "⚡",
          ),
          Question(
            id: "c_unit_3_l2_q2",
            type: QuestionType.multipleChoice,
            prompt: "Tahsis ettiği belleği otomatik olarak sıfırlarla (0 baytları) dolduran dinamik bellek fonksiyonu hangisidir?",
            codeSnippet: r'''int *p = ___(100, sizeof(int));''',
            options: ["calloc", "malloc", "realloc", "zalloc"],
            correctIndex: 0,
            explanation: "'calloc(num, size)' eleman sayısı ve eleman boyutu alır, ayrılan tüm bellek hücrelerini 0 ile başlatır.",
          ),
          Question(
            id: "c_unit_3_l2_q3",
            type: QuestionType.multipleChoice,
            prompt: "Daha önce ayrılmış dinamik bir bellek bloğunun boyutunu veri kaybı olmadan büyütmek veya küçültmek için ne kullanılır?",
            codeSnippet: r'''ptr = ___(ptr, new_size);''',
            options: ["realloc", "resize", "remalloc", "expand"],
            correctIndex: 0,
            explanation: "'realloc' mevcut bloğu genişletir veya yeni bir konuma taşıyarak eski veriyi kopyalar.",
          ),
          Question(
            id: "c_unit_3_l2_q4",
            type: QuestionType.multipleChoice,
            prompt: "C programlama dilinde GCC derleme sürecinin doğru sırası aşağıdakilerden hangisidir?",
            options: ["Preprocessor -> Compiler -> Assembler -> Linker", "Compiler -> Preprocessor -> Linker -> Assembler", "Assembler -> Compiler -> Linker -> Preprocessor", "Linker -> Assembler -> Compiler -> Preprocessor"],
            correctIndex: 0,
            explanation: "Önce makrolar ve headerlar çözülür (cpp), C kodu Assembly'ye derlenir (cc1), makine koduna çevrilir (as), kütüphaneler bağlanır (ld).",
          ),
          Question(
            id: "c_unit_3_l2_q5",
            type: QuestionType.multipleChoice,
            prompt: "64-bit modern bir mimaride standart bir işaretçi (pointer - int*, char*, void*) değişkeni bellekte kaç bayt yer kaplar?",
            codeSnippet: r'''printf("%zu", sizeof(int*));''',
            options: ["8 bayt", "4 bayt", "2 bayt", "16 bayt"],
            correctIndex: 0,
            explanation: "64-bit mimarilerde bellek adresleri 64 bit yani tam 8 bayttır. İşaretçinin tipi ne olursa olsun adres boyutu 8 bayttır.",
          ),
          Question(
            id: "c_unit_3_l2_q6",
            type: QuestionType.multipleChoice,
            prompt: "Bir struct içindeki bir işaretçi elemana erişirken '.' yerine hangi pratik operatör kullanılır?",
            codeSnippet: r'''struct User *u = getUser();
u___name = "Ahmet";''',
            options: ["-> (Ok operatörü)", ".", "::", "=>"],
            correctIndex: 0,
            explanation: "'u->name', '(*u).name' yazımının daha okunaklı ve standart kısayoludur.",
          ),
          Question(
            id: "c_unit_3_l2_q7",
            type: QuestionType.multipleChoice,
            prompt: "Herhangi bir veri tipine ait bellek adresini tutabilen jenerik (tip bağımsız) işaretçi tipi hangisidir?",
            codeSnippet: r'''___ generic_ptr = &x;''',
            options: ["void*", "any*", "object*", "generic*"],
            correctIndex: 0,
            explanation: "'void*' tipi belirsiz jenerik bir işaretçidir; doğrudan dereference edilemez, cast edilmesi gerekir.",
          ),
          Question(
            id: "c_unit_3_l2_q8",
            type: QuestionType.multipleChoice,
            prompt: "Serbest bırakılmış (free edilmiş) bir işaretçiyi kullanmaya devam etme hatasına ne ad verilir?",
            codeSnippet: r'''free(ptr);
printf("%d", *ptr); // HATA!''',
            options: ["Dangling Pointer (Askıda Kalan İşaretçi)", "Stack Overflow", "Memory Leak", "Deadlock"],
            correctIndex: 0,
            explanation: "free edildikten sonra hala o adresi göstermeye devam eden işaretçiye dangling pointer denir; 'ptr = NULL' yapılarak önlenir.",
          ),
          Question(
            id: "c_unit_3_l2_q9",
            type: QuestionType.multipleChoice,
            prompt: "C programlarında bellek sızıntılarını (memory leak) ve geçersiz bellek erişimlerini tespit etmek için en popüler Linux aracı hangisidir?",
            codeSnippet: r'''$ ___ --leak-check=full ./program''',
            options: ["valgrind", "gdb", "perf", "strace"],
            correctIndex: 0,
            explanation: "Valgrind (özellikle memcheck aracı) C/C++ programlarında bellek yönetim hatalarını ayrıntılı raporlar.",
          ),
          Question(
            id: "c_unit_3_l2_q10",
            type: QuestionType.multipleChoice,
            prompt: "Aşağıdaki bit düzeyinde (bitwise) operatörlerden hangisi bitleri 1 basamak sola kaydırarak 2 ile çarpmayı sağlar?",
            codeSnippet: r'''int x = 5;
int y = x ___ 1; // y = 10 olur''',
            options: ["<<", ">>", "&", "|"],
            correctIndex: 0,
            explanation: "Sola kaydırma (<< n) operatörü sayının değerini 2^n ile çarpar.",
          ),
          Question(
            id: "c_unit_3_l2_q11",
            type: QuestionType.multipleChoice,
            prompt: "C'de dosya açmak ve bir dosya işaretçisi (FILE*) elde etmek için hangi standart fonksiyon kullanılır?",
            codeSnippet: r'''FILE *f = ___("data.txt", "r");''',
            options: ["fopen", "open", "file_open", "create_file"],
            correctIndex: 0,
            explanation: "'fopen(dosya_adi, mod)' dosyayı belirtilen modda (r, w, a, rb, wb) açar.",
          ),
          Question(
            id: "c_unit_3_l2_q12",
            type: QuestionType.multipleChoice,
            prompt: "Bir header dosyasının birden fazla kez derlemeye dahil edilmesini (redefinition) önlemek için ne kullanılır?",
            codeSnippet: r'''#ifndef MY_HEADER_H
#define MY_HEADER_H
// ...
#endif''',
            options: ["Header Guards (#ifndef / #define)", "namespace", "pragma private", "module"],
            correctIndex: 0,
            explanation: "Header guards veya '#pragma once' başlık dosyalarının mükerrer include edilmesini engeller.",
          ),
          Question(
            id: "c_unit_3_l2_q13",
            type: QuestionType.fillInTheBlank,
            prompt: "Geçersiz veya henüz atanmamış bir işaretçiye güvenli başlangıç değeri olarak _____ atanmalıdır.",
            explanation: "İşaretçilere NULL atamak tanımsız belleğe erişimi ve segmentation fault hatalarını engellemeye yardımcı olur.",
            blankOptions: ["NULL", "0xFF", "void", "NaN"],
            correctBlankAnswer: "NULL",
          ),
          Question(
            id: "c_unit_3_l2_q14",
            type: QuestionType.fillInTheBlank,
            prompt: "Bir veri tipinin bellekte kaç bayt yer kapladığını öğrenmek için derleme zamanı operatörü olan _____ kullanılır.",
            explanation: "sizeof(tip) veya sizeof(degisken) bayt cinsinden bellek boyutunu size_t olarak döner.",
            blankOptions: ["sizeof", "lengthof", "bytesize", "countof"],
            correctBlankAnswer: "sizeof",
          ),
          Question(
            id: "c_unit_3_l2_q15",
            type: QuestionType.fillInTheBlank,
            prompt: "Açılmış bir dosya işaretçisini işletim sistemine geri iade etmek için _____ fonksiyonu çağrılır.",
            explanation: "fclose(FILE *stream) dosya tamponlarını diske yazar ve kaynakları kapatır.",
            blankOptions: ["fclose", "close", "file_exit", "dispose"],
            correctBlankAnswer: "fclose",
          ),
          Question(
            id: "c_unit_3_l2_q16",
            type: QuestionType.trueFalse,
            prompt: "C dilinde dizi isimleri ifadeler içinde kullanıldığında dizinin ilk elemanının bellek adresine (pointer) dönüşür (decay).",
            explanation: "Doğrudur, 'arr' ifadesi '&arr[0]' adresi ile eşdeğerdir.",
            isTrue: true,
          ),
          Question(
            id: "c_unit_3_l2_q17",
            type: QuestionType.trueFalse,
            prompt: "Stack belleğinde oluşturulan yerel değişkenler fonksiyon sonlandığında da bellekte kalmaya devam eder ve serbest bırakılması için free() gerekir.",
            explanation: "Yanlıştır! Stack bellek fonksiyon bitiminde otomatik temizlenir; free() sadece heap (malloc) için geçerlidir.",
            isTrue: false,
          ),
          Question(
            id: "c_unit_3_l2_q18",
            type: QuestionType.matching,
            prompt: "C bellek kavramlarını doğru açıklamalarıyla eşleştirin.",
            explanation: "C'de bellek güvenliği doğrudan yazılımcının sorumluluğundadır.",
            matchingPairs: [MatchingPair(left: "malloc", right: "Heap üzerinde başlatılmamış bellek tahsisi"), MatchingPair(left: "free", right: "Dinamik belleği sisteme iade etme"), MatchingPair(left: "Valgrind", right: "Bellek sızıntılarını tespit eden analiz aracı")],
          ),
        ],
      ),
      Lesson(
        id: "c_unit_3_l3",
        title: "İşaretçi (Pointer) Tanımlama & Syntax (*)",
        description: "İşaretçinin kendisinin de bir değişken olması",
        xpReward: 35,
        gemReward: 12,
        isUnitExam: false,
        questions: [
          Question(
            id: "c_unit_3_l3_q1",
            type: QuestionType.conceptCard,
            conceptTitle: "İşaretçi (Pointer) Tanımlama & Syntax (*) - Hap Bilgi",
            rule: "C dilinde işaretçiler (pointers) doğrudan bellek adreslerini saklar. '&' operatörü bir değişkenin adresini alırken, '*' (dereference) o adresteki veriye erişir veya değiştirir.",
            codeExample: r'''#include <stdio.h>
#include <stdlib.h>

int main() {
    int x = 100;
    int *ptr = &x;
    
    printf("x Degeri: %d\n", *ptr);
    printf("x Bellek Adresi: %p\n", (void*)ptr);
    return 0;
}''',
            devTip: "malloc ile tahsis edilen her bayt bellek için mutlaka bir free() çağrısı yapılmalıdır, aksi halde Memory Leak oluşur.",
            iconEmoji: "⚡",
          ),
          Question(
            id: "c_unit_3_l3_q2",
            type: QuestionType.multipleChoice,
            prompt: "C programlama dilinde GCC derleme sürecinin doğru sırası aşağıdakilerden hangisidir?",
            options: ["Preprocessor -> Compiler -> Assembler -> Linker", "Compiler -> Preprocessor -> Linker -> Assembler", "Assembler -> Compiler -> Linker -> Preprocessor", "Linker -> Assembler -> Compiler -> Preprocessor"],
            correctIndex: 0,
            explanation: "Önce makrolar ve headerlar çözülür (cpp), C kodu Assembly'ye derlenir (cc1), makine koduna çevrilir (as), kütüphaneler bağlanır (ld).",
          ),
          Question(
            id: "c_unit_3_l3_q3",
            type: QuestionType.multipleChoice,
            prompt: "64-bit modern bir mimaride standart bir işaretçi (pointer - int*, char*, void*) değişkeni bellekte kaç bayt yer kaplar?",
            codeSnippet: r'''printf("%zu", sizeof(int*));''',
            options: ["8 bayt", "4 bayt", "2 bayt", "16 bayt"],
            correctIndex: 0,
            explanation: "64-bit mimarilerde bellek adresleri 64 bit yani tam 8 bayttır. İşaretçinin tipi ne olursa olsun adres boyutu 8 bayttır.",
          ),
          Question(
            id: "c_unit_3_l3_q4",
            type: QuestionType.multipleChoice,
            prompt: "Bir struct içindeki bir işaretçi elemana erişirken '.' yerine hangi pratik operatör kullanılır?",
            codeSnippet: r'''struct User *u = getUser();
u___name = "Ahmet";''',
            options: ["-> (Ok operatörü)", ".", "::", "=>"],
            correctIndex: 0,
            explanation: "'u->name', '(*u).name' yazımının daha okunaklı ve standart kısayoludur.",
          ),
          Question(
            id: "c_unit_3_l3_q5",
            type: QuestionType.multipleChoice,
            prompt: "Herhangi bir veri tipine ait bellek adresini tutabilen jenerik (tip bağımsız) işaretçi tipi hangisidir?",
            codeSnippet: r'''___ generic_ptr = &x;''',
            options: ["void*", "any*", "object*", "generic*"],
            correctIndex: 0,
            explanation: "'void*' tipi belirsiz jenerik bir işaretçidir; doğrudan dereference edilemez, cast edilmesi gerekir.",
          ),
          Question(
            id: "c_unit_3_l3_q6",
            type: QuestionType.multipleChoice,
            prompt: "Serbest bırakılmış (free edilmiş) bir işaretçiyi kullanmaya devam etme hatasına ne ad verilir?",
            codeSnippet: r'''free(ptr);
printf("%d", *ptr); // HATA!''',
            options: ["Dangling Pointer (Askıda Kalan İşaretçi)", "Stack Overflow", "Memory Leak", "Deadlock"],
            correctIndex: 0,
            explanation: "free edildikten sonra hala o adresi göstermeye devam eden işaretçiye dangling pointer denir; 'ptr = NULL' yapılarak önlenir.",
          ),
          Question(
            id: "c_unit_3_l3_q7",
            type: QuestionType.multipleChoice,
            prompt: "C programlarında bellek sızıntılarını (memory leak) ve geçersiz bellek erişimlerini tespit etmek için en popüler Linux aracı hangisidir?",
            codeSnippet: r'''$ ___ --leak-check=full ./program''',
            options: ["valgrind", "gdb", "perf", "strace"],
            correctIndex: 0,
            explanation: "Valgrind (özellikle memcheck aracı) C/C++ programlarında bellek yönetim hatalarını ayrıntılı raporlar.",
          ),
          Question(
            id: "c_unit_3_l3_q8",
            type: QuestionType.multipleChoice,
            prompt: "Aşağıdaki bit düzeyinde (bitwise) operatörlerden hangisi bitleri 1 basamak sola kaydırarak 2 ile çarpmayı sağlar?",
            codeSnippet: r'''int x = 5;
int y = x ___ 1; // y = 10 olur''',
            options: ["<<", ">>", "&", "|"],
            correctIndex: 0,
            explanation: "Sola kaydırma (<< n) operatörü sayının değerini 2^n ile çarpar.",
          ),
          Question(
            id: "c_unit_3_l3_q9",
            type: QuestionType.multipleChoice,
            prompt: "C'de dosya açmak ve bir dosya işaretçisi (FILE*) elde etmek için hangi standart fonksiyon kullanılır?",
            codeSnippet: r'''FILE *f = ___("data.txt", "r");''',
            options: ["fopen", "open", "file_open", "create_file"],
            correctIndex: 0,
            explanation: "'fopen(dosya_adi, mod)' dosyayı belirtilen modda (r, w, a, rb, wb) açar.",
          ),
          Question(
            id: "c_unit_3_l3_q10",
            type: QuestionType.multipleChoice,
            prompt: "Bir header dosyasının birden fazla kez derlemeye dahil edilmesini (redefinition) önlemek için ne kullanılır?",
            codeSnippet: r'''#ifndef MY_HEADER_H
#define MY_HEADER_H
// ...
#endif''',
            options: ["Header Guards (#ifndef / #define)", "namespace", "pragma private", "module"],
            correctIndex: 0,
            explanation: "Header guards veya '#pragma once' başlık dosyalarının mükerrer include edilmesini engeller.",
          ),
          Question(
            id: "c_unit_3_l3_q11",
            type: QuestionType.multipleChoice,
            prompt: "Tüm üyelerinin bellekte AYNI başlangıç adresini paylaştığı ve en büyük üyesi kadar yer kaplayan yapı hangisidir?",
            codeSnippet: r'''___ Data {
    int i;
    float f;
    char str[20];
};''',
            options: ["union", "struct", "class", "shared"],
            correctIndex: 0,
            explanation: "'union' içindeki tüm elemanlar aynı bellek alanını ortaklaşa kullanır; aynı anda sadece biri geçerli değer tutar.",
          ),
          Question(
            id: "c_unit_3_l3_q12",
            type: QuestionType.multipleChoice,
            prompt: "C dilinde bir değişkenin bellekteki adresini elde etmek için hangi operatör kullanılır?",
            codeSnippet: r'''int x = 10;
int *ptr = ___x;''',
            options: ["& (Address-of)", "* (Dereference)", "% (Mod)", "\$ (Value)"],
            correctIndex: 0,
            explanation: "'&' operatörü bir değişkenin RAM üzerindeki başlangıç adresini döner.",
          ),
          Question(
            id: "c_unit_3_l3_q13",
            type: QuestionType.fillInTheBlank,
            prompt: "Geçersiz veya henüz atanmamış bir işaretçiye güvenli başlangıç değeri olarak _____ atanmalıdır.",
            explanation: "İşaretçilere NULL atamak tanımsız belleğe erişimi ve segmentation fault hatalarını engellemeye yardımcı olur.",
            blankOptions: ["NULL", "0xFF", "void", "NaN"],
            correctBlankAnswer: "NULL",
          ),
          Question(
            id: "c_unit_3_l3_q14",
            type: QuestionType.fillInTheBlank,
            prompt: "Bir veri tipinin bellekte kaç bayt yer kapladığını öğrenmek için derleme zamanı operatörü olan _____ kullanılır.",
            explanation: "sizeof(tip) veya sizeof(degisken) bayt cinsinden bellek boyutunu size_t olarak döner.",
            blankOptions: ["sizeof", "lengthof", "bytesize", "countof"],
            correctBlankAnswer: "sizeof",
          ),
          Question(
            id: "c_unit_3_l3_q15",
            type: QuestionType.fillInTheBlank,
            prompt: "Açılmış bir dosya işaretçisini işletim sistemine geri iade etmek için _____ fonksiyonu çağrılır.",
            explanation: "fclose(FILE *stream) dosya tamponlarını diske yazar ve kaynakları kapatır.",
            blankOptions: ["fclose", "close", "file_exit", "dispose"],
            correctBlankAnswer: "fclose",
          ),
          Question(
            id: "c_unit_3_l3_q16",
            type: QuestionType.trueFalse,
            prompt: "C dilinde dizi isimleri ifadeler içinde kullanıldığında dizinin ilk elemanının bellek adresine (pointer) dönüşür (decay).",
            explanation: "Doğrudur, 'arr' ifadesi '&arr[0]' adresi ile eşdeğerdir.",
            isTrue: true,
          ),
          Question(
            id: "c_unit_3_l3_q17",
            type: QuestionType.trueFalse,
            prompt: "Stack belleğinde oluşturulan yerel değişkenler fonksiyon sonlandığında da bellekte kalmaya devam eder ve serbest bırakılması için free() gerekir.",
            explanation: "Yanlıştır! Stack bellek fonksiyon bitiminde otomatik temizlenir; free() sadece heap (malloc) için geçerlidir.",
            isTrue: false,
          ),
          Question(
            id: "c_unit_3_l3_q18",
            type: QuestionType.matching,
            prompt: "C bellek kavramlarını doğru açıklamalarıyla eşleştirin.",
            explanation: "C'de bellek güvenliği doğrudan yazılımcının sorumluluğundadır.",
            matchingPairs: [MatchingPair(left: "malloc", right: "Heap üzerinde başlatılmamış bellek tahsisi"), MatchingPair(left: "free", right: "Dinamik belleği sisteme iade etme"), MatchingPair(left: "Valgrind", right: "Bellek sızıntılarını tespit eden analiz aracı")],
          ),
        ],
      ),
      Lesson(
        id: "c_unit_3_l4",
        title: "Dereferencing (*) ile Adresteki Değeri Okuma/Yazma",
        description: "İşaret edilen bellek hücresine müdahale",
        xpReward: 35,
        gemReward: 12,
        isUnitExam: false,
        questions: [
          Question(
            id: "c_unit_3_l4_q1",
            type: QuestionType.conceptCard,
            conceptTitle: "Dereferencing (*) ile Adresteki Değeri Okuma/Yazma - Hap Bilgi",
            rule: "C dilinde işaretçiler (pointers) doğrudan bellek adreslerini saklar. '&' operatörü bir değişkenin adresini alırken, '*' (dereference) o adresteki veriye erişir veya değiştirir.",
            codeExample: r'''#include <stdio.h>
#include <stdlib.h>

int main() {
    int x = 100;
    int *ptr = &x;
    
    printf("x Degeri: %d\n", *ptr);
    printf("x Bellek Adresi: %p\n", (void*)ptr);
    return 0;
}''',
            devTip: "malloc ile tahsis edilen her bayt bellek için mutlaka bir free() çağrısı yapılmalıdır, aksi halde Memory Leak oluşur.",
            iconEmoji: "⚡",
          ),
          Question(
            id: "c_unit_3_l4_q2",
            type: QuestionType.multipleChoice,
            prompt: "Bir struct içindeki bir işaretçi elemana erişirken '.' yerine hangi pratik operatör kullanılır?",
            codeSnippet: r'''struct User *u = getUser();
u___name = "Ahmet";''',
            options: ["-> (Ok operatörü)", ".", "::", "=>"],
            correctIndex: 0,
            explanation: "'u->name', '(*u).name' yazımının daha okunaklı ve standart kısayoludur.",
          ),
          Question(
            id: "c_unit_3_l4_q3",
            type: QuestionType.multipleChoice,
            prompt: "Herhangi bir veri tipine ait bellek adresini tutabilen jenerik (tip bağımsız) işaretçi tipi hangisidir?",
            codeSnippet: r'''___ generic_ptr = &x;''',
            options: ["void*", "any*", "object*", "generic*"],
            correctIndex: 0,
            explanation: "'void*' tipi belirsiz jenerik bir işaretçidir; doğrudan dereference edilemez, cast edilmesi gerekir.",
          ),
          Question(
            id: "c_unit_3_l4_q4",
            type: QuestionType.multipleChoice,
            prompt: "Serbest bırakılmış (free edilmiş) bir işaretçiyi kullanmaya devam etme hatasına ne ad verilir?",
            codeSnippet: r'''free(ptr);
printf("%d", *ptr); // HATA!''',
            options: ["Dangling Pointer (Askıda Kalan İşaretçi)", "Stack Overflow", "Memory Leak", "Deadlock"],
            correctIndex: 0,
            explanation: "free edildikten sonra hala o adresi göstermeye devam eden işaretçiye dangling pointer denir; 'ptr = NULL' yapılarak önlenir.",
          ),
          Question(
            id: "c_unit_3_l4_q5",
            type: QuestionType.multipleChoice,
            prompt: "C programlarında bellek sızıntılarını (memory leak) ve geçersiz bellek erişimlerini tespit etmek için en popüler Linux aracı hangisidir?",
            codeSnippet: r'''$ ___ --leak-check=full ./program''',
            options: ["valgrind", "gdb", "perf", "strace"],
            correctIndex: 0,
            explanation: "Valgrind (özellikle memcheck aracı) C/C++ programlarında bellek yönetim hatalarını ayrıntılı raporlar.",
          ),
          Question(
            id: "c_unit_3_l4_q6",
            type: QuestionType.multipleChoice,
            prompt: "Aşağıdaki bit düzeyinde (bitwise) operatörlerden hangisi bitleri 1 basamak sola kaydırarak 2 ile çarpmayı sağlar?",
            codeSnippet: r'''int x = 5;
int y = x ___ 1; // y = 10 olur''',
            options: ["<<", ">>", "&", "|"],
            correctIndex: 0,
            explanation: "Sola kaydırma (<< n) operatörü sayının değerini 2^n ile çarpar.",
          ),
          Question(
            id: "c_unit_3_l4_q7",
            type: QuestionType.multipleChoice,
            prompt: "C'de dosya açmak ve bir dosya işaretçisi (FILE*) elde etmek için hangi standart fonksiyon kullanılır?",
            codeSnippet: r'''FILE *f = ___("data.txt", "r");''',
            options: ["fopen", "open", "file_open", "create_file"],
            correctIndex: 0,
            explanation: "'fopen(dosya_adi, mod)' dosyayı belirtilen modda (r, w, a, rb, wb) açar.",
          ),
          Question(
            id: "c_unit_3_l4_q8",
            type: QuestionType.multipleChoice,
            prompt: "Bir header dosyasının birden fazla kez derlemeye dahil edilmesini (redefinition) önlemek için ne kullanılır?",
            codeSnippet: r'''#ifndef MY_HEADER_H
#define MY_HEADER_H
// ...
#endif''',
            options: ["Header Guards (#ifndef / #define)", "namespace", "pragma private", "module"],
            correctIndex: 0,
            explanation: "Header guards veya '#pragma once' başlık dosyalarının mükerrer include edilmesini engeller.",
          ),
          Question(
            id: "c_unit_3_l4_q9",
            type: QuestionType.multipleChoice,
            prompt: "Tüm üyelerinin bellekte AYNI başlangıç adresini paylaştığı ve en büyük üyesi kadar yer kaplayan yapı hangisidir?",
            codeSnippet: r'''___ Data {
    int i;
    float f;
    char str[20];
};''',
            options: ["union", "struct", "class", "shared"],
            correctIndex: 0,
            explanation: "'union' içindeki tüm elemanlar aynı bellek alanını ortaklaşa kullanır; aynı anda sadece biri geçerli değer tutar.",
          ),
          Question(
            id: "c_unit_3_l4_q10",
            type: QuestionType.multipleChoice,
            prompt: "C dilinde bir değişkenin bellekteki adresini elde etmek için hangi operatör kullanılır?",
            codeSnippet: r'''int x = 10;
int *ptr = ___x;''',
            options: ["& (Address-of)", "* (Dereference)", "% (Mod)", "\$ (Value)"],
            correctIndex: 0,
            explanation: "'&' operatörü bir değişkenin RAM üzerindeki başlangıç adresini döner.",
          ),
          Question(
            id: "c_unit_3_l4_q11",
            type: QuestionType.multipleChoice,
            prompt: "Bir işaretçinin (pointer) işaret ettiği bellek adresindeki veriye erişmek veya onu değiştirmek için hangi işlem yapılır?",
            codeSnippet: r'''int x = 5;
int *p = &x;
___p = 20; // x artik 20 olur''',
            options: ["* (Dereference)", "&", "->", "."],
            correctIndex: 0,
            explanation: "'*p' dereferencing yaparak işaretçinin tuttuğu adresteki asıl değere erişir.",
          ),
          Question(
            id: "c_unit_3_l4_q12",
            type: QuestionType.multipleChoice,
            prompt: "Heap bellekte dinamik olarak bayt cinsinden bellek tahsis etmek için hangi standart kütüphane fonksiyonu kullanılır?",
            codeSnippet: r'''int *arr = (int*)___(10 * sizeof(int));''',
            options: ["malloc", "alloc", "new", "heap_get"],
            correctIndex: 0,
            explanation: "'malloc(size_t size)' heap bölgesinde istenen bayt kadar bellek ayırır ve void* işaretçi döner.",
          ),
          Question(
            id: "c_unit_3_l4_q13",
            type: QuestionType.fillInTheBlank,
            prompt: "Geçersiz veya henüz atanmamış bir işaretçiye güvenli başlangıç değeri olarak _____ atanmalıdır.",
            explanation: "İşaretçilere NULL atamak tanımsız belleğe erişimi ve segmentation fault hatalarını engellemeye yardımcı olur.",
            blankOptions: ["NULL", "0xFF", "void", "NaN"],
            correctBlankAnswer: "NULL",
          ),
          Question(
            id: "c_unit_3_l4_q14",
            type: QuestionType.fillInTheBlank,
            prompt: "Bir veri tipinin bellekte kaç bayt yer kapladığını öğrenmek için derleme zamanı operatörü olan _____ kullanılır.",
            explanation: "sizeof(tip) veya sizeof(degisken) bayt cinsinden bellek boyutunu size_t olarak döner.",
            blankOptions: ["sizeof", "lengthof", "bytesize", "countof"],
            correctBlankAnswer: "sizeof",
          ),
          Question(
            id: "c_unit_3_l4_q15",
            type: QuestionType.fillInTheBlank,
            prompt: "Açılmış bir dosya işaretçisini işletim sistemine geri iade etmek için _____ fonksiyonu çağrılır.",
            explanation: "fclose(FILE *stream) dosya tamponlarını diske yazar ve kaynakları kapatır.",
            blankOptions: ["fclose", "close", "file_exit", "dispose"],
            correctBlankAnswer: "fclose",
          ),
          Question(
            id: "c_unit_3_l4_q16",
            type: QuestionType.trueFalse,
            prompt: "C dilinde dizi isimleri ifadeler içinde kullanıldığında dizinin ilk elemanının bellek adresine (pointer) dönüşür (decay).",
            explanation: "Doğrudur, 'arr' ifadesi '&arr[0]' adresi ile eşdeğerdir.",
            isTrue: true,
          ),
          Question(
            id: "c_unit_3_l4_q17",
            type: QuestionType.trueFalse,
            prompt: "Stack belleğinde oluşturulan yerel değişkenler fonksiyon sonlandığında da bellekte kalmaya devam eder ve serbest bırakılması için free() gerekir.",
            explanation: "Yanlıştır! Stack bellek fonksiyon bitiminde otomatik temizlenir; free() sadece heap (malloc) için geçerlidir.",
            isTrue: false,
          ),
          Question(
            id: "c_unit_3_l4_q18",
            type: QuestionType.matching,
            prompt: "C bellek kavramlarını doğru açıklamalarıyla eşleştirin.",
            explanation: "C'de bellek güvenliği doğrudan yazılımcının sorumluluğundadır.",
            matchingPairs: [MatchingPair(left: "malloc", right: "Heap üzerinde başlatılmamış bellek tahsisi"), MatchingPair(left: "free", right: "Dinamik belleği sisteme iade etme"), MatchingPair(left: "Valgrind", right: "Bellek sızıntılarını tespit eden analiz aracı")],
          ),
        ],
      ),
      Lesson(
        id: "c_unit_3_l5",
        title: "NULL İşaretçi & Neden NULL Atamalıyız?",
        description: "Tanımsız bellek erişimlerini (Segfault) önleme",
        xpReward: 35,
        gemReward: 12,
        isUnitExam: false,
        questions: [
          Question(
            id: "c_unit_3_l5_q1",
            type: QuestionType.conceptCard,
            conceptTitle: "NULL İşaretçi & Neden NULL Atamalıyız? - Hap Bilgi",
            rule: "C dilinde işaretçiler (pointers) doğrudan bellek adreslerini saklar. '&' operatörü bir değişkenin adresini alırken, '*' (dereference) o adresteki veriye erişir veya değiştirir.",
            codeExample: r'''#include <stdio.h>
#include <stdlib.h>

int main() {
    int x = 100;
    int *ptr = &x;
    
    printf("x Degeri: %d\n", *ptr);
    printf("x Bellek Adresi: %p\n", (void*)ptr);
    return 0;
}''',
            devTip: "malloc ile tahsis edilen her bayt bellek için mutlaka bir free() çağrısı yapılmalıdır, aksi halde Memory Leak oluşur.",
            iconEmoji: "⚡",
          ),
          Question(
            id: "c_unit_3_l5_q2",
            type: QuestionType.multipleChoice,
            prompt: "Serbest bırakılmış (free edilmiş) bir işaretçiyi kullanmaya devam etme hatasına ne ad verilir?",
            codeSnippet: r'''free(ptr);
printf("%d", *ptr); // HATA!''',
            options: ["Dangling Pointer (Askıda Kalan İşaretçi)", "Stack Overflow", "Memory Leak", "Deadlock"],
            correctIndex: 0,
            explanation: "free edildikten sonra hala o adresi göstermeye devam eden işaretçiye dangling pointer denir; 'ptr = NULL' yapılarak önlenir.",
          ),
          Question(
            id: "c_unit_3_l5_q3",
            type: QuestionType.multipleChoice,
            prompt: "C programlarında bellek sızıntılarını (memory leak) ve geçersiz bellek erişimlerini tespit etmek için en popüler Linux aracı hangisidir?",
            codeSnippet: r'''$ ___ --leak-check=full ./program''',
            options: ["valgrind", "gdb", "perf", "strace"],
            correctIndex: 0,
            explanation: "Valgrind (özellikle memcheck aracı) C/C++ programlarında bellek yönetim hatalarını ayrıntılı raporlar.",
          ),
          Question(
            id: "c_unit_3_l5_q4",
            type: QuestionType.multipleChoice,
            prompt: "Aşağıdaki bit düzeyinde (bitwise) operatörlerden hangisi bitleri 1 basamak sola kaydırarak 2 ile çarpmayı sağlar?",
            codeSnippet: r'''int x = 5;
int y = x ___ 1; // y = 10 olur''',
            options: ["<<", ">>", "&", "|"],
            correctIndex: 0,
            explanation: "Sola kaydırma (<< n) operatörü sayının değerini 2^n ile çarpar.",
          ),
          Question(
            id: "c_unit_3_l5_q5",
            type: QuestionType.multipleChoice,
            prompt: "C'de dosya açmak ve bir dosya işaretçisi (FILE*) elde etmek için hangi standart fonksiyon kullanılır?",
            codeSnippet: r'''FILE *f = ___("data.txt", "r");''',
            options: ["fopen", "open", "file_open", "create_file"],
            correctIndex: 0,
            explanation: "'fopen(dosya_adi, mod)' dosyayı belirtilen modda (r, w, a, rb, wb) açar.",
          ),
          Question(
            id: "c_unit_3_l5_q6",
            type: QuestionType.multipleChoice,
            prompt: "Bir header dosyasının birden fazla kez derlemeye dahil edilmesini (redefinition) önlemek için ne kullanılır?",
            codeSnippet: r'''#ifndef MY_HEADER_H
#define MY_HEADER_H
// ...
#endif''',
            options: ["Header Guards (#ifndef / #define)", "namespace", "pragma private", "module"],
            correctIndex: 0,
            explanation: "Header guards veya '#pragma once' başlık dosyalarının mükerrer include edilmesini engeller.",
          ),
          Question(
            id: "c_unit_3_l5_q7",
            type: QuestionType.multipleChoice,
            prompt: "Tüm üyelerinin bellekte AYNI başlangıç adresini paylaştığı ve en büyük üyesi kadar yer kaplayan yapı hangisidir?",
            codeSnippet: r'''___ Data {
    int i;
    float f;
    char str[20];
};''',
            options: ["union", "struct", "class", "shared"],
            correctIndex: 0,
            explanation: "'union' içindeki tüm elemanlar aynı bellek alanını ortaklaşa kullanır; aynı anda sadece biri geçerli değer tutar.",
          ),
          Question(
            id: "c_unit_3_l5_q8",
            type: QuestionType.multipleChoice,
            prompt: "C dilinde bir değişkenin bellekteki adresini elde etmek için hangi operatör kullanılır?",
            codeSnippet: r'''int x = 10;
int *ptr = ___x;''',
            options: ["& (Address-of)", "* (Dereference)", "% (Mod)", "\$ (Value)"],
            correctIndex: 0,
            explanation: "'&' operatörü bir değişkenin RAM üzerindeki başlangıç adresini döner.",
          ),
          Question(
            id: "c_unit_3_l5_q9",
            type: QuestionType.multipleChoice,
            prompt: "Bir işaretçinin (pointer) işaret ettiği bellek adresindeki veriye erişmek veya onu değiştirmek için hangi işlem yapılır?",
            codeSnippet: r'''int x = 5;
int *p = &x;
___p = 20; // x artik 20 olur''',
            options: ["* (Dereference)", "&", "->", "."],
            correctIndex: 0,
            explanation: "'*p' dereferencing yaparak işaretçinin tuttuğu adresteki asıl değere erişir.",
          ),
          Question(
            id: "c_unit_3_l5_q10",
            type: QuestionType.multipleChoice,
            prompt: "Heap bellekte dinamik olarak bayt cinsinden bellek tahsis etmek için hangi standart kütüphane fonksiyonu kullanılır?",
            codeSnippet: r'''int *arr = (int*)___(10 * sizeof(int));''',
            options: ["malloc", "alloc", "new", "heap_get"],
            correctIndex: 0,
            explanation: "'malloc(size_t size)' heap bölgesinde istenen bayt kadar bellek ayırır ve void* işaretçi döner.",
          ),
          Question(
            id: "c_unit_3_l5_q11",
            type: QuestionType.multipleChoice,
            prompt: "malloc veya calloc ile tahsis edilen dinamik belleğin sisteme iade edilmesi için hangi fonksiyon çağrılmalıdır?",
            codeSnippet: r'''int *buf = malloc(1024);
// ... kullanim ...
___(buf);''',
            options: ["free", "delete", "release", "dispose"],
            correctIndex: 0,
            explanation: "'free(ptr)' heap bellekte ayrılan alanı serbest bırakır. Çağrılmazsa 'Memory Leak' oluşur.",
          ),
          Question(
            id: "c_unit_3_l5_q12",
            type: QuestionType.multipleChoice,
            prompt: "Tahsis ettiği belleği otomatik olarak sıfırlarla (0 baytları) dolduran dinamik bellek fonksiyonu hangisidir?",
            codeSnippet: r'''int *p = ___(100, sizeof(int));''',
            options: ["calloc", "malloc", "realloc", "zalloc"],
            correctIndex: 0,
            explanation: "'calloc(num, size)' eleman sayısı ve eleman boyutu alır, ayrılan tüm bellek hücrelerini 0 ile başlatır.",
          ),
          Question(
            id: "c_unit_3_l5_q13",
            type: QuestionType.fillInTheBlank,
            prompt: "Geçersiz veya henüz atanmamış bir işaretçiye güvenli başlangıç değeri olarak _____ atanmalıdır.",
            explanation: "İşaretçilere NULL atamak tanımsız belleğe erişimi ve segmentation fault hatalarını engellemeye yardımcı olur.",
            blankOptions: ["NULL", "0xFF", "void", "NaN"],
            correctBlankAnswer: "NULL",
          ),
          Question(
            id: "c_unit_3_l5_q14",
            type: QuestionType.fillInTheBlank,
            prompt: "Bir veri tipinin bellekte kaç bayt yer kapladığını öğrenmek için derleme zamanı operatörü olan _____ kullanılır.",
            explanation: "sizeof(tip) veya sizeof(degisken) bayt cinsinden bellek boyutunu size_t olarak döner.",
            blankOptions: ["sizeof", "lengthof", "bytesize", "countof"],
            correctBlankAnswer: "sizeof",
          ),
          Question(
            id: "c_unit_3_l5_q15",
            type: QuestionType.fillInTheBlank,
            prompt: "Açılmış bir dosya işaretçisini işletim sistemine geri iade etmek için _____ fonksiyonu çağrılır.",
            explanation: "fclose(FILE *stream) dosya tamponlarını diske yazar ve kaynakları kapatır.",
            blankOptions: ["fclose", "close", "file_exit", "dispose"],
            correctBlankAnswer: "fclose",
          ),
          Question(
            id: "c_unit_3_l5_q16",
            type: QuestionType.trueFalse,
            prompt: "C dilinde dizi isimleri ifadeler içinde kullanıldığında dizinin ilk elemanının bellek adresine (pointer) dönüşür (decay).",
            explanation: "Doğrudur, 'arr' ifadesi '&arr[0]' adresi ile eşdeğerdir.",
            isTrue: true,
          ),
          Question(
            id: "c_unit_3_l5_q17",
            type: QuestionType.trueFalse,
            prompt: "Stack belleğinde oluşturulan yerel değişkenler fonksiyon sonlandığında da bellekte kalmaya devam eder ve serbest bırakılması için free() gerekir.",
            explanation: "Yanlıştır! Stack bellek fonksiyon bitiminde otomatik temizlenir; free() sadece heap (malloc) için geçerlidir.",
            isTrue: false,
          ),
          Question(
            id: "c_unit_3_l5_q18",
            type: QuestionType.matching,
            prompt: "C bellek kavramlarını doğru açıklamalarıyla eşleştirin.",
            explanation: "C'de bellek güvenliği doğrudan yazılımcının sorumluluğundadır.",
            matchingPairs: [MatchingPair(left: "malloc", right: "Heap üzerinde başlatılmamış bellek tahsisi"), MatchingPair(left: "free", right: "Dinamik belleği sisteme iade etme"), MatchingPair(left: "Valgrind", right: "Bellek sızıntılarını tespit eden analiz aracı")],
          ),
        ],
      ),
      Lesson(
        id: "c_unit_3_l6",
        title: "void* (Jenerik İşaretçi) Mimarisi",
        description: "Tipten bağımsız bellek işaretçisi ve cast kuralları",
        xpReward: 35,
        gemReward: 12,
        isUnitExam: false,
        questions: [
          Question(
            id: "c_unit_3_l6_q1",
            type: QuestionType.conceptCard,
            conceptTitle: "void* (Jenerik İşaretçi) Mimarisi - Hap Bilgi",
            rule: "C dilinde işaretçiler (pointers) doğrudan bellek adreslerini saklar. '&' operatörü bir değişkenin adresini alırken, '*' (dereference) o adresteki veriye erişir veya değiştirir.",
            codeExample: r'''#include <stdio.h>
#include <stdlib.h>

int main() {
    int x = 100;
    int *ptr = &x;
    
    printf("x Degeri: %d\n", *ptr);
    printf("x Bellek Adresi: %p\n", (void*)ptr);
    return 0;
}''',
            devTip: "malloc ile tahsis edilen her bayt bellek için mutlaka bir free() çağrısı yapılmalıdır, aksi halde Memory Leak oluşur.",
            iconEmoji: "⚡",
          ),
          Question(
            id: "c_unit_3_l6_q2",
            type: QuestionType.multipleChoice,
            prompt: "Aşağıdaki bit düzeyinde (bitwise) operatörlerden hangisi bitleri 1 basamak sola kaydırarak 2 ile çarpmayı sağlar?",
            codeSnippet: r'''int x = 5;
int y = x ___ 1; // y = 10 olur''',
            options: ["<<", ">>", "&", "|"],
            correctIndex: 0,
            explanation: "Sola kaydırma (<< n) operatörü sayının değerini 2^n ile çarpar.",
          ),
          Question(
            id: "c_unit_3_l6_q3",
            type: QuestionType.multipleChoice,
            prompt: "C'de dosya açmak ve bir dosya işaretçisi (FILE*) elde etmek için hangi standart fonksiyon kullanılır?",
            codeSnippet: r'''FILE *f = ___("data.txt", "r");''',
            options: ["fopen", "open", "file_open", "create_file"],
            correctIndex: 0,
            explanation: "'fopen(dosya_adi, mod)' dosyayı belirtilen modda (r, w, a, rb, wb) açar.",
          ),
          Question(
            id: "c_unit_3_l6_q4",
            type: QuestionType.multipleChoice,
            prompt: "Bir header dosyasının birden fazla kez derlemeye dahil edilmesini (redefinition) önlemek için ne kullanılır?",
            codeSnippet: r'''#ifndef MY_HEADER_H
#define MY_HEADER_H
// ...
#endif''',
            options: ["Header Guards (#ifndef / #define)", "namespace", "pragma private", "module"],
            correctIndex: 0,
            explanation: "Header guards veya '#pragma once' başlık dosyalarının mükerrer include edilmesini engeller.",
          ),
          Question(
            id: "c_unit_3_l6_q5",
            type: QuestionType.multipleChoice,
            prompt: "Tüm üyelerinin bellekte AYNI başlangıç adresini paylaştığı ve en büyük üyesi kadar yer kaplayan yapı hangisidir?",
            codeSnippet: r'''___ Data {
    int i;
    float f;
    char str[20];
};''',
            options: ["union", "struct", "class", "shared"],
            correctIndex: 0,
            explanation: "'union' içindeki tüm elemanlar aynı bellek alanını ortaklaşa kullanır; aynı anda sadece biri geçerli değer tutar.",
          ),
          Question(
            id: "c_unit_3_l6_q6",
            type: QuestionType.multipleChoice,
            prompt: "C dilinde bir değişkenin bellekteki adresini elde etmek için hangi operatör kullanılır?",
            codeSnippet: r'''int x = 10;
int *ptr = ___x;''',
            options: ["& (Address-of)", "* (Dereference)", "% (Mod)", "\$ (Value)"],
            correctIndex: 0,
            explanation: "'&' operatörü bir değişkenin RAM üzerindeki başlangıç adresini döner.",
          ),
          Question(
            id: "c_unit_3_l6_q7",
            type: QuestionType.multipleChoice,
            prompt: "Bir işaretçinin (pointer) işaret ettiği bellek adresindeki veriye erişmek veya onu değiştirmek için hangi işlem yapılır?",
            codeSnippet: r'''int x = 5;
int *p = &x;
___p = 20; // x artik 20 olur''',
            options: ["* (Dereference)", "&", "->", "."],
            correctIndex: 0,
            explanation: "'*p' dereferencing yaparak işaretçinin tuttuğu adresteki asıl değere erişir.",
          ),
          Question(
            id: "c_unit_3_l6_q8",
            type: QuestionType.multipleChoice,
            prompt: "Heap bellekte dinamik olarak bayt cinsinden bellek tahsis etmek için hangi standart kütüphane fonksiyonu kullanılır?",
            codeSnippet: r'''int *arr = (int*)___(10 * sizeof(int));''',
            options: ["malloc", "alloc", "new", "heap_get"],
            correctIndex: 0,
            explanation: "'malloc(size_t size)' heap bölgesinde istenen bayt kadar bellek ayırır ve void* işaretçi döner.",
          ),
          Question(
            id: "c_unit_3_l6_q9",
            type: QuestionType.multipleChoice,
            prompt: "malloc veya calloc ile tahsis edilen dinamik belleğin sisteme iade edilmesi için hangi fonksiyon çağrılmalıdır?",
            codeSnippet: r'''int *buf = malloc(1024);
// ... kullanim ...
___(buf);''',
            options: ["free", "delete", "release", "dispose"],
            correctIndex: 0,
            explanation: "'free(ptr)' heap bellekte ayrılan alanı serbest bırakır. Çağrılmazsa 'Memory Leak' oluşur.",
          ),
          Question(
            id: "c_unit_3_l6_q10",
            type: QuestionType.multipleChoice,
            prompt: "Tahsis ettiği belleği otomatik olarak sıfırlarla (0 baytları) dolduran dinamik bellek fonksiyonu hangisidir?",
            codeSnippet: r'''int *p = ___(100, sizeof(int));''',
            options: ["calloc", "malloc", "realloc", "zalloc"],
            correctIndex: 0,
            explanation: "'calloc(num, size)' eleman sayısı ve eleman boyutu alır, ayrılan tüm bellek hücrelerini 0 ile başlatır.",
          ),
          Question(
            id: "c_unit_3_l6_q11",
            type: QuestionType.multipleChoice,
            prompt: "Daha önce ayrılmış dinamik bir bellek bloğunun boyutunu veri kaybı olmadan büyütmek veya küçültmek için ne kullanılır?",
            codeSnippet: r'''ptr = ___(ptr, new_size);''',
            options: ["realloc", "resize", "remalloc", "expand"],
            correctIndex: 0,
            explanation: "'realloc' mevcut bloğu genişletir veya yeni bir konuma taşıyarak eski veriyi kopyalar.",
          ),
          Question(
            id: "c_unit_3_l6_q12",
            type: QuestionType.multipleChoice,
            prompt: "C programlama dilinde GCC derleme sürecinin doğru sırası aşağıdakilerden hangisidir?",
            options: ["Preprocessor -> Compiler -> Assembler -> Linker", "Compiler -> Preprocessor -> Linker -> Assembler", "Assembler -> Compiler -> Linker -> Preprocessor", "Linker -> Assembler -> Compiler -> Preprocessor"],
            correctIndex: 0,
            explanation: "Önce makrolar ve headerlar çözülür (cpp), C kodu Assembly'ye derlenir (cc1), makine koduna çevrilir (as), kütüphaneler bağlanır (ld).",
          ),
          Question(
            id: "c_unit_3_l6_q13",
            type: QuestionType.fillInTheBlank,
            prompt: "Geçersiz veya henüz atanmamış bir işaretçiye güvenli başlangıç değeri olarak _____ atanmalıdır.",
            explanation: "İşaretçilere NULL atamak tanımsız belleğe erişimi ve segmentation fault hatalarını engellemeye yardımcı olur.",
            blankOptions: ["NULL", "0xFF", "void", "NaN"],
            correctBlankAnswer: "NULL",
          ),
          Question(
            id: "c_unit_3_l6_q14",
            type: QuestionType.fillInTheBlank,
            prompt: "Bir veri tipinin bellekte kaç bayt yer kapladığını öğrenmek için derleme zamanı operatörü olan _____ kullanılır.",
            explanation: "sizeof(tip) veya sizeof(degisken) bayt cinsinden bellek boyutunu size_t olarak döner.",
            blankOptions: ["sizeof", "lengthof", "bytesize", "countof"],
            correctBlankAnswer: "sizeof",
          ),
          Question(
            id: "c_unit_3_l6_q15",
            type: QuestionType.fillInTheBlank,
            prompt: "Açılmış bir dosya işaretçisini işletim sistemine geri iade etmek için _____ fonksiyonu çağrılır.",
            explanation: "fclose(FILE *stream) dosya tamponlarını diske yazar ve kaynakları kapatır.",
            blankOptions: ["fclose", "close", "file_exit", "dispose"],
            correctBlankAnswer: "fclose",
          ),
          Question(
            id: "c_unit_3_l6_q16",
            type: QuestionType.trueFalse,
            prompt: "C dilinde dizi isimleri ifadeler içinde kullanıldığında dizinin ilk elemanının bellek adresine (pointer) dönüşür (decay).",
            explanation: "Doğrudur, 'arr' ifadesi '&arr[0]' adresi ile eşdeğerdir.",
            isTrue: true,
          ),
          Question(
            id: "c_unit_3_l6_q17",
            type: QuestionType.trueFalse,
            prompt: "Stack belleğinde oluşturulan yerel değişkenler fonksiyon sonlandığında da bellekte kalmaya devam eder ve serbest bırakılması için free() gerekir.",
            explanation: "Yanlıştır! Stack bellek fonksiyon bitiminde otomatik temizlenir; free() sadece heap (malloc) için geçerlidir.",
            isTrue: false,
          ),
          Question(
            id: "c_unit_3_l6_q18",
            type: QuestionType.matching,
            prompt: "C bellek kavramlarını doğru açıklamalarıyla eşleştirin.",
            explanation: "C'de bellek güvenliği doğrudan yazılımcının sorumluluğundadır.",
            matchingPairs: [MatchingPair(left: "malloc", right: "Heap üzerinde başlatılmamış bellek tahsisi"), MatchingPair(left: "free", right: "Dinamik belleği sisteme iade etme"), MatchingPair(left: "Valgrind", right: "Bellek sızıntılarını tespit eden analiz aracı")],
          ),
        ],
      ),
      Lesson(
        id: "c_unit_3_l7",
        title: "Çift İşaretçiler (Pointers to Pointers - int**)",
        description: "İşaretçinin adresini tutma ve matrisler",
        xpReward: 35,
        gemReward: 12,
        isUnitExam: false,
        questions: [
          Question(
            id: "c_unit_3_l7_q1",
            type: QuestionType.conceptCard,
            conceptTitle: "Çift İşaretçiler (Pointers to Pointers - int**) - Hap Bilgi",
            rule: "C dilinde işaretçiler (pointers) doğrudan bellek adreslerini saklar. '&' operatörü bir değişkenin adresini alırken, '*' (dereference) o adresteki veriye erişir veya değiştirir.",
            codeExample: r'''#include <stdio.h>
#include <stdlib.h>

int main() {
    int x = 100;
    int *ptr = &x;
    
    printf("x Degeri: %d\n", *ptr);
    printf("x Bellek Adresi: %p\n", (void*)ptr);
    return 0;
}''',
            devTip: "malloc ile tahsis edilen her bayt bellek için mutlaka bir free() çağrısı yapılmalıdır, aksi halde Memory Leak oluşur.",
            iconEmoji: "⚡",
          ),
          Question(
            id: "c_unit_3_l7_q2",
            type: QuestionType.multipleChoice,
            prompt: "Bir header dosyasının birden fazla kez derlemeye dahil edilmesini (redefinition) önlemek için ne kullanılır?",
            codeSnippet: r'''#ifndef MY_HEADER_H
#define MY_HEADER_H
// ...
#endif''',
            options: ["Header Guards (#ifndef / #define)", "namespace", "pragma private", "module"],
            correctIndex: 0,
            explanation: "Header guards veya '#pragma once' başlık dosyalarının mükerrer include edilmesini engeller.",
          ),
          Question(
            id: "c_unit_3_l7_q3",
            type: QuestionType.multipleChoice,
            prompt: "Tüm üyelerinin bellekte AYNI başlangıç adresini paylaştığı ve en büyük üyesi kadar yer kaplayan yapı hangisidir?",
            codeSnippet: r'''___ Data {
    int i;
    float f;
    char str[20];
};''',
            options: ["union", "struct", "class", "shared"],
            correctIndex: 0,
            explanation: "'union' içindeki tüm elemanlar aynı bellek alanını ortaklaşa kullanır; aynı anda sadece biri geçerli değer tutar.",
          ),
          Question(
            id: "c_unit_3_l7_q4",
            type: QuestionType.multipleChoice,
            prompt: "C dilinde bir değişkenin bellekteki adresini elde etmek için hangi operatör kullanılır?",
            codeSnippet: r'''int x = 10;
int *ptr = ___x;''',
            options: ["& (Address-of)", "* (Dereference)", "% (Mod)", "\$ (Value)"],
            correctIndex: 0,
            explanation: "'&' operatörü bir değişkenin RAM üzerindeki başlangıç adresini döner.",
          ),
          Question(
            id: "c_unit_3_l7_q5",
            type: QuestionType.multipleChoice,
            prompt: "Bir işaretçinin (pointer) işaret ettiği bellek adresindeki veriye erişmek veya onu değiştirmek için hangi işlem yapılır?",
            codeSnippet: r'''int x = 5;
int *p = &x;
___p = 20; // x artik 20 olur''',
            options: ["* (Dereference)", "&", "->", "."],
            correctIndex: 0,
            explanation: "'*p' dereferencing yaparak işaretçinin tuttuğu adresteki asıl değere erişir.",
          ),
          Question(
            id: "c_unit_3_l7_q6",
            type: QuestionType.multipleChoice,
            prompt: "Heap bellekte dinamik olarak bayt cinsinden bellek tahsis etmek için hangi standart kütüphane fonksiyonu kullanılır?",
            codeSnippet: r'''int *arr = (int*)___(10 * sizeof(int));''',
            options: ["malloc", "alloc", "new", "heap_get"],
            correctIndex: 0,
            explanation: "'malloc(size_t size)' heap bölgesinde istenen bayt kadar bellek ayırır ve void* işaretçi döner.",
          ),
          Question(
            id: "c_unit_3_l7_q7",
            type: QuestionType.multipleChoice,
            prompt: "malloc veya calloc ile tahsis edilen dinamik belleğin sisteme iade edilmesi için hangi fonksiyon çağrılmalıdır?",
            codeSnippet: r'''int *buf = malloc(1024);
// ... kullanim ...
___(buf);''',
            options: ["free", "delete", "release", "dispose"],
            correctIndex: 0,
            explanation: "'free(ptr)' heap bellekte ayrılan alanı serbest bırakır. Çağrılmazsa 'Memory Leak' oluşur.",
          ),
          Question(
            id: "c_unit_3_l7_q8",
            type: QuestionType.multipleChoice,
            prompt: "Tahsis ettiği belleği otomatik olarak sıfırlarla (0 baytları) dolduran dinamik bellek fonksiyonu hangisidir?",
            codeSnippet: r'''int *p = ___(100, sizeof(int));''',
            options: ["calloc", "malloc", "realloc", "zalloc"],
            correctIndex: 0,
            explanation: "'calloc(num, size)' eleman sayısı ve eleman boyutu alır, ayrılan tüm bellek hücrelerini 0 ile başlatır.",
          ),
          Question(
            id: "c_unit_3_l7_q9",
            type: QuestionType.multipleChoice,
            prompt: "Daha önce ayrılmış dinamik bir bellek bloğunun boyutunu veri kaybı olmadan büyütmek veya küçültmek için ne kullanılır?",
            codeSnippet: r'''ptr = ___(ptr, new_size);''',
            options: ["realloc", "resize", "remalloc", "expand"],
            correctIndex: 0,
            explanation: "'realloc' mevcut bloğu genişletir veya yeni bir konuma taşıyarak eski veriyi kopyalar.",
          ),
          Question(
            id: "c_unit_3_l7_q10",
            type: QuestionType.multipleChoice,
            prompt: "C programlama dilinde GCC derleme sürecinin doğru sırası aşağıdakilerden hangisidir?",
            options: ["Preprocessor -> Compiler -> Assembler -> Linker", "Compiler -> Preprocessor -> Linker -> Assembler", "Assembler -> Compiler -> Linker -> Preprocessor", "Linker -> Assembler -> Compiler -> Preprocessor"],
            correctIndex: 0,
            explanation: "Önce makrolar ve headerlar çözülür (cpp), C kodu Assembly'ye derlenir (cc1), makine koduna çevrilir (as), kütüphaneler bağlanır (ld).",
          ),
          Question(
            id: "c_unit_3_l7_q11",
            type: QuestionType.multipleChoice,
            prompt: "64-bit modern bir mimaride standart bir işaretçi (pointer - int*, char*, void*) değişkeni bellekte kaç bayt yer kaplar?",
            codeSnippet: r'''printf("%zu", sizeof(int*));''',
            options: ["8 bayt", "4 bayt", "2 bayt", "16 bayt"],
            correctIndex: 0,
            explanation: "64-bit mimarilerde bellek adresleri 64 bit yani tam 8 bayttır. İşaretçinin tipi ne olursa olsun adres boyutu 8 bayttır.",
          ),
          Question(
            id: "c_unit_3_l7_q12",
            type: QuestionType.multipleChoice,
            prompt: "Bir struct içindeki bir işaretçi elemana erişirken '.' yerine hangi pratik operatör kullanılır?",
            codeSnippet: r'''struct User *u = getUser();
u___name = "Ahmet";''',
            options: ["-> (Ok operatörü)", ".", "::", "=>"],
            correctIndex: 0,
            explanation: "'u->name', '(*u).name' yazımının daha okunaklı ve standart kısayoludur.",
          ),
          Question(
            id: "c_unit_3_l7_q13",
            type: QuestionType.fillInTheBlank,
            prompt: "Geçersiz veya henüz atanmamış bir işaretçiye güvenli başlangıç değeri olarak _____ atanmalıdır.",
            explanation: "İşaretçilere NULL atamak tanımsız belleğe erişimi ve segmentation fault hatalarını engellemeye yardımcı olur.",
            blankOptions: ["NULL", "0xFF", "void", "NaN"],
            correctBlankAnswer: "NULL",
          ),
          Question(
            id: "c_unit_3_l7_q14",
            type: QuestionType.fillInTheBlank,
            prompt: "Bir veri tipinin bellekte kaç bayt yer kapladığını öğrenmek için derleme zamanı operatörü olan _____ kullanılır.",
            explanation: "sizeof(tip) veya sizeof(degisken) bayt cinsinden bellek boyutunu size_t olarak döner.",
            blankOptions: ["sizeof", "lengthof", "bytesize", "countof"],
            correctBlankAnswer: "sizeof",
          ),
          Question(
            id: "c_unit_3_l7_q15",
            type: QuestionType.fillInTheBlank,
            prompt: "Açılmış bir dosya işaretçisini işletim sistemine geri iade etmek için _____ fonksiyonu çağrılır.",
            explanation: "fclose(FILE *stream) dosya tamponlarını diske yazar ve kaynakları kapatır.",
            blankOptions: ["fclose", "close", "file_exit", "dispose"],
            correctBlankAnswer: "fclose",
          ),
          Question(
            id: "c_unit_3_l7_q16",
            type: QuestionType.trueFalse,
            prompt: "C dilinde dizi isimleri ifadeler içinde kullanıldığında dizinin ilk elemanının bellek adresine (pointer) dönüşür (decay).",
            explanation: "Doğrudur, 'arr' ifadesi '&arr[0]' adresi ile eşdeğerdir.",
            isTrue: true,
          ),
          Question(
            id: "c_unit_3_l7_q17",
            type: QuestionType.trueFalse,
            prompt: "Stack belleğinde oluşturulan yerel değişkenler fonksiyon sonlandığında da bellekte kalmaya devam eder ve serbest bırakılması için free() gerekir.",
            explanation: "Yanlıştır! Stack bellek fonksiyon bitiminde otomatik temizlenir; free() sadece heap (malloc) için geçerlidir.",
            isTrue: false,
          ),
          Question(
            id: "c_unit_3_l7_q18",
            type: QuestionType.matching,
            prompt: "C bellek kavramlarını doğru açıklamalarıyla eşleştirin.",
            explanation: "C'de bellek güvenliği doğrudan yazılımcının sorumluluğundadır.",
            matchingPairs: [MatchingPair(left: "malloc", right: "Heap üzerinde başlatılmamış bellek tahsisi"), MatchingPair(left: "free", right: "Dinamik belleği sisteme iade etme"), MatchingPair(left: "Valgrind", right: "Bellek sızıntılarını tespit eden analiz aracı")],
          ),
        ],
      ),
      Lesson(
        id: "c_unit_3_l8",
        title: "3. Ünite Bellek Adresleri & İşaretçiler Sınavı",
        description: "İşaretçi temelleri sınavı",
        xpReward: 50,
        gemReward: 25,
        isUnitExam: true,
        questions: [
          Question(
            id: "c_unit_3_l8_q1",
            type: QuestionType.conceptCard,
            conceptTitle: "3. Ünite Bellek Adresleri & İşaretçiler Sınavı - Hap Bilgi",
            rule: "C dilinde işaretçiler (pointers) doğrudan bellek adreslerini saklar. '&' operatörü bir değişkenin adresini alırken, '*' (dereference) o adresteki veriye erişir veya değiştirir.",
            codeExample: r'''#include <stdio.h>
#include <stdlib.h>

int main() {
    int x = 100;
    int *ptr = &x;
    
    printf("x Degeri: %d\n", *ptr);
    printf("x Bellek Adresi: %p\n", (void*)ptr);
    return 0;
}''',
            devTip: "malloc ile tahsis edilen her bayt bellek için mutlaka bir free() çağrısı yapılmalıdır, aksi halde Memory Leak oluşur.",
            iconEmoji: "⚡",
          ),
          Question(
            id: "c_unit_3_l8_q2",
            type: QuestionType.multipleChoice,
            prompt: "C dilinde bir değişkenin bellekteki adresini elde etmek için hangi operatör kullanılır?",
            codeSnippet: r'''int x = 10;
int *ptr = ___x;''',
            options: ["& (Address-of)", "* (Dereference)", "% (Mod)", "\$ (Value)"],
            correctIndex: 0,
            explanation: "'&' operatörü bir değişkenin RAM üzerindeki başlangıç adresini döner.",
          ),
          Question(
            id: "c_unit_3_l8_q3",
            type: QuestionType.multipleChoice,
            prompt: "Bir işaretçinin (pointer) işaret ettiği bellek adresindeki veriye erişmek veya onu değiştirmek için hangi işlem yapılır?",
            codeSnippet: r'''int x = 5;
int *p = &x;
___p = 20; // x artik 20 olur''',
            options: ["* (Dereference)", "&", "->", "."],
            correctIndex: 0,
            explanation: "'*p' dereferencing yaparak işaretçinin tuttuğu adresteki asıl değere erişir.",
          ),
          Question(
            id: "c_unit_3_l8_q4",
            type: QuestionType.multipleChoice,
            prompt: "Heap bellekte dinamik olarak bayt cinsinden bellek tahsis etmek için hangi standart kütüphane fonksiyonu kullanılır?",
            codeSnippet: r'''int *arr = (int*)___(10 * sizeof(int));''',
            options: ["malloc", "alloc", "new", "heap_get"],
            correctIndex: 0,
            explanation: "'malloc(size_t size)' heap bölgesinde istenen bayt kadar bellek ayırır ve void* işaretçi döner.",
          ),
          Question(
            id: "c_unit_3_l8_q5",
            type: QuestionType.multipleChoice,
            prompt: "malloc veya calloc ile tahsis edilen dinamik belleğin sisteme iade edilmesi için hangi fonksiyon çağrılmalıdır?",
            codeSnippet: r'''int *buf = malloc(1024);
// ... kullanim ...
___(buf);''',
            options: ["free", "delete", "release", "dispose"],
            correctIndex: 0,
            explanation: "'free(ptr)' heap bellekte ayrılan alanı serbest bırakır. Çağrılmazsa 'Memory Leak' oluşur.",
          ),
          Question(
            id: "c_unit_3_l8_q6",
            type: QuestionType.multipleChoice,
            prompt: "Tahsis ettiği belleği otomatik olarak sıfırlarla (0 baytları) dolduran dinamik bellek fonksiyonu hangisidir?",
            codeSnippet: r'''int *p = ___(100, sizeof(int));''',
            options: ["calloc", "malloc", "realloc", "zalloc"],
            correctIndex: 0,
            explanation: "'calloc(num, size)' eleman sayısı ve eleman boyutu alır, ayrılan tüm bellek hücrelerini 0 ile başlatır.",
          ),
          Question(
            id: "c_unit_3_l8_q7",
            type: QuestionType.multipleChoice,
            prompt: "Daha önce ayrılmış dinamik bir bellek bloğunun boyutunu veri kaybı olmadan büyütmek veya küçültmek için ne kullanılır?",
            codeSnippet: r'''ptr = ___(ptr, new_size);''',
            options: ["realloc", "resize", "remalloc", "expand"],
            correctIndex: 0,
            explanation: "'realloc' mevcut bloğu genişletir veya yeni bir konuma taşıyarak eski veriyi kopyalar.",
          ),
          Question(
            id: "c_unit_3_l8_q8",
            type: QuestionType.multipleChoice,
            prompt: "C programlama dilinde GCC derleme sürecinin doğru sırası aşağıdakilerden hangisidir?",
            options: ["Preprocessor -> Compiler -> Assembler -> Linker", "Compiler -> Preprocessor -> Linker -> Assembler", "Assembler -> Compiler -> Linker -> Preprocessor", "Linker -> Assembler -> Compiler -> Preprocessor"],
            correctIndex: 0,
            explanation: "Önce makrolar ve headerlar çözülür (cpp), C kodu Assembly'ye derlenir (cc1), makine koduna çevrilir (as), kütüphaneler bağlanır (ld).",
          ),
          Question(
            id: "c_unit_3_l8_q9",
            type: QuestionType.multipleChoice,
            prompt: "64-bit modern bir mimaride standart bir işaretçi (pointer - int*, char*, void*) değişkeni bellekte kaç bayt yer kaplar?",
            codeSnippet: r'''printf("%zu", sizeof(int*));''',
            options: ["8 bayt", "4 bayt", "2 bayt", "16 bayt"],
            correctIndex: 0,
            explanation: "64-bit mimarilerde bellek adresleri 64 bit yani tam 8 bayttır. İşaretçinin tipi ne olursa olsun adres boyutu 8 bayttır.",
          ),
          Question(
            id: "c_unit_3_l8_q10",
            type: QuestionType.multipleChoice,
            prompt: "Bir struct içindeki bir işaretçi elemana erişirken '.' yerine hangi pratik operatör kullanılır?",
            codeSnippet: r'''struct User *u = getUser();
u___name = "Ahmet";''',
            options: ["-> (Ok operatörü)", ".", "::", "=>"],
            correctIndex: 0,
            explanation: "'u->name', '(*u).name' yazımının daha okunaklı ve standart kısayoludur.",
          ),
          Question(
            id: "c_unit_3_l8_q11",
            type: QuestionType.multipleChoice,
            prompt: "Herhangi bir veri tipine ait bellek adresini tutabilen jenerik (tip bağımsız) işaretçi tipi hangisidir?",
            codeSnippet: r'''___ generic_ptr = &x;''',
            options: ["void*", "any*", "object*", "generic*"],
            correctIndex: 0,
            explanation: "'void*' tipi belirsiz jenerik bir işaretçidir; doğrudan dereference edilemez, cast edilmesi gerekir.",
          ),
          Question(
            id: "c_unit_3_l8_q12",
            type: QuestionType.multipleChoice,
            prompt: "Serbest bırakılmış (free edilmiş) bir işaretçiyi kullanmaya devam etme hatasına ne ad verilir?",
            codeSnippet: r'''free(ptr);
printf("%d", *ptr); // HATA!''',
            options: ["Dangling Pointer (Askıda Kalan İşaretçi)", "Stack Overflow", "Memory Leak", "Deadlock"],
            correctIndex: 0,
            explanation: "free edildikten sonra hala o adresi göstermeye devam eden işaretçiye dangling pointer denir; 'ptr = NULL' yapılarak önlenir.",
          ),
          Question(
            id: "c_unit_3_l8_q13",
            type: QuestionType.fillInTheBlank,
            prompt: "Geçersiz veya henüz atanmamış bir işaretçiye güvenli başlangıç değeri olarak _____ atanmalıdır.",
            explanation: "İşaretçilere NULL atamak tanımsız belleğe erişimi ve segmentation fault hatalarını engellemeye yardımcı olur.",
            blankOptions: ["NULL", "0xFF", "void", "NaN"],
            correctBlankAnswer: "NULL",
          ),
          Question(
            id: "c_unit_3_l8_q14",
            type: QuestionType.fillInTheBlank,
            prompt: "Bir veri tipinin bellekte kaç bayt yer kapladığını öğrenmek için derleme zamanı operatörü olan _____ kullanılır.",
            explanation: "sizeof(tip) veya sizeof(degisken) bayt cinsinden bellek boyutunu size_t olarak döner.",
            blankOptions: ["sizeof", "lengthof", "bytesize", "countof"],
            correctBlankAnswer: "sizeof",
          ),
          Question(
            id: "c_unit_3_l8_q15",
            type: QuestionType.fillInTheBlank,
            prompt: "Açılmış bir dosya işaretçisini işletim sistemine geri iade etmek için _____ fonksiyonu çağrılır.",
            explanation: "fclose(FILE *stream) dosya tamponlarını diske yazar ve kaynakları kapatır.",
            blankOptions: ["fclose", "close", "file_exit", "dispose"],
            correctBlankAnswer: "fclose",
          ),
          Question(
            id: "c_unit_3_l8_q16",
            type: QuestionType.trueFalse,
            prompt: "C dilinde dizi isimleri ifadeler içinde kullanıldığında dizinin ilk elemanının bellek adresine (pointer) dönüşür (decay).",
            explanation: "Doğrudur, 'arr' ifadesi '&arr[0]' adresi ile eşdeğerdir.",
            isTrue: true,
          ),
          Question(
            id: "c_unit_3_l8_q17",
            type: QuestionType.trueFalse,
            prompt: "Stack belleğinde oluşturulan yerel değişkenler fonksiyon sonlandığında da bellekte kalmaya devam eder ve serbest bırakılması için free() gerekir.",
            explanation: "Yanlıştır! Stack bellek fonksiyon bitiminde otomatik temizlenir; free() sadece heap (malloc) için geçerlidir.",
            isTrue: false,
          ),
          Question(
            id: "c_unit_3_l8_q18",
            type: QuestionType.matching,
            prompt: "C bellek kavramlarını doğru açıklamalarıyla eşleştirin.",
            explanation: "C'de bellek güvenliği doğrudan yazılımcının sorumluluğundadır.",
            matchingPairs: [MatchingPair(left: "malloc", right: "Heap üzerinde başlatılmamış bellek tahsisi"), MatchingPair(left: "free", right: "Dinamik belleği sisteme iade etme"), MatchingPair(left: "Valgrind", right: "Bellek sızıntılarını tespit eden analiz aracı")],
          ),
        ],
      ),
    ],
  ),
  LearningUnit(
    id: "c_unit_4",
    unitNumber: 4,
    title: "İşaretçi Aritmetiği, Diziler & Stringler",
    language: CodeLanguage.c,
    category: "İşaretçiler (Pointers)",
    colorHex: 0xFF0284C7,
    cheatSheetTitle: "C Dizi & String Hile Kağıdı",
    cheatSheetContent: r'''int arr[5] = {1, 2, 3, 4, 5};
int *p = arr;
*(p + 2) == arr[2];
char str[] = 'Hello'; // \0 ile biter''',
    lessons: [
      Lesson(
        id: "c_unit_4_l1",
        title: "İşaretçi Aritmetiği: ptr + 1 Neden Tip Boyutu Kadar Atlar?",
        description: "Ölçekleme faktörü ve sizeof adımı",
        xpReward: 35,
        gemReward: 12,
        isUnitExam: false,
        questions: [
          Question(
            id: "c_unit_4_l1_q1",
            type: QuestionType.conceptCard,
            conceptTitle: "İşaretçi Aritmetiği: ptr + 1 Neden Tip Boyutu Kadar Atlar? - Hap Bilgi",
            rule: "C dilinde işaretçiler (pointers) doğrudan bellek adreslerini saklar. '&' operatörü bir değişkenin adresini alırken, '*' (dereference) o adresteki veriye erişir veya değiştirir.",
            codeExample: r'''#include <stdio.h>
#include <stdlib.h>

int main() {
    int x = 100;
    int *ptr = &x;
    
    printf("x Degeri: %d\n", *ptr);
    printf("x Bellek Adresi: %p\n", (void*)ptr);
    return 0;
}''',
            devTip: "malloc ile tahsis edilen her bayt bellek için mutlaka bir free() çağrısı yapılmalıdır, aksi halde Memory Leak oluşur.",
            iconEmoji: "⚡",
          ),
          Question(
            id: "c_unit_4_l1_q2",
            type: QuestionType.multipleChoice,
            prompt: "Heap bellekte dinamik olarak bayt cinsinden bellek tahsis etmek için hangi standart kütüphane fonksiyonu kullanılır?",
            codeSnippet: r'''int *arr = (int*)___(10 * sizeof(int));''',
            options: ["malloc", "alloc", "new", "heap_get"],
            correctIndex: 0,
            explanation: "'malloc(size_t size)' heap bölgesinde istenen bayt kadar bellek ayırır ve void* işaretçi döner.",
          ),
          Question(
            id: "c_unit_4_l1_q3",
            type: QuestionType.multipleChoice,
            prompt: "malloc veya calloc ile tahsis edilen dinamik belleğin sisteme iade edilmesi için hangi fonksiyon çağrılmalıdır?",
            codeSnippet: r'''int *buf = malloc(1024);
// ... kullanim ...
___(buf);''',
            options: ["free", "delete", "release", "dispose"],
            correctIndex: 0,
            explanation: "'free(ptr)' heap bellekte ayrılan alanı serbest bırakır. Çağrılmazsa 'Memory Leak' oluşur.",
          ),
          Question(
            id: "c_unit_4_l1_q4",
            type: QuestionType.multipleChoice,
            prompt: "Tahsis ettiği belleği otomatik olarak sıfırlarla (0 baytları) dolduran dinamik bellek fonksiyonu hangisidir?",
            codeSnippet: r'''int *p = ___(100, sizeof(int));''',
            options: ["calloc", "malloc", "realloc", "zalloc"],
            correctIndex: 0,
            explanation: "'calloc(num, size)' eleman sayısı ve eleman boyutu alır, ayrılan tüm bellek hücrelerini 0 ile başlatır.",
          ),
          Question(
            id: "c_unit_4_l1_q5",
            type: QuestionType.multipleChoice,
            prompt: "Daha önce ayrılmış dinamik bir bellek bloğunun boyutunu veri kaybı olmadan büyütmek veya küçültmek için ne kullanılır?",
            codeSnippet: r'''ptr = ___(ptr, new_size);''',
            options: ["realloc", "resize", "remalloc", "expand"],
            correctIndex: 0,
            explanation: "'realloc' mevcut bloğu genişletir veya yeni bir konuma taşıyarak eski veriyi kopyalar.",
          ),
          Question(
            id: "c_unit_4_l1_q6",
            type: QuestionType.multipleChoice,
            prompt: "C programlama dilinde GCC derleme sürecinin doğru sırası aşağıdakilerden hangisidir?",
            options: ["Preprocessor -> Compiler -> Assembler -> Linker", "Compiler -> Preprocessor -> Linker -> Assembler", "Assembler -> Compiler -> Linker -> Preprocessor", "Linker -> Assembler -> Compiler -> Preprocessor"],
            correctIndex: 0,
            explanation: "Önce makrolar ve headerlar çözülür (cpp), C kodu Assembly'ye derlenir (cc1), makine koduna çevrilir (as), kütüphaneler bağlanır (ld).",
          ),
          Question(
            id: "c_unit_4_l1_q7",
            type: QuestionType.multipleChoice,
            prompt: "64-bit modern bir mimaride standart bir işaretçi (pointer - int*, char*, void*) değişkeni bellekte kaç bayt yer kaplar?",
            codeSnippet: r'''printf("%zu", sizeof(int*));''',
            options: ["8 bayt", "4 bayt", "2 bayt", "16 bayt"],
            correctIndex: 0,
            explanation: "64-bit mimarilerde bellek adresleri 64 bit yani tam 8 bayttır. İşaretçinin tipi ne olursa olsun adres boyutu 8 bayttır.",
          ),
          Question(
            id: "c_unit_4_l1_q8",
            type: QuestionType.multipleChoice,
            prompt: "Bir struct içindeki bir işaretçi elemana erişirken '.' yerine hangi pratik operatör kullanılır?",
            codeSnippet: r'''struct User *u = getUser();
u___name = "Ahmet";''',
            options: ["-> (Ok operatörü)", ".", "::", "=>"],
            correctIndex: 0,
            explanation: "'u->name', '(*u).name' yazımının daha okunaklı ve standart kısayoludur.",
          ),
          Question(
            id: "c_unit_4_l1_q9",
            type: QuestionType.multipleChoice,
            prompt: "Herhangi bir veri tipine ait bellek adresini tutabilen jenerik (tip bağımsız) işaretçi tipi hangisidir?",
            codeSnippet: r'''___ generic_ptr = &x;''',
            options: ["void*", "any*", "object*", "generic*"],
            correctIndex: 0,
            explanation: "'void*' tipi belirsiz jenerik bir işaretçidir; doğrudan dereference edilemez, cast edilmesi gerekir.",
          ),
          Question(
            id: "c_unit_4_l1_q10",
            type: QuestionType.multipleChoice,
            prompt: "Serbest bırakılmış (free edilmiş) bir işaretçiyi kullanmaya devam etme hatasına ne ad verilir?",
            codeSnippet: r'''free(ptr);
printf("%d", *ptr); // HATA!''',
            options: ["Dangling Pointer (Askıda Kalan İşaretçi)", "Stack Overflow", "Memory Leak", "Deadlock"],
            correctIndex: 0,
            explanation: "free edildikten sonra hala o adresi göstermeye devam eden işaretçiye dangling pointer denir; 'ptr = NULL' yapılarak önlenir.",
          ),
          Question(
            id: "c_unit_4_l1_q11",
            type: QuestionType.multipleChoice,
            prompt: "C programlarında bellek sızıntılarını (memory leak) ve geçersiz bellek erişimlerini tespit etmek için en popüler Linux aracı hangisidir?",
            codeSnippet: r'''$ ___ --leak-check=full ./program''',
            options: ["valgrind", "gdb", "perf", "strace"],
            correctIndex: 0,
            explanation: "Valgrind (özellikle memcheck aracı) C/C++ programlarında bellek yönetim hatalarını ayrıntılı raporlar.",
          ),
          Question(
            id: "c_unit_4_l1_q12",
            type: QuestionType.multipleChoice,
            prompt: "Aşağıdaki bit düzeyinde (bitwise) operatörlerden hangisi bitleri 1 basamak sola kaydırarak 2 ile çarpmayı sağlar?",
            codeSnippet: r'''int x = 5;
int y = x ___ 1; // y = 10 olur''',
            options: ["<<", ">>", "&", "|"],
            correctIndex: 0,
            explanation: "Sola kaydırma (<< n) operatörü sayının değerini 2^n ile çarpar.",
          ),
          Question(
            id: "c_unit_4_l1_q13",
            type: QuestionType.fillInTheBlank,
            prompt: "Geçersiz veya henüz atanmamış bir işaretçiye güvenli başlangıç değeri olarak _____ atanmalıdır.",
            explanation: "İşaretçilere NULL atamak tanımsız belleğe erişimi ve segmentation fault hatalarını engellemeye yardımcı olur.",
            blankOptions: ["NULL", "0xFF", "void", "NaN"],
            correctBlankAnswer: "NULL",
          ),
          Question(
            id: "c_unit_4_l1_q14",
            type: QuestionType.fillInTheBlank,
            prompt: "Bir veri tipinin bellekte kaç bayt yer kapladığını öğrenmek için derleme zamanı operatörü olan _____ kullanılır.",
            explanation: "sizeof(tip) veya sizeof(degisken) bayt cinsinden bellek boyutunu size_t olarak döner.",
            blankOptions: ["sizeof", "lengthof", "bytesize", "countof"],
            correctBlankAnswer: "sizeof",
          ),
          Question(
            id: "c_unit_4_l1_q15",
            type: QuestionType.fillInTheBlank,
            prompt: "Açılmış bir dosya işaretçisini işletim sistemine geri iade etmek için _____ fonksiyonu çağrılır.",
            explanation: "fclose(FILE *stream) dosya tamponlarını diske yazar ve kaynakları kapatır.",
            blankOptions: ["fclose", "close", "file_exit", "dispose"],
            correctBlankAnswer: "fclose",
          ),
          Question(
            id: "c_unit_4_l1_q16",
            type: QuestionType.trueFalse,
            prompt: "C dilinde dizi isimleri ifadeler içinde kullanıldığında dizinin ilk elemanının bellek adresine (pointer) dönüşür (decay).",
            explanation: "Doğrudur, 'arr' ifadesi '&arr[0]' adresi ile eşdeğerdir.",
            isTrue: true,
          ),
          Question(
            id: "c_unit_4_l1_q17",
            type: QuestionType.trueFalse,
            prompt: "Stack belleğinde oluşturulan yerel değişkenler fonksiyon sonlandığında da bellekte kalmaya devam eder ve serbest bırakılması için free() gerekir.",
            explanation: "Yanlıştır! Stack bellek fonksiyon bitiminde otomatik temizlenir; free() sadece heap (malloc) için geçerlidir.",
            isTrue: false,
          ),
          Question(
            id: "c_unit_4_l1_q18",
            type: QuestionType.matching,
            prompt: "C bellek kavramlarını doğru açıklamalarıyla eşleştirin.",
            explanation: "C'de bellek güvenliği doğrudan yazılımcının sorumluluğundadır.",
            matchingPairs: [MatchingPair(left: "malloc", right: "Heap üzerinde başlatılmamış bellek tahsisi"), MatchingPair(left: "free", right: "Dinamik belleği sisteme iade etme"), MatchingPair(left: "Valgrind", right: "Bellek sızıntılarını tespit eden analiz aracı")],
          ),
        ],
      ),
      Lesson(
        id: "c_unit_4_l2",
        title: "Diziler ve İşaretçi İlişkisi (Array Decay)",
        description: "Dizi adının ilk elemanın adresine dönüşmesi",
        xpReward: 35,
        gemReward: 12,
        isUnitExam: false,
        questions: [
          Question(
            id: "c_unit_4_l2_q1",
            type: QuestionType.conceptCard,
            conceptTitle: "Diziler ve İşaretçi İlişkisi (Array Decay) - Hap Bilgi",
            rule: "C dilinde işaretçiler (pointers) doğrudan bellek adreslerini saklar. '&' operatörü bir değişkenin adresini alırken, '*' (dereference) o adresteki veriye erişir veya değiştirir.",
            codeExample: r'''#include <stdio.h>
#include <stdlib.h>

int main() {
    int x = 100;
    int *ptr = &x;
    
    printf("x Degeri: %d\n", *ptr);
    printf("x Bellek Adresi: %p\n", (void*)ptr);
    return 0;
}''',
            devTip: "malloc ile tahsis edilen her bayt bellek için mutlaka bir free() çağrısı yapılmalıdır, aksi halde Memory Leak oluşur.",
            iconEmoji: "⚡",
          ),
          Question(
            id: "c_unit_4_l2_q2",
            type: QuestionType.multipleChoice,
            prompt: "Tahsis ettiği belleği otomatik olarak sıfırlarla (0 baytları) dolduran dinamik bellek fonksiyonu hangisidir?",
            codeSnippet: r'''int *p = ___(100, sizeof(int));''',
            options: ["calloc", "malloc", "realloc", "zalloc"],
            correctIndex: 0,
            explanation: "'calloc(num, size)' eleman sayısı ve eleman boyutu alır, ayrılan tüm bellek hücrelerini 0 ile başlatır.",
          ),
          Question(
            id: "c_unit_4_l2_q3",
            type: QuestionType.multipleChoice,
            prompt: "Daha önce ayrılmış dinamik bir bellek bloğunun boyutunu veri kaybı olmadan büyütmek veya küçültmek için ne kullanılır?",
            codeSnippet: r'''ptr = ___(ptr, new_size);''',
            options: ["realloc", "resize", "remalloc", "expand"],
            correctIndex: 0,
            explanation: "'realloc' mevcut bloğu genişletir veya yeni bir konuma taşıyarak eski veriyi kopyalar.",
          ),
          Question(
            id: "c_unit_4_l2_q4",
            type: QuestionType.multipleChoice,
            prompt: "C programlama dilinde GCC derleme sürecinin doğru sırası aşağıdakilerden hangisidir?",
            options: ["Preprocessor -> Compiler -> Assembler -> Linker", "Compiler -> Preprocessor -> Linker -> Assembler", "Assembler -> Compiler -> Linker -> Preprocessor", "Linker -> Assembler -> Compiler -> Preprocessor"],
            correctIndex: 0,
            explanation: "Önce makrolar ve headerlar çözülür (cpp), C kodu Assembly'ye derlenir (cc1), makine koduna çevrilir (as), kütüphaneler bağlanır (ld).",
          ),
          Question(
            id: "c_unit_4_l2_q5",
            type: QuestionType.multipleChoice,
            prompt: "64-bit modern bir mimaride standart bir işaretçi (pointer - int*, char*, void*) değişkeni bellekte kaç bayt yer kaplar?",
            codeSnippet: r'''printf("%zu", sizeof(int*));''',
            options: ["8 bayt", "4 bayt", "2 bayt", "16 bayt"],
            correctIndex: 0,
            explanation: "64-bit mimarilerde bellek adresleri 64 bit yani tam 8 bayttır. İşaretçinin tipi ne olursa olsun adres boyutu 8 bayttır.",
          ),
          Question(
            id: "c_unit_4_l2_q6",
            type: QuestionType.multipleChoice,
            prompt: "Bir struct içindeki bir işaretçi elemana erişirken '.' yerine hangi pratik operatör kullanılır?",
            codeSnippet: r'''struct User *u = getUser();
u___name = "Ahmet";''',
            options: ["-> (Ok operatörü)", ".", "::", "=>"],
            correctIndex: 0,
            explanation: "'u->name', '(*u).name' yazımının daha okunaklı ve standart kısayoludur.",
          ),
          Question(
            id: "c_unit_4_l2_q7",
            type: QuestionType.multipleChoice,
            prompt: "Herhangi bir veri tipine ait bellek adresini tutabilen jenerik (tip bağımsız) işaretçi tipi hangisidir?",
            codeSnippet: r'''___ generic_ptr = &x;''',
            options: ["void*", "any*", "object*", "generic*"],
            correctIndex: 0,
            explanation: "'void*' tipi belirsiz jenerik bir işaretçidir; doğrudan dereference edilemez, cast edilmesi gerekir.",
          ),
          Question(
            id: "c_unit_4_l2_q8",
            type: QuestionType.multipleChoice,
            prompt: "Serbest bırakılmış (free edilmiş) bir işaretçiyi kullanmaya devam etme hatasına ne ad verilir?",
            codeSnippet: r'''free(ptr);
printf("%d", *ptr); // HATA!''',
            options: ["Dangling Pointer (Askıda Kalan İşaretçi)", "Stack Overflow", "Memory Leak", "Deadlock"],
            correctIndex: 0,
            explanation: "free edildikten sonra hala o adresi göstermeye devam eden işaretçiye dangling pointer denir; 'ptr = NULL' yapılarak önlenir.",
          ),
          Question(
            id: "c_unit_4_l2_q9",
            type: QuestionType.multipleChoice,
            prompt: "C programlarında bellek sızıntılarını (memory leak) ve geçersiz bellek erişimlerini tespit etmek için en popüler Linux aracı hangisidir?",
            codeSnippet: r'''$ ___ --leak-check=full ./program''',
            options: ["valgrind", "gdb", "perf", "strace"],
            correctIndex: 0,
            explanation: "Valgrind (özellikle memcheck aracı) C/C++ programlarında bellek yönetim hatalarını ayrıntılı raporlar.",
          ),
          Question(
            id: "c_unit_4_l2_q10",
            type: QuestionType.multipleChoice,
            prompt: "Aşağıdaki bit düzeyinde (bitwise) operatörlerden hangisi bitleri 1 basamak sola kaydırarak 2 ile çarpmayı sağlar?",
            codeSnippet: r'''int x = 5;
int y = x ___ 1; // y = 10 olur''',
            options: ["<<", ">>", "&", "|"],
            correctIndex: 0,
            explanation: "Sola kaydırma (<< n) operatörü sayının değerini 2^n ile çarpar.",
          ),
          Question(
            id: "c_unit_4_l2_q11",
            type: QuestionType.multipleChoice,
            prompt: "C'de dosya açmak ve bir dosya işaretçisi (FILE*) elde etmek için hangi standart fonksiyon kullanılır?",
            codeSnippet: r'''FILE *f = ___("data.txt", "r");''',
            options: ["fopen", "open", "file_open", "create_file"],
            correctIndex: 0,
            explanation: "'fopen(dosya_adi, mod)' dosyayı belirtilen modda (r, w, a, rb, wb) açar.",
          ),
          Question(
            id: "c_unit_4_l2_q12",
            type: QuestionType.multipleChoice,
            prompt: "Bir header dosyasının birden fazla kez derlemeye dahil edilmesini (redefinition) önlemek için ne kullanılır?",
            codeSnippet: r'''#ifndef MY_HEADER_H
#define MY_HEADER_H
// ...
#endif''',
            options: ["Header Guards (#ifndef / #define)", "namespace", "pragma private", "module"],
            correctIndex: 0,
            explanation: "Header guards veya '#pragma once' başlık dosyalarının mükerrer include edilmesini engeller.",
          ),
          Question(
            id: "c_unit_4_l2_q13",
            type: QuestionType.fillInTheBlank,
            prompt: "Geçersiz veya henüz atanmamış bir işaretçiye güvenli başlangıç değeri olarak _____ atanmalıdır.",
            explanation: "İşaretçilere NULL atamak tanımsız belleğe erişimi ve segmentation fault hatalarını engellemeye yardımcı olur.",
            blankOptions: ["NULL", "0xFF", "void", "NaN"],
            correctBlankAnswer: "NULL",
          ),
          Question(
            id: "c_unit_4_l2_q14",
            type: QuestionType.fillInTheBlank,
            prompt: "Bir veri tipinin bellekte kaç bayt yer kapladığını öğrenmek için derleme zamanı operatörü olan _____ kullanılır.",
            explanation: "sizeof(tip) veya sizeof(degisken) bayt cinsinden bellek boyutunu size_t olarak döner.",
            blankOptions: ["sizeof", "lengthof", "bytesize", "countof"],
            correctBlankAnswer: "sizeof",
          ),
          Question(
            id: "c_unit_4_l2_q15",
            type: QuestionType.fillInTheBlank,
            prompt: "Açılmış bir dosya işaretçisini işletim sistemine geri iade etmek için _____ fonksiyonu çağrılır.",
            explanation: "fclose(FILE *stream) dosya tamponlarını diske yazar ve kaynakları kapatır.",
            blankOptions: ["fclose", "close", "file_exit", "dispose"],
            correctBlankAnswer: "fclose",
          ),
          Question(
            id: "c_unit_4_l2_q16",
            type: QuestionType.trueFalse,
            prompt: "C dilinde dizi isimleri ifadeler içinde kullanıldığında dizinin ilk elemanının bellek adresine (pointer) dönüşür (decay).",
            explanation: "Doğrudur, 'arr' ifadesi '&arr[0]' adresi ile eşdeğerdir.",
            isTrue: true,
          ),
          Question(
            id: "c_unit_4_l2_q17",
            type: QuestionType.trueFalse,
            prompt: "Stack belleğinde oluşturulan yerel değişkenler fonksiyon sonlandığında da bellekte kalmaya devam eder ve serbest bırakılması için free() gerekir.",
            explanation: "Yanlıştır! Stack bellek fonksiyon bitiminde otomatik temizlenir; free() sadece heap (malloc) için geçerlidir.",
            isTrue: false,
          ),
          Question(
            id: "c_unit_4_l2_q18",
            type: QuestionType.matching,
            prompt: "C bellek kavramlarını doğru açıklamalarıyla eşleştirin.",
            explanation: "C'de bellek güvenliği doğrudan yazılımcının sorumluluğundadır.",
            matchingPairs: [MatchingPair(left: "malloc", right: "Heap üzerinde başlatılmamış bellek tahsisi"), MatchingPair(left: "free", right: "Dinamik belleği sisteme iade etme"), MatchingPair(left: "Valgrind", right: "Bellek sızıntılarını tespit eden analiz aracı")],
          ),
        ],
      ),
      Lesson(
        id: "c_unit_4_l3",
        title: "İşaretçilerle Dizi Elemanlarını Gezme",
        description: "*(arr + i) vs arr[i] yazım denkliği",
        xpReward: 35,
        gemReward: 12,
        isUnitExam: false,
        questions: [
          Question(
            id: "c_unit_4_l3_q1",
            type: QuestionType.conceptCard,
            conceptTitle: "İşaretçilerle Dizi Elemanlarını Gezme - Hap Bilgi",
            rule: "C dilinde işaretçiler (pointers) doğrudan bellek adreslerini saklar. '&' operatörü bir değişkenin adresini alırken, '*' (dereference) o adresteki veriye erişir veya değiştirir.",
            codeExample: r'''#include <stdio.h>
#include <stdlib.h>

int main() {
    int x = 100;
    int *ptr = &x;
    
    printf("x Degeri: %d\n", *ptr);
    printf("x Bellek Adresi: %p\n", (void*)ptr);
    return 0;
}''',
            devTip: "malloc ile tahsis edilen her bayt bellek için mutlaka bir free() çağrısı yapılmalıdır, aksi halde Memory Leak oluşur.",
            iconEmoji: "⚡",
          ),
          Question(
            id: "c_unit_4_l3_q2",
            type: QuestionType.multipleChoice,
            prompt: "C programlama dilinde GCC derleme sürecinin doğru sırası aşağıdakilerden hangisidir?",
            options: ["Preprocessor -> Compiler -> Assembler -> Linker", "Compiler -> Preprocessor -> Linker -> Assembler", "Assembler -> Compiler -> Linker -> Preprocessor", "Linker -> Assembler -> Compiler -> Preprocessor"],
            correctIndex: 0,
            explanation: "Önce makrolar ve headerlar çözülür (cpp), C kodu Assembly'ye derlenir (cc1), makine koduna çevrilir (as), kütüphaneler bağlanır (ld).",
          ),
          Question(
            id: "c_unit_4_l3_q3",
            type: QuestionType.multipleChoice,
            prompt: "64-bit modern bir mimaride standart bir işaretçi (pointer - int*, char*, void*) değişkeni bellekte kaç bayt yer kaplar?",
            codeSnippet: r'''printf("%zu", sizeof(int*));''',
            options: ["8 bayt", "4 bayt", "2 bayt", "16 bayt"],
            correctIndex: 0,
            explanation: "64-bit mimarilerde bellek adresleri 64 bit yani tam 8 bayttır. İşaretçinin tipi ne olursa olsun adres boyutu 8 bayttır.",
          ),
          Question(
            id: "c_unit_4_l3_q4",
            type: QuestionType.multipleChoice,
            prompt: "Bir struct içindeki bir işaretçi elemana erişirken '.' yerine hangi pratik operatör kullanılır?",
            codeSnippet: r'''struct User *u = getUser();
u___name = "Ahmet";''',
            options: ["-> (Ok operatörü)", ".", "::", "=>"],
            correctIndex: 0,
            explanation: "'u->name', '(*u).name' yazımının daha okunaklı ve standart kısayoludur.",
          ),
          Question(
            id: "c_unit_4_l3_q5",
            type: QuestionType.multipleChoice,
            prompt: "Herhangi bir veri tipine ait bellek adresini tutabilen jenerik (tip bağımsız) işaretçi tipi hangisidir?",
            codeSnippet: r'''___ generic_ptr = &x;''',
            options: ["void*", "any*", "object*", "generic*"],
            correctIndex: 0,
            explanation: "'void*' tipi belirsiz jenerik bir işaretçidir; doğrudan dereference edilemez, cast edilmesi gerekir.",
          ),
          Question(
            id: "c_unit_4_l3_q6",
            type: QuestionType.multipleChoice,
            prompt: "Serbest bırakılmış (free edilmiş) bir işaretçiyi kullanmaya devam etme hatasına ne ad verilir?",
            codeSnippet: r'''free(ptr);
printf("%d", *ptr); // HATA!''',
            options: ["Dangling Pointer (Askıda Kalan İşaretçi)", "Stack Overflow", "Memory Leak", "Deadlock"],
            correctIndex: 0,
            explanation: "free edildikten sonra hala o adresi göstermeye devam eden işaretçiye dangling pointer denir; 'ptr = NULL' yapılarak önlenir.",
          ),
          Question(
            id: "c_unit_4_l3_q7",
            type: QuestionType.multipleChoice,
            prompt: "C programlarında bellek sızıntılarını (memory leak) ve geçersiz bellek erişimlerini tespit etmek için en popüler Linux aracı hangisidir?",
            codeSnippet: r'''$ ___ --leak-check=full ./program''',
            options: ["valgrind", "gdb", "perf", "strace"],
            correctIndex: 0,
            explanation: "Valgrind (özellikle memcheck aracı) C/C++ programlarında bellek yönetim hatalarını ayrıntılı raporlar.",
          ),
          Question(
            id: "c_unit_4_l3_q8",
            type: QuestionType.multipleChoice,
            prompt: "Aşağıdaki bit düzeyinde (bitwise) operatörlerden hangisi bitleri 1 basamak sola kaydırarak 2 ile çarpmayı sağlar?",
            codeSnippet: r'''int x = 5;
int y = x ___ 1; // y = 10 olur''',
            options: ["<<", ">>", "&", "|"],
            correctIndex: 0,
            explanation: "Sola kaydırma (<< n) operatörü sayının değerini 2^n ile çarpar.",
          ),
          Question(
            id: "c_unit_4_l3_q9",
            type: QuestionType.multipleChoice,
            prompt: "C'de dosya açmak ve bir dosya işaretçisi (FILE*) elde etmek için hangi standart fonksiyon kullanılır?",
            codeSnippet: r'''FILE *f = ___("data.txt", "r");''',
            options: ["fopen", "open", "file_open", "create_file"],
            correctIndex: 0,
            explanation: "'fopen(dosya_adi, mod)' dosyayı belirtilen modda (r, w, a, rb, wb) açar.",
          ),
          Question(
            id: "c_unit_4_l3_q10",
            type: QuestionType.multipleChoice,
            prompt: "Bir header dosyasının birden fazla kez derlemeye dahil edilmesini (redefinition) önlemek için ne kullanılır?",
            codeSnippet: r'''#ifndef MY_HEADER_H
#define MY_HEADER_H
// ...
#endif''',
            options: ["Header Guards (#ifndef / #define)", "namespace", "pragma private", "module"],
            correctIndex: 0,
            explanation: "Header guards veya '#pragma once' başlık dosyalarının mükerrer include edilmesini engeller.",
          ),
          Question(
            id: "c_unit_4_l3_q11",
            type: QuestionType.multipleChoice,
            prompt: "Tüm üyelerinin bellekte AYNI başlangıç adresini paylaştığı ve en büyük üyesi kadar yer kaplayan yapı hangisidir?",
            codeSnippet: r'''___ Data {
    int i;
    float f;
    char str[20];
};''',
            options: ["union", "struct", "class", "shared"],
            correctIndex: 0,
            explanation: "'union' içindeki tüm elemanlar aynı bellek alanını ortaklaşa kullanır; aynı anda sadece biri geçerli değer tutar.",
          ),
          Question(
            id: "c_unit_4_l3_q12",
            type: QuestionType.multipleChoice,
            prompt: "C dilinde bir değişkenin bellekteki adresini elde etmek için hangi operatör kullanılır?",
            codeSnippet: r'''int x = 10;
int *ptr = ___x;''',
            options: ["& (Address-of)", "* (Dereference)", "% (Mod)", "\$ (Value)"],
            correctIndex: 0,
            explanation: "'&' operatörü bir değişkenin RAM üzerindeki başlangıç adresini döner.",
          ),
          Question(
            id: "c_unit_4_l3_q13",
            type: QuestionType.fillInTheBlank,
            prompt: "Geçersiz veya henüz atanmamış bir işaretçiye güvenli başlangıç değeri olarak _____ atanmalıdır.",
            explanation: "İşaretçilere NULL atamak tanımsız belleğe erişimi ve segmentation fault hatalarını engellemeye yardımcı olur.",
            blankOptions: ["NULL", "0xFF", "void", "NaN"],
            correctBlankAnswer: "NULL",
          ),
          Question(
            id: "c_unit_4_l3_q14",
            type: QuestionType.fillInTheBlank,
            prompt: "Bir veri tipinin bellekte kaç bayt yer kapladığını öğrenmek için derleme zamanı operatörü olan _____ kullanılır.",
            explanation: "sizeof(tip) veya sizeof(degisken) bayt cinsinden bellek boyutunu size_t olarak döner.",
            blankOptions: ["sizeof", "lengthof", "bytesize", "countof"],
            correctBlankAnswer: "sizeof",
          ),
          Question(
            id: "c_unit_4_l3_q15",
            type: QuestionType.fillInTheBlank,
            prompt: "Açılmış bir dosya işaretçisini işletim sistemine geri iade etmek için _____ fonksiyonu çağrılır.",
            explanation: "fclose(FILE *stream) dosya tamponlarını diske yazar ve kaynakları kapatır.",
            blankOptions: ["fclose", "close", "file_exit", "dispose"],
            correctBlankAnswer: "fclose",
          ),
          Question(
            id: "c_unit_4_l3_q16",
            type: QuestionType.trueFalse,
            prompt: "C dilinde dizi isimleri ifadeler içinde kullanıldığında dizinin ilk elemanının bellek adresine (pointer) dönüşür (decay).",
            explanation: "Doğrudur, 'arr' ifadesi '&arr[0]' adresi ile eşdeğerdir.",
            isTrue: true,
          ),
          Question(
            id: "c_unit_4_l3_q17",
            type: QuestionType.trueFalse,
            prompt: "Stack belleğinde oluşturulan yerel değişkenler fonksiyon sonlandığında da bellekte kalmaya devam eder ve serbest bırakılması için free() gerekir.",
            explanation: "Yanlıştır! Stack bellek fonksiyon bitiminde otomatik temizlenir; free() sadece heap (malloc) için geçerlidir.",
            isTrue: false,
          ),
          Question(
            id: "c_unit_4_l3_q18",
            type: QuestionType.matching,
            prompt: "C bellek kavramlarını doğru açıklamalarıyla eşleştirin.",
            explanation: "C'de bellek güvenliği doğrudan yazılımcının sorumluluğundadır.",
            matchingPairs: [MatchingPair(left: "malloc", right: "Heap üzerinde başlatılmamış bellek tahsisi"), MatchingPair(left: "free", right: "Dinamik belleği sisteme iade etme"), MatchingPair(left: "Valgrind", right: "Bellek sızıntılarını tespit eden analiz aracı")],
          ),
        ],
      ),
      Lesson(
        id: "c_unit_4_l4",
        title: "C Stringleri: Null-Terminated (\\0) Karakter Dizileri",
        description: "Stringlerin sonundaki 0 baytı kuralı",
        xpReward: 35,
        gemReward: 12,
        isUnitExam: false,
        questions: [
          Question(
            id: "c_unit_4_l4_q1",
            type: QuestionType.conceptCard,
            conceptTitle: "C Stringleri: Null-Terminated (\\0) Karakter Dizileri - Hap Bilgi",
            rule: "C dilinde işaretçiler (pointers) doğrudan bellek adreslerini saklar. '&' operatörü bir değişkenin adresini alırken, '*' (dereference) o adresteki veriye erişir veya değiştirir.",
            codeExample: r'''#include <stdio.h>
#include <stdlib.h>

int main() {
    int x = 100;
    int *ptr = &x;
    
    printf("x Degeri: %d\n", *ptr);
    printf("x Bellek Adresi: %p\n", (void*)ptr);
    return 0;
}''',
            devTip: "malloc ile tahsis edilen her bayt bellek için mutlaka bir free() çağrısı yapılmalıdır, aksi halde Memory Leak oluşur.",
            iconEmoji: "⚡",
          ),
          Question(
            id: "c_unit_4_l4_q2",
            type: QuestionType.multipleChoice,
            prompt: "Bir struct içindeki bir işaretçi elemana erişirken '.' yerine hangi pratik operatör kullanılır?",
            codeSnippet: r'''struct User *u = getUser();
u___name = "Ahmet";''',
            options: ["-> (Ok operatörü)", ".", "::", "=>"],
            correctIndex: 0,
            explanation: "'u->name', '(*u).name' yazımının daha okunaklı ve standart kısayoludur.",
          ),
          Question(
            id: "c_unit_4_l4_q3",
            type: QuestionType.multipleChoice,
            prompt: "Herhangi bir veri tipine ait bellek adresini tutabilen jenerik (tip bağımsız) işaretçi tipi hangisidir?",
            codeSnippet: r'''___ generic_ptr = &x;''',
            options: ["void*", "any*", "object*", "generic*"],
            correctIndex: 0,
            explanation: "'void*' tipi belirsiz jenerik bir işaretçidir; doğrudan dereference edilemez, cast edilmesi gerekir.",
          ),
          Question(
            id: "c_unit_4_l4_q4",
            type: QuestionType.multipleChoice,
            prompt: "Serbest bırakılmış (free edilmiş) bir işaretçiyi kullanmaya devam etme hatasına ne ad verilir?",
            codeSnippet: r'''free(ptr);
printf("%d", *ptr); // HATA!''',
            options: ["Dangling Pointer (Askıda Kalan İşaretçi)", "Stack Overflow", "Memory Leak", "Deadlock"],
            correctIndex: 0,
            explanation: "free edildikten sonra hala o adresi göstermeye devam eden işaretçiye dangling pointer denir; 'ptr = NULL' yapılarak önlenir.",
          ),
          Question(
            id: "c_unit_4_l4_q5",
            type: QuestionType.multipleChoice,
            prompt: "C programlarında bellek sızıntılarını (memory leak) ve geçersiz bellek erişimlerini tespit etmek için en popüler Linux aracı hangisidir?",
            codeSnippet: r'''$ ___ --leak-check=full ./program''',
            options: ["valgrind", "gdb", "perf", "strace"],
            correctIndex: 0,
            explanation: "Valgrind (özellikle memcheck aracı) C/C++ programlarında bellek yönetim hatalarını ayrıntılı raporlar.",
          ),
          Question(
            id: "c_unit_4_l4_q6",
            type: QuestionType.multipleChoice,
            prompt: "Aşağıdaki bit düzeyinde (bitwise) operatörlerden hangisi bitleri 1 basamak sola kaydırarak 2 ile çarpmayı sağlar?",
            codeSnippet: r'''int x = 5;
int y = x ___ 1; // y = 10 olur''',
            options: ["<<", ">>", "&", "|"],
            correctIndex: 0,
            explanation: "Sola kaydırma (<< n) operatörü sayının değerini 2^n ile çarpar.",
          ),
          Question(
            id: "c_unit_4_l4_q7",
            type: QuestionType.multipleChoice,
            prompt: "C'de dosya açmak ve bir dosya işaretçisi (FILE*) elde etmek için hangi standart fonksiyon kullanılır?",
            codeSnippet: r'''FILE *f = ___("data.txt", "r");''',
            options: ["fopen", "open", "file_open", "create_file"],
            correctIndex: 0,
            explanation: "'fopen(dosya_adi, mod)' dosyayı belirtilen modda (r, w, a, rb, wb) açar.",
          ),
          Question(
            id: "c_unit_4_l4_q8",
            type: QuestionType.multipleChoice,
            prompt: "Bir header dosyasının birden fazla kez derlemeye dahil edilmesini (redefinition) önlemek için ne kullanılır?",
            codeSnippet: r'''#ifndef MY_HEADER_H
#define MY_HEADER_H
// ...
#endif''',
            options: ["Header Guards (#ifndef / #define)", "namespace", "pragma private", "module"],
            correctIndex: 0,
            explanation: "Header guards veya '#pragma once' başlık dosyalarının mükerrer include edilmesini engeller.",
          ),
          Question(
            id: "c_unit_4_l4_q9",
            type: QuestionType.multipleChoice,
            prompt: "Tüm üyelerinin bellekte AYNI başlangıç adresini paylaştığı ve en büyük üyesi kadar yer kaplayan yapı hangisidir?",
            codeSnippet: r'''___ Data {
    int i;
    float f;
    char str[20];
};''',
            options: ["union", "struct", "class", "shared"],
            correctIndex: 0,
            explanation: "'union' içindeki tüm elemanlar aynı bellek alanını ortaklaşa kullanır; aynı anda sadece biri geçerli değer tutar.",
          ),
          Question(
            id: "c_unit_4_l4_q10",
            type: QuestionType.multipleChoice,
            prompt: "C dilinde bir değişkenin bellekteki adresini elde etmek için hangi operatör kullanılır?",
            codeSnippet: r'''int x = 10;
int *ptr = ___x;''',
            options: ["& (Address-of)", "* (Dereference)", "% (Mod)", "\$ (Value)"],
            correctIndex: 0,
            explanation: "'&' operatörü bir değişkenin RAM üzerindeki başlangıç adresini döner.",
          ),
          Question(
            id: "c_unit_4_l4_q11",
            type: QuestionType.multipleChoice,
            prompt: "Bir işaretçinin (pointer) işaret ettiği bellek adresindeki veriye erişmek veya onu değiştirmek için hangi işlem yapılır?",
            codeSnippet: r'''int x = 5;
int *p = &x;
___p = 20; // x artik 20 olur''',
            options: ["* (Dereference)", "&", "->", "."],
            correctIndex: 0,
            explanation: "'*p' dereferencing yaparak işaretçinin tuttuğu adresteki asıl değere erişir.",
          ),
          Question(
            id: "c_unit_4_l4_q12",
            type: QuestionType.multipleChoice,
            prompt: "Heap bellekte dinamik olarak bayt cinsinden bellek tahsis etmek için hangi standart kütüphane fonksiyonu kullanılır?",
            codeSnippet: r'''int *arr = (int*)___(10 * sizeof(int));''',
            options: ["malloc", "alloc", "new", "heap_get"],
            correctIndex: 0,
            explanation: "'malloc(size_t size)' heap bölgesinde istenen bayt kadar bellek ayırır ve void* işaretçi döner.",
          ),
          Question(
            id: "c_unit_4_l4_q13",
            type: QuestionType.fillInTheBlank,
            prompt: "Geçersiz veya henüz atanmamış bir işaretçiye güvenli başlangıç değeri olarak _____ atanmalıdır.",
            explanation: "İşaretçilere NULL atamak tanımsız belleğe erişimi ve segmentation fault hatalarını engellemeye yardımcı olur.",
            blankOptions: ["NULL", "0xFF", "void", "NaN"],
            correctBlankAnswer: "NULL",
          ),
          Question(
            id: "c_unit_4_l4_q14",
            type: QuestionType.fillInTheBlank,
            prompt: "Bir veri tipinin bellekte kaç bayt yer kapladığını öğrenmek için derleme zamanı operatörü olan _____ kullanılır.",
            explanation: "sizeof(tip) veya sizeof(degisken) bayt cinsinden bellek boyutunu size_t olarak döner.",
            blankOptions: ["sizeof", "lengthof", "bytesize", "countof"],
            correctBlankAnswer: "sizeof",
          ),
          Question(
            id: "c_unit_4_l4_q15",
            type: QuestionType.fillInTheBlank,
            prompt: "Açılmış bir dosya işaretçisini işletim sistemine geri iade etmek için _____ fonksiyonu çağrılır.",
            explanation: "fclose(FILE *stream) dosya tamponlarını diske yazar ve kaynakları kapatır.",
            blankOptions: ["fclose", "close", "file_exit", "dispose"],
            correctBlankAnswer: "fclose",
          ),
          Question(
            id: "c_unit_4_l4_q16",
            type: QuestionType.trueFalse,
            prompt: "C dilinde dizi isimleri ifadeler içinde kullanıldığında dizinin ilk elemanının bellek adresine (pointer) dönüşür (decay).",
            explanation: "Doğrudur, 'arr' ifadesi '&arr[0]' adresi ile eşdeğerdir.",
            isTrue: true,
          ),
          Question(
            id: "c_unit_4_l4_q17",
            type: QuestionType.trueFalse,
            prompt: "Stack belleğinde oluşturulan yerel değişkenler fonksiyon sonlandığında da bellekte kalmaya devam eder ve serbest bırakılması için free() gerekir.",
            explanation: "Yanlıştır! Stack bellek fonksiyon bitiminde otomatik temizlenir; free() sadece heap (malloc) için geçerlidir.",
            isTrue: false,
          ),
          Question(
            id: "c_unit_4_l4_q18",
            type: QuestionType.matching,
            prompt: "C bellek kavramlarını doğru açıklamalarıyla eşleştirin.",
            explanation: "C'de bellek güvenliği doğrudan yazılımcının sorumluluğundadır.",
            matchingPairs: [MatchingPair(left: "malloc", right: "Heap üzerinde başlatılmamış bellek tahsisi"), MatchingPair(left: "free", right: "Dinamik belleği sisteme iade etme"), MatchingPair(left: "Valgrind", right: "Bellek sızıntılarını tespit eden analiz aracı")],
          ),
        ],
      ),
      Lesson(
        id: "c_unit_4_l5",
        title: "string.h Kütüphanesi: strlen, strcpy, strcmp, strcat",
        description: "Standart string fonksiyonları ve tehlikeleri",
        xpReward: 35,
        gemReward: 12,
        isUnitExam: false,
        questions: [
          Question(
            id: "c_unit_4_l5_q1",
            type: QuestionType.conceptCard,
            conceptTitle: "string.h Kütüphanesi: strlen, strcpy, strcmp, strcat - Hap Bilgi",
            rule: "C dilinde işaretçiler (pointers) doğrudan bellek adreslerini saklar. '&' operatörü bir değişkenin adresini alırken, '*' (dereference) o adresteki veriye erişir veya değiştirir.",
            codeExample: r'''#include <stdio.h>
#include <stdlib.h>

int main() {
    int x = 100;
    int *ptr = &x;
    
    printf("x Degeri: %d\n", *ptr);
    printf("x Bellek Adresi: %p\n", (void*)ptr);
    return 0;
}''',
            devTip: "malloc ile tahsis edilen her bayt bellek için mutlaka bir free() çağrısı yapılmalıdır, aksi halde Memory Leak oluşur.",
            iconEmoji: "⚡",
          ),
          Question(
            id: "c_unit_4_l5_q2",
            type: QuestionType.multipleChoice,
            prompt: "Serbest bırakılmış (free edilmiş) bir işaretçiyi kullanmaya devam etme hatasına ne ad verilir?",
            codeSnippet: r'''free(ptr);
printf("%d", *ptr); // HATA!''',
            options: ["Dangling Pointer (Askıda Kalan İşaretçi)", "Stack Overflow", "Memory Leak", "Deadlock"],
            correctIndex: 0,
            explanation: "free edildikten sonra hala o adresi göstermeye devam eden işaretçiye dangling pointer denir; 'ptr = NULL' yapılarak önlenir.",
          ),
          Question(
            id: "c_unit_4_l5_q3",
            type: QuestionType.multipleChoice,
            prompt: "C programlarında bellek sızıntılarını (memory leak) ve geçersiz bellek erişimlerini tespit etmek için en popüler Linux aracı hangisidir?",
            codeSnippet: r'''$ ___ --leak-check=full ./program''',
            options: ["valgrind", "gdb", "perf", "strace"],
            correctIndex: 0,
            explanation: "Valgrind (özellikle memcheck aracı) C/C++ programlarında bellek yönetim hatalarını ayrıntılı raporlar.",
          ),
          Question(
            id: "c_unit_4_l5_q4",
            type: QuestionType.multipleChoice,
            prompt: "Aşağıdaki bit düzeyinde (bitwise) operatörlerden hangisi bitleri 1 basamak sola kaydırarak 2 ile çarpmayı sağlar?",
            codeSnippet: r'''int x = 5;
int y = x ___ 1; // y = 10 olur''',
            options: ["<<", ">>", "&", "|"],
            correctIndex: 0,
            explanation: "Sola kaydırma (<< n) operatörü sayının değerini 2^n ile çarpar.",
          ),
          Question(
            id: "c_unit_4_l5_q5",
            type: QuestionType.multipleChoice,
            prompt: "C'de dosya açmak ve bir dosya işaretçisi (FILE*) elde etmek için hangi standart fonksiyon kullanılır?",
            codeSnippet: r'''FILE *f = ___("data.txt", "r");''',
            options: ["fopen", "open", "file_open", "create_file"],
            correctIndex: 0,
            explanation: "'fopen(dosya_adi, mod)' dosyayı belirtilen modda (r, w, a, rb, wb) açar.",
          ),
          Question(
            id: "c_unit_4_l5_q6",
            type: QuestionType.multipleChoice,
            prompt: "Bir header dosyasının birden fazla kez derlemeye dahil edilmesini (redefinition) önlemek için ne kullanılır?",
            codeSnippet: r'''#ifndef MY_HEADER_H
#define MY_HEADER_H
// ...
#endif''',
            options: ["Header Guards (#ifndef / #define)", "namespace", "pragma private", "module"],
            correctIndex: 0,
            explanation: "Header guards veya '#pragma once' başlık dosyalarının mükerrer include edilmesini engeller.",
          ),
          Question(
            id: "c_unit_4_l5_q7",
            type: QuestionType.multipleChoice,
            prompt: "Tüm üyelerinin bellekte AYNI başlangıç adresini paylaştığı ve en büyük üyesi kadar yer kaplayan yapı hangisidir?",
            codeSnippet: r'''___ Data {
    int i;
    float f;
    char str[20];
};''',
            options: ["union", "struct", "class", "shared"],
            correctIndex: 0,
            explanation: "'union' içindeki tüm elemanlar aynı bellek alanını ortaklaşa kullanır; aynı anda sadece biri geçerli değer tutar.",
          ),
          Question(
            id: "c_unit_4_l5_q8",
            type: QuestionType.multipleChoice,
            prompt: "C dilinde bir değişkenin bellekteki adresini elde etmek için hangi operatör kullanılır?",
            codeSnippet: r'''int x = 10;
int *ptr = ___x;''',
            options: ["& (Address-of)", "* (Dereference)", "% (Mod)", "\$ (Value)"],
            correctIndex: 0,
            explanation: "'&' operatörü bir değişkenin RAM üzerindeki başlangıç adresini döner.",
          ),
          Question(
            id: "c_unit_4_l5_q9",
            type: QuestionType.multipleChoice,
            prompt: "Bir işaretçinin (pointer) işaret ettiği bellek adresindeki veriye erişmek veya onu değiştirmek için hangi işlem yapılır?",
            codeSnippet: r'''int x = 5;
int *p = &x;
___p = 20; // x artik 20 olur''',
            options: ["* (Dereference)", "&", "->", "."],
            correctIndex: 0,
            explanation: "'*p' dereferencing yaparak işaretçinin tuttuğu adresteki asıl değere erişir.",
          ),
          Question(
            id: "c_unit_4_l5_q10",
            type: QuestionType.multipleChoice,
            prompt: "Heap bellekte dinamik olarak bayt cinsinden bellek tahsis etmek için hangi standart kütüphane fonksiyonu kullanılır?",
            codeSnippet: r'''int *arr = (int*)___(10 * sizeof(int));''',
            options: ["malloc", "alloc", "new", "heap_get"],
            correctIndex: 0,
            explanation: "'malloc(size_t size)' heap bölgesinde istenen bayt kadar bellek ayırır ve void* işaretçi döner.",
          ),
          Question(
            id: "c_unit_4_l5_q11",
            type: QuestionType.multipleChoice,
            prompt: "malloc veya calloc ile tahsis edilen dinamik belleğin sisteme iade edilmesi için hangi fonksiyon çağrılmalıdır?",
            codeSnippet: r'''int *buf = malloc(1024);
// ... kullanim ...
___(buf);''',
            options: ["free", "delete", "release", "dispose"],
            correctIndex: 0,
            explanation: "'free(ptr)' heap bellekte ayrılan alanı serbest bırakır. Çağrılmazsa 'Memory Leak' oluşur.",
          ),
          Question(
            id: "c_unit_4_l5_q12",
            type: QuestionType.multipleChoice,
            prompt: "Tahsis ettiği belleği otomatik olarak sıfırlarla (0 baytları) dolduran dinamik bellek fonksiyonu hangisidir?",
            codeSnippet: r'''int *p = ___(100, sizeof(int));''',
            options: ["calloc", "malloc", "realloc", "zalloc"],
            correctIndex: 0,
            explanation: "'calloc(num, size)' eleman sayısı ve eleman boyutu alır, ayrılan tüm bellek hücrelerini 0 ile başlatır.",
          ),
          Question(
            id: "c_unit_4_l5_q13",
            type: QuestionType.fillInTheBlank,
            prompt: "Geçersiz veya henüz atanmamış bir işaretçiye güvenli başlangıç değeri olarak _____ atanmalıdır.",
            explanation: "İşaretçilere NULL atamak tanımsız belleğe erişimi ve segmentation fault hatalarını engellemeye yardımcı olur.",
            blankOptions: ["NULL", "0xFF", "void", "NaN"],
            correctBlankAnswer: "NULL",
          ),
          Question(
            id: "c_unit_4_l5_q14",
            type: QuestionType.fillInTheBlank,
            prompt: "Bir veri tipinin bellekte kaç bayt yer kapladığını öğrenmek için derleme zamanı operatörü olan _____ kullanılır.",
            explanation: "sizeof(tip) veya sizeof(degisken) bayt cinsinden bellek boyutunu size_t olarak döner.",
            blankOptions: ["sizeof", "lengthof", "bytesize", "countof"],
            correctBlankAnswer: "sizeof",
          ),
          Question(
            id: "c_unit_4_l5_q15",
            type: QuestionType.fillInTheBlank,
            prompt: "Açılmış bir dosya işaretçisini işletim sistemine geri iade etmek için _____ fonksiyonu çağrılır.",
            explanation: "fclose(FILE *stream) dosya tamponlarını diske yazar ve kaynakları kapatır.",
            blankOptions: ["fclose", "close", "file_exit", "dispose"],
            correctBlankAnswer: "fclose",
          ),
          Question(
            id: "c_unit_4_l5_q16",
            type: QuestionType.trueFalse,
            prompt: "C dilinde dizi isimleri ifadeler içinde kullanıldığında dizinin ilk elemanının bellek adresine (pointer) dönüşür (decay).",
            explanation: "Doğrudur, 'arr' ifadesi '&arr[0]' adresi ile eşdeğerdir.",
            isTrue: true,
          ),
          Question(
            id: "c_unit_4_l5_q17",
            type: QuestionType.trueFalse,
            prompt: "Stack belleğinde oluşturulan yerel değişkenler fonksiyon sonlandığında da bellekte kalmaya devam eder ve serbest bırakılması için free() gerekir.",
            explanation: "Yanlıştır! Stack bellek fonksiyon bitiminde otomatik temizlenir; free() sadece heap (malloc) için geçerlidir.",
            isTrue: false,
          ),
          Question(
            id: "c_unit_4_l5_q18",
            type: QuestionType.matching,
            prompt: "C bellek kavramlarını doğru açıklamalarıyla eşleştirin.",
            explanation: "C'de bellek güvenliği doğrudan yazılımcının sorumluluğundadır.",
            matchingPairs: [MatchingPair(left: "malloc", right: "Heap üzerinde başlatılmamış bellek tahsisi"), MatchingPair(left: "free", right: "Dinamik belleği sisteme iade etme"), MatchingPair(left: "Valgrind", right: "Bellek sızıntılarını tespit eden analiz aracı")],
          ),
        ],
      ),
      Lesson(
        id: "c_unit_4_l6",
        title: "Tampon Taşması (Buffer Overflow) Tehlikesi",
        description: "Dizi sınırlarının dışına yazma açıkları",
        xpReward: 35,
        gemReward: 12,
        isUnitExam: false,
        questions: [
          Question(
            id: "c_unit_4_l6_q1",
            type: QuestionType.conceptCard,
            conceptTitle: "Tampon Taşması (Buffer Overflow) Tehlikesi - Hap Bilgi",
            rule: "C dilinde işaretçiler (pointers) doğrudan bellek adreslerini saklar. '&' operatörü bir değişkenin adresini alırken, '*' (dereference) o adresteki veriye erişir veya değiştirir.",
            codeExample: r'''#include <stdio.h>
#include <stdlib.h>

int main() {
    int x = 100;
    int *ptr = &x;
    
    printf("x Degeri: %d\n", *ptr);
    printf("x Bellek Adresi: %p\n", (void*)ptr);
    return 0;
}''',
            devTip: "malloc ile tahsis edilen her bayt bellek için mutlaka bir free() çağrısı yapılmalıdır, aksi halde Memory Leak oluşur.",
            iconEmoji: "⚡",
          ),
          Question(
            id: "c_unit_4_l6_q2",
            type: QuestionType.multipleChoice,
            prompt: "Aşağıdaki bit düzeyinde (bitwise) operatörlerden hangisi bitleri 1 basamak sola kaydırarak 2 ile çarpmayı sağlar?",
            codeSnippet: r'''int x = 5;
int y = x ___ 1; // y = 10 olur''',
            options: ["<<", ">>", "&", "|"],
            correctIndex: 0,
            explanation: "Sola kaydırma (<< n) operatörü sayının değerini 2^n ile çarpar.",
          ),
          Question(
            id: "c_unit_4_l6_q3",
            type: QuestionType.multipleChoice,
            prompt: "C'de dosya açmak ve bir dosya işaretçisi (FILE*) elde etmek için hangi standart fonksiyon kullanılır?",
            codeSnippet: r'''FILE *f = ___("data.txt", "r");''',
            options: ["fopen", "open", "file_open", "create_file"],
            correctIndex: 0,
            explanation: "'fopen(dosya_adi, mod)' dosyayı belirtilen modda (r, w, a, rb, wb) açar.",
          ),
          Question(
            id: "c_unit_4_l6_q4",
            type: QuestionType.multipleChoice,
            prompt: "Bir header dosyasının birden fazla kez derlemeye dahil edilmesini (redefinition) önlemek için ne kullanılır?",
            codeSnippet: r'''#ifndef MY_HEADER_H
#define MY_HEADER_H
// ...
#endif''',
            options: ["Header Guards (#ifndef / #define)", "namespace", "pragma private", "module"],
            correctIndex: 0,
            explanation: "Header guards veya '#pragma once' başlık dosyalarının mükerrer include edilmesini engeller.",
          ),
          Question(
            id: "c_unit_4_l6_q5",
            type: QuestionType.multipleChoice,
            prompt: "Tüm üyelerinin bellekte AYNI başlangıç adresini paylaştığı ve en büyük üyesi kadar yer kaplayan yapı hangisidir?",
            codeSnippet: r'''___ Data {
    int i;
    float f;
    char str[20];
};''',
            options: ["union", "struct", "class", "shared"],
            correctIndex: 0,
            explanation: "'union' içindeki tüm elemanlar aynı bellek alanını ortaklaşa kullanır; aynı anda sadece biri geçerli değer tutar.",
          ),
          Question(
            id: "c_unit_4_l6_q6",
            type: QuestionType.multipleChoice,
            prompt: "C dilinde bir değişkenin bellekteki adresini elde etmek için hangi operatör kullanılır?",
            codeSnippet: r'''int x = 10;
int *ptr = ___x;''',
            options: ["& (Address-of)", "* (Dereference)", "% (Mod)", "\$ (Value)"],
            correctIndex: 0,
            explanation: "'&' operatörü bir değişkenin RAM üzerindeki başlangıç adresini döner.",
          ),
          Question(
            id: "c_unit_4_l6_q7",
            type: QuestionType.multipleChoice,
            prompt: "Bir işaretçinin (pointer) işaret ettiği bellek adresindeki veriye erişmek veya onu değiştirmek için hangi işlem yapılır?",
            codeSnippet: r'''int x = 5;
int *p = &x;
___p = 20; // x artik 20 olur''',
            options: ["* (Dereference)", "&", "->", "."],
            correctIndex: 0,
            explanation: "'*p' dereferencing yaparak işaretçinin tuttuğu adresteki asıl değere erişir.",
          ),
          Question(
            id: "c_unit_4_l6_q8",
            type: QuestionType.multipleChoice,
            prompt: "Heap bellekte dinamik olarak bayt cinsinden bellek tahsis etmek için hangi standart kütüphane fonksiyonu kullanılır?",
            codeSnippet: r'''int *arr = (int*)___(10 * sizeof(int));''',
            options: ["malloc", "alloc", "new", "heap_get"],
            correctIndex: 0,
            explanation: "'malloc(size_t size)' heap bölgesinde istenen bayt kadar bellek ayırır ve void* işaretçi döner.",
          ),
          Question(
            id: "c_unit_4_l6_q9",
            type: QuestionType.multipleChoice,
            prompt: "malloc veya calloc ile tahsis edilen dinamik belleğin sisteme iade edilmesi için hangi fonksiyon çağrılmalıdır?",
            codeSnippet: r'''int *buf = malloc(1024);
// ... kullanim ...
___(buf);''',
            options: ["free", "delete", "release", "dispose"],
            correctIndex: 0,
            explanation: "'free(ptr)' heap bellekte ayrılan alanı serbest bırakır. Çağrılmazsa 'Memory Leak' oluşur.",
          ),
          Question(
            id: "c_unit_4_l6_q10",
            type: QuestionType.multipleChoice,
            prompt: "Tahsis ettiği belleği otomatik olarak sıfırlarla (0 baytları) dolduran dinamik bellek fonksiyonu hangisidir?",
            codeSnippet: r'''int *p = ___(100, sizeof(int));''',
            options: ["calloc", "malloc", "realloc", "zalloc"],
            correctIndex: 0,
            explanation: "'calloc(num, size)' eleman sayısı ve eleman boyutu alır, ayrılan tüm bellek hücrelerini 0 ile başlatır.",
          ),
          Question(
            id: "c_unit_4_l6_q11",
            type: QuestionType.multipleChoice,
            prompt: "Daha önce ayrılmış dinamik bir bellek bloğunun boyutunu veri kaybı olmadan büyütmek veya küçültmek için ne kullanılır?",
            codeSnippet: r'''ptr = ___(ptr, new_size);''',
            options: ["realloc", "resize", "remalloc", "expand"],
            correctIndex: 0,
            explanation: "'realloc' mevcut bloğu genişletir veya yeni bir konuma taşıyarak eski veriyi kopyalar.",
          ),
          Question(
            id: "c_unit_4_l6_q12",
            type: QuestionType.multipleChoice,
            prompt: "C programlama dilinde GCC derleme sürecinin doğru sırası aşağıdakilerden hangisidir?",
            options: ["Preprocessor -> Compiler -> Assembler -> Linker", "Compiler -> Preprocessor -> Linker -> Assembler", "Assembler -> Compiler -> Linker -> Preprocessor", "Linker -> Assembler -> Compiler -> Preprocessor"],
            correctIndex: 0,
            explanation: "Önce makrolar ve headerlar çözülür (cpp), C kodu Assembly'ye derlenir (cc1), makine koduna çevrilir (as), kütüphaneler bağlanır (ld).",
          ),
          Question(
            id: "c_unit_4_l6_q13",
            type: QuestionType.fillInTheBlank,
            prompt: "Geçersiz veya henüz atanmamış bir işaretçiye güvenli başlangıç değeri olarak _____ atanmalıdır.",
            explanation: "İşaretçilere NULL atamak tanımsız belleğe erişimi ve segmentation fault hatalarını engellemeye yardımcı olur.",
            blankOptions: ["NULL", "0xFF", "void", "NaN"],
            correctBlankAnswer: "NULL",
          ),
          Question(
            id: "c_unit_4_l6_q14",
            type: QuestionType.fillInTheBlank,
            prompt: "Bir veri tipinin bellekte kaç bayt yer kapladığını öğrenmek için derleme zamanı operatörü olan _____ kullanılır.",
            explanation: "sizeof(tip) veya sizeof(degisken) bayt cinsinden bellek boyutunu size_t olarak döner.",
            blankOptions: ["sizeof", "lengthof", "bytesize", "countof"],
            correctBlankAnswer: "sizeof",
          ),
          Question(
            id: "c_unit_4_l6_q15",
            type: QuestionType.fillInTheBlank,
            prompt: "Açılmış bir dosya işaretçisini işletim sistemine geri iade etmek için _____ fonksiyonu çağrılır.",
            explanation: "fclose(FILE *stream) dosya tamponlarını diske yazar ve kaynakları kapatır.",
            blankOptions: ["fclose", "close", "file_exit", "dispose"],
            correctBlankAnswer: "fclose",
          ),
          Question(
            id: "c_unit_4_l6_q16",
            type: QuestionType.trueFalse,
            prompt: "C dilinde dizi isimleri ifadeler içinde kullanıldığında dizinin ilk elemanının bellek adresine (pointer) dönüşür (decay).",
            explanation: "Doğrudur, 'arr' ifadesi '&arr[0]' adresi ile eşdeğerdir.",
            isTrue: true,
          ),
          Question(
            id: "c_unit_4_l6_q17",
            type: QuestionType.trueFalse,
            prompt: "Stack belleğinde oluşturulan yerel değişkenler fonksiyon sonlandığında da bellekte kalmaya devam eder ve serbest bırakılması için free() gerekir.",
            explanation: "Yanlıştır! Stack bellek fonksiyon bitiminde otomatik temizlenir; free() sadece heap (malloc) için geçerlidir.",
            isTrue: false,
          ),
          Question(
            id: "c_unit_4_l6_q18",
            type: QuestionType.matching,
            prompt: "C bellek kavramlarını doğru açıklamalarıyla eşleştirin.",
            explanation: "C'de bellek güvenliği doğrudan yazılımcının sorumluluğundadır.",
            matchingPairs: [MatchingPair(left: "malloc", right: "Heap üzerinde başlatılmamış bellek tahsisi"), MatchingPair(left: "free", right: "Dinamik belleği sisteme iade etme"), MatchingPair(left: "Valgrind", right: "Bellek sızıntılarını tespit eden analiz aracı")],
          ),
        ],
      ),
      Lesson(
        id: "c_unit_4_l7",
        title: "const İşaretçiler (const int* vs int* const)",
        description: "Değerin mi adresin mi sabit olduğunu belirleme",
        xpReward: 35,
        gemReward: 12,
        isUnitExam: false,
        questions: [
          Question(
            id: "c_unit_4_l7_q1",
            type: QuestionType.conceptCard,
            conceptTitle: "const İşaretçiler (const int* vs int* const) - Hap Bilgi",
            rule: "C dilinde işaretçiler (pointers) doğrudan bellek adreslerini saklar. '&' operatörü bir değişkenin adresini alırken, '*' (dereference) o adresteki veriye erişir veya değiştirir.",
            codeExample: r'''#include <stdio.h>
#include <stdlib.h>

int main() {
    int x = 100;
    int *ptr = &x;
    
    printf("x Degeri: %d\n", *ptr);
    printf("x Bellek Adresi: %p\n", (void*)ptr);
    return 0;
}''',
            devTip: "malloc ile tahsis edilen her bayt bellek için mutlaka bir free() çağrısı yapılmalıdır, aksi halde Memory Leak oluşur.",
            iconEmoji: "⚡",
          ),
          Question(
            id: "c_unit_4_l7_q2",
            type: QuestionType.multipleChoice,
            prompt: "Bir header dosyasının birden fazla kez derlemeye dahil edilmesini (redefinition) önlemek için ne kullanılır?",
            codeSnippet: r'''#ifndef MY_HEADER_H
#define MY_HEADER_H
// ...
#endif''',
            options: ["Header Guards (#ifndef / #define)", "namespace", "pragma private", "module"],
            correctIndex: 0,
            explanation: "Header guards veya '#pragma once' başlık dosyalarının mükerrer include edilmesini engeller.",
          ),
          Question(
            id: "c_unit_4_l7_q3",
            type: QuestionType.multipleChoice,
            prompt: "Tüm üyelerinin bellekte AYNI başlangıç adresini paylaştığı ve en büyük üyesi kadar yer kaplayan yapı hangisidir?",
            codeSnippet: r'''___ Data {
    int i;
    float f;
    char str[20];
};''',
            options: ["union", "struct", "class", "shared"],
            correctIndex: 0,
            explanation: "'union' içindeki tüm elemanlar aynı bellek alanını ortaklaşa kullanır; aynı anda sadece biri geçerli değer tutar.",
          ),
          Question(
            id: "c_unit_4_l7_q4",
            type: QuestionType.multipleChoice,
            prompt: "C dilinde bir değişkenin bellekteki adresini elde etmek için hangi operatör kullanılır?",
            codeSnippet: r'''int x = 10;
int *ptr = ___x;''',
            options: ["& (Address-of)", "* (Dereference)", "% (Mod)", "\$ (Value)"],
            correctIndex: 0,
            explanation: "'&' operatörü bir değişkenin RAM üzerindeki başlangıç adresini döner.",
          ),
          Question(
            id: "c_unit_4_l7_q5",
            type: QuestionType.multipleChoice,
            prompt: "Bir işaretçinin (pointer) işaret ettiği bellek adresindeki veriye erişmek veya onu değiştirmek için hangi işlem yapılır?",
            codeSnippet: r'''int x = 5;
int *p = &x;
___p = 20; // x artik 20 olur''',
            options: ["* (Dereference)", "&", "->", "."],
            correctIndex: 0,
            explanation: "'*p' dereferencing yaparak işaretçinin tuttuğu adresteki asıl değere erişir.",
          ),
          Question(
            id: "c_unit_4_l7_q6",
            type: QuestionType.multipleChoice,
            prompt: "Heap bellekte dinamik olarak bayt cinsinden bellek tahsis etmek için hangi standart kütüphane fonksiyonu kullanılır?",
            codeSnippet: r'''int *arr = (int*)___(10 * sizeof(int));''',
            options: ["malloc", "alloc", "new", "heap_get"],
            correctIndex: 0,
            explanation: "'malloc(size_t size)' heap bölgesinde istenen bayt kadar bellek ayırır ve void* işaretçi döner.",
          ),
          Question(
            id: "c_unit_4_l7_q7",
            type: QuestionType.multipleChoice,
            prompt: "malloc veya calloc ile tahsis edilen dinamik belleğin sisteme iade edilmesi için hangi fonksiyon çağrılmalıdır?",
            codeSnippet: r'''int *buf = malloc(1024);
// ... kullanim ...
___(buf);''',
            options: ["free", "delete", "release", "dispose"],
            correctIndex: 0,
            explanation: "'free(ptr)' heap bellekte ayrılan alanı serbest bırakır. Çağrılmazsa 'Memory Leak' oluşur.",
          ),
          Question(
            id: "c_unit_4_l7_q8",
            type: QuestionType.multipleChoice,
            prompt: "Tahsis ettiği belleği otomatik olarak sıfırlarla (0 baytları) dolduran dinamik bellek fonksiyonu hangisidir?",
            codeSnippet: r'''int *p = ___(100, sizeof(int));''',
            options: ["calloc", "malloc", "realloc", "zalloc"],
            correctIndex: 0,
            explanation: "'calloc(num, size)' eleman sayısı ve eleman boyutu alır, ayrılan tüm bellek hücrelerini 0 ile başlatır.",
          ),
          Question(
            id: "c_unit_4_l7_q9",
            type: QuestionType.multipleChoice,
            prompt: "Daha önce ayrılmış dinamik bir bellek bloğunun boyutunu veri kaybı olmadan büyütmek veya küçültmek için ne kullanılır?",
            codeSnippet: r'''ptr = ___(ptr, new_size);''',
            options: ["realloc", "resize", "remalloc", "expand"],
            correctIndex: 0,
            explanation: "'realloc' mevcut bloğu genişletir veya yeni bir konuma taşıyarak eski veriyi kopyalar.",
          ),
          Question(
            id: "c_unit_4_l7_q10",
            type: QuestionType.multipleChoice,
            prompt: "C programlama dilinde GCC derleme sürecinin doğru sırası aşağıdakilerden hangisidir?",
            options: ["Preprocessor -> Compiler -> Assembler -> Linker", "Compiler -> Preprocessor -> Linker -> Assembler", "Assembler -> Compiler -> Linker -> Preprocessor", "Linker -> Assembler -> Compiler -> Preprocessor"],
            correctIndex: 0,
            explanation: "Önce makrolar ve headerlar çözülür (cpp), C kodu Assembly'ye derlenir (cc1), makine koduna çevrilir (as), kütüphaneler bağlanır (ld).",
          ),
          Question(
            id: "c_unit_4_l7_q11",
            type: QuestionType.multipleChoice,
            prompt: "64-bit modern bir mimaride standart bir işaretçi (pointer - int*, char*, void*) değişkeni bellekte kaç bayt yer kaplar?",
            codeSnippet: r'''printf("%zu", sizeof(int*));''',
            options: ["8 bayt", "4 bayt", "2 bayt", "16 bayt"],
            correctIndex: 0,
            explanation: "64-bit mimarilerde bellek adresleri 64 bit yani tam 8 bayttır. İşaretçinin tipi ne olursa olsun adres boyutu 8 bayttır.",
          ),
          Question(
            id: "c_unit_4_l7_q12",
            type: QuestionType.multipleChoice,
            prompt: "Bir struct içindeki bir işaretçi elemana erişirken '.' yerine hangi pratik operatör kullanılır?",
            codeSnippet: r'''struct User *u = getUser();
u___name = "Ahmet";''',
            options: ["-> (Ok operatörü)", ".", "::", "=>"],
            correctIndex: 0,
            explanation: "'u->name', '(*u).name' yazımının daha okunaklı ve standart kısayoludur.",
          ),
          Question(
            id: "c_unit_4_l7_q13",
            type: QuestionType.fillInTheBlank,
            prompt: "Geçersiz veya henüz atanmamış bir işaretçiye güvenli başlangıç değeri olarak _____ atanmalıdır.",
            explanation: "İşaretçilere NULL atamak tanımsız belleğe erişimi ve segmentation fault hatalarını engellemeye yardımcı olur.",
            blankOptions: ["NULL", "0xFF", "void", "NaN"],
            correctBlankAnswer: "NULL",
          ),
          Question(
            id: "c_unit_4_l7_q14",
            type: QuestionType.fillInTheBlank,
            prompt: "Bir veri tipinin bellekte kaç bayt yer kapladığını öğrenmek için derleme zamanı operatörü olan _____ kullanılır.",
            explanation: "sizeof(tip) veya sizeof(degisken) bayt cinsinden bellek boyutunu size_t olarak döner.",
            blankOptions: ["sizeof", "lengthof", "bytesize", "countof"],
            correctBlankAnswer: "sizeof",
          ),
          Question(
            id: "c_unit_4_l7_q15",
            type: QuestionType.fillInTheBlank,
            prompt: "Açılmış bir dosya işaretçisini işletim sistemine geri iade etmek için _____ fonksiyonu çağrılır.",
            explanation: "fclose(FILE *stream) dosya tamponlarını diske yazar ve kaynakları kapatır.",
            blankOptions: ["fclose", "close", "file_exit", "dispose"],
            correctBlankAnswer: "fclose",
          ),
          Question(
            id: "c_unit_4_l7_q16",
            type: QuestionType.trueFalse,
            prompt: "C dilinde dizi isimleri ifadeler içinde kullanıldığında dizinin ilk elemanının bellek adresine (pointer) dönüşür (decay).",
            explanation: "Doğrudur, 'arr' ifadesi '&arr[0]' adresi ile eşdeğerdir.",
            isTrue: true,
          ),
          Question(
            id: "c_unit_4_l7_q17",
            type: QuestionType.trueFalse,
            prompt: "Stack belleğinde oluşturulan yerel değişkenler fonksiyon sonlandığında da bellekte kalmaya devam eder ve serbest bırakılması için free() gerekir.",
            explanation: "Yanlıştır! Stack bellek fonksiyon bitiminde otomatik temizlenir; free() sadece heap (malloc) için geçerlidir.",
            isTrue: false,
          ),
          Question(
            id: "c_unit_4_l7_q18",
            type: QuestionType.matching,
            prompt: "C bellek kavramlarını doğru açıklamalarıyla eşleştirin.",
            explanation: "C'de bellek güvenliği doğrudan yazılımcının sorumluluğundadır.",
            matchingPairs: [MatchingPair(left: "malloc", right: "Heap üzerinde başlatılmamış bellek tahsisi"), MatchingPair(left: "free", right: "Dinamik belleği sisteme iade etme"), MatchingPair(left: "Valgrind", right: "Bellek sızıntılarını tespit eden analiz aracı")],
          ),
        ],
      ),
      Lesson(
        id: "c_unit_4_l8",
        title: "4. Ünite İşaretçi Aritmetiği & Diziler Sınavı",
        description: "Diziler ve string işaretçileri sınavı",
        xpReward: 50,
        gemReward: 25,
        isUnitExam: true,
        questions: [
          Question(
            id: "c_unit_4_l8_q1",
            type: QuestionType.conceptCard,
            conceptTitle: "4. Ünite İşaretçi Aritmetiği & Diziler Sınavı - Hap Bilgi",
            rule: "C dilinde işaretçiler (pointers) doğrudan bellek adreslerini saklar. '&' operatörü bir değişkenin adresini alırken, '*' (dereference) o adresteki veriye erişir veya değiştirir.",
            codeExample: r'''#include <stdio.h>
#include <stdlib.h>

int main() {
    int x = 100;
    int *ptr = &x;
    
    printf("x Degeri: %d\n", *ptr);
    printf("x Bellek Adresi: %p\n", (void*)ptr);
    return 0;
}''',
            devTip: "malloc ile tahsis edilen her bayt bellek için mutlaka bir free() çağrısı yapılmalıdır, aksi halde Memory Leak oluşur.",
            iconEmoji: "⚡",
          ),
          Question(
            id: "c_unit_4_l8_q2",
            type: QuestionType.multipleChoice,
            prompt: "C dilinde bir değişkenin bellekteki adresini elde etmek için hangi operatör kullanılır?",
            codeSnippet: r'''int x = 10;
int *ptr = ___x;''',
            options: ["& (Address-of)", "* (Dereference)", "% (Mod)", "\$ (Value)"],
            correctIndex: 0,
            explanation: "'&' operatörü bir değişkenin RAM üzerindeki başlangıç adresini döner.",
          ),
          Question(
            id: "c_unit_4_l8_q3",
            type: QuestionType.multipleChoice,
            prompt: "Bir işaretçinin (pointer) işaret ettiği bellek adresindeki veriye erişmek veya onu değiştirmek için hangi işlem yapılır?",
            codeSnippet: r'''int x = 5;
int *p = &x;
___p = 20; // x artik 20 olur''',
            options: ["* (Dereference)", "&", "->", "."],
            correctIndex: 0,
            explanation: "'*p' dereferencing yaparak işaretçinin tuttuğu adresteki asıl değere erişir.",
          ),
          Question(
            id: "c_unit_4_l8_q4",
            type: QuestionType.multipleChoice,
            prompt: "Heap bellekte dinamik olarak bayt cinsinden bellek tahsis etmek için hangi standart kütüphane fonksiyonu kullanılır?",
            codeSnippet: r'''int *arr = (int*)___(10 * sizeof(int));''',
            options: ["malloc", "alloc", "new", "heap_get"],
            correctIndex: 0,
            explanation: "'malloc(size_t size)' heap bölgesinde istenen bayt kadar bellek ayırır ve void* işaretçi döner.",
          ),
          Question(
            id: "c_unit_4_l8_q5",
            type: QuestionType.multipleChoice,
            prompt: "malloc veya calloc ile tahsis edilen dinamik belleğin sisteme iade edilmesi için hangi fonksiyon çağrılmalıdır?",
            codeSnippet: r'''int *buf = malloc(1024);
// ... kullanim ...
___(buf);''',
            options: ["free", "delete", "release", "dispose"],
            correctIndex: 0,
            explanation: "'free(ptr)' heap bellekte ayrılan alanı serbest bırakır. Çağrılmazsa 'Memory Leak' oluşur.",
          ),
          Question(
            id: "c_unit_4_l8_q6",
            type: QuestionType.multipleChoice,
            prompt: "Tahsis ettiği belleği otomatik olarak sıfırlarla (0 baytları) dolduran dinamik bellek fonksiyonu hangisidir?",
            codeSnippet: r'''int *p = ___(100, sizeof(int));''',
            options: ["calloc", "malloc", "realloc", "zalloc"],
            correctIndex: 0,
            explanation: "'calloc(num, size)' eleman sayısı ve eleman boyutu alır, ayrılan tüm bellek hücrelerini 0 ile başlatır.",
          ),
          Question(
            id: "c_unit_4_l8_q7",
            type: QuestionType.multipleChoice,
            prompt: "Daha önce ayrılmış dinamik bir bellek bloğunun boyutunu veri kaybı olmadan büyütmek veya küçültmek için ne kullanılır?",
            codeSnippet: r'''ptr = ___(ptr, new_size);''',
            options: ["realloc", "resize", "remalloc", "expand"],
            correctIndex: 0,
            explanation: "'realloc' mevcut bloğu genişletir veya yeni bir konuma taşıyarak eski veriyi kopyalar.",
          ),
          Question(
            id: "c_unit_4_l8_q8",
            type: QuestionType.multipleChoice,
            prompt: "C programlama dilinde GCC derleme sürecinin doğru sırası aşağıdakilerden hangisidir?",
            options: ["Preprocessor -> Compiler -> Assembler -> Linker", "Compiler -> Preprocessor -> Linker -> Assembler", "Assembler -> Compiler -> Linker -> Preprocessor", "Linker -> Assembler -> Compiler -> Preprocessor"],
            correctIndex: 0,
            explanation: "Önce makrolar ve headerlar çözülür (cpp), C kodu Assembly'ye derlenir (cc1), makine koduna çevrilir (as), kütüphaneler bağlanır (ld).",
          ),
          Question(
            id: "c_unit_4_l8_q9",
            type: QuestionType.multipleChoice,
            prompt: "64-bit modern bir mimaride standart bir işaretçi (pointer - int*, char*, void*) değişkeni bellekte kaç bayt yer kaplar?",
            codeSnippet: r'''printf("%zu", sizeof(int*));''',
            options: ["8 bayt", "4 bayt", "2 bayt", "16 bayt"],
            correctIndex: 0,
            explanation: "64-bit mimarilerde bellek adresleri 64 bit yani tam 8 bayttır. İşaretçinin tipi ne olursa olsun adres boyutu 8 bayttır.",
          ),
          Question(
            id: "c_unit_4_l8_q10",
            type: QuestionType.multipleChoice,
            prompt: "Bir struct içindeki bir işaretçi elemana erişirken '.' yerine hangi pratik operatör kullanılır?",
            codeSnippet: r'''struct User *u = getUser();
u___name = "Ahmet";''',
            options: ["-> (Ok operatörü)", ".", "::", "=>"],
            correctIndex: 0,
            explanation: "'u->name', '(*u).name' yazımının daha okunaklı ve standart kısayoludur.",
          ),
          Question(
            id: "c_unit_4_l8_q11",
            type: QuestionType.multipleChoice,
            prompt: "Herhangi bir veri tipine ait bellek adresini tutabilen jenerik (tip bağımsız) işaretçi tipi hangisidir?",
            codeSnippet: r'''___ generic_ptr = &x;''',
            options: ["void*", "any*", "object*", "generic*"],
            correctIndex: 0,
            explanation: "'void*' tipi belirsiz jenerik bir işaretçidir; doğrudan dereference edilemez, cast edilmesi gerekir.",
          ),
          Question(
            id: "c_unit_4_l8_q12",
            type: QuestionType.multipleChoice,
            prompt: "Serbest bırakılmış (free edilmiş) bir işaretçiyi kullanmaya devam etme hatasına ne ad verilir?",
            codeSnippet: r'''free(ptr);
printf("%d", *ptr); // HATA!''',
            options: ["Dangling Pointer (Askıda Kalan İşaretçi)", "Stack Overflow", "Memory Leak", "Deadlock"],
            correctIndex: 0,
            explanation: "free edildikten sonra hala o adresi göstermeye devam eden işaretçiye dangling pointer denir; 'ptr = NULL' yapılarak önlenir.",
          ),
          Question(
            id: "c_unit_4_l8_q13",
            type: QuestionType.fillInTheBlank,
            prompt: "Geçersiz veya henüz atanmamış bir işaretçiye güvenli başlangıç değeri olarak _____ atanmalıdır.",
            explanation: "İşaretçilere NULL atamak tanımsız belleğe erişimi ve segmentation fault hatalarını engellemeye yardımcı olur.",
            blankOptions: ["NULL", "0xFF", "void", "NaN"],
            correctBlankAnswer: "NULL",
          ),
          Question(
            id: "c_unit_4_l8_q14",
            type: QuestionType.fillInTheBlank,
            prompt: "Bir veri tipinin bellekte kaç bayt yer kapladığını öğrenmek için derleme zamanı operatörü olan _____ kullanılır.",
            explanation: "sizeof(tip) veya sizeof(degisken) bayt cinsinden bellek boyutunu size_t olarak döner.",
            blankOptions: ["sizeof", "lengthof", "bytesize", "countof"],
            correctBlankAnswer: "sizeof",
          ),
          Question(
            id: "c_unit_4_l8_q15",
            type: QuestionType.fillInTheBlank,
            prompt: "Açılmış bir dosya işaretçisini işletim sistemine geri iade etmek için _____ fonksiyonu çağrılır.",
            explanation: "fclose(FILE *stream) dosya tamponlarını diske yazar ve kaynakları kapatır.",
            blankOptions: ["fclose", "close", "file_exit", "dispose"],
            correctBlankAnswer: "fclose",
          ),
          Question(
            id: "c_unit_4_l8_q16",
            type: QuestionType.trueFalse,
            prompt: "C dilinde dizi isimleri ifadeler içinde kullanıldığında dizinin ilk elemanının bellek adresine (pointer) dönüşür (decay).",
            explanation: "Doğrudur, 'arr' ifadesi '&arr[0]' adresi ile eşdeğerdir.",
            isTrue: true,
          ),
          Question(
            id: "c_unit_4_l8_q17",
            type: QuestionType.trueFalse,
            prompt: "Stack belleğinde oluşturulan yerel değişkenler fonksiyon sonlandığında da bellekte kalmaya devam eder ve serbest bırakılması için free() gerekir.",
            explanation: "Yanlıştır! Stack bellek fonksiyon bitiminde otomatik temizlenir; free() sadece heap (malloc) için geçerlidir.",
            isTrue: false,
          ),
          Question(
            id: "c_unit_4_l8_q18",
            type: QuestionType.matching,
            prompt: "C bellek kavramlarını doğru açıklamalarıyla eşleştirin.",
            explanation: "C'de bellek güvenliği doğrudan yazılımcının sorumluluğundadır.",
            matchingPairs: [MatchingPair(left: "malloc", right: "Heap üzerinde başlatılmamış bellek tahsisi"), MatchingPair(left: "free", right: "Dinamik belleği sisteme iade etme"), MatchingPair(left: "Valgrind", right: "Bellek sızıntılarını tespit eden analiz aracı")],
          ),
        ],
      ),
    ],
  ),
  LearningUnit(
    id: "c_unit_5",
    unitNumber: 5,
    title: "Dinamik Bellek Yönetimi (Heap, malloc, free)",
    language: CodeLanguage.c,
    category: "Dinamik Bellek & Malloc",
    colorHex: 0xFF6366F1,
    cheatSheetTitle: "C Dinamik Bellek Hile Kağıdı",
    cheatSheetContent: r'''int *arr = malloc(10 * sizeof(int));
if (arr == NULL) exit(1);
free(arr);
arr = NULL;''',
    lessons: [
      Lesson(
        id: "c_unit_5_l1",
        title: "Stack vs Heap Bellek Bölgeleri",
        description: "Fonksiyon çerçevesi vs dinamik küme ömrü",
        xpReward: 35,
        gemReward: 12,
        isUnitExam: false,
        questions: [
          Question(
            id: "c_unit_5_l1_q1",
            type: QuestionType.conceptCard,
            conceptTitle: "Stack vs Heap Bellek Bölgeleri - Hap Bilgi",
            rule: "C dilinde işaretçiler (pointers) doğrudan bellek adreslerini saklar. '&' operatörü bir değişkenin adresini alırken, '*' (dereference) o adresteki veriye erişir veya değiştirir.",
            codeExample: r'''#include <stdio.h>
#include <stdlib.h>

int main() {
    int x = 100;
    int *ptr = &x;
    
    printf("x Degeri: %d\n", *ptr);
    printf("x Bellek Adresi: %p\n", (void*)ptr);
    return 0;
}''',
            devTip: "malloc ile tahsis edilen her bayt bellek için mutlaka bir free() çağrısı yapılmalıdır, aksi halde Memory Leak oluşur.",
            iconEmoji: "⚡",
          ),
          Question(
            id: "c_unit_5_l1_q2",
            type: QuestionType.multipleChoice,
            prompt: "Heap bellekte dinamik olarak bayt cinsinden bellek tahsis etmek için hangi standart kütüphane fonksiyonu kullanılır?",
            codeSnippet: r'''int *arr = (int*)___(10 * sizeof(int));''',
            options: ["malloc", "alloc", "new", "heap_get"],
            correctIndex: 0,
            explanation: "'malloc(size_t size)' heap bölgesinde istenen bayt kadar bellek ayırır ve void* işaretçi döner.",
          ),
          Question(
            id: "c_unit_5_l1_q3",
            type: QuestionType.multipleChoice,
            prompt: "malloc veya calloc ile tahsis edilen dinamik belleğin sisteme iade edilmesi için hangi fonksiyon çağrılmalıdır?",
            codeSnippet: r'''int *buf = malloc(1024);
// ... kullanim ...
___(buf);''',
            options: ["free", "delete", "release", "dispose"],
            correctIndex: 0,
            explanation: "'free(ptr)' heap bellekte ayrılan alanı serbest bırakır. Çağrılmazsa 'Memory Leak' oluşur.",
          ),
          Question(
            id: "c_unit_5_l1_q4",
            type: QuestionType.multipleChoice,
            prompt: "Tahsis ettiği belleği otomatik olarak sıfırlarla (0 baytları) dolduran dinamik bellek fonksiyonu hangisidir?",
            codeSnippet: r'''int *p = ___(100, sizeof(int));''',
            options: ["calloc", "malloc", "realloc", "zalloc"],
            correctIndex: 0,
            explanation: "'calloc(num, size)' eleman sayısı ve eleman boyutu alır, ayrılan tüm bellek hücrelerini 0 ile başlatır.",
          ),
          Question(
            id: "c_unit_5_l1_q5",
            type: QuestionType.multipleChoice,
            prompt: "Daha önce ayrılmış dinamik bir bellek bloğunun boyutunu veri kaybı olmadan büyütmek veya küçültmek için ne kullanılır?",
            codeSnippet: r'''ptr = ___(ptr, new_size);''',
            options: ["realloc", "resize", "remalloc", "expand"],
            correctIndex: 0,
            explanation: "'realloc' mevcut bloğu genişletir veya yeni bir konuma taşıyarak eski veriyi kopyalar.",
          ),
          Question(
            id: "c_unit_5_l1_q6",
            type: QuestionType.multipleChoice,
            prompt: "C programlama dilinde GCC derleme sürecinin doğru sırası aşağıdakilerden hangisidir?",
            options: ["Preprocessor -> Compiler -> Assembler -> Linker", "Compiler -> Preprocessor -> Linker -> Assembler", "Assembler -> Compiler -> Linker -> Preprocessor", "Linker -> Assembler -> Compiler -> Preprocessor"],
            correctIndex: 0,
            explanation: "Önce makrolar ve headerlar çözülür (cpp), C kodu Assembly'ye derlenir (cc1), makine koduna çevrilir (as), kütüphaneler bağlanır (ld).",
          ),
          Question(
            id: "c_unit_5_l1_q7",
            type: QuestionType.multipleChoice,
            prompt: "64-bit modern bir mimaride standart bir işaretçi (pointer - int*, char*, void*) değişkeni bellekte kaç bayt yer kaplar?",
            codeSnippet: r'''printf("%zu", sizeof(int*));''',
            options: ["8 bayt", "4 bayt", "2 bayt", "16 bayt"],
            correctIndex: 0,
            explanation: "64-bit mimarilerde bellek adresleri 64 bit yani tam 8 bayttır. İşaretçinin tipi ne olursa olsun adres boyutu 8 bayttır.",
          ),
          Question(
            id: "c_unit_5_l1_q8",
            type: QuestionType.multipleChoice,
            prompt: "Bir struct içindeki bir işaretçi elemana erişirken '.' yerine hangi pratik operatör kullanılır?",
            codeSnippet: r'''struct User *u = getUser();
u___name = "Ahmet";''',
            options: ["-> (Ok operatörü)", ".", "::", "=>"],
            correctIndex: 0,
            explanation: "'u->name', '(*u).name' yazımının daha okunaklı ve standart kısayoludur.",
          ),
          Question(
            id: "c_unit_5_l1_q9",
            type: QuestionType.multipleChoice,
            prompt: "Herhangi bir veri tipine ait bellek adresini tutabilen jenerik (tip bağımsız) işaretçi tipi hangisidir?",
            codeSnippet: r'''___ generic_ptr = &x;''',
            options: ["void*", "any*", "object*", "generic*"],
            correctIndex: 0,
            explanation: "'void*' tipi belirsiz jenerik bir işaretçidir; doğrudan dereference edilemez, cast edilmesi gerekir.",
          ),
          Question(
            id: "c_unit_5_l1_q10",
            type: QuestionType.multipleChoice,
            prompt: "Serbest bırakılmış (free edilmiş) bir işaretçiyi kullanmaya devam etme hatasına ne ad verilir?",
            codeSnippet: r'''free(ptr);
printf("%d", *ptr); // HATA!''',
            options: ["Dangling Pointer (Askıda Kalan İşaretçi)", "Stack Overflow", "Memory Leak", "Deadlock"],
            correctIndex: 0,
            explanation: "free edildikten sonra hala o adresi göstermeye devam eden işaretçiye dangling pointer denir; 'ptr = NULL' yapılarak önlenir.",
          ),
          Question(
            id: "c_unit_5_l1_q11",
            type: QuestionType.multipleChoice,
            prompt: "C programlarında bellek sızıntılarını (memory leak) ve geçersiz bellek erişimlerini tespit etmek için en popüler Linux aracı hangisidir?",
            codeSnippet: r'''$ ___ --leak-check=full ./program''',
            options: ["valgrind", "gdb", "perf", "strace"],
            correctIndex: 0,
            explanation: "Valgrind (özellikle memcheck aracı) C/C++ programlarında bellek yönetim hatalarını ayrıntılı raporlar.",
          ),
          Question(
            id: "c_unit_5_l1_q12",
            type: QuestionType.multipleChoice,
            prompt: "Aşağıdaki bit düzeyinde (bitwise) operatörlerden hangisi bitleri 1 basamak sola kaydırarak 2 ile çarpmayı sağlar?",
            codeSnippet: r'''int x = 5;
int y = x ___ 1; // y = 10 olur''',
            options: ["<<", ">>", "&", "|"],
            correctIndex: 0,
            explanation: "Sola kaydırma (<< n) operatörü sayının değerini 2^n ile çarpar.",
          ),
          Question(
            id: "c_unit_5_l1_q13",
            type: QuestionType.fillInTheBlank,
            prompt: "Geçersiz veya henüz atanmamış bir işaretçiye güvenli başlangıç değeri olarak _____ atanmalıdır.",
            explanation: "İşaretçilere NULL atamak tanımsız belleğe erişimi ve segmentation fault hatalarını engellemeye yardımcı olur.",
            blankOptions: ["NULL", "0xFF", "void", "NaN"],
            correctBlankAnswer: "NULL",
          ),
          Question(
            id: "c_unit_5_l1_q14",
            type: QuestionType.fillInTheBlank,
            prompt: "Bir veri tipinin bellekte kaç bayt yer kapladığını öğrenmek için derleme zamanı operatörü olan _____ kullanılır.",
            explanation: "sizeof(tip) veya sizeof(degisken) bayt cinsinden bellek boyutunu size_t olarak döner.",
            blankOptions: ["sizeof", "lengthof", "bytesize", "countof"],
            correctBlankAnswer: "sizeof",
          ),
          Question(
            id: "c_unit_5_l1_q15",
            type: QuestionType.fillInTheBlank,
            prompt: "Açılmış bir dosya işaretçisini işletim sistemine geri iade etmek için _____ fonksiyonu çağrılır.",
            explanation: "fclose(FILE *stream) dosya tamponlarını diske yazar ve kaynakları kapatır.",
            blankOptions: ["fclose", "close", "file_exit", "dispose"],
            correctBlankAnswer: "fclose",
          ),
          Question(
            id: "c_unit_5_l1_q16",
            type: QuestionType.trueFalse,
            prompt: "C dilinde dizi isimleri ifadeler içinde kullanıldığında dizinin ilk elemanının bellek adresine (pointer) dönüşür (decay).",
            explanation: "Doğrudur, 'arr' ifadesi '&arr[0]' adresi ile eşdeğerdir.",
            isTrue: true,
          ),
          Question(
            id: "c_unit_5_l1_q17",
            type: QuestionType.trueFalse,
            prompt: "Stack belleğinde oluşturulan yerel değişkenler fonksiyon sonlandığında da bellekte kalmaya devam eder ve serbest bırakılması için free() gerekir.",
            explanation: "Yanlıştır! Stack bellek fonksiyon bitiminde otomatik temizlenir; free() sadece heap (malloc) için geçerlidir.",
            isTrue: false,
          ),
          Question(
            id: "c_unit_5_l1_q18",
            type: QuestionType.matching,
            prompt: "C bellek kavramlarını doğru açıklamalarıyla eşleştirin.",
            explanation: "C'de bellek güvenliği doğrudan yazılımcının sorumluluğundadır.",
            matchingPairs: [MatchingPair(left: "malloc", right: "Heap üzerinde başlatılmamış bellek tahsisi"), MatchingPair(left: "free", right: "Dinamik belleği sisteme iade etme"), MatchingPair(left: "Valgrind", right: "Bellek sızıntılarını tespit eden analiz aracı")],
          ),
        ],
      ),
      Lesson(
        id: "c_unit_5_l2",
        title: "malloc() ile Bayt Tahsisi & void* Dönüşü",
        description: "Heap üzerinde dinamik alan açma kuralları",
        xpReward: 35,
        gemReward: 12,
        isUnitExam: false,
        questions: [
          Question(
            id: "c_unit_5_l2_q1",
            type: QuestionType.conceptCard,
            conceptTitle: "malloc() ile Bayt Tahsisi & void* Dönüşü - Hap Bilgi",
            rule: "C dilinde işaretçiler (pointers) doğrudan bellek adreslerini saklar. '&' operatörü bir değişkenin adresini alırken, '*' (dereference) o adresteki veriye erişir veya değiştirir.",
            codeExample: r'''#include <stdio.h>
#include <stdlib.h>

int main() {
    int x = 100;
    int *ptr = &x;
    
    printf("x Degeri: %d\n", *ptr);
    printf("x Bellek Adresi: %p\n", (void*)ptr);
    return 0;
}''',
            devTip: "malloc ile tahsis edilen her bayt bellek için mutlaka bir free() çağrısı yapılmalıdır, aksi halde Memory Leak oluşur.",
            iconEmoji: "⚡",
          ),
          Question(
            id: "c_unit_5_l2_q2",
            type: QuestionType.multipleChoice,
            prompt: "Tahsis ettiği belleği otomatik olarak sıfırlarla (0 baytları) dolduran dinamik bellek fonksiyonu hangisidir?",
            codeSnippet: r'''int *p = ___(100, sizeof(int));''',
            options: ["calloc", "malloc", "realloc", "zalloc"],
            correctIndex: 0,
            explanation: "'calloc(num, size)' eleman sayısı ve eleman boyutu alır, ayrılan tüm bellek hücrelerini 0 ile başlatır.",
          ),
          Question(
            id: "c_unit_5_l2_q3",
            type: QuestionType.multipleChoice,
            prompt: "Daha önce ayrılmış dinamik bir bellek bloğunun boyutunu veri kaybı olmadan büyütmek veya küçültmek için ne kullanılır?",
            codeSnippet: r'''ptr = ___(ptr, new_size);''',
            options: ["realloc", "resize", "remalloc", "expand"],
            correctIndex: 0,
            explanation: "'realloc' mevcut bloğu genişletir veya yeni bir konuma taşıyarak eski veriyi kopyalar.",
          ),
          Question(
            id: "c_unit_5_l2_q4",
            type: QuestionType.multipleChoice,
            prompt: "C programlama dilinde GCC derleme sürecinin doğru sırası aşağıdakilerden hangisidir?",
            options: ["Preprocessor -> Compiler -> Assembler -> Linker", "Compiler -> Preprocessor -> Linker -> Assembler", "Assembler -> Compiler -> Linker -> Preprocessor", "Linker -> Assembler -> Compiler -> Preprocessor"],
            correctIndex: 0,
            explanation: "Önce makrolar ve headerlar çözülür (cpp), C kodu Assembly'ye derlenir (cc1), makine koduna çevrilir (as), kütüphaneler bağlanır (ld).",
          ),
          Question(
            id: "c_unit_5_l2_q5",
            type: QuestionType.multipleChoice,
            prompt: "64-bit modern bir mimaride standart bir işaretçi (pointer - int*, char*, void*) değişkeni bellekte kaç bayt yer kaplar?",
            codeSnippet: r'''printf("%zu", sizeof(int*));''',
            options: ["8 bayt", "4 bayt", "2 bayt", "16 bayt"],
            correctIndex: 0,
            explanation: "64-bit mimarilerde bellek adresleri 64 bit yani tam 8 bayttır. İşaretçinin tipi ne olursa olsun adres boyutu 8 bayttır.",
          ),
          Question(
            id: "c_unit_5_l2_q6",
            type: QuestionType.multipleChoice,
            prompt: "Bir struct içindeki bir işaretçi elemana erişirken '.' yerine hangi pratik operatör kullanılır?",
            codeSnippet: r'''struct User *u = getUser();
u___name = "Ahmet";''',
            options: ["-> (Ok operatörü)", ".", "::", "=>"],
            correctIndex: 0,
            explanation: "'u->name', '(*u).name' yazımının daha okunaklı ve standart kısayoludur.",
          ),
          Question(
            id: "c_unit_5_l2_q7",
            type: QuestionType.multipleChoice,
            prompt: "Herhangi bir veri tipine ait bellek adresini tutabilen jenerik (tip bağımsız) işaretçi tipi hangisidir?",
            codeSnippet: r'''___ generic_ptr = &x;''',
            options: ["void*", "any*", "object*", "generic*"],
            correctIndex: 0,
            explanation: "'void*' tipi belirsiz jenerik bir işaretçidir; doğrudan dereference edilemez, cast edilmesi gerekir.",
          ),
          Question(
            id: "c_unit_5_l2_q8",
            type: QuestionType.multipleChoice,
            prompt: "Serbest bırakılmış (free edilmiş) bir işaretçiyi kullanmaya devam etme hatasına ne ad verilir?",
            codeSnippet: r'''free(ptr);
printf("%d", *ptr); // HATA!''',
            options: ["Dangling Pointer (Askıda Kalan İşaretçi)", "Stack Overflow", "Memory Leak", "Deadlock"],
            correctIndex: 0,
            explanation: "free edildikten sonra hala o adresi göstermeye devam eden işaretçiye dangling pointer denir; 'ptr = NULL' yapılarak önlenir.",
          ),
          Question(
            id: "c_unit_5_l2_q9",
            type: QuestionType.multipleChoice,
            prompt: "C programlarında bellek sızıntılarını (memory leak) ve geçersiz bellek erişimlerini tespit etmek için en popüler Linux aracı hangisidir?",
            codeSnippet: r'''$ ___ --leak-check=full ./program''',
            options: ["valgrind", "gdb", "perf", "strace"],
            correctIndex: 0,
            explanation: "Valgrind (özellikle memcheck aracı) C/C++ programlarında bellek yönetim hatalarını ayrıntılı raporlar.",
          ),
          Question(
            id: "c_unit_5_l2_q10",
            type: QuestionType.multipleChoice,
            prompt: "Aşağıdaki bit düzeyinde (bitwise) operatörlerden hangisi bitleri 1 basamak sola kaydırarak 2 ile çarpmayı sağlar?",
            codeSnippet: r'''int x = 5;
int y = x ___ 1; // y = 10 olur''',
            options: ["<<", ">>", "&", "|"],
            correctIndex: 0,
            explanation: "Sola kaydırma (<< n) operatörü sayının değerini 2^n ile çarpar.",
          ),
          Question(
            id: "c_unit_5_l2_q11",
            type: QuestionType.multipleChoice,
            prompt: "C'de dosya açmak ve bir dosya işaretçisi (FILE*) elde etmek için hangi standart fonksiyon kullanılır?",
            codeSnippet: r'''FILE *f = ___("data.txt", "r");''',
            options: ["fopen", "open", "file_open", "create_file"],
            correctIndex: 0,
            explanation: "'fopen(dosya_adi, mod)' dosyayı belirtilen modda (r, w, a, rb, wb) açar.",
          ),
          Question(
            id: "c_unit_5_l2_q12",
            type: QuestionType.multipleChoice,
            prompt: "Bir header dosyasının birden fazla kez derlemeye dahil edilmesini (redefinition) önlemek için ne kullanılır?",
            codeSnippet: r'''#ifndef MY_HEADER_H
#define MY_HEADER_H
// ...
#endif''',
            options: ["Header Guards (#ifndef / #define)", "namespace", "pragma private", "module"],
            correctIndex: 0,
            explanation: "Header guards veya '#pragma once' başlık dosyalarının mükerrer include edilmesini engeller.",
          ),
          Question(
            id: "c_unit_5_l2_q13",
            type: QuestionType.fillInTheBlank,
            prompt: "Geçersiz veya henüz atanmamış bir işaretçiye güvenli başlangıç değeri olarak _____ atanmalıdır.",
            explanation: "İşaretçilere NULL atamak tanımsız belleğe erişimi ve segmentation fault hatalarını engellemeye yardımcı olur.",
            blankOptions: ["NULL", "0xFF", "void", "NaN"],
            correctBlankAnswer: "NULL",
          ),
          Question(
            id: "c_unit_5_l2_q14",
            type: QuestionType.fillInTheBlank,
            prompt: "Bir veri tipinin bellekte kaç bayt yer kapladığını öğrenmek için derleme zamanı operatörü olan _____ kullanılır.",
            explanation: "sizeof(tip) veya sizeof(degisken) bayt cinsinden bellek boyutunu size_t olarak döner.",
            blankOptions: ["sizeof", "lengthof", "bytesize", "countof"],
            correctBlankAnswer: "sizeof",
          ),
          Question(
            id: "c_unit_5_l2_q15",
            type: QuestionType.fillInTheBlank,
            prompt: "Açılmış bir dosya işaretçisini işletim sistemine geri iade etmek için _____ fonksiyonu çağrılır.",
            explanation: "fclose(FILE *stream) dosya tamponlarını diske yazar ve kaynakları kapatır.",
            blankOptions: ["fclose", "close", "file_exit", "dispose"],
            correctBlankAnswer: "fclose",
          ),
          Question(
            id: "c_unit_5_l2_q16",
            type: QuestionType.trueFalse,
            prompt: "C dilinde dizi isimleri ifadeler içinde kullanıldığında dizinin ilk elemanının bellek adresine (pointer) dönüşür (decay).",
            explanation: "Doğrudur, 'arr' ifadesi '&arr[0]' adresi ile eşdeğerdir.",
            isTrue: true,
          ),
          Question(
            id: "c_unit_5_l2_q17",
            type: QuestionType.trueFalse,
            prompt: "Stack belleğinde oluşturulan yerel değişkenler fonksiyon sonlandığında da bellekte kalmaya devam eder ve serbest bırakılması için free() gerekir.",
            explanation: "Yanlıştır! Stack bellek fonksiyon bitiminde otomatik temizlenir; free() sadece heap (malloc) için geçerlidir.",
            isTrue: false,
          ),
          Question(
            id: "c_unit_5_l2_q18",
            type: QuestionType.matching,
            prompt: "C bellek kavramlarını doğru açıklamalarıyla eşleştirin.",
            explanation: "C'de bellek güvenliği doğrudan yazılımcının sorumluluğundadır.",
            matchingPairs: [MatchingPair(left: "malloc", right: "Heap üzerinde başlatılmamış bellek tahsisi"), MatchingPair(left: "free", right: "Dinamik belleği sisteme iade etme"), MatchingPair(left: "Valgrind", right: "Bellek sızıntılarını tespit eden analiz aracı")],
          ),
        ],
      ),
      Lesson(
        id: "c_unit_5_l3",
        title: "malloc Dönüşünü NULL Kontrolü Yapma Kuralı",
        description: "Bellek yetersizliği durumunu yakalama",
        xpReward: 35,
        gemReward: 12,
        isUnitExam: false,
        questions: [
          Question(
            id: "c_unit_5_l3_q1",
            type: QuestionType.conceptCard,
            conceptTitle: "malloc Dönüşünü NULL Kontrolü Yapma Kuralı - Hap Bilgi",
            rule: "C dilinde işaretçiler (pointers) doğrudan bellek adreslerini saklar. '&' operatörü bir değişkenin adresini alırken, '*' (dereference) o adresteki veriye erişir veya değiştirir.",
            codeExample: r'''#include <stdio.h>
#include <stdlib.h>

int main() {
    int x = 100;
    int *ptr = &x;
    
    printf("x Degeri: %d\n", *ptr);
    printf("x Bellek Adresi: %p\n", (void*)ptr);
    return 0;
}''',
            devTip: "malloc ile tahsis edilen her bayt bellek için mutlaka bir free() çağrısı yapılmalıdır, aksi halde Memory Leak oluşur.",
            iconEmoji: "⚡",
          ),
          Question(
            id: "c_unit_5_l3_q2",
            type: QuestionType.multipleChoice,
            prompt: "C programlama dilinde GCC derleme sürecinin doğru sırası aşağıdakilerden hangisidir?",
            options: ["Preprocessor -> Compiler -> Assembler -> Linker", "Compiler -> Preprocessor -> Linker -> Assembler", "Assembler -> Compiler -> Linker -> Preprocessor", "Linker -> Assembler -> Compiler -> Preprocessor"],
            correctIndex: 0,
            explanation: "Önce makrolar ve headerlar çözülür (cpp), C kodu Assembly'ye derlenir (cc1), makine koduna çevrilir (as), kütüphaneler bağlanır (ld).",
          ),
          Question(
            id: "c_unit_5_l3_q3",
            type: QuestionType.multipleChoice,
            prompt: "64-bit modern bir mimaride standart bir işaretçi (pointer - int*, char*, void*) değişkeni bellekte kaç bayt yer kaplar?",
            codeSnippet: r'''printf("%zu", sizeof(int*));''',
            options: ["8 bayt", "4 bayt", "2 bayt", "16 bayt"],
            correctIndex: 0,
            explanation: "64-bit mimarilerde bellek adresleri 64 bit yani tam 8 bayttır. İşaretçinin tipi ne olursa olsun adres boyutu 8 bayttır.",
          ),
          Question(
            id: "c_unit_5_l3_q4",
            type: QuestionType.multipleChoice,
            prompt: "Bir struct içindeki bir işaretçi elemana erişirken '.' yerine hangi pratik operatör kullanılır?",
            codeSnippet: r'''struct User *u = getUser();
u___name = "Ahmet";''',
            options: ["-> (Ok operatörü)", ".", "::", "=>"],
            correctIndex: 0,
            explanation: "'u->name', '(*u).name' yazımının daha okunaklı ve standart kısayoludur.",
          ),
          Question(
            id: "c_unit_5_l3_q5",
            type: QuestionType.multipleChoice,
            prompt: "Herhangi bir veri tipine ait bellek adresini tutabilen jenerik (tip bağımsız) işaretçi tipi hangisidir?",
            codeSnippet: r'''___ generic_ptr = &x;''',
            options: ["void*", "any*", "object*", "generic*"],
            correctIndex: 0,
            explanation: "'void*' tipi belirsiz jenerik bir işaretçidir; doğrudan dereference edilemez, cast edilmesi gerekir.",
          ),
          Question(
            id: "c_unit_5_l3_q6",
            type: QuestionType.multipleChoice,
            prompt: "Serbest bırakılmış (free edilmiş) bir işaretçiyi kullanmaya devam etme hatasına ne ad verilir?",
            codeSnippet: r'''free(ptr);
printf("%d", *ptr); // HATA!''',
            options: ["Dangling Pointer (Askıda Kalan İşaretçi)", "Stack Overflow", "Memory Leak", "Deadlock"],
            correctIndex: 0,
            explanation: "free edildikten sonra hala o adresi göstermeye devam eden işaretçiye dangling pointer denir; 'ptr = NULL' yapılarak önlenir.",
          ),
          Question(
            id: "c_unit_5_l3_q7",
            type: QuestionType.multipleChoice,
            prompt: "C programlarında bellek sızıntılarını (memory leak) ve geçersiz bellek erişimlerini tespit etmek için en popüler Linux aracı hangisidir?",
            codeSnippet: r'''$ ___ --leak-check=full ./program''',
            options: ["valgrind", "gdb", "perf", "strace"],
            correctIndex: 0,
            explanation: "Valgrind (özellikle memcheck aracı) C/C++ programlarında bellek yönetim hatalarını ayrıntılı raporlar.",
          ),
          Question(
            id: "c_unit_5_l3_q8",
            type: QuestionType.multipleChoice,
            prompt: "Aşağıdaki bit düzeyinde (bitwise) operatörlerden hangisi bitleri 1 basamak sola kaydırarak 2 ile çarpmayı sağlar?",
            codeSnippet: r'''int x = 5;
int y = x ___ 1; // y = 10 olur''',
            options: ["<<", ">>", "&", "|"],
            correctIndex: 0,
            explanation: "Sola kaydırma (<< n) operatörü sayının değerini 2^n ile çarpar.",
          ),
          Question(
            id: "c_unit_5_l3_q9",
            type: QuestionType.multipleChoice,
            prompt: "C'de dosya açmak ve bir dosya işaretçisi (FILE*) elde etmek için hangi standart fonksiyon kullanılır?",
            codeSnippet: r'''FILE *f = ___("data.txt", "r");''',
            options: ["fopen", "open", "file_open", "create_file"],
            correctIndex: 0,
            explanation: "'fopen(dosya_adi, mod)' dosyayı belirtilen modda (r, w, a, rb, wb) açar.",
          ),
          Question(
            id: "c_unit_5_l3_q10",
            type: QuestionType.multipleChoice,
            prompt: "Bir header dosyasının birden fazla kez derlemeye dahil edilmesini (redefinition) önlemek için ne kullanılır?",
            codeSnippet: r'''#ifndef MY_HEADER_H
#define MY_HEADER_H
// ...
#endif''',
            options: ["Header Guards (#ifndef / #define)", "namespace", "pragma private", "module"],
            correctIndex: 0,
            explanation: "Header guards veya '#pragma once' başlık dosyalarının mükerrer include edilmesini engeller.",
          ),
          Question(
            id: "c_unit_5_l3_q11",
            type: QuestionType.multipleChoice,
            prompt: "Tüm üyelerinin bellekte AYNI başlangıç adresini paylaştığı ve en büyük üyesi kadar yer kaplayan yapı hangisidir?",
            codeSnippet: r'''___ Data {
    int i;
    float f;
    char str[20];
};''',
            options: ["union", "struct", "class", "shared"],
            correctIndex: 0,
            explanation: "'union' içindeki tüm elemanlar aynı bellek alanını ortaklaşa kullanır; aynı anda sadece biri geçerli değer tutar.",
          ),
          Question(
            id: "c_unit_5_l3_q12",
            type: QuestionType.multipleChoice,
            prompt: "C dilinde bir değişkenin bellekteki adresini elde etmek için hangi operatör kullanılır?",
            codeSnippet: r'''int x = 10;
int *ptr = ___x;''',
            options: ["& (Address-of)", "* (Dereference)", "% (Mod)", "\$ (Value)"],
            correctIndex: 0,
            explanation: "'&' operatörü bir değişkenin RAM üzerindeki başlangıç adresini döner.",
          ),
          Question(
            id: "c_unit_5_l3_q13",
            type: QuestionType.fillInTheBlank,
            prompt: "Geçersiz veya henüz atanmamış bir işaretçiye güvenli başlangıç değeri olarak _____ atanmalıdır.",
            explanation: "İşaretçilere NULL atamak tanımsız belleğe erişimi ve segmentation fault hatalarını engellemeye yardımcı olur.",
            blankOptions: ["NULL", "0xFF", "void", "NaN"],
            correctBlankAnswer: "NULL",
          ),
          Question(
            id: "c_unit_5_l3_q14",
            type: QuestionType.fillInTheBlank,
            prompt: "Bir veri tipinin bellekte kaç bayt yer kapladığını öğrenmek için derleme zamanı operatörü olan _____ kullanılır.",
            explanation: "sizeof(tip) veya sizeof(degisken) bayt cinsinden bellek boyutunu size_t olarak döner.",
            blankOptions: ["sizeof", "lengthof", "bytesize", "countof"],
            correctBlankAnswer: "sizeof",
          ),
          Question(
            id: "c_unit_5_l3_q15",
            type: QuestionType.fillInTheBlank,
            prompt: "Açılmış bir dosya işaretçisini işletim sistemine geri iade etmek için _____ fonksiyonu çağrılır.",
            explanation: "fclose(FILE *stream) dosya tamponlarını diske yazar ve kaynakları kapatır.",
            blankOptions: ["fclose", "close", "file_exit", "dispose"],
            correctBlankAnswer: "fclose",
          ),
          Question(
            id: "c_unit_5_l3_q16",
            type: QuestionType.trueFalse,
            prompt: "C dilinde dizi isimleri ifadeler içinde kullanıldığında dizinin ilk elemanının bellek adresine (pointer) dönüşür (decay).",
            explanation: "Doğrudur, 'arr' ifadesi '&arr[0]' adresi ile eşdeğerdir.",
            isTrue: true,
          ),
          Question(
            id: "c_unit_5_l3_q17",
            type: QuestionType.trueFalse,
            prompt: "Stack belleğinde oluşturulan yerel değişkenler fonksiyon sonlandığında da bellekte kalmaya devam eder ve serbest bırakılması için free() gerekir.",
            explanation: "Yanlıştır! Stack bellek fonksiyon bitiminde otomatik temizlenir; free() sadece heap (malloc) için geçerlidir.",
            isTrue: false,
          ),
          Question(
            id: "c_unit_5_l3_q18",
            type: QuestionType.matching,
            prompt: "C bellek kavramlarını doğru açıklamalarıyla eşleştirin.",
            explanation: "C'de bellek güvenliği doğrudan yazılımcının sorumluluğundadır.",
            matchingPairs: [MatchingPair(left: "malloc", right: "Heap üzerinde başlatılmamış bellek tahsisi"), MatchingPair(left: "free", right: "Dinamik belleği sisteme iade etme"), MatchingPair(left: "Valgrind", right: "Bellek sızıntılarını tespit eden analiz aracı")],
          ),
        ],
      ),
      Lesson(
        id: "c_unit_5_l4",
        title: "free() Fonksiyonu & Belleği Geri Verme",
        description: "Tahsis edilen alanı sisteme iade etme",
        xpReward: 35,
        gemReward: 12,
        isUnitExam: false,
        questions: [
          Question(
            id: "c_unit_5_l4_q1",
            type: QuestionType.conceptCard,
            conceptTitle: "free() Fonksiyonu & Belleği Geri Verme - Hap Bilgi",
            rule: "C dilinde işaretçiler (pointers) doğrudan bellek adreslerini saklar. '&' operatörü bir değişkenin adresini alırken, '*' (dereference) o adresteki veriye erişir veya değiştirir.",
            codeExample: r'''#include <stdio.h>
#include <stdlib.h>

int main() {
    int x = 100;
    int *ptr = &x;
    
    printf("x Degeri: %d\n", *ptr);
    printf("x Bellek Adresi: %p\n", (void*)ptr);
    return 0;
}''',
            devTip: "malloc ile tahsis edilen her bayt bellek için mutlaka bir free() çağrısı yapılmalıdır, aksi halde Memory Leak oluşur.",
            iconEmoji: "⚡",
          ),
          Question(
            id: "c_unit_5_l4_q2",
            type: QuestionType.multipleChoice,
            prompt: "Bir struct içindeki bir işaretçi elemana erişirken '.' yerine hangi pratik operatör kullanılır?",
            codeSnippet: r'''struct User *u = getUser();
u___name = "Ahmet";''',
            options: ["-> (Ok operatörü)", ".", "::", "=>"],
            correctIndex: 0,
            explanation: "'u->name', '(*u).name' yazımının daha okunaklı ve standart kısayoludur.",
          ),
          Question(
            id: "c_unit_5_l4_q3",
            type: QuestionType.multipleChoice,
            prompt: "Herhangi bir veri tipine ait bellek adresini tutabilen jenerik (tip bağımsız) işaretçi tipi hangisidir?",
            codeSnippet: r'''___ generic_ptr = &x;''',
            options: ["void*", "any*", "object*", "generic*"],
            correctIndex: 0,
            explanation: "'void*' tipi belirsiz jenerik bir işaretçidir; doğrudan dereference edilemez, cast edilmesi gerekir.",
          ),
          Question(
            id: "c_unit_5_l4_q4",
            type: QuestionType.multipleChoice,
            prompt: "Serbest bırakılmış (free edilmiş) bir işaretçiyi kullanmaya devam etme hatasına ne ad verilir?",
            codeSnippet: r'''free(ptr);
printf("%d", *ptr); // HATA!''',
            options: ["Dangling Pointer (Askıda Kalan İşaretçi)", "Stack Overflow", "Memory Leak", "Deadlock"],
            correctIndex: 0,
            explanation: "free edildikten sonra hala o adresi göstermeye devam eden işaretçiye dangling pointer denir; 'ptr = NULL' yapılarak önlenir.",
          ),
          Question(
            id: "c_unit_5_l4_q5",
            type: QuestionType.multipleChoice,
            prompt: "C programlarında bellek sızıntılarını (memory leak) ve geçersiz bellek erişimlerini tespit etmek için en popüler Linux aracı hangisidir?",
            codeSnippet: r'''$ ___ --leak-check=full ./program''',
            options: ["valgrind", "gdb", "perf", "strace"],
            correctIndex: 0,
            explanation: "Valgrind (özellikle memcheck aracı) C/C++ programlarında bellek yönetim hatalarını ayrıntılı raporlar.",
          ),
          Question(
            id: "c_unit_5_l4_q6",
            type: QuestionType.multipleChoice,
            prompt: "Aşağıdaki bit düzeyinde (bitwise) operatörlerden hangisi bitleri 1 basamak sola kaydırarak 2 ile çarpmayı sağlar?",
            codeSnippet: r'''int x = 5;
int y = x ___ 1; // y = 10 olur''',
            options: ["<<", ">>", "&", "|"],
            correctIndex: 0,
            explanation: "Sola kaydırma (<< n) operatörü sayının değerini 2^n ile çarpar.",
          ),
          Question(
            id: "c_unit_5_l4_q7",
            type: QuestionType.multipleChoice,
            prompt: "C'de dosya açmak ve bir dosya işaretçisi (FILE*) elde etmek için hangi standart fonksiyon kullanılır?",
            codeSnippet: r'''FILE *f = ___("data.txt", "r");''',
            options: ["fopen", "open", "file_open", "create_file"],
            correctIndex: 0,
            explanation: "'fopen(dosya_adi, mod)' dosyayı belirtilen modda (r, w, a, rb, wb) açar.",
          ),
          Question(
            id: "c_unit_5_l4_q8",
            type: QuestionType.multipleChoice,
            prompt: "Bir header dosyasının birden fazla kez derlemeye dahil edilmesini (redefinition) önlemek için ne kullanılır?",
            codeSnippet: r'''#ifndef MY_HEADER_H
#define MY_HEADER_H
// ...
#endif''',
            options: ["Header Guards (#ifndef / #define)", "namespace", "pragma private", "module"],
            correctIndex: 0,
            explanation: "Header guards veya '#pragma once' başlık dosyalarının mükerrer include edilmesini engeller.",
          ),
          Question(
            id: "c_unit_5_l4_q9",
            type: QuestionType.multipleChoice,
            prompt: "Tüm üyelerinin bellekte AYNI başlangıç adresini paylaştığı ve en büyük üyesi kadar yer kaplayan yapı hangisidir?",
            codeSnippet: r'''___ Data {
    int i;
    float f;
    char str[20];
};''',
            options: ["union", "struct", "class", "shared"],
            correctIndex: 0,
            explanation: "'union' içindeki tüm elemanlar aynı bellek alanını ortaklaşa kullanır; aynı anda sadece biri geçerli değer tutar.",
          ),
          Question(
            id: "c_unit_5_l4_q10",
            type: QuestionType.multipleChoice,
            prompt: "C dilinde bir değişkenin bellekteki adresini elde etmek için hangi operatör kullanılır?",
            codeSnippet: r'''int x = 10;
int *ptr = ___x;''',
            options: ["& (Address-of)", "* (Dereference)", "% (Mod)", "\$ (Value)"],
            correctIndex: 0,
            explanation: "'&' operatörü bir değişkenin RAM üzerindeki başlangıç adresini döner.",
          ),
          Question(
            id: "c_unit_5_l4_q11",
            type: QuestionType.multipleChoice,
            prompt: "Bir işaretçinin (pointer) işaret ettiği bellek adresindeki veriye erişmek veya onu değiştirmek için hangi işlem yapılır?",
            codeSnippet: r'''int x = 5;
int *p = &x;
___p = 20; // x artik 20 olur''',
            options: ["* (Dereference)", "&", "->", "."],
            correctIndex: 0,
            explanation: "'*p' dereferencing yaparak işaretçinin tuttuğu adresteki asıl değere erişir.",
          ),
          Question(
            id: "c_unit_5_l4_q12",
            type: QuestionType.multipleChoice,
            prompt: "Heap bellekte dinamik olarak bayt cinsinden bellek tahsis etmek için hangi standart kütüphane fonksiyonu kullanılır?",
            codeSnippet: r'''int *arr = (int*)___(10 * sizeof(int));''',
            options: ["malloc", "alloc", "new", "heap_get"],
            correctIndex: 0,
            explanation: "'malloc(size_t size)' heap bölgesinde istenen bayt kadar bellek ayırır ve void* işaretçi döner.",
          ),
          Question(
            id: "c_unit_5_l4_q13",
            type: QuestionType.fillInTheBlank,
            prompt: "Geçersiz veya henüz atanmamış bir işaretçiye güvenli başlangıç değeri olarak _____ atanmalıdır.",
            explanation: "İşaretçilere NULL atamak tanımsız belleğe erişimi ve segmentation fault hatalarını engellemeye yardımcı olur.",
            blankOptions: ["NULL", "0xFF", "void", "NaN"],
            correctBlankAnswer: "NULL",
          ),
          Question(
            id: "c_unit_5_l4_q14",
            type: QuestionType.fillInTheBlank,
            prompt: "Bir veri tipinin bellekte kaç bayt yer kapladığını öğrenmek için derleme zamanı operatörü olan _____ kullanılır.",
            explanation: "sizeof(tip) veya sizeof(degisken) bayt cinsinden bellek boyutunu size_t olarak döner.",
            blankOptions: ["sizeof", "lengthof", "bytesize", "countof"],
            correctBlankAnswer: "sizeof",
          ),
          Question(
            id: "c_unit_5_l4_q15",
            type: QuestionType.fillInTheBlank,
            prompt: "Açılmış bir dosya işaretçisini işletim sistemine geri iade etmek için _____ fonksiyonu çağrılır.",
            explanation: "fclose(FILE *stream) dosya tamponlarını diske yazar ve kaynakları kapatır.",
            blankOptions: ["fclose", "close", "file_exit", "dispose"],
            correctBlankAnswer: "fclose",
          ),
          Question(
            id: "c_unit_5_l4_q16",
            type: QuestionType.trueFalse,
            prompt: "C dilinde dizi isimleri ifadeler içinde kullanıldığında dizinin ilk elemanının bellek adresine (pointer) dönüşür (decay).",
            explanation: "Doğrudur, 'arr' ifadesi '&arr[0]' adresi ile eşdeğerdir.",
            isTrue: true,
          ),
          Question(
            id: "c_unit_5_l4_q17",
            type: QuestionType.trueFalse,
            prompt: "Stack belleğinde oluşturulan yerel değişkenler fonksiyon sonlandığında da bellekte kalmaya devam eder ve serbest bırakılması için free() gerekir.",
            explanation: "Yanlıştır! Stack bellek fonksiyon bitiminde otomatik temizlenir; free() sadece heap (malloc) için geçerlidir.",
            isTrue: false,
          ),
          Question(
            id: "c_unit_5_l4_q18",
            type: QuestionType.matching,
            prompt: "C bellek kavramlarını doğru açıklamalarıyla eşleştirin.",
            explanation: "C'de bellek güvenliği doğrudan yazılımcının sorumluluğundadır.",
            matchingPairs: [MatchingPair(left: "malloc", right: "Heap üzerinde başlatılmamış bellek tahsisi"), MatchingPair(left: "free", right: "Dinamik belleği sisteme iade etme"), MatchingPair(left: "Valgrind", right: "Bellek sızıntılarını tespit eden analiz aracı")],
          ),
        ],
      ),
      Lesson(
        id: "c_unit_5_l5",
        title: "calloc() ile Sıfırlanmış Bellek Tahsisi",
        description: "Tüm baytları otomatik 0 ile başlatma",
        xpReward: 35,
        gemReward: 12,
        isUnitExam: false,
        questions: [
          Question(
            id: "c_unit_5_l5_q1",
            type: QuestionType.conceptCard,
            conceptTitle: "calloc() ile Sıfırlanmış Bellek Tahsisi - Hap Bilgi",
            rule: "C dilinde işaretçiler (pointers) doğrudan bellek adreslerini saklar. '&' operatörü bir değişkenin adresini alırken, '*' (dereference) o adresteki veriye erişir veya değiştirir.",
            codeExample: r'''#include <stdio.h>
#include <stdlib.h>

int main() {
    int x = 100;
    int *ptr = &x;
    
    printf("x Degeri: %d\n", *ptr);
    printf("x Bellek Adresi: %p\n", (void*)ptr);
    return 0;
}''',
            devTip: "malloc ile tahsis edilen her bayt bellek için mutlaka bir free() çağrısı yapılmalıdır, aksi halde Memory Leak oluşur.",
            iconEmoji: "⚡",
          ),
          Question(
            id: "c_unit_5_l5_q2",
            type: QuestionType.multipleChoice,
            prompt: "Serbest bırakılmış (free edilmiş) bir işaretçiyi kullanmaya devam etme hatasına ne ad verilir?",
            codeSnippet: r'''free(ptr);
printf("%d", *ptr); // HATA!''',
            options: ["Dangling Pointer (Askıda Kalan İşaretçi)", "Stack Overflow", "Memory Leak", "Deadlock"],
            correctIndex: 0,
            explanation: "free edildikten sonra hala o adresi göstermeye devam eden işaretçiye dangling pointer denir; 'ptr = NULL' yapılarak önlenir.",
          ),
          Question(
            id: "c_unit_5_l5_q3",
            type: QuestionType.multipleChoice,
            prompt: "C programlarında bellek sızıntılarını (memory leak) ve geçersiz bellek erişimlerini tespit etmek için en popüler Linux aracı hangisidir?",
            codeSnippet: r'''$ ___ --leak-check=full ./program''',
            options: ["valgrind", "gdb", "perf", "strace"],
            correctIndex: 0,
            explanation: "Valgrind (özellikle memcheck aracı) C/C++ programlarında bellek yönetim hatalarını ayrıntılı raporlar.",
          ),
          Question(
            id: "c_unit_5_l5_q4",
            type: QuestionType.multipleChoice,
            prompt: "Aşağıdaki bit düzeyinde (bitwise) operatörlerden hangisi bitleri 1 basamak sola kaydırarak 2 ile çarpmayı sağlar?",
            codeSnippet: r'''int x = 5;
int y = x ___ 1; // y = 10 olur''',
            options: ["<<", ">>", "&", "|"],
            correctIndex: 0,
            explanation: "Sola kaydırma (<< n) operatörü sayının değerini 2^n ile çarpar.",
          ),
          Question(
            id: "c_unit_5_l5_q5",
            type: QuestionType.multipleChoice,
            prompt: "C'de dosya açmak ve bir dosya işaretçisi (FILE*) elde etmek için hangi standart fonksiyon kullanılır?",
            codeSnippet: r'''FILE *f = ___("data.txt", "r");''',
            options: ["fopen", "open", "file_open", "create_file"],
            correctIndex: 0,
            explanation: "'fopen(dosya_adi, mod)' dosyayı belirtilen modda (r, w, a, rb, wb) açar.",
          ),
          Question(
            id: "c_unit_5_l5_q6",
            type: QuestionType.multipleChoice,
            prompt: "Bir header dosyasının birden fazla kez derlemeye dahil edilmesini (redefinition) önlemek için ne kullanılır?",
            codeSnippet: r'''#ifndef MY_HEADER_H
#define MY_HEADER_H
// ...
#endif''',
            options: ["Header Guards (#ifndef / #define)", "namespace", "pragma private", "module"],
            correctIndex: 0,
            explanation: "Header guards veya '#pragma once' başlık dosyalarının mükerrer include edilmesini engeller.",
          ),
          Question(
            id: "c_unit_5_l5_q7",
            type: QuestionType.multipleChoice,
            prompt: "Tüm üyelerinin bellekte AYNI başlangıç adresini paylaştığı ve en büyük üyesi kadar yer kaplayan yapı hangisidir?",
            codeSnippet: r'''___ Data {
    int i;
    float f;
    char str[20];
};''',
            options: ["union", "struct", "class", "shared"],
            correctIndex: 0,
            explanation: "'union' içindeki tüm elemanlar aynı bellek alanını ortaklaşa kullanır; aynı anda sadece biri geçerli değer tutar.",
          ),
          Question(
            id: "c_unit_5_l5_q8",
            type: QuestionType.multipleChoice,
            prompt: "C dilinde bir değişkenin bellekteki adresini elde etmek için hangi operatör kullanılır?",
            codeSnippet: r'''int x = 10;
int *ptr = ___x;''',
            options: ["& (Address-of)", "* (Dereference)", "% (Mod)", "\$ (Value)"],
            correctIndex: 0,
            explanation: "'&' operatörü bir değişkenin RAM üzerindeki başlangıç adresini döner.",
          ),
          Question(
            id: "c_unit_5_l5_q9",
            type: QuestionType.multipleChoice,
            prompt: "Bir işaretçinin (pointer) işaret ettiği bellek adresindeki veriye erişmek veya onu değiştirmek için hangi işlem yapılır?",
            codeSnippet: r'''int x = 5;
int *p = &x;
___p = 20; // x artik 20 olur''',
            options: ["* (Dereference)", "&", "->", "."],
            correctIndex: 0,
            explanation: "'*p' dereferencing yaparak işaretçinin tuttuğu adresteki asıl değere erişir.",
          ),
          Question(
            id: "c_unit_5_l5_q10",
            type: QuestionType.multipleChoice,
            prompt: "Heap bellekte dinamik olarak bayt cinsinden bellek tahsis etmek için hangi standart kütüphane fonksiyonu kullanılır?",
            codeSnippet: r'''int *arr = (int*)___(10 * sizeof(int));''',
            options: ["malloc", "alloc", "new", "heap_get"],
            correctIndex: 0,
            explanation: "'malloc(size_t size)' heap bölgesinde istenen bayt kadar bellek ayırır ve void* işaretçi döner.",
          ),
          Question(
            id: "c_unit_5_l5_q11",
            type: QuestionType.multipleChoice,
            prompt: "malloc veya calloc ile tahsis edilen dinamik belleğin sisteme iade edilmesi için hangi fonksiyon çağrılmalıdır?",
            codeSnippet: r'''int *buf = malloc(1024);
// ... kullanim ...
___(buf);''',
            options: ["free", "delete", "release", "dispose"],
            correctIndex: 0,
            explanation: "'free(ptr)' heap bellekte ayrılan alanı serbest bırakır. Çağrılmazsa 'Memory Leak' oluşur.",
          ),
          Question(
            id: "c_unit_5_l5_q12",
            type: QuestionType.multipleChoice,
            prompt: "Tahsis ettiği belleği otomatik olarak sıfırlarla (0 baytları) dolduran dinamik bellek fonksiyonu hangisidir?",
            codeSnippet: r'''int *p = ___(100, sizeof(int));''',
            options: ["calloc", "malloc", "realloc", "zalloc"],
            correctIndex: 0,
            explanation: "'calloc(num, size)' eleman sayısı ve eleman boyutu alır, ayrılan tüm bellek hücrelerini 0 ile başlatır.",
          ),
          Question(
            id: "c_unit_5_l5_q13",
            type: QuestionType.fillInTheBlank,
            prompt: "Geçersiz veya henüz atanmamış bir işaretçiye güvenli başlangıç değeri olarak _____ atanmalıdır.",
            explanation: "İşaretçilere NULL atamak tanımsız belleğe erişimi ve segmentation fault hatalarını engellemeye yardımcı olur.",
            blankOptions: ["NULL", "0xFF", "void", "NaN"],
            correctBlankAnswer: "NULL",
          ),
          Question(
            id: "c_unit_5_l5_q14",
            type: QuestionType.fillInTheBlank,
            prompt: "Bir veri tipinin bellekte kaç bayt yer kapladığını öğrenmek için derleme zamanı operatörü olan _____ kullanılır.",
            explanation: "sizeof(tip) veya sizeof(degisken) bayt cinsinden bellek boyutunu size_t olarak döner.",
            blankOptions: ["sizeof", "lengthof", "bytesize", "countof"],
            correctBlankAnswer: "sizeof",
          ),
          Question(
            id: "c_unit_5_l5_q15",
            type: QuestionType.fillInTheBlank,
            prompt: "Açılmış bir dosya işaretçisini işletim sistemine geri iade etmek için _____ fonksiyonu çağrılır.",
            explanation: "fclose(FILE *stream) dosya tamponlarını diske yazar ve kaynakları kapatır.",
            blankOptions: ["fclose", "close", "file_exit", "dispose"],
            correctBlankAnswer: "fclose",
          ),
          Question(
            id: "c_unit_5_l5_q16",
            type: QuestionType.trueFalse,
            prompt: "C dilinde dizi isimleri ifadeler içinde kullanıldığında dizinin ilk elemanının bellek adresine (pointer) dönüşür (decay).",
            explanation: "Doğrudur, 'arr' ifadesi '&arr[0]' adresi ile eşdeğerdir.",
            isTrue: true,
          ),
          Question(
            id: "c_unit_5_l5_q17",
            type: QuestionType.trueFalse,
            prompt: "Stack belleğinde oluşturulan yerel değişkenler fonksiyon sonlandığında da bellekte kalmaya devam eder ve serbest bırakılması için free() gerekir.",
            explanation: "Yanlıştır! Stack bellek fonksiyon bitiminde otomatik temizlenir; free() sadece heap (malloc) için geçerlidir.",
            isTrue: false,
          ),
          Question(
            id: "c_unit_5_l5_q18",
            type: QuestionType.matching,
            prompt: "C bellek kavramlarını doğru açıklamalarıyla eşleştirin.",
            explanation: "C'de bellek güvenliği doğrudan yazılımcının sorumluluğundadır.",
            matchingPairs: [MatchingPair(left: "malloc", right: "Heap üzerinde başlatılmamış bellek tahsisi"), MatchingPair(left: "free", right: "Dinamik belleği sisteme iade etme"), MatchingPair(left: "Valgrind", right: "Bellek sızıntılarını tespit eden analiz aracı")],
          ),
        ],
      ),
      Lesson(
        id: "c_unit_5_l6",
        title: "realloc() ile Bloğu Büyütme/Küçültme",
        description: "Dinamik dizileri genişletme ve veri kopyalama",
        xpReward: 35,
        gemReward: 12,
        isUnitExam: false,
        questions: [
          Question(
            id: "c_unit_5_l6_q1",
            type: QuestionType.conceptCard,
            conceptTitle: "realloc() ile Bloğu Büyütme/Küçültme - Hap Bilgi",
            rule: "C dilinde işaretçiler (pointers) doğrudan bellek adreslerini saklar. '&' operatörü bir değişkenin adresini alırken, '*' (dereference) o adresteki veriye erişir veya değiştirir.",
            codeExample: r'''#include <stdio.h>
#include <stdlib.h>

int main() {
    int x = 100;
    int *ptr = &x;
    
    printf("x Degeri: %d\n", *ptr);
    printf("x Bellek Adresi: %p\n", (void*)ptr);
    return 0;
}''',
            devTip: "malloc ile tahsis edilen her bayt bellek için mutlaka bir free() çağrısı yapılmalıdır, aksi halde Memory Leak oluşur.",
            iconEmoji: "⚡",
          ),
          Question(
            id: "c_unit_5_l6_q2",
            type: QuestionType.multipleChoice,
            prompt: "Aşağıdaki bit düzeyinde (bitwise) operatörlerden hangisi bitleri 1 basamak sola kaydırarak 2 ile çarpmayı sağlar?",
            codeSnippet: r'''int x = 5;
int y = x ___ 1; // y = 10 olur''',
            options: ["<<", ">>", "&", "|"],
            correctIndex: 0,
            explanation: "Sola kaydırma (<< n) operatörü sayının değerini 2^n ile çarpar.",
          ),
          Question(
            id: "c_unit_5_l6_q3",
            type: QuestionType.multipleChoice,
            prompt: "C'de dosya açmak ve bir dosya işaretçisi (FILE*) elde etmek için hangi standart fonksiyon kullanılır?",
            codeSnippet: r'''FILE *f = ___("data.txt", "r");''',
            options: ["fopen", "open", "file_open", "create_file"],
            correctIndex: 0,
            explanation: "'fopen(dosya_adi, mod)' dosyayı belirtilen modda (r, w, a, rb, wb) açar.",
          ),
          Question(
            id: "c_unit_5_l6_q4",
            type: QuestionType.multipleChoice,
            prompt: "Bir header dosyasının birden fazla kez derlemeye dahil edilmesini (redefinition) önlemek için ne kullanılır?",
            codeSnippet: r'''#ifndef MY_HEADER_H
#define MY_HEADER_H
// ...
#endif''',
            options: ["Header Guards (#ifndef / #define)", "namespace", "pragma private", "module"],
            correctIndex: 0,
            explanation: "Header guards veya '#pragma once' başlık dosyalarının mükerrer include edilmesini engeller.",
          ),
          Question(
            id: "c_unit_5_l6_q5",
            type: QuestionType.multipleChoice,
            prompt: "Tüm üyelerinin bellekte AYNI başlangıç adresini paylaştığı ve en büyük üyesi kadar yer kaplayan yapı hangisidir?",
            codeSnippet: r'''___ Data {
    int i;
    float f;
    char str[20];
};''',
            options: ["union", "struct", "class", "shared"],
            correctIndex: 0,
            explanation: "'union' içindeki tüm elemanlar aynı bellek alanını ortaklaşa kullanır; aynı anda sadece biri geçerli değer tutar.",
          ),
          Question(
            id: "c_unit_5_l6_q6",
            type: QuestionType.multipleChoice,
            prompt: "C dilinde bir değişkenin bellekteki adresini elde etmek için hangi operatör kullanılır?",
            codeSnippet: r'''int x = 10;
int *ptr = ___x;''',
            options: ["& (Address-of)", "* (Dereference)", "% (Mod)", "\$ (Value)"],
            correctIndex: 0,
            explanation: "'&' operatörü bir değişkenin RAM üzerindeki başlangıç adresini döner.",
          ),
          Question(
            id: "c_unit_5_l6_q7",
            type: QuestionType.multipleChoice,
            prompt: "Bir işaretçinin (pointer) işaret ettiği bellek adresindeki veriye erişmek veya onu değiştirmek için hangi işlem yapılır?",
            codeSnippet: r'''int x = 5;
int *p = &x;
___p = 20; // x artik 20 olur''',
            options: ["* (Dereference)", "&", "->", "."],
            correctIndex: 0,
            explanation: "'*p' dereferencing yaparak işaretçinin tuttuğu adresteki asıl değere erişir.",
          ),
          Question(
            id: "c_unit_5_l6_q8",
            type: QuestionType.multipleChoice,
            prompt: "Heap bellekte dinamik olarak bayt cinsinden bellek tahsis etmek için hangi standart kütüphane fonksiyonu kullanılır?",
            codeSnippet: r'''int *arr = (int*)___(10 * sizeof(int));''',
            options: ["malloc", "alloc", "new", "heap_get"],
            correctIndex: 0,
            explanation: "'malloc(size_t size)' heap bölgesinde istenen bayt kadar bellek ayırır ve void* işaretçi döner.",
          ),
          Question(
            id: "c_unit_5_l6_q9",
            type: QuestionType.multipleChoice,
            prompt: "malloc veya calloc ile tahsis edilen dinamik belleğin sisteme iade edilmesi için hangi fonksiyon çağrılmalıdır?",
            codeSnippet: r'''int *buf = malloc(1024);
// ... kullanim ...
___(buf);''',
            options: ["free", "delete", "release", "dispose"],
            correctIndex: 0,
            explanation: "'free(ptr)' heap bellekte ayrılan alanı serbest bırakır. Çağrılmazsa 'Memory Leak' oluşur.",
          ),
          Question(
            id: "c_unit_5_l6_q10",
            type: QuestionType.multipleChoice,
            prompt: "Tahsis ettiği belleği otomatik olarak sıfırlarla (0 baytları) dolduran dinamik bellek fonksiyonu hangisidir?",
            codeSnippet: r'''int *p = ___(100, sizeof(int));''',
            options: ["calloc", "malloc", "realloc", "zalloc"],
            correctIndex: 0,
            explanation: "'calloc(num, size)' eleman sayısı ve eleman boyutu alır, ayrılan tüm bellek hücrelerini 0 ile başlatır.",
          ),
          Question(
            id: "c_unit_5_l6_q11",
            type: QuestionType.multipleChoice,
            prompt: "Daha önce ayrılmış dinamik bir bellek bloğunun boyutunu veri kaybı olmadan büyütmek veya küçültmek için ne kullanılır?",
            codeSnippet: r'''ptr = ___(ptr, new_size);''',
            options: ["realloc", "resize", "remalloc", "expand"],
            correctIndex: 0,
            explanation: "'realloc' mevcut bloğu genişletir veya yeni bir konuma taşıyarak eski veriyi kopyalar.",
          ),
          Question(
            id: "c_unit_5_l6_q12",
            type: QuestionType.multipleChoice,
            prompt: "C programlama dilinde GCC derleme sürecinin doğru sırası aşağıdakilerden hangisidir?",
            options: ["Preprocessor -> Compiler -> Assembler -> Linker", "Compiler -> Preprocessor -> Linker -> Assembler", "Assembler -> Compiler -> Linker -> Preprocessor", "Linker -> Assembler -> Compiler -> Preprocessor"],
            correctIndex: 0,
            explanation: "Önce makrolar ve headerlar çözülür (cpp), C kodu Assembly'ye derlenir (cc1), makine koduna çevrilir (as), kütüphaneler bağlanır (ld).",
          ),
          Question(
            id: "c_unit_5_l6_q13",
            type: QuestionType.fillInTheBlank,
            prompt: "Geçersiz veya henüz atanmamış bir işaretçiye güvenli başlangıç değeri olarak _____ atanmalıdır.",
            explanation: "İşaretçilere NULL atamak tanımsız belleğe erişimi ve segmentation fault hatalarını engellemeye yardımcı olur.",
            blankOptions: ["NULL", "0xFF", "void", "NaN"],
            correctBlankAnswer: "NULL",
          ),
          Question(
            id: "c_unit_5_l6_q14",
            type: QuestionType.fillInTheBlank,
            prompt: "Bir veri tipinin bellekte kaç bayt yer kapladığını öğrenmek için derleme zamanı operatörü olan _____ kullanılır.",
            explanation: "sizeof(tip) veya sizeof(degisken) bayt cinsinden bellek boyutunu size_t olarak döner.",
            blankOptions: ["sizeof", "lengthof", "bytesize", "countof"],
            correctBlankAnswer: "sizeof",
          ),
          Question(
            id: "c_unit_5_l6_q15",
            type: QuestionType.fillInTheBlank,
            prompt: "Açılmış bir dosya işaretçisini işletim sistemine geri iade etmek için _____ fonksiyonu çağrılır.",
            explanation: "fclose(FILE *stream) dosya tamponlarını diske yazar ve kaynakları kapatır.",
            blankOptions: ["fclose", "close", "file_exit", "dispose"],
            correctBlankAnswer: "fclose",
          ),
          Question(
            id: "c_unit_5_l6_q16",
            type: QuestionType.trueFalse,
            prompt: "C dilinde dizi isimleri ifadeler içinde kullanıldığında dizinin ilk elemanının bellek adresine (pointer) dönüşür (decay).",
            explanation: "Doğrudur, 'arr' ifadesi '&arr[0]' adresi ile eşdeğerdir.",
            isTrue: true,
          ),
          Question(
            id: "c_unit_5_l6_q17",
            type: QuestionType.trueFalse,
            prompt: "Stack belleğinde oluşturulan yerel değişkenler fonksiyon sonlandığında da bellekte kalmaya devam eder ve serbest bırakılması için free() gerekir.",
            explanation: "Yanlıştır! Stack bellek fonksiyon bitiminde otomatik temizlenir; free() sadece heap (malloc) için geçerlidir.",
            isTrue: false,
          ),
          Question(
            id: "c_unit_5_l6_q18",
            type: QuestionType.matching,
            prompt: "C bellek kavramlarını doğru açıklamalarıyla eşleştirin.",
            explanation: "C'de bellek güvenliği doğrudan yazılımcının sorumluluğundadır.",
            matchingPairs: [MatchingPair(left: "malloc", right: "Heap üzerinde başlatılmamış bellek tahsisi"), MatchingPair(left: "free", right: "Dinamik belleği sisteme iade etme"), MatchingPair(left: "Valgrind", right: "Bellek sızıntılarını tespit eden analiz aracı")],
          ),
        ],
      ),
      Lesson(
        id: "c_unit_5_l7",
        title: "Çift Free (Double Free) Hatası & Çözümü",
        description: "Aynı bloğu iki kez serbest bırakma tuzağı",
        xpReward: 35,
        gemReward: 12,
        isUnitExam: false,
        questions: [
          Question(
            id: "c_unit_5_l7_q1",
            type: QuestionType.conceptCard,
            conceptTitle: "Çift Free (Double Free) Hatası & Çözümü - Hap Bilgi",
            rule: "C dilinde işaretçiler (pointers) doğrudan bellek adreslerini saklar. '&' operatörü bir değişkenin adresini alırken, '*' (dereference) o adresteki veriye erişir veya değiştirir.",
            codeExample: r'''#include <stdio.h>
#include <stdlib.h>

int main() {
    int x = 100;
    int *ptr = &x;
    
    printf("x Degeri: %d\n", *ptr);
    printf("x Bellek Adresi: %p\n", (void*)ptr);
    return 0;
}''',
            devTip: "malloc ile tahsis edilen her bayt bellek için mutlaka bir free() çağrısı yapılmalıdır, aksi halde Memory Leak oluşur.",
            iconEmoji: "⚡",
          ),
          Question(
            id: "c_unit_5_l7_q2",
            type: QuestionType.multipleChoice,
            prompt: "Bir header dosyasının birden fazla kez derlemeye dahil edilmesini (redefinition) önlemek için ne kullanılır?",
            codeSnippet: r'''#ifndef MY_HEADER_H
#define MY_HEADER_H
// ...
#endif''',
            options: ["Header Guards (#ifndef / #define)", "namespace", "pragma private", "module"],
            correctIndex: 0,
            explanation: "Header guards veya '#pragma once' başlık dosyalarının mükerrer include edilmesini engeller.",
          ),
          Question(
            id: "c_unit_5_l7_q3",
            type: QuestionType.multipleChoice,
            prompt: "Tüm üyelerinin bellekte AYNI başlangıç adresini paylaştığı ve en büyük üyesi kadar yer kaplayan yapı hangisidir?",
            codeSnippet: r'''___ Data {
    int i;
    float f;
    char str[20];
};''',
            options: ["union", "struct", "class", "shared"],
            correctIndex: 0,
            explanation: "'union' içindeki tüm elemanlar aynı bellek alanını ortaklaşa kullanır; aynı anda sadece biri geçerli değer tutar.",
          ),
          Question(
            id: "c_unit_5_l7_q4",
            type: QuestionType.multipleChoice,
            prompt: "C dilinde bir değişkenin bellekteki adresini elde etmek için hangi operatör kullanılır?",
            codeSnippet: r'''int x = 10;
int *ptr = ___x;''',
            options: ["& (Address-of)", "* (Dereference)", "% (Mod)", "\$ (Value)"],
            correctIndex: 0,
            explanation: "'&' operatörü bir değişkenin RAM üzerindeki başlangıç adresini döner.",
          ),
          Question(
            id: "c_unit_5_l7_q5",
            type: QuestionType.multipleChoice,
            prompt: "Bir işaretçinin (pointer) işaret ettiği bellek adresindeki veriye erişmek veya onu değiştirmek için hangi işlem yapılır?",
            codeSnippet: r'''int x = 5;
int *p = &x;
___p = 20; // x artik 20 olur''',
            options: ["* (Dereference)", "&", "->", "."],
            correctIndex: 0,
            explanation: "'*p' dereferencing yaparak işaretçinin tuttuğu adresteki asıl değere erişir.",
          ),
          Question(
            id: "c_unit_5_l7_q6",
            type: QuestionType.multipleChoice,
            prompt: "Heap bellekte dinamik olarak bayt cinsinden bellek tahsis etmek için hangi standart kütüphane fonksiyonu kullanılır?",
            codeSnippet: r'''int *arr = (int*)___(10 * sizeof(int));''',
            options: ["malloc", "alloc", "new", "heap_get"],
            correctIndex: 0,
            explanation: "'malloc(size_t size)' heap bölgesinde istenen bayt kadar bellek ayırır ve void* işaretçi döner.",
          ),
          Question(
            id: "c_unit_5_l7_q7",
            type: QuestionType.multipleChoice,
            prompt: "malloc veya calloc ile tahsis edilen dinamik belleğin sisteme iade edilmesi için hangi fonksiyon çağrılmalıdır?",
            codeSnippet: r'''int *buf = malloc(1024);
// ... kullanim ...
___(buf);''',
            options: ["free", "delete", "release", "dispose"],
            correctIndex: 0,
            explanation: "'free(ptr)' heap bellekte ayrılan alanı serbest bırakır. Çağrılmazsa 'Memory Leak' oluşur.",
          ),
          Question(
            id: "c_unit_5_l7_q8",
            type: QuestionType.multipleChoice,
            prompt: "Tahsis ettiği belleği otomatik olarak sıfırlarla (0 baytları) dolduran dinamik bellek fonksiyonu hangisidir?",
            codeSnippet: r'''int *p = ___(100, sizeof(int));''',
            options: ["calloc", "malloc", "realloc", "zalloc"],
            correctIndex: 0,
            explanation: "'calloc(num, size)' eleman sayısı ve eleman boyutu alır, ayrılan tüm bellek hücrelerini 0 ile başlatır.",
          ),
          Question(
            id: "c_unit_5_l7_q9",
            type: QuestionType.multipleChoice,
            prompt: "Daha önce ayrılmış dinamik bir bellek bloğunun boyutunu veri kaybı olmadan büyütmek veya küçültmek için ne kullanılır?",
            codeSnippet: r'''ptr = ___(ptr, new_size);''',
            options: ["realloc", "resize", "remalloc", "expand"],
            correctIndex: 0,
            explanation: "'realloc' mevcut bloğu genişletir veya yeni bir konuma taşıyarak eski veriyi kopyalar.",
          ),
          Question(
            id: "c_unit_5_l7_q10",
            type: QuestionType.multipleChoice,
            prompt: "C programlama dilinde GCC derleme sürecinin doğru sırası aşağıdakilerden hangisidir?",
            options: ["Preprocessor -> Compiler -> Assembler -> Linker", "Compiler -> Preprocessor -> Linker -> Assembler", "Assembler -> Compiler -> Linker -> Preprocessor", "Linker -> Assembler -> Compiler -> Preprocessor"],
            correctIndex: 0,
            explanation: "Önce makrolar ve headerlar çözülür (cpp), C kodu Assembly'ye derlenir (cc1), makine koduna çevrilir (as), kütüphaneler bağlanır (ld).",
          ),
          Question(
            id: "c_unit_5_l7_q11",
            type: QuestionType.multipleChoice,
            prompt: "64-bit modern bir mimaride standart bir işaretçi (pointer - int*, char*, void*) değişkeni bellekte kaç bayt yer kaplar?",
            codeSnippet: r'''printf("%zu", sizeof(int*));''',
            options: ["8 bayt", "4 bayt", "2 bayt", "16 bayt"],
            correctIndex: 0,
            explanation: "64-bit mimarilerde bellek adresleri 64 bit yani tam 8 bayttır. İşaretçinin tipi ne olursa olsun adres boyutu 8 bayttır.",
          ),
          Question(
            id: "c_unit_5_l7_q12",
            type: QuestionType.multipleChoice,
            prompt: "Bir struct içindeki bir işaretçi elemana erişirken '.' yerine hangi pratik operatör kullanılır?",
            codeSnippet: r'''struct User *u = getUser();
u___name = "Ahmet";''',
            options: ["-> (Ok operatörü)", ".", "::", "=>"],
            correctIndex: 0,
            explanation: "'u->name', '(*u).name' yazımının daha okunaklı ve standart kısayoludur.",
          ),
          Question(
            id: "c_unit_5_l7_q13",
            type: QuestionType.fillInTheBlank,
            prompt: "Geçersiz veya henüz atanmamış bir işaretçiye güvenli başlangıç değeri olarak _____ atanmalıdır.",
            explanation: "İşaretçilere NULL atamak tanımsız belleğe erişimi ve segmentation fault hatalarını engellemeye yardımcı olur.",
            blankOptions: ["NULL", "0xFF", "void", "NaN"],
            correctBlankAnswer: "NULL",
          ),
          Question(
            id: "c_unit_5_l7_q14",
            type: QuestionType.fillInTheBlank,
            prompt: "Bir veri tipinin bellekte kaç bayt yer kapladığını öğrenmek için derleme zamanı operatörü olan _____ kullanılır.",
            explanation: "sizeof(tip) veya sizeof(degisken) bayt cinsinden bellek boyutunu size_t olarak döner.",
            blankOptions: ["sizeof", "lengthof", "bytesize", "countof"],
            correctBlankAnswer: "sizeof",
          ),
          Question(
            id: "c_unit_5_l7_q15",
            type: QuestionType.fillInTheBlank,
            prompt: "Açılmış bir dosya işaretçisini işletim sistemine geri iade etmek için _____ fonksiyonu çağrılır.",
            explanation: "fclose(FILE *stream) dosya tamponlarını diske yazar ve kaynakları kapatır.",
            blankOptions: ["fclose", "close", "file_exit", "dispose"],
            correctBlankAnswer: "fclose",
          ),
          Question(
            id: "c_unit_5_l7_q16",
            type: QuestionType.trueFalse,
            prompt: "C dilinde dizi isimleri ifadeler içinde kullanıldığında dizinin ilk elemanının bellek adresine (pointer) dönüşür (decay).",
            explanation: "Doğrudur, 'arr' ifadesi '&arr[0]' adresi ile eşdeğerdir.",
            isTrue: true,
          ),
          Question(
            id: "c_unit_5_l7_q17",
            type: QuestionType.trueFalse,
            prompt: "Stack belleğinde oluşturulan yerel değişkenler fonksiyon sonlandığında da bellekte kalmaya devam eder ve serbest bırakılması için free() gerekir.",
            explanation: "Yanlıştır! Stack bellek fonksiyon bitiminde otomatik temizlenir; free() sadece heap (malloc) için geçerlidir.",
            isTrue: false,
          ),
          Question(
            id: "c_unit_5_l7_q18",
            type: QuestionType.matching,
            prompt: "C bellek kavramlarını doğru açıklamalarıyla eşleştirin.",
            explanation: "C'de bellek güvenliği doğrudan yazılımcının sorumluluğundadır.",
            matchingPairs: [MatchingPair(left: "malloc", right: "Heap üzerinde başlatılmamış bellek tahsisi"), MatchingPair(left: "free", right: "Dinamik belleği sisteme iade etme"), MatchingPair(left: "Valgrind", right: "Bellek sızıntılarını tespit eden analiz aracı")],
          ),
        ],
      ),
      Lesson(
        id: "c_unit_5_l8",
        title: "5. Ünite Dinamik Bellek Yönetimi Sınavı",
        description: "malloc, free ve heap yönetimi sınavı",
        xpReward: 50,
        gemReward: 25,
        isUnitExam: true,
        questions: [
          Question(
            id: "c_unit_5_l8_q1",
            type: QuestionType.conceptCard,
            conceptTitle: "5. Ünite Dinamik Bellek Yönetimi Sınavı - Hap Bilgi",
            rule: "C dilinde işaretçiler (pointers) doğrudan bellek adreslerini saklar. '&' operatörü bir değişkenin adresini alırken, '*' (dereference) o adresteki veriye erişir veya değiştirir.",
            codeExample: r'''#include <stdio.h>
#include <stdlib.h>

int main() {
    int x = 100;
    int *ptr = &x;
    
    printf("x Degeri: %d\n", *ptr);
    printf("x Bellek Adresi: %p\n", (void*)ptr);
    return 0;
}''',
            devTip: "malloc ile tahsis edilen her bayt bellek için mutlaka bir free() çağrısı yapılmalıdır, aksi halde Memory Leak oluşur.",
            iconEmoji: "⚡",
          ),
          Question(
            id: "c_unit_5_l8_q2",
            type: QuestionType.multipleChoice,
            prompt: "C dilinde bir değişkenin bellekteki adresini elde etmek için hangi operatör kullanılır?",
            codeSnippet: r'''int x = 10;
int *ptr = ___x;''',
            options: ["& (Address-of)", "* (Dereference)", "% (Mod)", "\$ (Value)"],
            correctIndex: 0,
            explanation: "'&' operatörü bir değişkenin RAM üzerindeki başlangıç adresini döner.",
          ),
          Question(
            id: "c_unit_5_l8_q3",
            type: QuestionType.multipleChoice,
            prompt: "Bir işaretçinin (pointer) işaret ettiği bellek adresindeki veriye erişmek veya onu değiştirmek için hangi işlem yapılır?",
            codeSnippet: r'''int x = 5;
int *p = &x;
___p = 20; // x artik 20 olur''',
            options: ["* (Dereference)", "&", "->", "."],
            correctIndex: 0,
            explanation: "'*p' dereferencing yaparak işaretçinin tuttuğu adresteki asıl değere erişir.",
          ),
          Question(
            id: "c_unit_5_l8_q4",
            type: QuestionType.multipleChoice,
            prompt: "Heap bellekte dinamik olarak bayt cinsinden bellek tahsis etmek için hangi standart kütüphane fonksiyonu kullanılır?",
            codeSnippet: r'''int *arr = (int*)___(10 * sizeof(int));''',
            options: ["malloc", "alloc", "new", "heap_get"],
            correctIndex: 0,
            explanation: "'malloc(size_t size)' heap bölgesinde istenen bayt kadar bellek ayırır ve void* işaretçi döner.",
          ),
          Question(
            id: "c_unit_5_l8_q5",
            type: QuestionType.multipleChoice,
            prompt: "malloc veya calloc ile tahsis edilen dinamik belleğin sisteme iade edilmesi için hangi fonksiyon çağrılmalıdır?",
            codeSnippet: r'''int *buf = malloc(1024);
// ... kullanim ...
___(buf);''',
            options: ["free", "delete", "release", "dispose"],
            correctIndex: 0,
            explanation: "'free(ptr)' heap bellekte ayrılan alanı serbest bırakır. Çağrılmazsa 'Memory Leak' oluşur.",
          ),
          Question(
            id: "c_unit_5_l8_q6",
            type: QuestionType.multipleChoice,
            prompt: "Tahsis ettiği belleği otomatik olarak sıfırlarla (0 baytları) dolduran dinamik bellek fonksiyonu hangisidir?",
            codeSnippet: r'''int *p = ___(100, sizeof(int));''',
            options: ["calloc", "malloc", "realloc", "zalloc"],
            correctIndex: 0,
            explanation: "'calloc(num, size)' eleman sayısı ve eleman boyutu alır, ayrılan tüm bellek hücrelerini 0 ile başlatır.",
          ),
          Question(
            id: "c_unit_5_l8_q7",
            type: QuestionType.multipleChoice,
            prompt: "Daha önce ayrılmış dinamik bir bellek bloğunun boyutunu veri kaybı olmadan büyütmek veya küçültmek için ne kullanılır?",
            codeSnippet: r'''ptr = ___(ptr, new_size);''',
            options: ["realloc", "resize", "remalloc", "expand"],
            correctIndex: 0,
            explanation: "'realloc' mevcut bloğu genişletir veya yeni bir konuma taşıyarak eski veriyi kopyalar.",
          ),
          Question(
            id: "c_unit_5_l8_q8",
            type: QuestionType.multipleChoice,
            prompt: "C programlama dilinde GCC derleme sürecinin doğru sırası aşağıdakilerden hangisidir?",
            options: ["Preprocessor -> Compiler -> Assembler -> Linker", "Compiler -> Preprocessor -> Linker -> Assembler", "Assembler -> Compiler -> Linker -> Preprocessor", "Linker -> Assembler -> Compiler -> Preprocessor"],
            correctIndex: 0,
            explanation: "Önce makrolar ve headerlar çözülür (cpp), C kodu Assembly'ye derlenir (cc1), makine koduna çevrilir (as), kütüphaneler bağlanır (ld).",
          ),
          Question(
            id: "c_unit_5_l8_q9",
            type: QuestionType.multipleChoice,
            prompt: "64-bit modern bir mimaride standart bir işaretçi (pointer - int*, char*, void*) değişkeni bellekte kaç bayt yer kaplar?",
            codeSnippet: r'''printf("%zu", sizeof(int*));''',
            options: ["8 bayt", "4 bayt", "2 bayt", "16 bayt"],
            correctIndex: 0,
            explanation: "64-bit mimarilerde bellek adresleri 64 bit yani tam 8 bayttır. İşaretçinin tipi ne olursa olsun adres boyutu 8 bayttır.",
          ),
          Question(
            id: "c_unit_5_l8_q10",
            type: QuestionType.multipleChoice,
            prompt: "Bir struct içindeki bir işaretçi elemana erişirken '.' yerine hangi pratik operatör kullanılır?",
            codeSnippet: r'''struct User *u = getUser();
u___name = "Ahmet";''',
            options: ["-> (Ok operatörü)", ".", "::", "=>"],
            correctIndex: 0,
            explanation: "'u->name', '(*u).name' yazımının daha okunaklı ve standart kısayoludur.",
          ),
          Question(
            id: "c_unit_5_l8_q11",
            type: QuestionType.multipleChoice,
            prompt: "Herhangi bir veri tipine ait bellek adresini tutabilen jenerik (tip bağımsız) işaretçi tipi hangisidir?",
            codeSnippet: r'''___ generic_ptr = &x;''',
            options: ["void*", "any*", "object*", "generic*"],
            correctIndex: 0,
            explanation: "'void*' tipi belirsiz jenerik bir işaretçidir; doğrudan dereference edilemez, cast edilmesi gerekir.",
          ),
          Question(
            id: "c_unit_5_l8_q12",
            type: QuestionType.multipleChoice,
            prompt: "Serbest bırakılmış (free edilmiş) bir işaretçiyi kullanmaya devam etme hatasına ne ad verilir?",
            codeSnippet: r'''free(ptr);
printf("%d", *ptr); // HATA!''',
            options: ["Dangling Pointer (Askıda Kalan İşaretçi)", "Stack Overflow", "Memory Leak", "Deadlock"],
            correctIndex: 0,
            explanation: "free edildikten sonra hala o adresi göstermeye devam eden işaretçiye dangling pointer denir; 'ptr = NULL' yapılarak önlenir.",
          ),
          Question(
            id: "c_unit_5_l8_q13",
            type: QuestionType.fillInTheBlank,
            prompt: "Geçersiz veya henüz atanmamış bir işaretçiye güvenli başlangıç değeri olarak _____ atanmalıdır.",
            explanation: "İşaretçilere NULL atamak tanımsız belleğe erişimi ve segmentation fault hatalarını engellemeye yardımcı olur.",
            blankOptions: ["NULL", "0xFF", "void", "NaN"],
            correctBlankAnswer: "NULL",
          ),
          Question(
            id: "c_unit_5_l8_q14",
            type: QuestionType.fillInTheBlank,
            prompt: "Bir veri tipinin bellekte kaç bayt yer kapladığını öğrenmek için derleme zamanı operatörü olan _____ kullanılır.",
            explanation: "sizeof(tip) veya sizeof(degisken) bayt cinsinden bellek boyutunu size_t olarak döner.",
            blankOptions: ["sizeof", "lengthof", "bytesize", "countof"],
            correctBlankAnswer: "sizeof",
          ),
          Question(
            id: "c_unit_5_l8_q15",
            type: QuestionType.fillInTheBlank,
            prompt: "Açılmış bir dosya işaretçisini işletim sistemine geri iade etmek için _____ fonksiyonu çağrılır.",
            explanation: "fclose(FILE *stream) dosya tamponlarını diske yazar ve kaynakları kapatır.",
            blankOptions: ["fclose", "close", "file_exit", "dispose"],
            correctBlankAnswer: "fclose",
          ),
          Question(
            id: "c_unit_5_l8_q16",
            type: QuestionType.trueFalse,
            prompt: "C dilinde dizi isimleri ifadeler içinde kullanıldığında dizinin ilk elemanının bellek adresine (pointer) dönüşür (decay).",
            explanation: "Doğrudur, 'arr' ifadesi '&arr[0]' adresi ile eşdeğerdir.",
            isTrue: true,
          ),
          Question(
            id: "c_unit_5_l8_q17",
            type: QuestionType.trueFalse,
            prompt: "Stack belleğinde oluşturulan yerel değişkenler fonksiyon sonlandığında da bellekte kalmaya devam eder ve serbest bırakılması için free() gerekir.",
            explanation: "Yanlıştır! Stack bellek fonksiyon bitiminde otomatik temizlenir; free() sadece heap (malloc) için geçerlidir.",
            isTrue: false,
          ),
          Question(
            id: "c_unit_5_l8_q18",
            type: QuestionType.matching,
            prompt: "C bellek kavramlarını doğru açıklamalarıyla eşleştirin.",
            explanation: "C'de bellek güvenliği doğrudan yazılımcının sorumluluğundadır.",
            matchingPairs: [MatchingPair(left: "malloc", right: "Heap üzerinde başlatılmamış bellek tahsisi"), MatchingPair(left: "free", right: "Dinamik belleği sisteme iade etme"), MatchingPair(left: "Valgrind", right: "Bellek sızıntılarını tespit eden analiz aracı")],
          ),
        ],
      ),
    ],
  ),
  LearningUnit(
    id: "c_unit_6",
    unitNumber: 6,
    title: "Bellek Güvenliği, Sızıntılar & Valgrind Analizi",
    language: CodeLanguage.c,
    category: "Dinamik Bellek & Malloc",
    colorHex: 0xFF4F46E5,
    cheatSheetTitle: "C Bellek Güvenliği Hile Kağıdı",
    cheatSheetContent: r'''valgrind --leak-check=full ./prog
free(p); p = NULL; // Dangling onle''',
    lessons: [
      Lesson(
        id: "c_unit_6_l1",
        title: "Bellek Sızıntısı (Memory Leak) Nedir?",
        description: "free edilmeyen belleğin programı şişirmesi",
        xpReward: 35,
        gemReward: 12,
        isUnitExam: false,
        questions: [
          Question(
            id: "c_unit_6_l1_q1",
            type: QuestionType.conceptCard,
            conceptTitle: "Bellek Sızıntısı (Memory Leak) Nedir? - Hap Bilgi",
            rule: "C dilinde işaretçiler (pointers) doğrudan bellek adreslerini saklar. '&' operatörü bir değişkenin adresini alırken, '*' (dereference) o adresteki veriye erişir veya değiştirir.",
            codeExample: r'''#include <stdio.h>
#include <stdlib.h>

int main() {
    int x = 100;
    int *ptr = &x;
    
    printf("x Degeri: %d\n", *ptr);
    printf("x Bellek Adresi: %p\n", (void*)ptr);
    return 0;
}''',
            devTip: "malloc ile tahsis edilen her bayt bellek için mutlaka bir free() çağrısı yapılmalıdır, aksi halde Memory Leak oluşur.",
            iconEmoji: "⚡",
          ),
          Question(
            id: "c_unit_6_l1_q2",
            type: QuestionType.multipleChoice,
            prompt: "Heap bellekte dinamik olarak bayt cinsinden bellek tahsis etmek için hangi standart kütüphane fonksiyonu kullanılır?",
            codeSnippet: r'''int *arr = (int*)___(10 * sizeof(int));''',
            options: ["malloc", "alloc", "new", "heap_get"],
            correctIndex: 0,
            explanation: "'malloc(size_t size)' heap bölgesinde istenen bayt kadar bellek ayırır ve void* işaretçi döner.",
          ),
          Question(
            id: "c_unit_6_l1_q3",
            type: QuestionType.multipleChoice,
            prompt: "malloc veya calloc ile tahsis edilen dinamik belleğin sisteme iade edilmesi için hangi fonksiyon çağrılmalıdır?",
            codeSnippet: r'''int *buf = malloc(1024);
// ... kullanim ...
___(buf);''',
            options: ["free", "delete", "release", "dispose"],
            correctIndex: 0,
            explanation: "'free(ptr)' heap bellekte ayrılan alanı serbest bırakır. Çağrılmazsa 'Memory Leak' oluşur.",
          ),
          Question(
            id: "c_unit_6_l1_q4",
            type: QuestionType.multipleChoice,
            prompt: "Tahsis ettiği belleği otomatik olarak sıfırlarla (0 baytları) dolduran dinamik bellek fonksiyonu hangisidir?",
            codeSnippet: r'''int *p = ___(100, sizeof(int));''',
            options: ["calloc", "malloc", "realloc", "zalloc"],
            correctIndex: 0,
            explanation: "'calloc(num, size)' eleman sayısı ve eleman boyutu alır, ayrılan tüm bellek hücrelerini 0 ile başlatır.",
          ),
          Question(
            id: "c_unit_6_l1_q5",
            type: QuestionType.multipleChoice,
            prompt: "Daha önce ayrılmış dinamik bir bellek bloğunun boyutunu veri kaybı olmadan büyütmek veya küçültmek için ne kullanılır?",
            codeSnippet: r'''ptr = ___(ptr, new_size);''',
            options: ["realloc", "resize", "remalloc", "expand"],
            correctIndex: 0,
            explanation: "'realloc' mevcut bloğu genişletir veya yeni bir konuma taşıyarak eski veriyi kopyalar.",
          ),
          Question(
            id: "c_unit_6_l1_q6",
            type: QuestionType.multipleChoice,
            prompt: "C programlama dilinde GCC derleme sürecinin doğru sırası aşağıdakilerden hangisidir?",
            options: ["Preprocessor -> Compiler -> Assembler -> Linker", "Compiler -> Preprocessor -> Linker -> Assembler", "Assembler -> Compiler -> Linker -> Preprocessor", "Linker -> Assembler -> Compiler -> Preprocessor"],
            correctIndex: 0,
            explanation: "Önce makrolar ve headerlar çözülür (cpp), C kodu Assembly'ye derlenir (cc1), makine koduna çevrilir (as), kütüphaneler bağlanır (ld).",
          ),
          Question(
            id: "c_unit_6_l1_q7",
            type: QuestionType.multipleChoice,
            prompt: "64-bit modern bir mimaride standart bir işaretçi (pointer - int*, char*, void*) değişkeni bellekte kaç bayt yer kaplar?",
            codeSnippet: r'''printf("%zu", sizeof(int*));''',
            options: ["8 bayt", "4 bayt", "2 bayt", "16 bayt"],
            correctIndex: 0,
            explanation: "64-bit mimarilerde bellek adresleri 64 bit yani tam 8 bayttır. İşaretçinin tipi ne olursa olsun adres boyutu 8 bayttır.",
          ),
          Question(
            id: "c_unit_6_l1_q8",
            type: QuestionType.multipleChoice,
            prompt: "Bir struct içindeki bir işaretçi elemana erişirken '.' yerine hangi pratik operatör kullanılır?",
            codeSnippet: r'''struct User *u = getUser();
u___name = "Ahmet";''',
            options: ["-> (Ok operatörü)", ".", "::", "=>"],
            correctIndex: 0,
            explanation: "'u->name', '(*u).name' yazımının daha okunaklı ve standart kısayoludur.",
          ),
          Question(
            id: "c_unit_6_l1_q9",
            type: QuestionType.multipleChoice,
            prompt: "Herhangi bir veri tipine ait bellek adresini tutabilen jenerik (tip bağımsız) işaretçi tipi hangisidir?",
            codeSnippet: r'''___ generic_ptr = &x;''',
            options: ["void*", "any*", "object*", "generic*"],
            correctIndex: 0,
            explanation: "'void*' tipi belirsiz jenerik bir işaretçidir; doğrudan dereference edilemez, cast edilmesi gerekir.",
          ),
          Question(
            id: "c_unit_6_l1_q10",
            type: QuestionType.multipleChoice,
            prompt: "Serbest bırakılmış (free edilmiş) bir işaretçiyi kullanmaya devam etme hatasına ne ad verilir?",
            codeSnippet: r'''free(ptr);
printf("%d", *ptr); // HATA!''',
            options: ["Dangling Pointer (Askıda Kalan İşaretçi)", "Stack Overflow", "Memory Leak", "Deadlock"],
            correctIndex: 0,
            explanation: "free edildikten sonra hala o adresi göstermeye devam eden işaretçiye dangling pointer denir; 'ptr = NULL' yapılarak önlenir.",
          ),
          Question(
            id: "c_unit_6_l1_q11",
            type: QuestionType.multipleChoice,
            prompt: "C programlarında bellek sızıntılarını (memory leak) ve geçersiz bellek erişimlerini tespit etmek için en popüler Linux aracı hangisidir?",
            codeSnippet: r'''$ ___ --leak-check=full ./program''',
            options: ["valgrind", "gdb", "perf", "strace"],
            correctIndex: 0,
            explanation: "Valgrind (özellikle memcheck aracı) C/C++ programlarında bellek yönetim hatalarını ayrıntılı raporlar.",
          ),
          Question(
            id: "c_unit_6_l1_q12",
            type: QuestionType.multipleChoice,
            prompt: "Aşağıdaki bit düzeyinde (bitwise) operatörlerden hangisi bitleri 1 basamak sola kaydırarak 2 ile çarpmayı sağlar?",
            codeSnippet: r'''int x = 5;
int y = x ___ 1; // y = 10 olur''',
            options: ["<<", ">>", "&", "|"],
            correctIndex: 0,
            explanation: "Sola kaydırma (<< n) operatörü sayının değerini 2^n ile çarpar.",
          ),
          Question(
            id: "c_unit_6_l1_q13",
            type: QuestionType.fillInTheBlank,
            prompt: "Geçersiz veya henüz atanmamış bir işaretçiye güvenli başlangıç değeri olarak _____ atanmalıdır.",
            explanation: "İşaretçilere NULL atamak tanımsız belleğe erişimi ve segmentation fault hatalarını engellemeye yardımcı olur.",
            blankOptions: ["NULL", "0xFF", "void", "NaN"],
            correctBlankAnswer: "NULL",
          ),
          Question(
            id: "c_unit_6_l1_q14",
            type: QuestionType.fillInTheBlank,
            prompt: "Bir veri tipinin bellekte kaç bayt yer kapladığını öğrenmek için derleme zamanı operatörü olan _____ kullanılır.",
            explanation: "sizeof(tip) veya sizeof(degisken) bayt cinsinden bellek boyutunu size_t olarak döner.",
            blankOptions: ["sizeof", "lengthof", "bytesize", "countof"],
            correctBlankAnswer: "sizeof",
          ),
          Question(
            id: "c_unit_6_l1_q15",
            type: QuestionType.fillInTheBlank,
            prompt: "Açılmış bir dosya işaretçisini işletim sistemine geri iade etmek için _____ fonksiyonu çağrılır.",
            explanation: "fclose(FILE *stream) dosya tamponlarını diske yazar ve kaynakları kapatır.",
            blankOptions: ["fclose", "close", "file_exit", "dispose"],
            correctBlankAnswer: "fclose",
          ),
          Question(
            id: "c_unit_6_l1_q16",
            type: QuestionType.trueFalse,
            prompt: "C dilinde dizi isimleri ifadeler içinde kullanıldığında dizinin ilk elemanının bellek adresine (pointer) dönüşür (decay).",
            explanation: "Doğrudur, 'arr' ifadesi '&arr[0]' adresi ile eşdeğerdir.",
            isTrue: true,
          ),
          Question(
            id: "c_unit_6_l1_q17",
            type: QuestionType.trueFalse,
            prompt: "Stack belleğinde oluşturulan yerel değişkenler fonksiyon sonlandığında da bellekte kalmaya devam eder ve serbest bırakılması için free() gerekir.",
            explanation: "Yanlıştır! Stack bellek fonksiyon bitiminde otomatik temizlenir; free() sadece heap (malloc) için geçerlidir.",
            isTrue: false,
          ),
          Question(
            id: "c_unit_6_l1_q18",
            type: QuestionType.matching,
            prompt: "C bellek kavramlarını doğru açıklamalarıyla eşleştirin.",
            explanation: "C'de bellek güvenliği doğrudan yazılımcının sorumluluğundadır.",
            matchingPairs: [MatchingPair(left: "malloc", right: "Heap üzerinde başlatılmamış bellek tahsisi"), MatchingPair(left: "free", right: "Dinamik belleği sisteme iade etme"), MatchingPair(left: "Valgrind", right: "Bellek sızıntılarını tespit eden analiz aracı")],
          ),
        ],
      ),
      Lesson(
        id: "c_unit_6_l2",
        title: "Dangling Pointer (Askıda Kalan İşaretçi)",
        description: "Serbest bırakılan adresi kullanmaya devam etme",
        xpReward: 35,
        gemReward: 12,
        isUnitExam: false,
        questions: [
          Question(
            id: "c_unit_6_l2_q1",
            type: QuestionType.conceptCard,
            conceptTitle: "Dangling Pointer (Askıda Kalan İşaretçi) - Hap Bilgi",
            rule: "C dilinde işaretçiler (pointers) doğrudan bellek adreslerini saklar. '&' operatörü bir değişkenin adresini alırken, '*' (dereference) o adresteki veriye erişir veya değiştirir.",
            codeExample: r'''#include <stdio.h>
#include <stdlib.h>

int main() {
    int x = 100;
    int *ptr = &x;
    
    printf("x Degeri: %d\n", *ptr);
    printf("x Bellek Adresi: %p\n", (void*)ptr);
    return 0;
}''',
            devTip: "malloc ile tahsis edilen her bayt bellek için mutlaka bir free() çağrısı yapılmalıdır, aksi halde Memory Leak oluşur.",
            iconEmoji: "⚡",
          ),
          Question(
            id: "c_unit_6_l2_q2",
            type: QuestionType.multipleChoice,
            prompt: "Tahsis ettiği belleği otomatik olarak sıfırlarla (0 baytları) dolduran dinamik bellek fonksiyonu hangisidir?",
            codeSnippet: r'''int *p = ___(100, sizeof(int));''',
            options: ["calloc", "malloc", "realloc", "zalloc"],
            correctIndex: 0,
            explanation: "'calloc(num, size)' eleman sayısı ve eleman boyutu alır, ayrılan tüm bellek hücrelerini 0 ile başlatır.",
          ),
          Question(
            id: "c_unit_6_l2_q3",
            type: QuestionType.multipleChoice,
            prompt: "Daha önce ayrılmış dinamik bir bellek bloğunun boyutunu veri kaybı olmadan büyütmek veya küçültmek için ne kullanılır?",
            codeSnippet: r'''ptr = ___(ptr, new_size);''',
            options: ["realloc", "resize", "remalloc", "expand"],
            correctIndex: 0,
            explanation: "'realloc' mevcut bloğu genişletir veya yeni bir konuma taşıyarak eski veriyi kopyalar.",
          ),
          Question(
            id: "c_unit_6_l2_q4",
            type: QuestionType.multipleChoice,
            prompt: "C programlama dilinde GCC derleme sürecinin doğru sırası aşağıdakilerden hangisidir?",
            options: ["Preprocessor -> Compiler -> Assembler -> Linker", "Compiler -> Preprocessor -> Linker -> Assembler", "Assembler -> Compiler -> Linker -> Preprocessor", "Linker -> Assembler -> Compiler -> Preprocessor"],
            correctIndex: 0,
            explanation: "Önce makrolar ve headerlar çözülür (cpp), C kodu Assembly'ye derlenir (cc1), makine koduna çevrilir (as), kütüphaneler bağlanır (ld).",
          ),
          Question(
            id: "c_unit_6_l2_q5",
            type: QuestionType.multipleChoice,
            prompt: "64-bit modern bir mimaride standart bir işaretçi (pointer - int*, char*, void*) değişkeni bellekte kaç bayt yer kaplar?",
            codeSnippet: r'''printf("%zu", sizeof(int*));''',
            options: ["8 bayt", "4 bayt", "2 bayt", "16 bayt"],
            correctIndex: 0,
            explanation: "64-bit mimarilerde bellek adresleri 64 bit yani tam 8 bayttır. İşaretçinin tipi ne olursa olsun adres boyutu 8 bayttır.",
          ),
          Question(
            id: "c_unit_6_l2_q6",
            type: QuestionType.multipleChoice,
            prompt: "Bir struct içindeki bir işaretçi elemana erişirken '.' yerine hangi pratik operatör kullanılır?",
            codeSnippet: r'''struct User *u = getUser();
u___name = "Ahmet";''',
            options: ["-> (Ok operatörü)", ".", "::", "=>"],
            correctIndex: 0,
            explanation: "'u->name', '(*u).name' yazımının daha okunaklı ve standart kısayoludur.",
          ),
          Question(
            id: "c_unit_6_l2_q7",
            type: QuestionType.multipleChoice,
            prompt: "Herhangi bir veri tipine ait bellek adresini tutabilen jenerik (tip bağımsız) işaretçi tipi hangisidir?",
            codeSnippet: r'''___ generic_ptr = &x;''',
            options: ["void*", "any*", "object*", "generic*"],
            correctIndex: 0,
            explanation: "'void*' tipi belirsiz jenerik bir işaretçidir; doğrudan dereference edilemez, cast edilmesi gerekir.",
          ),
          Question(
            id: "c_unit_6_l2_q8",
            type: QuestionType.multipleChoice,
            prompt: "Serbest bırakılmış (free edilmiş) bir işaretçiyi kullanmaya devam etme hatasına ne ad verilir?",
            codeSnippet: r'''free(ptr);
printf("%d", *ptr); // HATA!''',
            options: ["Dangling Pointer (Askıda Kalan İşaretçi)", "Stack Overflow", "Memory Leak", "Deadlock"],
            correctIndex: 0,
            explanation: "free edildikten sonra hala o adresi göstermeye devam eden işaretçiye dangling pointer denir; 'ptr = NULL' yapılarak önlenir.",
          ),
          Question(
            id: "c_unit_6_l2_q9",
            type: QuestionType.multipleChoice,
            prompt: "C programlarında bellek sızıntılarını (memory leak) ve geçersiz bellek erişimlerini tespit etmek için en popüler Linux aracı hangisidir?",
            codeSnippet: r'''$ ___ --leak-check=full ./program''',
            options: ["valgrind", "gdb", "perf", "strace"],
            correctIndex: 0,
            explanation: "Valgrind (özellikle memcheck aracı) C/C++ programlarında bellek yönetim hatalarını ayrıntılı raporlar.",
          ),
          Question(
            id: "c_unit_6_l2_q10",
            type: QuestionType.multipleChoice,
            prompt: "Aşağıdaki bit düzeyinde (bitwise) operatörlerden hangisi bitleri 1 basamak sola kaydırarak 2 ile çarpmayı sağlar?",
            codeSnippet: r'''int x = 5;
int y = x ___ 1; // y = 10 olur''',
            options: ["<<", ">>", "&", "|"],
            correctIndex: 0,
            explanation: "Sola kaydırma (<< n) operatörü sayının değerini 2^n ile çarpar.",
          ),
          Question(
            id: "c_unit_6_l2_q11",
            type: QuestionType.multipleChoice,
            prompt: "C'de dosya açmak ve bir dosya işaretçisi (FILE*) elde etmek için hangi standart fonksiyon kullanılır?",
            codeSnippet: r'''FILE *f = ___("data.txt", "r");''',
            options: ["fopen", "open", "file_open", "create_file"],
            correctIndex: 0,
            explanation: "'fopen(dosya_adi, mod)' dosyayı belirtilen modda (r, w, a, rb, wb) açar.",
          ),
          Question(
            id: "c_unit_6_l2_q12",
            type: QuestionType.multipleChoice,
            prompt: "Bir header dosyasının birden fazla kez derlemeye dahil edilmesini (redefinition) önlemek için ne kullanılır?",
            codeSnippet: r'''#ifndef MY_HEADER_H
#define MY_HEADER_H
// ...
#endif''',
            options: ["Header Guards (#ifndef / #define)", "namespace", "pragma private", "module"],
            correctIndex: 0,
            explanation: "Header guards veya '#pragma once' başlık dosyalarının mükerrer include edilmesini engeller.",
          ),
          Question(
            id: "c_unit_6_l2_q13",
            type: QuestionType.fillInTheBlank,
            prompt: "Geçersiz veya henüz atanmamış bir işaretçiye güvenli başlangıç değeri olarak _____ atanmalıdır.",
            explanation: "İşaretçilere NULL atamak tanımsız belleğe erişimi ve segmentation fault hatalarını engellemeye yardımcı olur.",
            blankOptions: ["NULL", "0xFF", "void", "NaN"],
            correctBlankAnswer: "NULL",
          ),
          Question(
            id: "c_unit_6_l2_q14",
            type: QuestionType.fillInTheBlank,
            prompt: "Bir veri tipinin bellekte kaç bayt yer kapladığını öğrenmek için derleme zamanı operatörü olan _____ kullanılır.",
            explanation: "sizeof(tip) veya sizeof(degisken) bayt cinsinden bellek boyutunu size_t olarak döner.",
            blankOptions: ["sizeof", "lengthof", "bytesize", "countof"],
            correctBlankAnswer: "sizeof",
          ),
          Question(
            id: "c_unit_6_l2_q15",
            type: QuestionType.fillInTheBlank,
            prompt: "Açılmış bir dosya işaretçisini işletim sistemine geri iade etmek için _____ fonksiyonu çağrılır.",
            explanation: "fclose(FILE *stream) dosya tamponlarını diske yazar ve kaynakları kapatır.",
            blankOptions: ["fclose", "close", "file_exit", "dispose"],
            correctBlankAnswer: "fclose",
          ),
          Question(
            id: "c_unit_6_l2_q16",
            type: QuestionType.trueFalse,
            prompt: "C dilinde dizi isimleri ifadeler içinde kullanıldığında dizinin ilk elemanının bellek adresine (pointer) dönüşür (decay).",
            explanation: "Doğrudur, 'arr' ifadesi '&arr[0]' adresi ile eşdeğerdir.",
            isTrue: true,
          ),
          Question(
            id: "c_unit_6_l2_q17",
            type: QuestionType.trueFalse,
            prompt: "Stack belleğinde oluşturulan yerel değişkenler fonksiyon sonlandığında da bellekte kalmaya devam eder ve serbest bırakılması için free() gerekir.",
            explanation: "Yanlıştır! Stack bellek fonksiyon bitiminde otomatik temizlenir; free() sadece heap (malloc) için geçerlidir.",
            isTrue: false,
          ),
          Question(
            id: "c_unit_6_l2_q18",
            type: QuestionType.matching,
            prompt: "C bellek kavramlarını doğru açıklamalarıyla eşleştirin.",
            explanation: "C'de bellek güvenliği doğrudan yazılımcının sorumluluğundadır.",
            matchingPairs: [MatchingPair(left: "malloc", right: "Heap üzerinde başlatılmamış bellek tahsisi"), MatchingPair(left: "free", right: "Dinamik belleği sisteme iade etme"), MatchingPair(left: "Valgrind", right: "Bellek sızıntılarını tespit eden analiz aracı")],
          ),
        ],
      ),
      Lesson(
        id: "c_unit_6_l3",
        title: "Segmentation Fault (Segfault) Neden Olur?",
        description: "İşletim sisteminin geçersiz bellek müdahalesi",
        xpReward: 35,
        gemReward: 12,
        isUnitExam: false,
        questions: [
          Question(
            id: "c_unit_6_l3_q1",
            type: QuestionType.conceptCard,
            conceptTitle: "Segmentation Fault (Segfault) Neden Olur? - Hap Bilgi",
            rule: "C dilinde işaretçiler (pointers) doğrudan bellek adreslerini saklar. '&' operatörü bir değişkenin adresini alırken, '*' (dereference) o adresteki veriye erişir veya değiştirir.",
            codeExample: r'''#include <stdio.h>
#include <stdlib.h>

int main() {
    int x = 100;
    int *ptr = &x;
    
    printf("x Degeri: %d\n", *ptr);
    printf("x Bellek Adresi: %p\n", (void*)ptr);
    return 0;
}''',
            devTip: "malloc ile tahsis edilen her bayt bellek için mutlaka bir free() çağrısı yapılmalıdır, aksi halde Memory Leak oluşur.",
            iconEmoji: "⚡",
          ),
          Question(
            id: "c_unit_6_l3_q2",
            type: QuestionType.multipleChoice,
            prompt: "C programlama dilinde GCC derleme sürecinin doğru sırası aşağıdakilerden hangisidir?",
            options: ["Preprocessor -> Compiler -> Assembler -> Linker", "Compiler -> Preprocessor -> Linker -> Assembler", "Assembler -> Compiler -> Linker -> Preprocessor", "Linker -> Assembler -> Compiler -> Preprocessor"],
            correctIndex: 0,
            explanation: "Önce makrolar ve headerlar çözülür (cpp), C kodu Assembly'ye derlenir (cc1), makine koduna çevrilir (as), kütüphaneler bağlanır (ld).",
          ),
          Question(
            id: "c_unit_6_l3_q3",
            type: QuestionType.multipleChoice,
            prompt: "64-bit modern bir mimaride standart bir işaretçi (pointer - int*, char*, void*) değişkeni bellekte kaç bayt yer kaplar?",
            codeSnippet: r'''printf("%zu", sizeof(int*));''',
            options: ["8 bayt", "4 bayt", "2 bayt", "16 bayt"],
            correctIndex: 0,
            explanation: "64-bit mimarilerde bellek adresleri 64 bit yani tam 8 bayttır. İşaretçinin tipi ne olursa olsun adres boyutu 8 bayttır.",
          ),
          Question(
            id: "c_unit_6_l3_q4",
            type: QuestionType.multipleChoice,
            prompt: "Bir struct içindeki bir işaretçi elemana erişirken '.' yerine hangi pratik operatör kullanılır?",
            codeSnippet: r'''struct User *u = getUser();
u___name = "Ahmet";''',
            options: ["-> (Ok operatörü)", ".", "::", "=>"],
            correctIndex: 0,
            explanation: "'u->name', '(*u).name' yazımının daha okunaklı ve standart kısayoludur.",
          ),
          Question(
            id: "c_unit_6_l3_q5",
            type: QuestionType.multipleChoice,
            prompt: "Herhangi bir veri tipine ait bellek adresini tutabilen jenerik (tip bağımsız) işaretçi tipi hangisidir?",
            codeSnippet: r'''___ generic_ptr = &x;''',
            options: ["void*", "any*", "object*", "generic*"],
            correctIndex: 0,
            explanation: "'void*' tipi belirsiz jenerik bir işaretçidir; doğrudan dereference edilemez, cast edilmesi gerekir.",
          ),
          Question(
            id: "c_unit_6_l3_q6",
            type: QuestionType.multipleChoice,
            prompt: "Serbest bırakılmış (free edilmiş) bir işaretçiyi kullanmaya devam etme hatasına ne ad verilir?",
            codeSnippet: r'''free(ptr);
printf("%d", *ptr); // HATA!''',
            options: ["Dangling Pointer (Askıda Kalan İşaretçi)", "Stack Overflow", "Memory Leak", "Deadlock"],
            correctIndex: 0,
            explanation: "free edildikten sonra hala o adresi göstermeye devam eden işaretçiye dangling pointer denir; 'ptr = NULL' yapılarak önlenir.",
          ),
          Question(
            id: "c_unit_6_l3_q7",
            type: QuestionType.multipleChoice,
            prompt: "C programlarında bellek sızıntılarını (memory leak) ve geçersiz bellek erişimlerini tespit etmek için en popüler Linux aracı hangisidir?",
            codeSnippet: r'''$ ___ --leak-check=full ./program''',
            options: ["valgrind", "gdb", "perf", "strace"],
            correctIndex: 0,
            explanation: "Valgrind (özellikle memcheck aracı) C/C++ programlarında bellek yönetim hatalarını ayrıntılı raporlar.",
          ),
          Question(
            id: "c_unit_6_l3_q8",
            type: QuestionType.multipleChoice,
            prompt: "Aşağıdaki bit düzeyinde (bitwise) operatörlerden hangisi bitleri 1 basamak sola kaydırarak 2 ile çarpmayı sağlar?",
            codeSnippet: r'''int x = 5;
int y = x ___ 1; // y = 10 olur''',
            options: ["<<", ">>", "&", "|"],
            correctIndex: 0,
            explanation: "Sola kaydırma (<< n) operatörü sayının değerini 2^n ile çarpar.",
          ),
          Question(
            id: "c_unit_6_l3_q9",
            type: QuestionType.multipleChoice,
            prompt: "C'de dosya açmak ve bir dosya işaretçisi (FILE*) elde etmek için hangi standart fonksiyon kullanılır?",
            codeSnippet: r'''FILE *f = ___("data.txt", "r");''',
            options: ["fopen", "open", "file_open", "create_file"],
            correctIndex: 0,
            explanation: "'fopen(dosya_adi, mod)' dosyayı belirtilen modda (r, w, a, rb, wb) açar.",
          ),
          Question(
            id: "c_unit_6_l3_q10",
            type: QuestionType.multipleChoice,
            prompt: "Bir header dosyasının birden fazla kez derlemeye dahil edilmesini (redefinition) önlemek için ne kullanılır?",
            codeSnippet: r'''#ifndef MY_HEADER_H
#define MY_HEADER_H
// ...
#endif''',
            options: ["Header Guards (#ifndef / #define)", "namespace", "pragma private", "module"],
            correctIndex: 0,
            explanation: "Header guards veya '#pragma once' başlık dosyalarının mükerrer include edilmesini engeller.",
          ),
          Question(
            id: "c_unit_6_l3_q11",
            type: QuestionType.multipleChoice,
            prompt: "Tüm üyelerinin bellekte AYNI başlangıç adresini paylaştığı ve en büyük üyesi kadar yer kaplayan yapı hangisidir?",
            codeSnippet: r'''___ Data {
    int i;
    float f;
    char str[20];
};''',
            options: ["union", "struct", "class", "shared"],
            correctIndex: 0,
            explanation: "'union' içindeki tüm elemanlar aynı bellek alanını ortaklaşa kullanır; aynı anda sadece biri geçerli değer tutar.",
          ),
          Question(
            id: "c_unit_6_l3_q12",
            type: QuestionType.multipleChoice,
            prompt: "C dilinde bir değişkenin bellekteki adresini elde etmek için hangi operatör kullanılır?",
            codeSnippet: r'''int x = 10;
int *ptr = ___x;''',
            options: ["& (Address-of)", "* (Dereference)", "% (Mod)", "\$ (Value)"],
            correctIndex: 0,
            explanation: "'&' operatörü bir değişkenin RAM üzerindeki başlangıç adresini döner.",
          ),
          Question(
            id: "c_unit_6_l3_q13",
            type: QuestionType.fillInTheBlank,
            prompt: "Geçersiz veya henüz atanmamış bir işaretçiye güvenli başlangıç değeri olarak _____ atanmalıdır.",
            explanation: "İşaretçilere NULL atamak tanımsız belleğe erişimi ve segmentation fault hatalarını engellemeye yardımcı olur.",
            blankOptions: ["NULL", "0xFF", "void", "NaN"],
            correctBlankAnswer: "NULL",
          ),
          Question(
            id: "c_unit_6_l3_q14",
            type: QuestionType.fillInTheBlank,
            prompt: "Bir veri tipinin bellekte kaç bayt yer kapladığını öğrenmek için derleme zamanı operatörü olan _____ kullanılır.",
            explanation: "sizeof(tip) veya sizeof(degisken) bayt cinsinden bellek boyutunu size_t olarak döner.",
            blankOptions: ["sizeof", "lengthof", "bytesize", "countof"],
            correctBlankAnswer: "sizeof",
          ),
          Question(
            id: "c_unit_6_l3_q15",
            type: QuestionType.fillInTheBlank,
            prompt: "Açılmış bir dosya işaretçisini işletim sistemine geri iade etmek için _____ fonksiyonu çağrılır.",
            explanation: "fclose(FILE *stream) dosya tamponlarını diske yazar ve kaynakları kapatır.",
            blankOptions: ["fclose", "close", "file_exit", "dispose"],
            correctBlankAnswer: "fclose",
          ),
          Question(
            id: "c_unit_6_l3_q16",
            type: QuestionType.trueFalse,
            prompt: "C dilinde dizi isimleri ifadeler içinde kullanıldığında dizinin ilk elemanının bellek adresine (pointer) dönüşür (decay).",
            explanation: "Doğrudur, 'arr' ifadesi '&arr[0]' adresi ile eşdeğerdir.",
            isTrue: true,
          ),
          Question(
            id: "c_unit_6_l3_q17",
            type: QuestionType.trueFalse,
            prompt: "Stack belleğinde oluşturulan yerel değişkenler fonksiyon sonlandığında da bellekte kalmaya devam eder ve serbest bırakılması için free() gerekir.",
            explanation: "Yanlıştır! Stack bellek fonksiyon bitiminde otomatik temizlenir; free() sadece heap (malloc) için geçerlidir.",
            isTrue: false,
          ),
          Question(
            id: "c_unit_6_l3_q18",
            type: QuestionType.matching,
            prompt: "C bellek kavramlarını doğru açıklamalarıyla eşleştirin.",
            explanation: "C'de bellek güvenliği doğrudan yazılımcının sorumluluğundadır.",
            matchingPairs: [MatchingPair(left: "malloc", right: "Heap üzerinde başlatılmamış bellek tahsisi"), MatchingPair(left: "free", right: "Dinamik belleği sisteme iade etme"), MatchingPair(left: "Valgrind", right: "Bellek sızıntılarını tespit eden analiz aracı")],
          ),
        ],
      ),
      Lesson(
        id: "c_unit_6_l4",
        title: "Valgrind Memcheck Aracını Kurma & Çalıştırma",
        description: "Linux ortamında sızıntıları otomatik tarama",
        xpReward: 35,
        gemReward: 12,
        isUnitExam: false,
        questions: [
          Question(
            id: "c_unit_6_l4_q1",
            type: QuestionType.conceptCard,
            conceptTitle: "Valgrind Memcheck Aracını Kurma & Çalıştırma - Hap Bilgi",
            rule: "C dilinde işaretçiler (pointers) doğrudan bellek adreslerini saklar. '&' operatörü bir değişkenin adresini alırken, '*' (dereference) o adresteki veriye erişir veya değiştirir.",
            codeExample: r'''#include <stdio.h>
#include <stdlib.h>

int main() {
    int x = 100;
    int *ptr = &x;
    
    printf("x Degeri: %d\n", *ptr);
    printf("x Bellek Adresi: %p\n", (void*)ptr);
    return 0;
}''',
            devTip: "malloc ile tahsis edilen her bayt bellek için mutlaka bir free() çağrısı yapılmalıdır, aksi halde Memory Leak oluşur.",
            iconEmoji: "⚡",
          ),
          Question(
            id: "c_unit_6_l4_q2",
            type: QuestionType.multipleChoice,
            prompt: "Bir struct içindeki bir işaretçi elemana erişirken '.' yerine hangi pratik operatör kullanılır?",
            codeSnippet: r'''struct User *u = getUser();
u___name = "Ahmet";''',
            options: ["-> (Ok operatörü)", ".", "::", "=>"],
            correctIndex: 0,
            explanation: "'u->name', '(*u).name' yazımının daha okunaklı ve standart kısayoludur.",
          ),
          Question(
            id: "c_unit_6_l4_q3",
            type: QuestionType.multipleChoice,
            prompt: "Herhangi bir veri tipine ait bellek adresini tutabilen jenerik (tip bağımsız) işaretçi tipi hangisidir?",
            codeSnippet: r'''___ generic_ptr = &x;''',
            options: ["void*", "any*", "object*", "generic*"],
            correctIndex: 0,
            explanation: "'void*' tipi belirsiz jenerik bir işaretçidir; doğrudan dereference edilemez, cast edilmesi gerekir.",
          ),
          Question(
            id: "c_unit_6_l4_q4",
            type: QuestionType.multipleChoice,
            prompt: "Serbest bırakılmış (free edilmiş) bir işaretçiyi kullanmaya devam etme hatasına ne ad verilir?",
            codeSnippet: r'''free(ptr);
printf("%d", *ptr); // HATA!''',
            options: ["Dangling Pointer (Askıda Kalan İşaretçi)", "Stack Overflow", "Memory Leak", "Deadlock"],
            correctIndex: 0,
            explanation: "free edildikten sonra hala o adresi göstermeye devam eden işaretçiye dangling pointer denir; 'ptr = NULL' yapılarak önlenir.",
          ),
          Question(
            id: "c_unit_6_l4_q5",
            type: QuestionType.multipleChoice,
            prompt: "C programlarında bellek sızıntılarını (memory leak) ve geçersiz bellek erişimlerini tespit etmek için en popüler Linux aracı hangisidir?",
            codeSnippet: r'''$ ___ --leak-check=full ./program''',
            options: ["valgrind", "gdb", "perf", "strace"],
            correctIndex: 0,
            explanation: "Valgrind (özellikle memcheck aracı) C/C++ programlarında bellek yönetim hatalarını ayrıntılı raporlar.",
          ),
          Question(
            id: "c_unit_6_l4_q6",
            type: QuestionType.multipleChoice,
            prompt: "Aşağıdaki bit düzeyinde (bitwise) operatörlerden hangisi bitleri 1 basamak sola kaydırarak 2 ile çarpmayı sağlar?",
            codeSnippet: r'''int x = 5;
int y = x ___ 1; // y = 10 olur''',
            options: ["<<", ">>", "&", "|"],
            correctIndex: 0,
            explanation: "Sola kaydırma (<< n) operatörü sayının değerini 2^n ile çarpar.",
          ),
          Question(
            id: "c_unit_6_l4_q7",
            type: QuestionType.multipleChoice,
            prompt: "C'de dosya açmak ve bir dosya işaretçisi (FILE*) elde etmek için hangi standart fonksiyon kullanılır?",
            codeSnippet: r'''FILE *f = ___("data.txt", "r");''',
            options: ["fopen", "open", "file_open", "create_file"],
            correctIndex: 0,
            explanation: "'fopen(dosya_adi, mod)' dosyayı belirtilen modda (r, w, a, rb, wb) açar.",
          ),
          Question(
            id: "c_unit_6_l4_q8",
            type: QuestionType.multipleChoice,
            prompt: "Bir header dosyasının birden fazla kez derlemeye dahil edilmesini (redefinition) önlemek için ne kullanılır?",
            codeSnippet: r'''#ifndef MY_HEADER_H
#define MY_HEADER_H
// ...
#endif''',
            options: ["Header Guards (#ifndef / #define)", "namespace", "pragma private", "module"],
            correctIndex: 0,
            explanation: "Header guards veya '#pragma once' başlık dosyalarının mükerrer include edilmesini engeller.",
          ),
          Question(
            id: "c_unit_6_l4_q9",
            type: QuestionType.multipleChoice,
            prompt: "Tüm üyelerinin bellekte AYNI başlangıç adresini paylaştığı ve en büyük üyesi kadar yer kaplayan yapı hangisidir?",
            codeSnippet: r'''___ Data {
    int i;
    float f;
    char str[20];
};''',
            options: ["union", "struct", "class", "shared"],
            correctIndex: 0,
            explanation: "'union' içindeki tüm elemanlar aynı bellek alanını ortaklaşa kullanır; aynı anda sadece biri geçerli değer tutar.",
          ),
          Question(
            id: "c_unit_6_l4_q10",
            type: QuestionType.multipleChoice,
            prompt: "C dilinde bir değişkenin bellekteki adresini elde etmek için hangi operatör kullanılır?",
            codeSnippet: r'''int x = 10;
int *ptr = ___x;''',
            options: ["& (Address-of)", "* (Dereference)", "% (Mod)", "\$ (Value)"],
            correctIndex: 0,
            explanation: "'&' operatörü bir değişkenin RAM üzerindeki başlangıç adresini döner.",
          ),
          Question(
            id: "c_unit_6_l4_q11",
            type: QuestionType.multipleChoice,
            prompt: "Bir işaretçinin (pointer) işaret ettiği bellek adresindeki veriye erişmek veya onu değiştirmek için hangi işlem yapılır?",
            codeSnippet: r'''int x = 5;
int *p = &x;
___p = 20; // x artik 20 olur''',
            options: ["* (Dereference)", "&", "->", "."],
            correctIndex: 0,
            explanation: "'*p' dereferencing yaparak işaretçinin tuttuğu adresteki asıl değere erişir.",
          ),
          Question(
            id: "c_unit_6_l4_q12",
            type: QuestionType.multipleChoice,
            prompt: "Heap bellekte dinamik olarak bayt cinsinden bellek tahsis etmek için hangi standart kütüphane fonksiyonu kullanılır?",
            codeSnippet: r'''int *arr = (int*)___(10 * sizeof(int));''',
            options: ["malloc", "alloc", "new", "heap_get"],
            correctIndex: 0,
            explanation: "'malloc(size_t size)' heap bölgesinde istenen bayt kadar bellek ayırır ve void* işaretçi döner.",
          ),
          Question(
            id: "c_unit_6_l4_q13",
            type: QuestionType.fillInTheBlank,
            prompt: "Geçersiz veya henüz atanmamış bir işaretçiye güvenli başlangıç değeri olarak _____ atanmalıdır.",
            explanation: "İşaretçilere NULL atamak tanımsız belleğe erişimi ve segmentation fault hatalarını engellemeye yardımcı olur.",
            blankOptions: ["NULL", "0xFF", "void", "NaN"],
            correctBlankAnswer: "NULL",
          ),
          Question(
            id: "c_unit_6_l4_q14",
            type: QuestionType.fillInTheBlank,
            prompt: "Bir veri tipinin bellekte kaç bayt yer kapladığını öğrenmek için derleme zamanı operatörü olan _____ kullanılır.",
            explanation: "sizeof(tip) veya sizeof(degisken) bayt cinsinden bellek boyutunu size_t olarak döner.",
            blankOptions: ["sizeof", "lengthof", "bytesize", "countof"],
            correctBlankAnswer: "sizeof",
          ),
          Question(
            id: "c_unit_6_l4_q15",
            type: QuestionType.fillInTheBlank,
            prompt: "Açılmış bir dosya işaretçisini işletim sistemine geri iade etmek için _____ fonksiyonu çağrılır.",
            explanation: "fclose(FILE *stream) dosya tamponlarını diske yazar ve kaynakları kapatır.",
            blankOptions: ["fclose", "close", "file_exit", "dispose"],
            correctBlankAnswer: "fclose",
          ),
          Question(
            id: "c_unit_6_l4_q16",
            type: QuestionType.trueFalse,
            prompt: "C dilinde dizi isimleri ifadeler içinde kullanıldığında dizinin ilk elemanının bellek adresine (pointer) dönüşür (decay).",
            explanation: "Doğrudur, 'arr' ifadesi '&arr[0]' adresi ile eşdeğerdir.",
            isTrue: true,
          ),
          Question(
            id: "c_unit_6_l4_q17",
            type: QuestionType.trueFalse,
            prompt: "Stack belleğinde oluşturulan yerel değişkenler fonksiyon sonlandığında da bellekte kalmaya devam eder ve serbest bırakılması için free() gerekir.",
            explanation: "Yanlıştır! Stack bellek fonksiyon bitiminde otomatik temizlenir; free() sadece heap (malloc) için geçerlidir.",
            isTrue: false,
          ),
          Question(
            id: "c_unit_6_l4_q18",
            type: QuestionType.matching,
            prompt: "C bellek kavramlarını doğru açıklamalarıyla eşleştirin.",
            explanation: "C'de bellek güvenliği doğrudan yazılımcının sorumluluğundadır.",
            matchingPairs: [MatchingPair(left: "malloc", right: "Heap üzerinde başlatılmamış bellek tahsisi"), MatchingPair(left: "free", right: "Dinamik belleği sisteme iade etme"), MatchingPair(left: "Valgrind", right: "Bellek sızıntılarını tespit eden analiz aracı")],
          ),
        ],
      ),
      Lesson(
        id: "c_unit_6_l5",
        title: "Valgrind Çıktılarını Okuma (Definitely / Indirectly Lost)",
        description: "Hangi satırda sızıntı olduğunu bulma",
        xpReward: 35,
        gemReward: 12,
        isUnitExam: false,
        questions: [
          Question(
            id: "c_unit_6_l5_q1",
            type: QuestionType.conceptCard,
            conceptTitle: "Valgrind Çıktılarını Okuma (Definitely / Indirectly Lost) - Hap Bilgi",
            rule: "C dilinde işaretçiler (pointers) doğrudan bellek adreslerini saklar. '&' operatörü bir değişkenin adresini alırken, '*' (dereference) o adresteki veriye erişir veya değiştirir.",
            codeExample: r'''#include <stdio.h>
#include <stdlib.h>

int main() {
    int x = 100;
    int *ptr = &x;
    
    printf("x Degeri: %d\n", *ptr);
    printf("x Bellek Adresi: %p\n", (void*)ptr);
    return 0;
}''',
            devTip: "malloc ile tahsis edilen her bayt bellek için mutlaka bir free() çağrısı yapılmalıdır, aksi halde Memory Leak oluşur.",
            iconEmoji: "⚡",
          ),
          Question(
            id: "c_unit_6_l5_q2",
            type: QuestionType.multipleChoice,
            prompt: "Serbest bırakılmış (free edilmiş) bir işaretçiyi kullanmaya devam etme hatasına ne ad verilir?",
            codeSnippet: r'''free(ptr);
printf("%d", *ptr); // HATA!''',
            options: ["Dangling Pointer (Askıda Kalan İşaretçi)", "Stack Overflow", "Memory Leak", "Deadlock"],
            correctIndex: 0,
            explanation: "free edildikten sonra hala o adresi göstermeye devam eden işaretçiye dangling pointer denir; 'ptr = NULL' yapılarak önlenir.",
          ),
          Question(
            id: "c_unit_6_l5_q3",
            type: QuestionType.multipleChoice,
            prompt: "C programlarında bellek sızıntılarını (memory leak) ve geçersiz bellek erişimlerini tespit etmek için en popüler Linux aracı hangisidir?",
            codeSnippet: r'''$ ___ --leak-check=full ./program''',
            options: ["valgrind", "gdb", "perf", "strace"],
            correctIndex: 0,
            explanation: "Valgrind (özellikle memcheck aracı) C/C++ programlarında bellek yönetim hatalarını ayrıntılı raporlar.",
          ),
          Question(
            id: "c_unit_6_l5_q4",
            type: QuestionType.multipleChoice,
            prompt: "Aşağıdaki bit düzeyinde (bitwise) operatörlerden hangisi bitleri 1 basamak sola kaydırarak 2 ile çarpmayı sağlar?",
            codeSnippet: r'''int x = 5;
int y = x ___ 1; // y = 10 olur''',
            options: ["<<", ">>", "&", "|"],
            correctIndex: 0,
            explanation: "Sola kaydırma (<< n) operatörü sayının değerini 2^n ile çarpar.",
          ),
          Question(
            id: "c_unit_6_l5_q5",
            type: QuestionType.multipleChoice,
            prompt: "C'de dosya açmak ve bir dosya işaretçisi (FILE*) elde etmek için hangi standart fonksiyon kullanılır?",
            codeSnippet: r'''FILE *f = ___("data.txt", "r");''',
            options: ["fopen", "open", "file_open", "create_file"],
            correctIndex: 0,
            explanation: "'fopen(dosya_adi, mod)' dosyayı belirtilen modda (r, w, a, rb, wb) açar.",
          ),
          Question(
            id: "c_unit_6_l5_q6",
            type: QuestionType.multipleChoice,
            prompt: "Bir header dosyasının birden fazla kez derlemeye dahil edilmesini (redefinition) önlemek için ne kullanılır?",
            codeSnippet: r'''#ifndef MY_HEADER_H
#define MY_HEADER_H
// ...
#endif''',
            options: ["Header Guards (#ifndef / #define)", "namespace", "pragma private", "module"],
            correctIndex: 0,
            explanation: "Header guards veya '#pragma once' başlık dosyalarının mükerrer include edilmesini engeller.",
          ),
          Question(
            id: "c_unit_6_l5_q7",
            type: QuestionType.multipleChoice,
            prompt: "Tüm üyelerinin bellekte AYNI başlangıç adresini paylaştığı ve en büyük üyesi kadar yer kaplayan yapı hangisidir?",
            codeSnippet: r'''___ Data {
    int i;
    float f;
    char str[20];
};''',
            options: ["union", "struct", "class", "shared"],
            correctIndex: 0,
            explanation: "'union' içindeki tüm elemanlar aynı bellek alanını ortaklaşa kullanır; aynı anda sadece biri geçerli değer tutar.",
          ),
          Question(
            id: "c_unit_6_l5_q8",
            type: QuestionType.multipleChoice,
            prompt: "C dilinde bir değişkenin bellekteki adresini elde etmek için hangi operatör kullanılır?",
            codeSnippet: r'''int x = 10;
int *ptr = ___x;''',
            options: ["& (Address-of)", "* (Dereference)", "% (Mod)", "\$ (Value)"],
            correctIndex: 0,
            explanation: "'&' operatörü bir değişkenin RAM üzerindeki başlangıç adresini döner.",
          ),
          Question(
            id: "c_unit_6_l5_q9",
            type: QuestionType.multipleChoice,
            prompt: "Bir işaretçinin (pointer) işaret ettiği bellek adresindeki veriye erişmek veya onu değiştirmek için hangi işlem yapılır?",
            codeSnippet: r'''int x = 5;
int *p = &x;
___p = 20; // x artik 20 olur''',
            options: ["* (Dereference)", "&", "->", "."],
            correctIndex: 0,
            explanation: "'*p' dereferencing yaparak işaretçinin tuttuğu adresteki asıl değere erişir.",
          ),
          Question(
            id: "c_unit_6_l5_q10",
            type: QuestionType.multipleChoice,
            prompt: "Heap bellekte dinamik olarak bayt cinsinden bellek tahsis etmek için hangi standart kütüphane fonksiyonu kullanılır?",
            codeSnippet: r'''int *arr = (int*)___(10 * sizeof(int));''',
            options: ["malloc", "alloc", "new", "heap_get"],
            correctIndex: 0,
            explanation: "'malloc(size_t size)' heap bölgesinde istenen bayt kadar bellek ayırır ve void* işaretçi döner.",
          ),
          Question(
            id: "c_unit_6_l5_q11",
            type: QuestionType.multipleChoice,
            prompt: "malloc veya calloc ile tahsis edilen dinamik belleğin sisteme iade edilmesi için hangi fonksiyon çağrılmalıdır?",
            codeSnippet: r'''int *buf = malloc(1024);
// ... kullanim ...
___(buf);''',
            options: ["free", "delete", "release", "dispose"],
            correctIndex: 0,
            explanation: "'free(ptr)' heap bellekte ayrılan alanı serbest bırakır. Çağrılmazsa 'Memory Leak' oluşur.",
          ),
          Question(
            id: "c_unit_6_l5_q12",
            type: QuestionType.multipleChoice,
            prompt: "Tahsis ettiği belleği otomatik olarak sıfırlarla (0 baytları) dolduran dinamik bellek fonksiyonu hangisidir?",
            codeSnippet: r'''int *p = ___(100, sizeof(int));''',
            options: ["calloc", "malloc", "realloc", "zalloc"],
            correctIndex: 0,
            explanation: "'calloc(num, size)' eleman sayısı ve eleman boyutu alır, ayrılan tüm bellek hücrelerini 0 ile başlatır.",
          ),
          Question(
            id: "c_unit_6_l5_q13",
            type: QuestionType.fillInTheBlank,
            prompt: "Geçersiz veya henüz atanmamış bir işaretçiye güvenli başlangıç değeri olarak _____ atanmalıdır.",
            explanation: "İşaretçilere NULL atamak tanımsız belleğe erişimi ve segmentation fault hatalarını engellemeye yardımcı olur.",
            blankOptions: ["NULL", "0xFF", "void", "NaN"],
            correctBlankAnswer: "NULL",
          ),
          Question(
            id: "c_unit_6_l5_q14",
            type: QuestionType.fillInTheBlank,
            prompt: "Bir veri tipinin bellekte kaç bayt yer kapladığını öğrenmek için derleme zamanı operatörü olan _____ kullanılır.",
            explanation: "sizeof(tip) veya sizeof(degisken) bayt cinsinden bellek boyutunu size_t olarak döner.",
            blankOptions: ["sizeof", "lengthof", "bytesize", "countof"],
            correctBlankAnswer: "sizeof",
          ),
          Question(
            id: "c_unit_6_l5_q15",
            type: QuestionType.fillInTheBlank,
            prompt: "Açılmış bir dosya işaretçisini işletim sistemine geri iade etmek için _____ fonksiyonu çağrılır.",
            explanation: "fclose(FILE *stream) dosya tamponlarını diske yazar ve kaynakları kapatır.",
            blankOptions: ["fclose", "close", "file_exit", "dispose"],
            correctBlankAnswer: "fclose",
          ),
          Question(
            id: "c_unit_6_l5_q16",
            type: QuestionType.trueFalse,
            prompt: "C dilinde dizi isimleri ifadeler içinde kullanıldığında dizinin ilk elemanının bellek adresine (pointer) dönüşür (decay).",
            explanation: "Doğrudur, 'arr' ifadesi '&arr[0]' adresi ile eşdeğerdir.",
            isTrue: true,
          ),
          Question(
            id: "c_unit_6_l5_q17",
            type: QuestionType.trueFalse,
            prompt: "Stack belleğinde oluşturulan yerel değişkenler fonksiyon sonlandığında da bellekte kalmaya devam eder ve serbest bırakılması için free() gerekir.",
            explanation: "Yanlıştır! Stack bellek fonksiyon bitiminde otomatik temizlenir; free() sadece heap (malloc) için geçerlidir.",
            isTrue: false,
          ),
          Question(
            id: "c_unit_6_l5_q18",
            type: QuestionType.matching,
            prompt: "C bellek kavramlarını doğru açıklamalarıyla eşleştirin.",
            explanation: "C'de bellek güvenliği doğrudan yazılımcının sorumluluğundadır.",
            matchingPairs: [MatchingPair(left: "malloc", right: "Heap üzerinde başlatılmamış bellek tahsisi"), MatchingPair(left: "free", right: "Dinamik belleği sisteme iade etme"), MatchingPair(left: "Valgrind", right: "Bellek sızıntılarını tespit eden analiz aracı")],
          ),
        ],
      ),
      Lesson(
        id: "c_unit_6_l6",
        title: "Use-After-Free ve Uninitialized Memory Hataları",
        description: "Başlatılmamış değişken okuma tehlikeleri",
        xpReward: 35,
        gemReward: 12,
        isUnitExam: false,
        questions: [
          Question(
            id: "c_unit_6_l6_q1",
            type: QuestionType.conceptCard,
            conceptTitle: "Use-After-Free ve Uninitialized Memory Hataları - Hap Bilgi",
            rule: "C dilinde işaretçiler (pointers) doğrudan bellek adreslerini saklar. '&' operatörü bir değişkenin adresini alırken, '*' (dereference) o adresteki veriye erişir veya değiştirir.",
            codeExample: r'''#include <stdio.h>
#include <stdlib.h>

int main() {
    int x = 100;
    int *ptr = &x;
    
    printf("x Degeri: %d\n", *ptr);
    printf("x Bellek Adresi: %p\n", (void*)ptr);
    return 0;
}''',
            devTip: "malloc ile tahsis edilen her bayt bellek için mutlaka bir free() çağrısı yapılmalıdır, aksi halde Memory Leak oluşur.",
            iconEmoji: "⚡",
          ),
          Question(
            id: "c_unit_6_l6_q2",
            type: QuestionType.multipleChoice,
            prompt: "Aşağıdaki bit düzeyinde (bitwise) operatörlerden hangisi bitleri 1 basamak sola kaydırarak 2 ile çarpmayı sağlar?",
            codeSnippet: r'''int x = 5;
int y = x ___ 1; // y = 10 olur''',
            options: ["<<", ">>", "&", "|"],
            correctIndex: 0,
            explanation: "Sola kaydırma (<< n) operatörü sayının değerini 2^n ile çarpar.",
          ),
          Question(
            id: "c_unit_6_l6_q3",
            type: QuestionType.multipleChoice,
            prompt: "C'de dosya açmak ve bir dosya işaretçisi (FILE*) elde etmek için hangi standart fonksiyon kullanılır?",
            codeSnippet: r'''FILE *f = ___("data.txt", "r");''',
            options: ["fopen", "open", "file_open", "create_file"],
            correctIndex: 0,
            explanation: "'fopen(dosya_adi, mod)' dosyayı belirtilen modda (r, w, a, rb, wb) açar.",
          ),
          Question(
            id: "c_unit_6_l6_q4",
            type: QuestionType.multipleChoice,
            prompt: "Bir header dosyasının birden fazla kez derlemeye dahil edilmesini (redefinition) önlemek için ne kullanılır?",
            codeSnippet: r'''#ifndef MY_HEADER_H
#define MY_HEADER_H
// ...
#endif''',
            options: ["Header Guards (#ifndef / #define)", "namespace", "pragma private", "module"],
            correctIndex: 0,
            explanation: "Header guards veya '#pragma once' başlık dosyalarının mükerrer include edilmesini engeller.",
          ),
          Question(
            id: "c_unit_6_l6_q5",
            type: QuestionType.multipleChoice,
            prompt: "Tüm üyelerinin bellekte AYNI başlangıç adresini paylaştığı ve en büyük üyesi kadar yer kaplayan yapı hangisidir?",
            codeSnippet: r'''___ Data {
    int i;
    float f;
    char str[20];
};''',
            options: ["union", "struct", "class", "shared"],
            correctIndex: 0,
            explanation: "'union' içindeki tüm elemanlar aynı bellek alanını ortaklaşa kullanır; aynı anda sadece biri geçerli değer tutar.",
          ),
          Question(
            id: "c_unit_6_l6_q6",
            type: QuestionType.multipleChoice,
            prompt: "C dilinde bir değişkenin bellekteki adresini elde etmek için hangi operatör kullanılır?",
            codeSnippet: r'''int x = 10;
int *ptr = ___x;''',
            options: ["& (Address-of)", "* (Dereference)", "% (Mod)", "\$ (Value)"],
            correctIndex: 0,
            explanation: "'&' operatörü bir değişkenin RAM üzerindeki başlangıç adresini döner.",
          ),
          Question(
            id: "c_unit_6_l6_q7",
            type: QuestionType.multipleChoice,
            prompt: "Bir işaretçinin (pointer) işaret ettiği bellek adresindeki veriye erişmek veya onu değiştirmek için hangi işlem yapılır?",
            codeSnippet: r'''int x = 5;
int *p = &x;
___p = 20; // x artik 20 olur''',
            options: ["* (Dereference)", "&", "->", "."],
            correctIndex: 0,
            explanation: "'*p' dereferencing yaparak işaretçinin tuttuğu adresteki asıl değere erişir.",
          ),
          Question(
            id: "c_unit_6_l6_q8",
            type: QuestionType.multipleChoice,
            prompt: "Heap bellekte dinamik olarak bayt cinsinden bellek tahsis etmek için hangi standart kütüphane fonksiyonu kullanılır?",
            codeSnippet: r'''int *arr = (int*)___(10 * sizeof(int));''',
            options: ["malloc", "alloc", "new", "heap_get"],
            correctIndex: 0,
            explanation: "'malloc(size_t size)' heap bölgesinde istenen bayt kadar bellek ayırır ve void* işaretçi döner.",
          ),
          Question(
            id: "c_unit_6_l6_q9",
            type: QuestionType.multipleChoice,
            prompt: "malloc veya calloc ile tahsis edilen dinamik belleğin sisteme iade edilmesi için hangi fonksiyon çağrılmalıdır?",
            codeSnippet: r'''int *buf = malloc(1024);
// ... kullanim ...
___(buf);''',
            options: ["free", "delete", "release", "dispose"],
            correctIndex: 0,
            explanation: "'free(ptr)' heap bellekte ayrılan alanı serbest bırakır. Çağrılmazsa 'Memory Leak' oluşur.",
          ),
          Question(
            id: "c_unit_6_l6_q10",
            type: QuestionType.multipleChoice,
            prompt: "Tahsis ettiği belleği otomatik olarak sıfırlarla (0 baytları) dolduran dinamik bellek fonksiyonu hangisidir?",
            codeSnippet: r'''int *p = ___(100, sizeof(int));''',
            options: ["calloc", "malloc", "realloc", "zalloc"],
            correctIndex: 0,
            explanation: "'calloc(num, size)' eleman sayısı ve eleman boyutu alır, ayrılan tüm bellek hücrelerini 0 ile başlatır.",
          ),
          Question(
            id: "c_unit_6_l6_q11",
            type: QuestionType.multipleChoice,
            prompt: "Daha önce ayrılmış dinamik bir bellek bloğunun boyutunu veri kaybı olmadan büyütmek veya küçültmek için ne kullanılır?",
            codeSnippet: r'''ptr = ___(ptr, new_size);''',
            options: ["realloc", "resize", "remalloc", "expand"],
            correctIndex: 0,
            explanation: "'realloc' mevcut bloğu genişletir veya yeni bir konuma taşıyarak eski veriyi kopyalar.",
          ),
          Question(
            id: "c_unit_6_l6_q12",
            type: QuestionType.multipleChoice,
            prompt: "C programlama dilinde GCC derleme sürecinin doğru sırası aşağıdakilerden hangisidir?",
            options: ["Preprocessor -> Compiler -> Assembler -> Linker", "Compiler -> Preprocessor -> Linker -> Assembler", "Assembler -> Compiler -> Linker -> Preprocessor", "Linker -> Assembler -> Compiler -> Preprocessor"],
            correctIndex: 0,
            explanation: "Önce makrolar ve headerlar çözülür (cpp), C kodu Assembly'ye derlenir (cc1), makine koduna çevrilir (as), kütüphaneler bağlanır (ld).",
          ),
          Question(
            id: "c_unit_6_l6_q13",
            type: QuestionType.fillInTheBlank,
            prompt: "Geçersiz veya henüz atanmamış bir işaretçiye güvenli başlangıç değeri olarak _____ atanmalıdır.",
            explanation: "İşaretçilere NULL atamak tanımsız belleğe erişimi ve segmentation fault hatalarını engellemeye yardımcı olur.",
            blankOptions: ["NULL", "0xFF", "void", "NaN"],
            correctBlankAnswer: "NULL",
          ),
          Question(
            id: "c_unit_6_l6_q14",
            type: QuestionType.fillInTheBlank,
            prompt: "Bir veri tipinin bellekte kaç bayt yer kapladığını öğrenmek için derleme zamanı operatörü olan _____ kullanılır.",
            explanation: "sizeof(tip) veya sizeof(degisken) bayt cinsinden bellek boyutunu size_t olarak döner.",
            blankOptions: ["sizeof", "lengthof", "bytesize", "countof"],
            correctBlankAnswer: "sizeof",
          ),
          Question(
            id: "c_unit_6_l6_q15",
            type: QuestionType.fillInTheBlank,
            prompt: "Açılmış bir dosya işaretçisini işletim sistemine geri iade etmek için _____ fonksiyonu çağrılır.",
            explanation: "fclose(FILE *stream) dosya tamponlarını diske yazar ve kaynakları kapatır.",
            blankOptions: ["fclose", "close", "file_exit", "dispose"],
            correctBlankAnswer: "fclose",
          ),
          Question(
            id: "c_unit_6_l6_q16",
            type: QuestionType.trueFalse,
            prompt: "C dilinde dizi isimleri ifadeler içinde kullanıldığında dizinin ilk elemanının bellek adresine (pointer) dönüşür (decay).",
            explanation: "Doğrudur, 'arr' ifadesi '&arr[0]' adresi ile eşdeğerdir.",
            isTrue: true,
          ),
          Question(
            id: "c_unit_6_l6_q17",
            type: QuestionType.trueFalse,
            prompt: "Stack belleğinde oluşturulan yerel değişkenler fonksiyon sonlandığında da bellekte kalmaya devam eder ve serbest bırakılması için free() gerekir.",
            explanation: "Yanlıştır! Stack bellek fonksiyon bitiminde otomatik temizlenir; free() sadece heap (malloc) için geçerlidir.",
            isTrue: false,
          ),
          Question(
            id: "c_unit_6_l6_q18",
            type: QuestionType.matching,
            prompt: "C bellek kavramlarını doğru açıklamalarıyla eşleştirin.",
            explanation: "C'de bellek güvenliği doğrudan yazılımcının sorumluluğundadır.",
            matchingPairs: [MatchingPair(left: "malloc", right: "Heap üzerinde başlatılmamış bellek tahsisi"), MatchingPair(left: "free", right: "Dinamik belleği sisteme iade etme"), MatchingPair(left: "Valgrind", right: "Bellek sızıntılarını tespit eden analiz aracı")],
          ),
        ],
      ),
      Lesson(
        id: "c_unit_6_l7",
        title: "Güvenli Bellek Sarmalayıcıları (Safe Wrappers)",
        description: "xmalloc ve otomatik NULL atayan makrolar",
        xpReward: 35,
        gemReward: 12,
        isUnitExam: false,
        questions: [
          Question(
            id: "c_unit_6_l7_q1",
            type: QuestionType.conceptCard,
            conceptTitle: "Güvenli Bellek Sarmalayıcıları (Safe Wrappers) - Hap Bilgi",
            rule: "C dilinde işaretçiler (pointers) doğrudan bellek adreslerini saklar. '&' operatörü bir değişkenin adresini alırken, '*' (dereference) o adresteki veriye erişir veya değiştirir.",
            codeExample: r'''#include <stdio.h>
#include <stdlib.h>

int main() {
    int x = 100;
    int *ptr = &x;
    
    printf("x Degeri: %d\n", *ptr);
    printf("x Bellek Adresi: %p\n", (void*)ptr);
    return 0;
}''',
            devTip: "malloc ile tahsis edilen her bayt bellek için mutlaka bir free() çağrısı yapılmalıdır, aksi halde Memory Leak oluşur.",
            iconEmoji: "⚡",
          ),
          Question(
            id: "c_unit_6_l7_q2",
            type: QuestionType.multipleChoice,
            prompt: "Bir header dosyasının birden fazla kez derlemeye dahil edilmesini (redefinition) önlemek için ne kullanılır?",
            codeSnippet: r'''#ifndef MY_HEADER_H
#define MY_HEADER_H
// ...
#endif''',
            options: ["Header Guards (#ifndef / #define)", "namespace", "pragma private", "module"],
            correctIndex: 0,
            explanation: "Header guards veya '#pragma once' başlık dosyalarının mükerrer include edilmesini engeller.",
          ),
          Question(
            id: "c_unit_6_l7_q3",
            type: QuestionType.multipleChoice,
            prompt: "Tüm üyelerinin bellekte AYNI başlangıç adresini paylaştığı ve en büyük üyesi kadar yer kaplayan yapı hangisidir?",
            codeSnippet: r'''___ Data {
    int i;
    float f;
    char str[20];
};''',
            options: ["union", "struct", "class", "shared"],
            correctIndex: 0,
            explanation: "'union' içindeki tüm elemanlar aynı bellek alanını ortaklaşa kullanır; aynı anda sadece biri geçerli değer tutar.",
          ),
          Question(
            id: "c_unit_6_l7_q4",
            type: QuestionType.multipleChoice,
            prompt: "C dilinde bir değişkenin bellekteki adresini elde etmek için hangi operatör kullanılır?",
            codeSnippet: r'''int x = 10;
int *ptr = ___x;''',
            options: ["& (Address-of)", "* (Dereference)", "% (Mod)", "\$ (Value)"],
            correctIndex: 0,
            explanation: "'&' operatörü bir değişkenin RAM üzerindeki başlangıç adresini döner.",
          ),
          Question(
            id: "c_unit_6_l7_q5",
            type: QuestionType.multipleChoice,
            prompt: "Bir işaretçinin (pointer) işaret ettiği bellek adresindeki veriye erişmek veya onu değiştirmek için hangi işlem yapılır?",
            codeSnippet: r'''int x = 5;
int *p = &x;
___p = 20; // x artik 20 olur''',
            options: ["* (Dereference)", "&", "->", "."],
            correctIndex: 0,
            explanation: "'*p' dereferencing yaparak işaretçinin tuttuğu adresteki asıl değere erişir.",
          ),
          Question(
            id: "c_unit_6_l7_q6",
            type: QuestionType.multipleChoice,
            prompt: "Heap bellekte dinamik olarak bayt cinsinden bellek tahsis etmek için hangi standart kütüphane fonksiyonu kullanılır?",
            codeSnippet: r'''int *arr = (int*)___(10 * sizeof(int));''',
            options: ["malloc", "alloc", "new", "heap_get"],
            correctIndex: 0,
            explanation: "'malloc(size_t size)' heap bölgesinde istenen bayt kadar bellek ayırır ve void* işaretçi döner.",
          ),
          Question(
            id: "c_unit_6_l7_q7",
            type: QuestionType.multipleChoice,
            prompt: "malloc veya calloc ile tahsis edilen dinamik belleğin sisteme iade edilmesi için hangi fonksiyon çağrılmalıdır?",
            codeSnippet: r'''int *buf = malloc(1024);
// ... kullanim ...
___(buf);''',
            options: ["free", "delete", "release", "dispose"],
            correctIndex: 0,
            explanation: "'free(ptr)' heap bellekte ayrılan alanı serbest bırakır. Çağrılmazsa 'Memory Leak' oluşur.",
          ),
          Question(
            id: "c_unit_6_l7_q8",
            type: QuestionType.multipleChoice,
            prompt: "Tahsis ettiği belleği otomatik olarak sıfırlarla (0 baytları) dolduran dinamik bellek fonksiyonu hangisidir?",
            codeSnippet: r'''int *p = ___(100, sizeof(int));''',
            options: ["calloc", "malloc", "realloc", "zalloc"],
            correctIndex: 0,
            explanation: "'calloc(num, size)' eleman sayısı ve eleman boyutu alır, ayrılan tüm bellek hücrelerini 0 ile başlatır.",
          ),
          Question(
            id: "c_unit_6_l7_q9",
            type: QuestionType.multipleChoice,
            prompt: "Daha önce ayrılmış dinamik bir bellek bloğunun boyutunu veri kaybı olmadan büyütmek veya küçültmek için ne kullanılır?",
            codeSnippet: r'''ptr = ___(ptr, new_size);''',
            options: ["realloc", "resize", "remalloc", "expand"],
            correctIndex: 0,
            explanation: "'realloc' mevcut bloğu genişletir veya yeni bir konuma taşıyarak eski veriyi kopyalar.",
          ),
          Question(
            id: "c_unit_6_l7_q10",
            type: QuestionType.multipleChoice,
            prompt: "C programlama dilinde GCC derleme sürecinin doğru sırası aşağıdakilerden hangisidir?",
            options: ["Preprocessor -> Compiler -> Assembler -> Linker", "Compiler -> Preprocessor -> Linker -> Assembler", "Assembler -> Compiler -> Linker -> Preprocessor", "Linker -> Assembler -> Compiler -> Preprocessor"],
            correctIndex: 0,
            explanation: "Önce makrolar ve headerlar çözülür (cpp), C kodu Assembly'ye derlenir (cc1), makine koduna çevrilir (as), kütüphaneler bağlanır (ld).",
          ),
          Question(
            id: "c_unit_6_l7_q11",
            type: QuestionType.multipleChoice,
            prompt: "64-bit modern bir mimaride standart bir işaretçi (pointer - int*, char*, void*) değişkeni bellekte kaç bayt yer kaplar?",
            codeSnippet: r'''printf("%zu", sizeof(int*));''',
            options: ["8 bayt", "4 bayt", "2 bayt", "16 bayt"],
            correctIndex: 0,
            explanation: "64-bit mimarilerde bellek adresleri 64 bit yani tam 8 bayttır. İşaretçinin tipi ne olursa olsun adres boyutu 8 bayttır.",
          ),
          Question(
            id: "c_unit_6_l7_q12",
            type: QuestionType.multipleChoice,
            prompt: "Bir struct içindeki bir işaretçi elemana erişirken '.' yerine hangi pratik operatör kullanılır?",
            codeSnippet: r'''struct User *u = getUser();
u___name = "Ahmet";''',
            options: ["-> (Ok operatörü)", ".", "::", "=>"],
            correctIndex: 0,
            explanation: "'u->name', '(*u).name' yazımının daha okunaklı ve standart kısayoludur.",
          ),
          Question(
            id: "c_unit_6_l7_q13",
            type: QuestionType.fillInTheBlank,
            prompt: "Geçersiz veya henüz atanmamış bir işaretçiye güvenli başlangıç değeri olarak _____ atanmalıdır.",
            explanation: "İşaretçilere NULL atamak tanımsız belleğe erişimi ve segmentation fault hatalarını engellemeye yardımcı olur.",
            blankOptions: ["NULL", "0xFF", "void", "NaN"],
            correctBlankAnswer: "NULL",
          ),
          Question(
            id: "c_unit_6_l7_q14",
            type: QuestionType.fillInTheBlank,
            prompt: "Bir veri tipinin bellekte kaç bayt yer kapladığını öğrenmek için derleme zamanı operatörü olan _____ kullanılır.",
            explanation: "sizeof(tip) veya sizeof(degisken) bayt cinsinden bellek boyutunu size_t olarak döner.",
            blankOptions: ["sizeof", "lengthof", "bytesize", "countof"],
            correctBlankAnswer: "sizeof",
          ),
          Question(
            id: "c_unit_6_l7_q15",
            type: QuestionType.fillInTheBlank,
            prompt: "Açılmış bir dosya işaretçisini işletim sistemine geri iade etmek için _____ fonksiyonu çağrılır.",
            explanation: "fclose(FILE *stream) dosya tamponlarını diske yazar ve kaynakları kapatır.",
            blankOptions: ["fclose", "close", "file_exit", "dispose"],
            correctBlankAnswer: "fclose",
          ),
          Question(
            id: "c_unit_6_l7_q16",
            type: QuestionType.trueFalse,
            prompt: "C dilinde dizi isimleri ifadeler içinde kullanıldığında dizinin ilk elemanının bellek adresine (pointer) dönüşür (decay).",
            explanation: "Doğrudur, 'arr' ifadesi '&arr[0]' adresi ile eşdeğerdir.",
            isTrue: true,
          ),
          Question(
            id: "c_unit_6_l7_q17",
            type: QuestionType.trueFalse,
            prompt: "Stack belleğinde oluşturulan yerel değişkenler fonksiyon sonlandığında da bellekte kalmaya devam eder ve serbest bırakılması için free() gerekir.",
            explanation: "Yanlıştır! Stack bellek fonksiyon bitiminde otomatik temizlenir; free() sadece heap (malloc) için geçerlidir.",
            isTrue: false,
          ),
          Question(
            id: "c_unit_6_l7_q18",
            type: QuestionType.matching,
            prompt: "C bellek kavramlarını doğru açıklamalarıyla eşleştirin.",
            explanation: "C'de bellek güvenliği doğrudan yazılımcının sorumluluğundadır.",
            matchingPairs: [MatchingPair(left: "malloc", right: "Heap üzerinde başlatılmamış bellek tahsisi"), MatchingPair(left: "free", right: "Dinamik belleği sisteme iade etme"), MatchingPair(left: "Valgrind", right: "Bellek sızıntılarını tespit eden analiz aracı")],
          ),
        ],
      ),
      Lesson(
        id: "c_unit_6_l8",
        title: "6. Ünite Bellek Güvenliği & Valgrind Sınavı",
        description: "Bellek analizi ve sızıntı avı sınavı",
        xpReward: 50,
        gemReward: 25,
        isUnitExam: true,
        questions: [
          Question(
            id: "c_unit_6_l8_q1",
            type: QuestionType.conceptCard,
            conceptTitle: "6. Ünite Bellek Güvenliği & Valgrind Sınavı - Hap Bilgi",
            rule: "C dilinde işaretçiler (pointers) doğrudan bellek adreslerini saklar. '&' operatörü bir değişkenin adresini alırken, '*' (dereference) o adresteki veriye erişir veya değiştirir.",
            codeExample: r'''#include <stdio.h>
#include <stdlib.h>

int main() {
    int x = 100;
    int *ptr = &x;
    
    printf("x Degeri: %d\n", *ptr);
    printf("x Bellek Adresi: %p\n", (void*)ptr);
    return 0;
}''',
            devTip: "malloc ile tahsis edilen her bayt bellek için mutlaka bir free() çağrısı yapılmalıdır, aksi halde Memory Leak oluşur.",
            iconEmoji: "⚡",
          ),
          Question(
            id: "c_unit_6_l8_q2",
            type: QuestionType.multipleChoice,
            prompt: "C dilinde bir değişkenin bellekteki adresini elde etmek için hangi operatör kullanılır?",
            codeSnippet: r'''int x = 10;
int *ptr = ___x;''',
            options: ["& (Address-of)", "* (Dereference)", "% (Mod)", "\$ (Value)"],
            correctIndex: 0,
            explanation: "'&' operatörü bir değişkenin RAM üzerindeki başlangıç adresini döner.",
          ),
          Question(
            id: "c_unit_6_l8_q3",
            type: QuestionType.multipleChoice,
            prompt: "Bir işaretçinin (pointer) işaret ettiği bellek adresindeki veriye erişmek veya onu değiştirmek için hangi işlem yapılır?",
            codeSnippet: r'''int x = 5;
int *p = &x;
___p = 20; // x artik 20 olur''',
            options: ["* (Dereference)", "&", "->", "."],
            correctIndex: 0,
            explanation: "'*p' dereferencing yaparak işaretçinin tuttuğu adresteki asıl değere erişir.",
          ),
          Question(
            id: "c_unit_6_l8_q4",
            type: QuestionType.multipleChoice,
            prompt: "Heap bellekte dinamik olarak bayt cinsinden bellek tahsis etmek için hangi standart kütüphane fonksiyonu kullanılır?",
            codeSnippet: r'''int *arr = (int*)___(10 * sizeof(int));''',
            options: ["malloc", "alloc", "new", "heap_get"],
            correctIndex: 0,
            explanation: "'malloc(size_t size)' heap bölgesinde istenen bayt kadar bellek ayırır ve void* işaretçi döner.",
          ),
          Question(
            id: "c_unit_6_l8_q5",
            type: QuestionType.multipleChoice,
            prompt: "malloc veya calloc ile tahsis edilen dinamik belleğin sisteme iade edilmesi için hangi fonksiyon çağrılmalıdır?",
            codeSnippet: r'''int *buf = malloc(1024);
// ... kullanim ...
___(buf);''',
            options: ["free", "delete", "release", "dispose"],
            correctIndex: 0,
            explanation: "'free(ptr)' heap bellekte ayrılan alanı serbest bırakır. Çağrılmazsa 'Memory Leak' oluşur.",
          ),
          Question(
            id: "c_unit_6_l8_q6",
            type: QuestionType.multipleChoice,
            prompt: "Tahsis ettiği belleği otomatik olarak sıfırlarla (0 baytları) dolduran dinamik bellek fonksiyonu hangisidir?",
            codeSnippet: r'''int *p = ___(100, sizeof(int));''',
            options: ["calloc", "malloc", "realloc", "zalloc"],
            correctIndex: 0,
            explanation: "'calloc(num, size)' eleman sayısı ve eleman boyutu alır, ayrılan tüm bellek hücrelerini 0 ile başlatır.",
          ),
          Question(
            id: "c_unit_6_l8_q7",
            type: QuestionType.multipleChoice,
            prompt: "Daha önce ayrılmış dinamik bir bellek bloğunun boyutunu veri kaybı olmadan büyütmek veya küçültmek için ne kullanılır?",
            codeSnippet: r'''ptr = ___(ptr, new_size);''',
            options: ["realloc", "resize", "remalloc", "expand"],
            correctIndex: 0,
            explanation: "'realloc' mevcut bloğu genişletir veya yeni bir konuma taşıyarak eski veriyi kopyalar.",
          ),
          Question(
            id: "c_unit_6_l8_q8",
            type: QuestionType.multipleChoice,
            prompt: "C programlama dilinde GCC derleme sürecinin doğru sırası aşağıdakilerden hangisidir?",
            options: ["Preprocessor -> Compiler -> Assembler -> Linker", "Compiler -> Preprocessor -> Linker -> Assembler", "Assembler -> Compiler -> Linker -> Preprocessor", "Linker -> Assembler -> Compiler -> Preprocessor"],
            correctIndex: 0,
            explanation: "Önce makrolar ve headerlar çözülür (cpp), C kodu Assembly'ye derlenir (cc1), makine koduna çevrilir (as), kütüphaneler bağlanır (ld).",
          ),
          Question(
            id: "c_unit_6_l8_q9",
            type: QuestionType.multipleChoice,
            prompt: "64-bit modern bir mimaride standart bir işaretçi (pointer - int*, char*, void*) değişkeni bellekte kaç bayt yer kaplar?",
            codeSnippet: r'''printf("%zu", sizeof(int*));''',
            options: ["8 bayt", "4 bayt", "2 bayt", "16 bayt"],
            correctIndex: 0,
            explanation: "64-bit mimarilerde bellek adresleri 64 bit yani tam 8 bayttır. İşaretçinin tipi ne olursa olsun adres boyutu 8 bayttır.",
          ),
          Question(
            id: "c_unit_6_l8_q10",
            type: QuestionType.multipleChoice,
            prompt: "Bir struct içindeki bir işaretçi elemana erişirken '.' yerine hangi pratik operatör kullanılır?",
            codeSnippet: r'''struct User *u = getUser();
u___name = "Ahmet";''',
            options: ["-> (Ok operatörü)", ".", "::", "=>"],
            correctIndex: 0,
            explanation: "'u->name', '(*u).name' yazımının daha okunaklı ve standart kısayoludur.",
          ),
          Question(
            id: "c_unit_6_l8_q11",
            type: QuestionType.multipleChoice,
            prompt: "Herhangi bir veri tipine ait bellek adresini tutabilen jenerik (tip bağımsız) işaretçi tipi hangisidir?",
            codeSnippet: r'''___ generic_ptr = &x;''',
            options: ["void*", "any*", "object*", "generic*"],
            correctIndex: 0,
            explanation: "'void*' tipi belirsiz jenerik bir işaretçidir; doğrudan dereference edilemez, cast edilmesi gerekir.",
          ),
          Question(
            id: "c_unit_6_l8_q12",
            type: QuestionType.multipleChoice,
            prompt: "Serbest bırakılmış (free edilmiş) bir işaretçiyi kullanmaya devam etme hatasına ne ad verilir?",
            codeSnippet: r'''free(ptr);
printf("%d", *ptr); // HATA!''',
            options: ["Dangling Pointer (Askıda Kalan İşaretçi)", "Stack Overflow", "Memory Leak", "Deadlock"],
            correctIndex: 0,
            explanation: "free edildikten sonra hala o adresi göstermeye devam eden işaretçiye dangling pointer denir; 'ptr = NULL' yapılarak önlenir.",
          ),
          Question(
            id: "c_unit_6_l8_q13",
            type: QuestionType.fillInTheBlank,
            prompt: "Geçersiz veya henüz atanmamış bir işaretçiye güvenli başlangıç değeri olarak _____ atanmalıdır.",
            explanation: "İşaretçilere NULL atamak tanımsız belleğe erişimi ve segmentation fault hatalarını engellemeye yardımcı olur.",
            blankOptions: ["NULL", "0xFF", "void", "NaN"],
            correctBlankAnswer: "NULL",
          ),
          Question(
            id: "c_unit_6_l8_q14",
            type: QuestionType.fillInTheBlank,
            prompt: "Bir veri tipinin bellekte kaç bayt yer kapladığını öğrenmek için derleme zamanı operatörü olan _____ kullanılır.",
            explanation: "sizeof(tip) veya sizeof(degisken) bayt cinsinden bellek boyutunu size_t olarak döner.",
            blankOptions: ["sizeof", "lengthof", "bytesize", "countof"],
            correctBlankAnswer: "sizeof",
          ),
          Question(
            id: "c_unit_6_l8_q15",
            type: QuestionType.fillInTheBlank,
            prompt: "Açılmış bir dosya işaretçisini işletim sistemine geri iade etmek için _____ fonksiyonu çağrılır.",
            explanation: "fclose(FILE *stream) dosya tamponlarını diske yazar ve kaynakları kapatır.",
            blankOptions: ["fclose", "close", "file_exit", "dispose"],
            correctBlankAnswer: "fclose",
          ),
          Question(
            id: "c_unit_6_l8_q16",
            type: QuestionType.trueFalse,
            prompt: "C dilinde dizi isimleri ifadeler içinde kullanıldığında dizinin ilk elemanının bellek adresine (pointer) dönüşür (decay).",
            explanation: "Doğrudur, 'arr' ifadesi '&arr[0]' adresi ile eşdeğerdir.",
            isTrue: true,
          ),
          Question(
            id: "c_unit_6_l8_q17",
            type: QuestionType.trueFalse,
            prompt: "Stack belleğinde oluşturulan yerel değişkenler fonksiyon sonlandığında da bellekte kalmaya devam eder ve serbest bırakılması için free() gerekir.",
            explanation: "Yanlıştır! Stack bellek fonksiyon bitiminde otomatik temizlenir; free() sadece heap (malloc) için geçerlidir.",
            isTrue: false,
          ),
          Question(
            id: "c_unit_6_l8_q18",
            type: QuestionType.matching,
            prompt: "C bellek kavramlarını doğru açıklamalarıyla eşleştirin.",
            explanation: "C'de bellek güvenliği doğrudan yazılımcının sorumluluğundadır.",
            matchingPairs: [MatchingPair(left: "malloc", right: "Heap üzerinde başlatılmamış bellek tahsisi"), MatchingPair(left: "free", right: "Dinamik belleği sisteme iade etme"), MatchingPair(left: "Valgrind", right: "Bellek sızıntılarını tespit eden analiz aracı")],
          ),
        ],
      ),
    ],
  ),
  LearningUnit(
    id: "c_unit_7",
    unitNumber: 7,
    title: "Structs, Unions, Struct Padding & Bellek Hizalama",
    language: CodeLanguage.c,
    category: "Structs & Unions",
    colorHex: 0xFF10B981,
    cheatSheetTitle: "C Struct Hile Kağıdı",
    cheatSheetContent: r'''typedef struct {
    int id;
    char name[32];
} Student;
Student s; Student *p = &s;
p->id = 1;''',
    lessons: [
      Lesson(
        id: "c_unit_7_l1",
        title: "struct Nedir & Özel Veri Tipleri Oluşturma",
        description: "Farklı tipleri tek bir blokta paketleme",
        xpReward: 35,
        gemReward: 12,
        isUnitExam: false,
        questions: [
          Question(
            id: "c_unit_7_l1_q1",
            type: QuestionType.conceptCard,
            conceptTitle: "struct Nedir & Özel Veri Tipleri Oluşturma - Hap Bilgi",
            rule: "C dilinde işaretçiler (pointers) doğrudan bellek adreslerini saklar. '&' operatörü bir değişkenin adresini alırken, '*' (dereference) o adresteki veriye erişir veya değiştirir.",
            codeExample: r'''#include <stdio.h>
#include <stdlib.h>

int main() {
    int x = 100;
    int *ptr = &x;
    
    printf("x Degeri: %d\n", *ptr);
    printf("x Bellek Adresi: %p\n", (void*)ptr);
    return 0;
}''',
            devTip: "malloc ile tahsis edilen her bayt bellek için mutlaka bir free() çağrısı yapılmalıdır, aksi halde Memory Leak oluşur.",
            iconEmoji: "⚡",
          ),
          Question(
            id: "c_unit_7_l1_q2",
            type: QuestionType.multipleChoice,
            prompt: "Heap bellekte dinamik olarak bayt cinsinden bellek tahsis etmek için hangi standart kütüphane fonksiyonu kullanılır?",
            codeSnippet: r'''int *arr = (int*)___(10 * sizeof(int));''',
            options: ["malloc", "alloc", "new", "heap_get"],
            correctIndex: 0,
            explanation: "'malloc(size_t size)' heap bölgesinde istenen bayt kadar bellek ayırır ve void* işaretçi döner.",
          ),
          Question(
            id: "c_unit_7_l1_q3",
            type: QuestionType.multipleChoice,
            prompt: "malloc veya calloc ile tahsis edilen dinamik belleğin sisteme iade edilmesi için hangi fonksiyon çağrılmalıdır?",
            codeSnippet: r'''int *buf = malloc(1024);
// ... kullanim ...
___(buf);''',
            options: ["free", "delete", "release", "dispose"],
            correctIndex: 0,
            explanation: "'free(ptr)' heap bellekte ayrılan alanı serbest bırakır. Çağrılmazsa 'Memory Leak' oluşur.",
          ),
          Question(
            id: "c_unit_7_l1_q4",
            type: QuestionType.multipleChoice,
            prompt: "Tahsis ettiği belleği otomatik olarak sıfırlarla (0 baytları) dolduran dinamik bellek fonksiyonu hangisidir?",
            codeSnippet: r'''int *p = ___(100, sizeof(int));''',
            options: ["calloc", "malloc", "realloc", "zalloc"],
            correctIndex: 0,
            explanation: "'calloc(num, size)' eleman sayısı ve eleman boyutu alır, ayrılan tüm bellek hücrelerini 0 ile başlatır.",
          ),
          Question(
            id: "c_unit_7_l1_q5",
            type: QuestionType.multipleChoice,
            prompt: "Daha önce ayrılmış dinamik bir bellek bloğunun boyutunu veri kaybı olmadan büyütmek veya küçültmek için ne kullanılır?",
            codeSnippet: r'''ptr = ___(ptr, new_size);''',
            options: ["realloc", "resize", "remalloc", "expand"],
            correctIndex: 0,
            explanation: "'realloc' mevcut bloğu genişletir veya yeni bir konuma taşıyarak eski veriyi kopyalar.",
          ),
          Question(
            id: "c_unit_7_l1_q6",
            type: QuestionType.multipleChoice,
            prompt: "C programlama dilinde GCC derleme sürecinin doğru sırası aşağıdakilerden hangisidir?",
            options: ["Preprocessor -> Compiler -> Assembler -> Linker", "Compiler -> Preprocessor -> Linker -> Assembler", "Assembler -> Compiler -> Linker -> Preprocessor", "Linker -> Assembler -> Compiler -> Preprocessor"],
            correctIndex: 0,
            explanation: "Önce makrolar ve headerlar çözülür (cpp), C kodu Assembly'ye derlenir (cc1), makine koduna çevrilir (as), kütüphaneler bağlanır (ld).",
          ),
          Question(
            id: "c_unit_7_l1_q7",
            type: QuestionType.multipleChoice,
            prompt: "64-bit modern bir mimaride standart bir işaretçi (pointer - int*, char*, void*) değişkeni bellekte kaç bayt yer kaplar?",
            codeSnippet: r'''printf("%zu", sizeof(int*));''',
            options: ["8 bayt", "4 bayt", "2 bayt", "16 bayt"],
            correctIndex: 0,
            explanation: "64-bit mimarilerde bellek adresleri 64 bit yani tam 8 bayttır. İşaretçinin tipi ne olursa olsun adres boyutu 8 bayttır.",
          ),
          Question(
            id: "c_unit_7_l1_q8",
            type: QuestionType.multipleChoice,
            prompt: "Bir struct içindeki bir işaretçi elemana erişirken '.' yerine hangi pratik operatör kullanılır?",
            codeSnippet: r'''struct User *u = getUser();
u___name = "Ahmet";''',
            options: ["-> (Ok operatörü)", ".", "::", "=>"],
            correctIndex: 0,
            explanation: "'u->name', '(*u).name' yazımının daha okunaklı ve standart kısayoludur.",
          ),
          Question(
            id: "c_unit_7_l1_q9",
            type: QuestionType.multipleChoice,
            prompt: "Herhangi bir veri tipine ait bellek adresini tutabilen jenerik (tip bağımsız) işaretçi tipi hangisidir?",
            codeSnippet: r'''___ generic_ptr = &x;''',
            options: ["void*", "any*", "object*", "generic*"],
            correctIndex: 0,
            explanation: "'void*' tipi belirsiz jenerik bir işaretçidir; doğrudan dereference edilemez, cast edilmesi gerekir.",
          ),
          Question(
            id: "c_unit_7_l1_q10",
            type: QuestionType.multipleChoice,
            prompt: "Serbest bırakılmış (free edilmiş) bir işaretçiyi kullanmaya devam etme hatasına ne ad verilir?",
            codeSnippet: r'''free(ptr);
printf("%d", *ptr); // HATA!''',
            options: ["Dangling Pointer (Askıda Kalan İşaretçi)", "Stack Overflow", "Memory Leak", "Deadlock"],
            correctIndex: 0,
            explanation: "free edildikten sonra hala o adresi göstermeye devam eden işaretçiye dangling pointer denir; 'ptr = NULL' yapılarak önlenir.",
          ),
          Question(
            id: "c_unit_7_l1_q11",
            type: QuestionType.multipleChoice,
            prompt: "C programlarında bellek sızıntılarını (memory leak) ve geçersiz bellek erişimlerini tespit etmek için en popüler Linux aracı hangisidir?",
            codeSnippet: r'''$ ___ --leak-check=full ./program''',
            options: ["valgrind", "gdb", "perf", "strace"],
            correctIndex: 0,
            explanation: "Valgrind (özellikle memcheck aracı) C/C++ programlarında bellek yönetim hatalarını ayrıntılı raporlar.",
          ),
          Question(
            id: "c_unit_7_l1_q12",
            type: QuestionType.multipleChoice,
            prompt: "Aşağıdaki bit düzeyinde (bitwise) operatörlerden hangisi bitleri 1 basamak sola kaydırarak 2 ile çarpmayı sağlar?",
            codeSnippet: r'''int x = 5;
int y = x ___ 1; // y = 10 olur''',
            options: ["<<", ">>", "&", "|"],
            correctIndex: 0,
            explanation: "Sola kaydırma (<< n) operatörü sayının değerini 2^n ile çarpar.",
          ),
          Question(
            id: "c_unit_7_l1_q13",
            type: QuestionType.fillInTheBlank,
            prompt: "Geçersiz veya henüz atanmamış bir işaretçiye güvenli başlangıç değeri olarak _____ atanmalıdır.",
            explanation: "İşaretçilere NULL atamak tanımsız belleğe erişimi ve segmentation fault hatalarını engellemeye yardımcı olur.",
            blankOptions: ["NULL", "0xFF", "void", "NaN"],
            correctBlankAnswer: "NULL",
          ),
          Question(
            id: "c_unit_7_l1_q14",
            type: QuestionType.fillInTheBlank,
            prompt: "Bir veri tipinin bellekte kaç bayt yer kapladığını öğrenmek için derleme zamanı operatörü olan _____ kullanılır.",
            explanation: "sizeof(tip) veya sizeof(degisken) bayt cinsinden bellek boyutunu size_t olarak döner.",
            blankOptions: ["sizeof", "lengthof", "bytesize", "countof"],
            correctBlankAnswer: "sizeof",
          ),
          Question(
            id: "c_unit_7_l1_q15",
            type: QuestionType.fillInTheBlank,
            prompt: "Açılmış bir dosya işaretçisini işletim sistemine geri iade etmek için _____ fonksiyonu çağrılır.",
            explanation: "fclose(FILE *stream) dosya tamponlarını diske yazar ve kaynakları kapatır.",
            blankOptions: ["fclose", "close", "file_exit", "dispose"],
            correctBlankAnswer: "fclose",
          ),
          Question(
            id: "c_unit_7_l1_q16",
            type: QuestionType.trueFalse,
            prompt: "C dilinde dizi isimleri ifadeler içinde kullanıldığında dizinin ilk elemanının bellek adresine (pointer) dönüşür (decay).",
            explanation: "Doğrudur, 'arr' ifadesi '&arr[0]' adresi ile eşdeğerdir.",
            isTrue: true,
          ),
          Question(
            id: "c_unit_7_l1_q17",
            type: QuestionType.trueFalse,
            prompt: "Stack belleğinde oluşturulan yerel değişkenler fonksiyon sonlandığında da bellekte kalmaya devam eder ve serbest bırakılması için free() gerekir.",
            explanation: "Yanlıştır! Stack bellek fonksiyon bitiminde otomatik temizlenir; free() sadece heap (malloc) için geçerlidir.",
            isTrue: false,
          ),
          Question(
            id: "c_unit_7_l1_q18",
            type: QuestionType.matching,
            prompt: "C bellek kavramlarını doğru açıklamalarıyla eşleştirin.",
            explanation: "C'de bellek güvenliği doğrudan yazılımcının sorumluluğundadır.",
            matchingPairs: [MatchingPair(left: "malloc", right: "Heap üzerinde başlatılmamış bellek tahsisi"), MatchingPair(left: "free", right: "Dinamik belleği sisteme iade etme"), MatchingPair(left: "Valgrind", right: "Bellek sızıntılarını tespit eden analiz aracı")],
          ),
        ],
      ),
      Lesson(
        id: "c_unit_7_l2",
        title: "typedef ile Struct İsimlerini Kısaltma",
        description: "struct anahtarını her yerde yazmaktan kurtulma",
        xpReward: 35,
        gemReward: 12,
        isUnitExam: false,
        questions: [
          Question(
            id: "c_unit_7_l2_q1",
            type: QuestionType.conceptCard,
            conceptTitle: "typedef ile Struct İsimlerini Kısaltma - Hap Bilgi",
            rule: "C dilinde işaretçiler (pointers) doğrudan bellek adreslerini saklar. '&' operatörü bir değişkenin adresini alırken, '*' (dereference) o adresteki veriye erişir veya değiştirir.",
            codeExample: r'''#include <stdio.h>
#include <stdlib.h>

int main() {
    int x = 100;
    int *ptr = &x;
    
    printf("x Degeri: %d\n", *ptr);
    printf("x Bellek Adresi: %p\n", (void*)ptr);
    return 0;
}''',
            devTip: "malloc ile tahsis edilen her bayt bellek için mutlaka bir free() çağrısı yapılmalıdır, aksi halde Memory Leak oluşur.",
            iconEmoji: "⚡",
          ),
          Question(
            id: "c_unit_7_l2_q2",
            type: QuestionType.multipleChoice,
            prompt: "Tahsis ettiği belleği otomatik olarak sıfırlarla (0 baytları) dolduran dinamik bellek fonksiyonu hangisidir?",
            codeSnippet: r'''int *p = ___(100, sizeof(int));''',
            options: ["calloc", "malloc", "realloc", "zalloc"],
            correctIndex: 0,
            explanation: "'calloc(num, size)' eleman sayısı ve eleman boyutu alır, ayrılan tüm bellek hücrelerini 0 ile başlatır.",
          ),
          Question(
            id: "c_unit_7_l2_q3",
            type: QuestionType.multipleChoice,
            prompt: "Daha önce ayrılmış dinamik bir bellek bloğunun boyutunu veri kaybı olmadan büyütmek veya küçültmek için ne kullanılır?",
            codeSnippet: r'''ptr = ___(ptr, new_size);''',
            options: ["realloc", "resize", "remalloc", "expand"],
            correctIndex: 0,
            explanation: "'realloc' mevcut bloğu genişletir veya yeni bir konuma taşıyarak eski veriyi kopyalar.",
          ),
          Question(
            id: "c_unit_7_l2_q4",
            type: QuestionType.multipleChoice,
            prompt: "C programlama dilinde GCC derleme sürecinin doğru sırası aşağıdakilerden hangisidir?",
            options: ["Preprocessor -> Compiler -> Assembler -> Linker", "Compiler -> Preprocessor -> Linker -> Assembler", "Assembler -> Compiler -> Linker -> Preprocessor", "Linker -> Assembler -> Compiler -> Preprocessor"],
            correctIndex: 0,
            explanation: "Önce makrolar ve headerlar çözülür (cpp), C kodu Assembly'ye derlenir (cc1), makine koduna çevrilir (as), kütüphaneler bağlanır (ld).",
          ),
          Question(
            id: "c_unit_7_l2_q5",
            type: QuestionType.multipleChoice,
            prompt: "64-bit modern bir mimaride standart bir işaretçi (pointer - int*, char*, void*) değişkeni bellekte kaç bayt yer kaplar?",
            codeSnippet: r'''printf("%zu", sizeof(int*));''',
            options: ["8 bayt", "4 bayt", "2 bayt", "16 bayt"],
            correctIndex: 0,
            explanation: "64-bit mimarilerde bellek adresleri 64 bit yani tam 8 bayttır. İşaretçinin tipi ne olursa olsun adres boyutu 8 bayttır.",
          ),
          Question(
            id: "c_unit_7_l2_q6",
            type: QuestionType.multipleChoice,
            prompt: "Bir struct içindeki bir işaretçi elemana erişirken '.' yerine hangi pratik operatör kullanılır?",
            codeSnippet: r'''struct User *u = getUser();
u___name = "Ahmet";''',
            options: ["-> (Ok operatörü)", ".", "::", "=>"],
            correctIndex: 0,
            explanation: "'u->name', '(*u).name' yazımının daha okunaklı ve standart kısayoludur.",
          ),
          Question(
            id: "c_unit_7_l2_q7",
            type: QuestionType.multipleChoice,
            prompt: "Herhangi bir veri tipine ait bellek adresini tutabilen jenerik (tip bağımsız) işaretçi tipi hangisidir?",
            codeSnippet: r'''___ generic_ptr = &x;''',
            options: ["void*", "any*", "object*", "generic*"],
            correctIndex: 0,
            explanation: "'void*' tipi belirsiz jenerik bir işaretçidir; doğrudan dereference edilemez, cast edilmesi gerekir.",
          ),
          Question(
            id: "c_unit_7_l2_q8",
            type: QuestionType.multipleChoice,
            prompt: "Serbest bırakılmış (free edilmiş) bir işaretçiyi kullanmaya devam etme hatasına ne ad verilir?",
            codeSnippet: r'''free(ptr);
printf("%d", *ptr); // HATA!''',
            options: ["Dangling Pointer (Askıda Kalan İşaretçi)", "Stack Overflow", "Memory Leak", "Deadlock"],
            correctIndex: 0,
            explanation: "free edildikten sonra hala o adresi göstermeye devam eden işaretçiye dangling pointer denir; 'ptr = NULL' yapılarak önlenir.",
          ),
          Question(
            id: "c_unit_7_l2_q9",
            type: QuestionType.multipleChoice,
            prompt: "C programlarında bellek sızıntılarını (memory leak) ve geçersiz bellek erişimlerini tespit etmek için en popüler Linux aracı hangisidir?",
            codeSnippet: r'''$ ___ --leak-check=full ./program''',
            options: ["valgrind", "gdb", "perf", "strace"],
            correctIndex: 0,
            explanation: "Valgrind (özellikle memcheck aracı) C/C++ programlarında bellek yönetim hatalarını ayrıntılı raporlar.",
          ),
          Question(
            id: "c_unit_7_l2_q10",
            type: QuestionType.multipleChoice,
            prompt: "Aşağıdaki bit düzeyinde (bitwise) operatörlerden hangisi bitleri 1 basamak sola kaydırarak 2 ile çarpmayı sağlar?",
            codeSnippet: r'''int x = 5;
int y = x ___ 1; // y = 10 olur''',
            options: ["<<", ">>", "&", "|"],
            correctIndex: 0,
            explanation: "Sola kaydırma (<< n) operatörü sayının değerini 2^n ile çarpar.",
          ),
          Question(
            id: "c_unit_7_l2_q11",
            type: QuestionType.multipleChoice,
            prompt: "C'de dosya açmak ve bir dosya işaretçisi (FILE*) elde etmek için hangi standart fonksiyon kullanılır?",
            codeSnippet: r'''FILE *f = ___("data.txt", "r");''',
            options: ["fopen", "open", "file_open", "create_file"],
            correctIndex: 0,
            explanation: "'fopen(dosya_adi, mod)' dosyayı belirtilen modda (r, w, a, rb, wb) açar.",
          ),
          Question(
            id: "c_unit_7_l2_q12",
            type: QuestionType.multipleChoice,
            prompt: "Bir header dosyasının birden fazla kez derlemeye dahil edilmesini (redefinition) önlemek için ne kullanılır?",
            codeSnippet: r'''#ifndef MY_HEADER_H
#define MY_HEADER_H
// ...
#endif''',
            options: ["Header Guards (#ifndef / #define)", "namespace", "pragma private", "module"],
            correctIndex: 0,
            explanation: "Header guards veya '#pragma once' başlık dosyalarının mükerrer include edilmesini engeller.",
          ),
          Question(
            id: "c_unit_7_l2_q13",
            type: QuestionType.fillInTheBlank,
            prompt: "Geçersiz veya henüz atanmamış bir işaretçiye güvenli başlangıç değeri olarak _____ atanmalıdır.",
            explanation: "İşaretçilere NULL atamak tanımsız belleğe erişimi ve segmentation fault hatalarını engellemeye yardımcı olur.",
            blankOptions: ["NULL", "0xFF", "void", "NaN"],
            correctBlankAnswer: "NULL",
          ),
          Question(
            id: "c_unit_7_l2_q14",
            type: QuestionType.fillInTheBlank,
            prompt: "Bir veri tipinin bellekte kaç bayt yer kapladığını öğrenmek için derleme zamanı operatörü olan _____ kullanılır.",
            explanation: "sizeof(tip) veya sizeof(degisken) bayt cinsinden bellek boyutunu size_t olarak döner.",
            blankOptions: ["sizeof", "lengthof", "bytesize", "countof"],
            correctBlankAnswer: "sizeof",
          ),
          Question(
            id: "c_unit_7_l2_q15",
            type: QuestionType.fillInTheBlank,
            prompt: "Açılmış bir dosya işaretçisini işletim sistemine geri iade etmek için _____ fonksiyonu çağrılır.",
            explanation: "fclose(FILE *stream) dosya tamponlarını diske yazar ve kaynakları kapatır.",
            blankOptions: ["fclose", "close", "file_exit", "dispose"],
            correctBlankAnswer: "fclose",
          ),
          Question(
            id: "c_unit_7_l2_q16",
            type: QuestionType.trueFalse,
            prompt: "C dilinde dizi isimleri ifadeler içinde kullanıldığında dizinin ilk elemanının bellek adresine (pointer) dönüşür (decay).",
            explanation: "Doğrudur, 'arr' ifadesi '&arr[0]' adresi ile eşdeğerdir.",
            isTrue: true,
          ),
          Question(
            id: "c_unit_7_l2_q17",
            type: QuestionType.trueFalse,
            prompt: "Stack belleğinde oluşturulan yerel değişkenler fonksiyon sonlandığında da bellekte kalmaya devam eder ve serbest bırakılması için free() gerekir.",
            explanation: "Yanlıştır! Stack bellek fonksiyon bitiminde otomatik temizlenir; free() sadece heap (malloc) için geçerlidir.",
            isTrue: false,
          ),
          Question(
            id: "c_unit_7_l2_q18",
            type: QuestionType.matching,
            prompt: "C bellek kavramlarını doğru açıklamalarıyla eşleştirin.",
            explanation: "C'de bellek güvenliği doğrudan yazılımcının sorumluluğundadır.",
            matchingPairs: [MatchingPair(left: "malloc", right: "Heap üzerinde başlatılmamış bellek tahsisi"), MatchingPair(left: "free", right: "Dinamik belleği sisteme iade etme"), MatchingPair(left: "Valgrind", right: "Bellek sızıntılarını tespit eden analiz aracı")],
          ),
        ],
      ),
      Lesson(
        id: "c_unit_7_l3",
        title: "Struct Elemanlarına Erişim: Nokta (.) vs Ok (->)",
        description: "Değişken üzerinden vs işaretçi üzerinden erişim",
        xpReward: 35,
        gemReward: 12,
        isUnitExam: false,
        questions: [
          Question(
            id: "c_unit_7_l3_q1",
            type: QuestionType.conceptCard,
            conceptTitle: "Struct Elemanlarına Erişim: Nokta (.) vs Ok (->) - Hap Bilgi",
            rule: "C dilinde işaretçiler (pointers) doğrudan bellek adreslerini saklar. '&' operatörü bir değişkenin adresini alırken, '*' (dereference) o adresteki veriye erişir veya değiştirir.",
            codeExample: r'''#include <stdio.h>
#include <stdlib.h>

int main() {
    int x = 100;
    int *ptr = &x;
    
    printf("x Degeri: %d\n", *ptr);
    printf("x Bellek Adresi: %p\n", (void*)ptr);
    return 0;
}''',
            devTip: "malloc ile tahsis edilen her bayt bellek için mutlaka bir free() çağrısı yapılmalıdır, aksi halde Memory Leak oluşur.",
            iconEmoji: "⚡",
          ),
          Question(
            id: "c_unit_7_l3_q2",
            type: QuestionType.multipleChoice,
            prompt: "C programlama dilinde GCC derleme sürecinin doğru sırası aşağıdakilerden hangisidir?",
            options: ["Preprocessor -> Compiler -> Assembler -> Linker", "Compiler -> Preprocessor -> Linker -> Assembler", "Assembler -> Compiler -> Linker -> Preprocessor", "Linker -> Assembler -> Compiler -> Preprocessor"],
            correctIndex: 0,
            explanation: "Önce makrolar ve headerlar çözülür (cpp), C kodu Assembly'ye derlenir (cc1), makine koduna çevrilir (as), kütüphaneler bağlanır (ld).",
          ),
          Question(
            id: "c_unit_7_l3_q3",
            type: QuestionType.multipleChoice,
            prompt: "64-bit modern bir mimaride standart bir işaretçi (pointer - int*, char*, void*) değişkeni bellekte kaç bayt yer kaplar?",
            codeSnippet: r'''printf("%zu", sizeof(int*));''',
            options: ["8 bayt", "4 bayt", "2 bayt", "16 bayt"],
            correctIndex: 0,
            explanation: "64-bit mimarilerde bellek adresleri 64 bit yani tam 8 bayttır. İşaretçinin tipi ne olursa olsun adres boyutu 8 bayttır.",
          ),
          Question(
            id: "c_unit_7_l3_q4",
            type: QuestionType.multipleChoice,
            prompt: "Bir struct içindeki bir işaretçi elemana erişirken '.' yerine hangi pratik operatör kullanılır?",
            codeSnippet: r'''struct User *u = getUser();
u___name = "Ahmet";''',
            options: ["-> (Ok operatörü)", ".", "::", "=>"],
            correctIndex: 0,
            explanation: "'u->name', '(*u).name' yazımının daha okunaklı ve standart kısayoludur.",
          ),
          Question(
            id: "c_unit_7_l3_q5",
            type: QuestionType.multipleChoice,
            prompt: "Herhangi bir veri tipine ait bellek adresini tutabilen jenerik (tip bağımsız) işaretçi tipi hangisidir?",
            codeSnippet: r'''___ generic_ptr = &x;''',
            options: ["void*", "any*", "object*", "generic*"],
            correctIndex: 0,
            explanation: "'void*' tipi belirsiz jenerik bir işaretçidir; doğrudan dereference edilemez, cast edilmesi gerekir.",
          ),
          Question(
            id: "c_unit_7_l3_q6",
            type: QuestionType.multipleChoice,
            prompt: "Serbest bırakılmış (free edilmiş) bir işaretçiyi kullanmaya devam etme hatasına ne ad verilir?",
            codeSnippet: r'''free(ptr);
printf("%d", *ptr); // HATA!''',
            options: ["Dangling Pointer (Askıda Kalan İşaretçi)", "Stack Overflow", "Memory Leak", "Deadlock"],
            correctIndex: 0,
            explanation: "free edildikten sonra hala o adresi göstermeye devam eden işaretçiye dangling pointer denir; 'ptr = NULL' yapılarak önlenir.",
          ),
          Question(
            id: "c_unit_7_l3_q7",
            type: QuestionType.multipleChoice,
            prompt: "C programlarında bellek sızıntılarını (memory leak) ve geçersiz bellek erişimlerini tespit etmek için en popüler Linux aracı hangisidir?",
            codeSnippet: r'''$ ___ --leak-check=full ./program''',
            options: ["valgrind", "gdb", "perf", "strace"],
            correctIndex: 0,
            explanation: "Valgrind (özellikle memcheck aracı) C/C++ programlarında bellek yönetim hatalarını ayrıntılı raporlar.",
          ),
          Question(
            id: "c_unit_7_l3_q8",
            type: QuestionType.multipleChoice,
            prompt: "Aşağıdaki bit düzeyinde (bitwise) operatörlerden hangisi bitleri 1 basamak sola kaydırarak 2 ile çarpmayı sağlar?",
            codeSnippet: r'''int x = 5;
int y = x ___ 1; // y = 10 olur''',
            options: ["<<", ">>", "&", "|"],
            correctIndex: 0,
            explanation: "Sola kaydırma (<< n) operatörü sayının değerini 2^n ile çarpar.",
          ),
          Question(
            id: "c_unit_7_l3_q9",
            type: QuestionType.multipleChoice,
            prompt: "C'de dosya açmak ve bir dosya işaretçisi (FILE*) elde etmek için hangi standart fonksiyon kullanılır?",
            codeSnippet: r'''FILE *f = ___("data.txt", "r");''',
            options: ["fopen", "open", "file_open", "create_file"],
            correctIndex: 0,
            explanation: "'fopen(dosya_adi, mod)' dosyayı belirtilen modda (r, w, a, rb, wb) açar.",
          ),
          Question(
            id: "c_unit_7_l3_q10",
            type: QuestionType.multipleChoice,
            prompt: "Bir header dosyasının birden fazla kez derlemeye dahil edilmesini (redefinition) önlemek için ne kullanılır?",
            codeSnippet: r'''#ifndef MY_HEADER_H
#define MY_HEADER_H
// ...
#endif''',
            options: ["Header Guards (#ifndef / #define)", "namespace", "pragma private", "module"],
            correctIndex: 0,
            explanation: "Header guards veya '#pragma once' başlık dosyalarının mükerrer include edilmesini engeller.",
          ),
          Question(
            id: "c_unit_7_l3_q11",
            type: QuestionType.multipleChoice,
            prompt: "Tüm üyelerinin bellekte AYNI başlangıç adresini paylaştığı ve en büyük üyesi kadar yer kaplayan yapı hangisidir?",
            codeSnippet: r'''___ Data {
    int i;
    float f;
    char str[20];
};''',
            options: ["union", "struct", "class", "shared"],
            correctIndex: 0,
            explanation: "'union' içindeki tüm elemanlar aynı bellek alanını ortaklaşa kullanır; aynı anda sadece biri geçerli değer tutar.",
          ),
          Question(
            id: "c_unit_7_l3_q12",
            type: QuestionType.multipleChoice,
            prompt: "C dilinde bir değişkenin bellekteki adresini elde etmek için hangi operatör kullanılır?",
            codeSnippet: r'''int x = 10;
int *ptr = ___x;''',
            options: ["& (Address-of)", "* (Dereference)", "% (Mod)", "\$ (Value)"],
            correctIndex: 0,
            explanation: "'&' operatörü bir değişkenin RAM üzerindeki başlangıç adresini döner.",
          ),
          Question(
            id: "c_unit_7_l3_q13",
            type: QuestionType.fillInTheBlank,
            prompt: "Geçersiz veya henüz atanmamış bir işaretçiye güvenli başlangıç değeri olarak _____ atanmalıdır.",
            explanation: "İşaretçilere NULL atamak tanımsız belleğe erişimi ve segmentation fault hatalarını engellemeye yardımcı olur.",
            blankOptions: ["NULL", "0xFF", "void", "NaN"],
            correctBlankAnswer: "NULL",
          ),
          Question(
            id: "c_unit_7_l3_q14",
            type: QuestionType.fillInTheBlank,
            prompt: "Bir veri tipinin bellekte kaç bayt yer kapladığını öğrenmek için derleme zamanı operatörü olan _____ kullanılır.",
            explanation: "sizeof(tip) veya sizeof(degisken) bayt cinsinden bellek boyutunu size_t olarak döner.",
            blankOptions: ["sizeof", "lengthof", "bytesize", "countof"],
            correctBlankAnswer: "sizeof",
          ),
          Question(
            id: "c_unit_7_l3_q15",
            type: QuestionType.fillInTheBlank,
            prompt: "Açılmış bir dosya işaretçisini işletim sistemine geri iade etmek için _____ fonksiyonu çağrılır.",
            explanation: "fclose(FILE *stream) dosya tamponlarını diske yazar ve kaynakları kapatır.",
            blankOptions: ["fclose", "close", "file_exit", "dispose"],
            correctBlankAnswer: "fclose",
          ),
          Question(
            id: "c_unit_7_l3_q16",
            type: QuestionType.trueFalse,
            prompt: "C dilinde dizi isimleri ifadeler içinde kullanıldığında dizinin ilk elemanının bellek adresine (pointer) dönüşür (decay).",
            explanation: "Doğrudur, 'arr' ifadesi '&arr[0]' adresi ile eşdeğerdir.",
            isTrue: true,
          ),
          Question(
            id: "c_unit_7_l3_q17",
            type: QuestionType.trueFalse,
            prompt: "Stack belleğinde oluşturulan yerel değişkenler fonksiyon sonlandığında da bellekte kalmaya devam eder ve serbest bırakılması için free() gerekir.",
            explanation: "Yanlıştır! Stack bellek fonksiyon bitiminde otomatik temizlenir; free() sadece heap (malloc) için geçerlidir.",
            isTrue: false,
          ),
          Question(
            id: "c_unit_7_l3_q18",
            type: QuestionType.matching,
            prompt: "C bellek kavramlarını doğru açıklamalarıyla eşleştirin.",
            explanation: "C'de bellek güvenliği doğrudan yazılımcının sorumluluğundadır.",
            matchingPairs: [MatchingPair(left: "malloc", right: "Heap üzerinde başlatılmamış bellek tahsisi"), MatchingPair(left: "free", right: "Dinamik belleği sisteme iade etme"), MatchingPair(left: "Valgrind", right: "Bellek sızıntılarını tespit eden analiz aracı")],
          ),
        ],
      ),
      Lesson(
        id: "c_unit_7_l4",
        title: "Struct Padding & Bellek Hizalama (Alignment)",
        description: "İşlemcinin bayt hizalaması için bıraktığı boşluklar",
        xpReward: 35,
        gemReward: 12,
        isUnitExam: false,
        questions: [
          Question(
            id: "c_unit_7_l4_q1",
            type: QuestionType.conceptCard,
            conceptTitle: "Struct Padding & Bellek Hizalama (Alignment) - Hap Bilgi",
            rule: "C dilinde işaretçiler (pointers) doğrudan bellek adreslerini saklar. '&' operatörü bir değişkenin adresini alırken, '*' (dereference) o adresteki veriye erişir veya değiştirir.",
            codeExample: r'''#include <stdio.h>
#include <stdlib.h>

int main() {
    int x = 100;
    int *ptr = &x;
    
    printf("x Degeri: %d\n", *ptr);
    printf("x Bellek Adresi: %p\n", (void*)ptr);
    return 0;
}''',
            devTip: "malloc ile tahsis edilen her bayt bellek için mutlaka bir free() çağrısı yapılmalıdır, aksi halde Memory Leak oluşur.",
            iconEmoji: "⚡",
          ),
          Question(
            id: "c_unit_7_l4_q2",
            type: QuestionType.multipleChoice,
            prompt: "Bir struct içindeki bir işaretçi elemana erişirken '.' yerine hangi pratik operatör kullanılır?",
            codeSnippet: r'''struct User *u = getUser();
u___name = "Ahmet";''',
            options: ["-> (Ok operatörü)", ".", "::", "=>"],
            correctIndex: 0,
            explanation: "'u->name', '(*u).name' yazımının daha okunaklı ve standart kısayoludur.",
          ),
          Question(
            id: "c_unit_7_l4_q3",
            type: QuestionType.multipleChoice,
            prompt: "Herhangi bir veri tipine ait bellek adresini tutabilen jenerik (tip bağımsız) işaretçi tipi hangisidir?",
            codeSnippet: r'''___ generic_ptr = &x;''',
            options: ["void*", "any*", "object*", "generic*"],
            correctIndex: 0,
            explanation: "'void*' tipi belirsiz jenerik bir işaretçidir; doğrudan dereference edilemez, cast edilmesi gerekir.",
          ),
          Question(
            id: "c_unit_7_l4_q4",
            type: QuestionType.multipleChoice,
            prompt: "Serbest bırakılmış (free edilmiş) bir işaretçiyi kullanmaya devam etme hatasına ne ad verilir?",
            codeSnippet: r'''free(ptr);
printf("%d", *ptr); // HATA!''',
            options: ["Dangling Pointer (Askıda Kalan İşaretçi)", "Stack Overflow", "Memory Leak", "Deadlock"],
            correctIndex: 0,
            explanation: "free edildikten sonra hala o adresi göstermeye devam eden işaretçiye dangling pointer denir; 'ptr = NULL' yapılarak önlenir.",
          ),
          Question(
            id: "c_unit_7_l4_q5",
            type: QuestionType.multipleChoice,
            prompt: "C programlarında bellek sızıntılarını (memory leak) ve geçersiz bellek erişimlerini tespit etmek için en popüler Linux aracı hangisidir?",
            codeSnippet: r'''$ ___ --leak-check=full ./program''',
            options: ["valgrind", "gdb", "perf", "strace"],
            correctIndex: 0,
            explanation: "Valgrind (özellikle memcheck aracı) C/C++ programlarında bellek yönetim hatalarını ayrıntılı raporlar.",
          ),
          Question(
            id: "c_unit_7_l4_q6",
            type: QuestionType.multipleChoice,
            prompt: "Aşağıdaki bit düzeyinde (bitwise) operatörlerden hangisi bitleri 1 basamak sola kaydırarak 2 ile çarpmayı sağlar?",
            codeSnippet: r'''int x = 5;
int y = x ___ 1; // y = 10 olur''',
            options: ["<<", ">>", "&", "|"],
            correctIndex: 0,
            explanation: "Sola kaydırma (<< n) operatörü sayının değerini 2^n ile çarpar.",
          ),
          Question(
            id: "c_unit_7_l4_q7",
            type: QuestionType.multipleChoice,
            prompt: "C'de dosya açmak ve bir dosya işaretçisi (FILE*) elde etmek için hangi standart fonksiyon kullanılır?",
            codeSnippet: r'''FILE *f = ___("data.txt", "r");''',
            options: ["fopen", "open", "file_open", "create_file"],
            correctIndex: 0,
            explanation: "'fopen(dosya_adi, mod)' dosyayı belirtilen modda (r, w, a, rb, wb) açar.",
          ),
          Question(
            id: "c_unit_7_l4_q8",
            type: QuestionType.multipleChoice,
            prompt: "Bir header dosyasının birden fazla kez derlemeye dahil edilmesini (redefinition) önlemek için ne kullanılır?",
            codeSnippet: r'''#ifndef MY_HEADER_H
#define MY_HEADER_H
// ...
#endif''',
            options: ["Header Guards (#ifndef / #define)", "namespace", "pragma private", "module"],
            correctIndex: 0,
            explanation: "Header guards veya '#pragma once' başlık dosyalarının mükerrer include edilmesini engeller.",
          ),
          Question(
            id: "c_unit_7_l4_q9",
            type: QuestionType.multipleChoice,
            prompt: "Tüm üyelerinin bellekte AYNI başlangıç adresini paylaştığı ve en büyük üyesi kadar yer kaplayan yapı hangisidir?",
            codeSnippet: r'''___ Data {
    int i;
    float f;
    char str[20];
};''',
            options: ["union", "struct", "class", "shared"],
            correctIndex: 0,
            explanation: "'union' içindeki tüm elemanlar aynı bellek alanını ortaklaşa kullanır; aynı anda sadece biri geçerli değer tutar.",
          ),
          Question(
            id: "c_unit_7_l4_q10",
            type: QuestionType.multipleChoice,
            prompt: "C dilinde bir değişkenin bellekteki adresini elde etmek için hangi operatör kullanılır?",
            codeSnippet: r'''int x = 10;
int *ptr = ___x;''',
            options: ["& (Address-of)", "* (Dereference)", "% (Mod)", "\$ (Value)"],
            correctIndex: 0,
            explanation: "'&' operatörü bir değişkenin RAM üzerindeki başlangıç adresini döner.",
          ),
          Question(
            id: "c_unit_7_l4_q11",
            type: QuestionType.multipleChoice,
            prompt: "Bir işaretçinin (pointer) işaret ettiği bellek adresindeki veriye erişmek veya onu değiştirmek için hangi işlem yapılır?",
            codeSnippet: r'''int x = 5;
int *p = &x;
___p = 20; // x artik 20 olur''',
            options: ["* (Dereference)", "&", "->", "."],
            correctIndex: 0,
            explanation: "'*p' dereferencing yaparak işaretçinin tuttuğu adresteki asıl değere erişir.",
          ),
          Question(
            id: "c_unit_7_l4_q12",
            type: QuestionType.multipleChoice,
            prompt: "Heap bellekte dinamik olarak bayt cinsinden bellek tahsis etmek için hangi standart kütüphane fonksiyonu kullanılır?",
            codeSnippet: r'''int *arr = (int*)___(10 * sizeof(int));''',
            options: ["malloc", "alloc", "new", "heap_get"],
            correctIndex: 0,
            explanation: "'malloc(size_t size)' heap bölgesinde istenen bayt kadar bellek ayırır ve void* işaretçi döner.",
          ),
          Question(
            id: "c_unit_7_l4_q13",
            type: QuestionType.fillInTheBlank,
            prompt: "Geçersiz veya henüz atanmamış bir işaretçiye güvenli başlangıç değeri olarak _____ atanmalıdır.",
            explanation: "İşaretçilere NULL atamak tanımsız belleğe erişimi ve segmentation fault hatalarını engellemeye yardımcı olur.",
            blankOptions: ["NULL", "0xFF", "void", "NaN"],
            correctBlankAnswer: "NULL",
          ),
          Question(
            id: "c_unit_7_l4_q14",
            type: QuestionType.fillInTheBlank,
            prompt: "Bir veri tipinin bellekte kaç bayt yer kapladığını öğrenmek için derleme zamanı operatörü olan _____ kullanılır.",
            explanation: "sizeof(tip) veya sizeof(degisken) bayt cinsinden bellek boyutunu size_t olarak döner.",
            blankOptions: ["sizeof", "lengthof", "bytesize", "countof"],
            correctBlankAnswer: "sizeof",
          ),
          Question(
            id: "c_unit_7_l4_q15",
            type: QuestionType.fillInTheBlank,
            prompt: "Açılmış bir dosya işaretçisini işletim sistemine geri iade etmek için _____ fonksiyonu çağrılır.",
            explanation: "fclose(FILE *stream) dosya tamponlarını diske yazar ve kaynakları kapatır.",
            blankOptions: ["fclose", "close", "file_exit", "dispose"],
            correctBlankAnswer: "fclose",
          ),
          Question(
            id: "c_unit_7_l4_q16",
            type: QuestionType.trueFalse,
            prompt: "C dilinde dizi isimleri ifadeler içinde kullanıldığında dizinin ilk elemanının bellek adresine (pointer) dönüşür (decay).",
            explanation: "Doğrudur, 'arr' ifadesi '&arr[0]' adresi ile eşdeğerdir.",
            isTrue: true,
          ),
          Question(
            id: "c_unit_7_l4_q17",
            type: QuestionType.trueFalse,
            prompt: "Stack belleğinde oluşturulan yerel değişkenler fonksiyon sonlandığında da bellekte kalmaya devam eder ve serbest bırakılması için free() gerekir.",
            explanation: "Yanlıştır! Stack bellek fonksiyon bitiminde otomatik temizlenir; free() sadece heap (malloc) için geçerlidir.",
            isTrue: false,
          ),
          Question(
            id: "c_unit_7_l4_q18",
            type: QuestionType.matching,
            prompt: "C bellek kavramlarını doğru açıklamalarıyla eşleştirin.",
            explanation: "C'de bellek güvenliği doğrudan yazılımcının sorumluluğundadır.",
            matchingPairs: [MatchingPair(left: "malloc", right: "Heap üzerinde başlatılmamış bellek tahsisi"), MatchingPair(left: "free", right: "Dinamik belleği sisteme iade etme"), MatchingPair(left: "Valgrind", right: "Bellek sızıntılarını tespit eden analiz aracı")],
          ),
        ],
      ),
      Lesson(
        id: "c_unit_7_l5",
        title: "#pragma pack ile Padding'i Kapatma",
        description: "Ağ paketleri için sıkıştırılmış structlar",
        xpReward: 35,
        gemReward: 12,
        isUnitExam: false,
        questions: [
          Question(
            id: "c_unit_7_l5_q1",
            type: QuestionType.conceptCard,
            conceptTitle: "#pragma pack ile Padding'i Kapatma - Hap Bilgi",
            rule: "C dilinde işaretçiler (pointers) doğrudan bellek adreslerini saklar. '&' operatörü bir değişkenin adresini alırken, '*' (dereference) o adresteki veriye erişir veya değiştirir.",
            codeExample: r'''#include <stdio.h>
#include <stdlib.h>

int main() {
    int x = 100;
    int *ptr = &x;
    
    printf("x Degeri: %d\n", *ptr);
    printf("x Bellek Adresi: %p\n", (void*)ptr);
    return 0;
}''',
            devTip: "malloc ile tahsis edilen her bayt bellek için mutlaka bir free() çağrısı yapılmalıdır, aksi halde Memory Leak oluşur.",
            iconEmoji: "⚡",
          ),
          Question(
            id: "c_unit_7_l5_q2",
            type: QuestionType.multipleChoice,
            prompt: "Serbest bırakılmış (free edilmiş) bir işaretçiyi kullanmaya devam etme hatasına ne ad verilir?",
            codeSnippet: r'''free(ptr);
printf("%d", *ptr); // HATA!''',
            options: ["Dangling Pointer (Askıda Kalan İşaretçi)", "Stack Overflow", "Memory Leak", "Deadlock"],
            correctIndex: 0,
            explanation: "free edildikten sonra hala o adresi göstermeye devam eden işaretçiye dangling pointer denir; 'ptr = NULL' yapılarak önlenir.",
          ),
          Question(
            id: "c_unit_7_l5_q3",
            type: QuestionType.multipleChoice,
            prompt: "C programlarında bellek sızıntılarını (memory leak) ve geçersiz bellek erişimlerini tespit etmek için en popüler Linux aracı hangisidir?",
            codeSnippet: r'''$ ___ --leak-check=full ./program''',
            options: ["valgrind", "gdb", "perf", "strace"],
            correctIndex: 0,
            explanation: "Valgrind (özellikle memcheck aracı) C/C++ programlarında bellek yönetim hatalarını ayrıntılı raporlar.",
          ),
          Question(
            id: "c_unit_7_l5_q4",
            type: QuestionType.multipleChoice,
            prompt: "Aşağıdaki bit düzeyinde (bitwise) operatörlerden hangisi bitleri 1 basamak sola kaydırarak 2 ile çarpmayı sağlar?",
            codeSnippet: r'''int x = 5;
int y = x ___ 1; // y = 10 olur''',
            options: ["<<", ">>", "&", "|"],
            correctIndex: 0,
            explanation: "Sola kaydırma (<< n) operatörü sayının değerini 2^n ile çarpar.",
          ),
          Question(
            id: "c_unit_7_l5_q5",
            type: QuestionType.multipleChoice,
            prompt: "C'de dosya açmak ve bir dosya işaretçisi (FILE*) elde etmek için hangi standart fonksiyon kullanılır?",
            codeSnippet: r'''FILE *f = ___("data.txt", "r");''',
            options: ["fopen", "open", "file_open", "create_file"],
            correctIndex: 0,
            explanation: "'fopen(dosya_adi, mod)' dosyayı belirtilen modda (r, w, a, rb, wb) açar.",
          ),
          Question(
            id: "c_unit_7_l5_q6",
            type: QuestionType.multipleChoice,
            prompt: "Bir header dosyasının birden fazla kez derlemeye dahil edilmesini (redefinition) önlemek için ne kullanılır?",
            codeSnippet: r'''#ifndef MY_HEADER_H
#define MY_HEADER_H
// ...
#endif''',
            options: ["Header Guards (#ifndef / #define)", "namespace", "pragma private", "module"],
            correctIndex: 0,
            explanation: "Header guards veya '#pragma once' başlık dosyalarının mükerrer include edilmesini engeller.",
          ),
          Question(
            id: "c_unit_7_l5_q7",
            type: QuestionType.multipleChoice,
            prompt: "Tüm üyelerinin bellekte AYNI başlangıç adresini paylaştığı ve en büyük üyesi kadar yer kaplayan yapı hangisidir?",
            codeSnippet: r'''___ Data {
    int i;
    float f;
    char str[20];
};''',
            options: ["union", "struct", "class", "shared"],
            correctIndex: 0,
            explanation: "'union' içindeki tüm elemanlar aynı bellek alanını ortaklaşa kullanır; aynı anda sadece biri geçerli değer tutar.",
          ),
          Question(
            id: "c_unit_7_l5_q8",
            type: QuestionType.multipleChoice,
            prompt: "C dilinde bir değişkenin bellekteki adresini elde etmek için hangi operatör kullanılır?",
            codeSnippet: r'''int x = 10;
int *ptr = ___x;''',
            options: ["& (Address-of)", "* (Dereference)", "% (Mod)", "\$ (Value)"],
            correctIndex: 0,
            explanation: "'&' operatörü bir değişkenin RAM üzerindeki başlangıç adresini döner.",
          ),
          Question(
            id: "c_unit_7_l5_q9",
            type: QuestionType.multipleChoice,
            prompt: "Bir işaretçinin (pointer) işaret ettiği bellek adresindeki veriye erişmek veya onu değiştirmek için hangi işlem yapılır?",
            codeSnippet: r'''int x = 5;
int *p = &x;
___p = 20; // x artik 20 olur''',
            options: ["* (Dereference)", "&", "->", "."],
            correctIndex: 0,
            explanation: "'*p' dereferencing yaparak işaretçinin tuttuğu adresteki asıl değere erişir.",
          ),
          Question(
            id: "c_unit_7_l5_q10",
            type: QuestionType.multipleChoice,
            prompt: "Heap bellekte dinamik olarak bayt cinsinden bellek tahsis etmek için hangi standart kütüphane fonksiyonu kullanılır?",
            codeSnippet: r'''int *arr = (int*)___(10 * sizeof(int));''',
            options: ["malloc", "alloc", "new", "heap_get"],
            correctIndex: 0,
            explanation: "'malloc(size_t size)' heap bölgesinde istenen bayt kadar bellek ayırır ve void* işaretçi döner.",
          ),
          Question(
            id: "c_unit_7_l5_q11",
            type: QuestionType.multipleChoice,
            prompt: "malloc veya calloc ile tahsis edilen dinamik belleğin sisteme iade edilmesi için hangi fonksiyon çağrılmalıdır?",
            codeSnippet: r'''int *buf = malloc(1024);
// ... kullanim ...
___(buf);''',
            options: ["free", "delete", "release", "dispose"],
            correctIndex: 0,
            explanation: "'free(ptr)' heap bellekte ayrılan alanı serbest bırakır. Çağrılmazsa 'Memory Leak' oluşur.",
          ),
          Question(
            id: "c_unit_7_l5_q12",
            type: QuestionType.multipleChoice,
            prompt: "Tahsis ettiği belleği otomatik olarak sıfırlarla (0 baytları) dolduran dinamik bellek fonksiyonu hangisidir?",
            codeSnippet: r'''int *p = ___(100, sizeof(int));''',
            options: ["calloc", "malloc", "realloc", "zalloc"],
            correctIndex: 0,
            explanation: "'calloc(num, size)' eleman sayısı ve eleman boyutu alır, ayrılan tüm bellek hücrelerini 0 ile başlatır.",
          ),
          Question(
            id: "c_unit_7_l5_q13",
            type: QuestionType.fillInTheBlank,
            prompt: "Geçersiz veya henüz atanmamış bir işaretçiye güvenli başlangıç değeri olarak _____ atanmalıdır.",
            explanation: "İşaretçilere NULL atamak tanımsız belleğe erişimi ve segmentation fault hatalarını engellemeye yardımcı olur.",
            blankOptions: ["NULL", "0xFF", "void", "NaN"],
            correctBlankAnswer: "NULL",
          ),
          Question(
            id: "c_unit_7_l5_q14",
            type: QuestionType.fillInTheBlank,
            prompt: "Bir veri tipinin bellekte kaç bayt yer kapladığını öğrenmek için derleme zamanı operatörü olan _____ kullanılır.",
            explanation: "sizeof(tip) veya sizeof(degisken) bayt cinsinden bellek boyutunu size_t olarak döner.",
            blankOptions: ["sizeof", "lengthof", "bytesize", "countof"],
            correctBlankAnswer: "sizeof",
          ),
          Question(
            id: "c_unit_7_l5_q15",
            type: QuestionType.fillInTheBlank,
            prompt: "Açılmış bir dosya işaretçisini işletim sistemine geri iade etmek için _____ fonksiyonu çağrılır.",
            explanation: "fclose(FILE *stream) dosya tamponlarını diske yazar ve kaynakları kapatır.",
            blankOptions: ["fclose", "close", "file_exit", "dispose"],
            correctBlankAnswer: "fclose",
          ),
          Question(
            id: "c_unit_7_l5_q16",
            type: QuestionType.trueFalse,
            prompt: "C dilinde dizi isimleri ifadeler içinde kullanıldığında dizinin ilk elemanının bellek adresine (pointer) dönüşür (decay).",
            explanation: "Doğrudur, 'arr' ifadesi '&arr[0]' adresi ile eşdeğerdir.",
            isTrue: true,
          ),
          Question(
            id: "c_unit_7_l5_q17",
            type: QuestionType.trueFalse,
            prompt: "Stack belleğinde oluşturulan yerel değişkenler fonksiyon sonlandığında da bellekte kalmaya devam eder ve serbest bırakılması için free() gerekir.",
            explanation: "Yanlıştır! Stack bellek fonksiyon bitiminde otomatik temizlenir; free() sadece heap (malloc) için geçerlidir.",
            isTrue: false,
          ),
          Question(
            id: "c_unit_7_l5_q18",
            type: QuestionType.matching,
            prompt: "C bellek kavramlarını doğru açıklamalarıyla eşleştirin.",
            explanation: "C'de bellek güvenliği doğrudan yazılımcının sorumluluğundadır.",
            matchingPairs: [MatchingPair(left: "malloc", right: "Heap üzerinde başlatılmamış bellek tahsisi"), MatchingPair(left: "free", right: "Dinamik belleği sisteme iade etme"), MatchingPair(left: "Valgrind", right: "Bellek sızıntılarını tespit eden analiz aracı")],
          ),
        ],
      ),
      Lesson(
        id: "c_unit_7_l6",
        title: "union Mimarisi: Ortak Bellek Alanı Paylaşımı",
        description: "Tüm üyelerin aynı adresi paylaştığı yapılar",
        xpReward: 35,
        gemReward: 12,
        isUnitExam: false,
        questions: [
          Question(
            id: "c_unit_7_l6_q1",
            type: QuestionType.conceptCard,
            conceptTitle: "union Mimarisi: Ortak Bellek Alanı Paylaşımı - Hap Bilgi",
            rule: "C dilinde işaretçiler (pointers) doğrudan bellek adreslerini saklar. '&' operatörü bir değişkenin adresini alırken, '*' (dereference) o adresteki veriye erişir veya değiştirir.",
            codeExample: r'''#include <stdio.h>
#include <stdlib.h>

int main() {
    int x = 100;
    int *ptr = &x;
    
    printf("x Degeri: %d\n", *ptr);
    printf("x Bellek Adresi: %p\n", (void*)ptr);
    return 0;
}''',
            devTip: "malloc ile tahsis edilen her bayt bellek için mutlaka bir free() çağrısı yapılmalıdır, aksi halde Memory Leak oluşur.",
            iconEmoji: "⚡",
          ),
          Question(
            id: "c_unit_7_l6_q2",
            type: QuestionType.multipleChoice,
            prompt: "Aşağıdaki bit düzeyinde (bitwise) operatörlerden hangisi bitleri 1 basamak sola kaydırarak 2 ile çarpmayı sağlar?",
            codeSnippet: r'''int x = 5;
int y = x ___ 1; // y = 10 olur''',
            options: ["<<", ">>", "&", "|"],
            correctIndex: 0,
            explanation: "Sola kaydırma (<< n) operatörü sayının değerini 2^n ile çarpar.",
          ),
          Question(
            id: "c_unit_7_l6_q3",
            type: QuestionType.multipleChoice,
            prompt: "C'de dosya açmak ve bir dosya işaretçisi (FILE*) elde etmek için hangi standart fonksiyon kullanılır?",
            codeSnippet: r'''FILE *f = ___("data.txt", "r");''',
            options: ["fopen", "open", "file_open", "create_file"],
            correctIndex: 0,
            explanation: "'fopen(dosya_adi, mod)' dosyayı belirtilen modda (r, w, a, rb, wb) açar.",
          ),
          Question(
            id: "c_unit_7_l6_q4",
            type: QuestionType.multipleChoice,
            prompt: "Bir header dosyasının birden fazla kez derlemeye dahil edilmesini (redefinition) önlemek için ne kullanılır?",
            codeSnippet: r'''#ifndef MY_HEADER_H
#define MY_HEADER_H
// ...
#endif''',
            options: ["Header Guards (#ifndef / #define)", "namespace", "pragma private", "module"],
            correctIndex: 0,
            explanation: "Header guards veya '#pragma once' başlık dosyalarının mükerrer include edilmesini engeller.",
          ),
          Question(
            id: "c_unit_7_l6_q5",
            type: QuestionType.multipleChoice,
            prompt: "Tüm üyelerinin bellekte AYNI başlangıç adresini paylaştığı ve en büyük üyesi kadar yer kaplayan yapı hangisidir?",
            codeSnippet: r'''___ Data {
    int i;
    float f;
    char str[20];
};''',
            options: ["union", "struct", "class", "shared"],
            correctIndex: 0,
            explanation: "'union' içindeki tüm elemanlar aynı bellek alanını ortaklaşa kullanır; aynı anda sadece biri geçerli değer tutar.",
          ),
          Question(
            id: "c_unit_7_l6_q6",
            type: QuestionType.multipleChoice,
            prompt: "C dilinde bir değişkenin bellekteki adresini elde etmek için hangi operatör kullanılır?",
            codeSnippet: r'''int x = 10;
int *ptr = ___x;''',
            options: ["& (Address-of)", "* (Dereference)", "% (Mod)", "\$ (Value)"],
            correctIndex: 0,
            explanation: "'&' operatörü bir değişkenin RAM üzerindeki başlangıç adresini döner.",
          ),
          Question(
            id: "c_unit_7_l6_q7",
            type: QuestionType.multipleChoice,
            prompt: "Bir işaretçinin (pointer) işaret ettiği bellek adresindeki veriye erişmek veya onu değiştirmek için hangi işlem yapılır?",
            codeSnippet: r'''int x = 5;
int *p = &x;
___p = 20; // x artik 20 olur''',
            options: ["* (Dereference)", "&", "->", "."],
            correctIndex: 0,
            explanation: "'*p' dereferencing yaparak işaretçinin tuttuğu adresteki asıl değere erişir.",
          ),
          Question(
            id: "c_unit_7_l6_q8",
            type: QuestionType.multipleChoice,
            prompt: "Heap bellekte dinamik olarak bayt cinsinden bellek tahsis etmek için hangi standart kütüphane fonksiyonu kullanılır?",
            codeSnippet: r'''int *arr = (int*)___(10 * sizeof(int));''',
            options: ["malloc", "alloc", "new", "heap_get"],
            correctIndex: 0,
            explanation: "'malloc(size_t size)' heap bölgesinde istenen bayt kadar bellek ayırır ve void* işaretçi döner.",
          ),
          Question(
            id: "c_unit_7_l6_q9",
            type: QuestionType.multipleChoice,
            prompt: "malloc veya calloc ile tahsis edilen dinamik belleğin sisteme iade edilmesi için hangi fonksiyon çağrılmalıdır?",
            codeSnippet: r'''int *buf = malloc(1024);
// ... kullanim ...
___(buf);''',
            options: ["free", "delete", "release", "dispose"],
            correctIndex: 0,
            explanation: "'free(ptr)' heap bellekte ayrılan alanı serbest bırakır. Çağrılmazsa 'Memory Leak' oluşur.",
          ),
          Question(
            id: "c_unit_7_l6_q10",
            type: QuestionType.multipleChoice,
            prompt: "Tahsis ettiği belleği otomatik olarak sıfırlarla (0 baytları) dolduran dinamik bellek fonksiyonu hangisidir?",
            codeSnippet: r'''int *p = ___(100, sizeof(int));''',
            options: ["calloc", "malloc", "realloc", "zalloc"],
            correctIndex: 0,
            explanation: "'calloc(num, size)' eleman sayısı ve eleman boyutu alır, ayrılan tüm bellek hücrelerini 0 ile başlatır.",
          ),
          Question(
            id: "c_unit_7_l6_q11",
            type: QuestionType.multipleChoice,
            prompt: "Daha önce ayrılmış dinamik bir bellek bloğunun boyutunu veri kaybı olmadan büyütmek veya küçültmek için ne kullanılır?",
            codeSnippet: r'''ptr = ___(ptr, new_size);''',
            options: ["realloc", "resize", "remalloc", "expand"],
            correctIndex: 0,
            explanation: "'realloc' mevcut bloğu genişletir veya yeni bir konuma taşıyarak eski veriyi kopyalar.",
          ),
          Question(
            id: "c_unit_7_l6_q12",
            type: QuestionType.multipleChoice,
            prompt: "C programlama dilinde GCC derleme sürecinin doğru sırası aşağıdakilerden hangisidir?",
            options: ["Preprocessor -> Compiler -> Assembler -> Linker", "Compiler -> Preprocessor -> Linker -> Assembler", "Assembler -> Compiler -> Linker -> Preprocessor", "Linker -> Assembler -> Compiler -> Preprocessor"],
            correctIndex: 0,
            explanation: "Önce makrolar ve headerlar çözülür (cpp), C kodu Assembly'ye derlenir (cc1), makine koduna çevrilir (as), kütüphaneler bağlanır (ld).",
          ),
          Question(
            id: "c_unit_7_l6_q13",
            type: QuestionType.fillInTheBlank,
            prompt: "Geçersiz veya henüz atanmamış bir işaretçiye güvenli başlangıç değeri olarak _____ atanmalıdır.",
            explanation: "İşaretçilere NULL atamak tanımsız belleğe erişimi ve segmentation fault hatalarını engellemeye yardımcı olur.",
            blankOptions: ["NULL", "0xFF", "void", "NaN"],
            correctBlankAnswer: "NULL",
          ),
          Question(
            id: "c_unit_7_l6_q14",
            type: QuestionType.fillInTheBlank,
            prompt: "Bir veri tipinin bellekte kaç bayt yer kapladığını öğrenmek için derleme zamanı operatörü olan _____ kullanılır.",
            explanation: "sizeof(tip) veya sizeof(degisken) bayt cinsinden bellek boyutunu size_t olarak döner.",
            blankOptions: ["sizeof", "lengthof", "bytesize", "countof"],
            correctBlankAnswer: "sizeof",
          ),
          Question(
            id: "c_unit_7_l6_q15",
            type: QuestionType.fillInTheBlank,
            prompt: "Açılmış bir dosya işaretçisini işletim sistemine geri iade etmek için _____ fonksiyonu çağrılır.",
            explanation: "fclose(FILE *stream) dosya tamponlarını diske yazar ve kaynakları kapatır.",
            blankOptions: ["fclose", "close", "file_exit", "dispose"],
            correctBlankAnswer: "fclose",
          ),
          Question(
            id: "c_unit_7_l6_q16",
            type: QuestionType.trueFalse,
            prompt: "C dilinde dizi isimleri ifadeler içinde kullanıldığında dizinin ilk elemanının bellek adresine (pointer) dönüşür (decay).",
            explanation: "Doğrudur, 'arr' ifadesi '&arr[0]' adresi ile eşdeğerdir.",
            isTrue: true,
          ),
          Question(
            id: "c_unit_7_l6_q17",
            type: QuestionType.trueFalse,
            prompt: "Stack belleğinde oluşturulan yerel değişkenler fonksiyon sonlandığında da bellekte kalmaya devam eder ve serbest bırakılması için free() gerekir.",
            explanation: "Yanlıştır! Stack bellek fonksiyon bitiminde otomatik temizlenir; free() sadece heap (malloc) için geçerlidir.",
            isTrue: false,
          ),
          Question(
            id: "c_unit_7_l6_q18",
            type: QuestionType.matching,
            prompt: "C bellek kavramlarını doğru açıklamalarıyla eşleştirin.",
            explanation: "C'de bellek güvenliği doğrudan yazılımcının sorumluluğundadır.",
            matchingPairs: [MatchingPair(left: "malloc", right: "Heap üzerinde başlatılmamış bellek tahsisi"), MatchingPair(left: "free", right: "Dinamik belleği sisteme iade etme"), MatchingPair(left: "Valgrind", right: "Bellek sızıntılarını tespit eden analiz aracı")],
          ),
        ],
      ),
      Lesson(
        id: "c_unit_7_l7",
        title: "enum: Tip Güvenli ve Okunabilir Durum Sabitleri",
        description: "0, 1, 2 yerine anlamlı durum isimleri verme",
        xpReward: 35,
        gemReward: 12,
        isUnitExam: false,
        questions: [
          Question(
            id: "c_unit_7_l7_q1",
            type: QuestionType.conceptCard,
            conceptTitle: "enum: Tip Güvenli ve Okunabilir Durum Sabitleri - Hap Bilgi",
            rule: "C dilinde işaretçiler (pointers) doğrudan bellek adreslerini saklar. '&' operatörü bir değişkenin adresini alırken, '*' (dereference) o adresteki veriye erişir veya değiştirir.",
            codeExample: r'''#include <stdio.h>
#include <stdlib.h>

int main() {
    int x = 100;
    int *ptr = &x;
    
    printf("x Degeri: %d\n", *ptr);
    printf("x Bellek Adresi: %p\n", (void*)ptr);
    return 0;
}''',
            devTip: "malloc ile tahsis edilen her bayt bellek için mutlaka bir free() çağrısı yapılmalıdır, aksi halde Memory Leak oluşur.",
            iconEmoji: "⚡",
          ),
          Question(
            id: "c_unit_7_l7_q2",
            type: QuestionType.multipleChoice,
            prompt: "Bir header dosyasının birden fazla kez derlemeye dahil edilmesini (redefinition) önlemek için ne kullanılır?",
            codeSnippet: r'''#ifndef MY_HEADER_H
#define MY_HEADER_H
// ...
#endif''',
            options: ["Header Guards (#ifndef / #define)", "namespace", "pragma private", "module"],
            correctIndex: 0,
            explanation: "Header guards veya '#pragma once' başlık dosyalarının mükerrer include edilmesini engeller.",
          ),
          Question(
            id: "c_unit_7_l7_q3",
            type: QuestionType.multipleChoice,
            prompt: "Tüm üyelerinin bellekte AYNI başlangıç adresini paylaştığı ve en büyük üyesi kadar yer kaplayan yapı hangisidir?",
            codeSnippet: r'''___ Data {
    int i;
    float f;
    char str[20];
};''',
            options: ["union", "struct", "class", "shared"],
            correctIndex: 0,
            explanation: "'union' içindeki tüm elemanlar aynı bellek alanını ortaklaşa kullanır; aynı anda sadece biri geçerli değer tutar.",
          ),
          Question(
            id: "c_unit_7_l7_q4",
            type: QuestionType.multipleChoice,
            prompt: "C dilinde bir değişkenin bellekteki adresini elde etmek için hangi operatör kullanılır?",
            codeSnippet: r'''int x = 10;
int *ptr = ___x;''',
            options: ["& (Address-of)", "* (Dereference)", "% (Mod)", "\$ (Value)"],
            correctIndex: 0,
            explanation: "'&' operatörü bir değişkenin RAM üzerindeki başlangıç adresini döner.",
          ),
          Question(
            id: "c_unit_7_l7_q5",
            type: QuestionType.multipleChoice,
            prompt: "Bir işaretçinin (pointer) işaret ettiği bellek adresindeki veriye erişmek veya onu değiştirmek için hangi işlem yapılır?",
            codeSnippet: r'''int x = 5;
int *p = &x;
___p = 20; // x artik 20 olur''',
            options: ["* (Dereference)", "&", "->", "."],
            correctIndex: 0,
            explanation: "'*p' dereferencing yaparak işaretçinin tuttuğu adresteki asıl değere erişir.",
          ),
          Question(
            id: "c_unit_7_l7_q6",
            type: QuestionType.multipleChoice,
            prompt: "Heap bellekte dinamik olarak bayt cinsinden bellek tahsis etmek için hangi standart kütüphane fonksiyonu kullanılır?",
            codeSnippet: r'''int *arr = (int*)___(10 * sizeof(int));''',
            options: ["malloc", "alloc", "new", "heap_get"],
            correctIndex: 0,
            explanation: "'malloc(size_t size)' heap bölgesinde istenen bayt kadar bellek ayırır ve void* işaretçi döner.",
          ),
          Question(
            id: "c_unit_7_l7_q7",
            type: QuestionType.multipleChoice,
            prompt: "malloc veya calloc ile tahsis edilen dinamik belleğin sisteme iade edilmesi için hangi fonksiyon çağrılmalıdır?",
            codeSnippet: r'''int *buf = malloc(1024);
// ... kullanim ...
___(buf);''',
            options: ["free", "delete", "release", "dispose"],
            correctIndex: 0,
            explanation: "'free(ptr)' heap bellekte ayrılan alanı serbest bırakır. Çağrılmazsa 'Memory Leak' oluşur.",
          ),
          Question(
            id: "c_unit_7_l7_q8",
            type: QuestionType.multipleChoice,
            prompt: "Tahsis ettiği belleği otomatik olarak sıfırlarla (0 baytları) dolduran dinamik bellek fonksiyonu hangisidir?",
            codeSnippet: r'''int *p = ___(100, sizeof(int));''',
            options: ["calloc", "malloc", "realloc", "zalloc"],
            correctIndex: 0,
            explanation: "'calloc(num, size)' eleman sayısı ve eleman boyutu alır, ayrılan tüm bellek hücrelerini 0 ile başlatır.",
          ),
          Question(
            id: "c_unit_7_l7_q9",
            type: QuestionType.multipleChoice,
            prompt: "Daha önce ayrılmış dinamik bir bellek bloğunun boyutunu veri kaybı olmadan büyütmek veya küçültmek için ne kullanılır?",
            codeSnippet: r'''ptr = ___(ptr, new_size);''',
            options: ["realloc", "resize", "remalloc", "expand"],
            correctIndex: 0,
            explanation: "'realloc' mevcut bloğu genişletir veya yeni bir konuma taşıyarak eski veriyi kopyalar.",
          ),
          Question(
            id: "c_unit_7_l7_q10",
            type: QuestionType.multipleChoice,
            prompt: "C programlama dilinde GCC derleme sürecinin doğru sırası aşağıdakilerden hangisidir?",
            options: ["Preprocessor -> Compiler -> Assembler -> Linker", "Compiler -> Preprocessor -> Linker -> Assembler", "Assembler -> Compiler -> Linker -> Preprocessor", "Linker -> Assembler -> Compiler -> Preprocessor"],
            correctIndex: 0,
            explanation: "Önce makrolar ve headerlar çözülür (cpp), C kodu Assembly'ye derlenir (cc1), makine koduna çevrilir (as), kütüphaneler bağlanır (ld).",
          ),
          Question(
            id: "c_unit_7_l7_q11",
            type: QuestionType.multipleChoice,
            prompt: "64-bit modern bir mimaride standart bir işaretçi (pointer - int*, char*, void*) değişkeni bellekte kaç bayt yer kaplar?",
            codeSnippet: r'''printf("%zu", sizeof(int*));''',
            options: ["8 bayt", "4 bayt", "2 bayt", "16 bayt"],
            correctIndex: 0,
            explanation: "64-bit mimarilerde bellek adresleri 64 bit yani tam 8 bayttır. İşaretçinin tipi ne olursa olsun adres boyutu 8 bayttır.",
          ),
          Question(
            id: "c_unit_7_l7_q12",
            type: QuestionType.multipleChoice,
            prompt: "Bir struct içindeki bir işaretçi elemana erişirken '.' yerine hangi pratik operatör kullanılır?",
            codeSnippet: r'''struct User *u = getUser();
u___name = "Ahmet";''',
            options: ["-> (Ok operatörü)", ".", "::", "=>"],
            correctIndex: 0,
            explanation: "'u->name', '(*u).name' yazımının daha okunaklı ve standart kısayoludur.",
          ),
          Question(
            id: "c_unit_7_l7_q13",
            type: QuestionType.fillInTheBlank,
            prompt: "Geçersiz veya henüz atanmamış bir işaretçiye güvenli başlangıç değeri olarak _____ atanmalıdır.",
            explanation: "İşaretçilere NULL atamak tanımsız belleğe erişimi ve segmentation fault hatalarını engellemeye yardımcı olur.",
            blankOptions: ["NULL", "0xFF", "void", "NaN"],
            correctBlankAnswer: "NULL",
          ),
          Question(
            id: "c_unit_7_l7_q14",
            type: QuestionType.fillInTheBlank,
            prompt: "Bir veri tipinin bellekte kaç bayt yer kapladığını öğrenmek için derleme zamanı operatörü olan _____ kullanılır.",
            explanation: "sizeof(tip) veya sizeof(degisken) bayt cinsinden bellek boyutunu size_t olarak döner.",
            blankOptions: ["sizeof", "lengthof", "bytesize", "countof"],
            correctBlankAnswer: "sizeof",
          ),
          Question(
            id: "c_unit_7_l7_q15",
            type: QuestionType.fillInTheBlank,
            prompt: "Açılmış bir dosya işaretçisini işletim sistemine geri iade etmek için _____ fonksiyonu çağrılır.",
            explanation: "fclose(FILE *stream) dosya tamponlarını diske yazar ve kaynakları kapatır.",
            blankOptions: ["fclose", "close", "file_exit", "dispose"],
            correctBlankAnswer: "fclose",
          ),
          Question(
            id: "c_unit_7_l7_q16",
            type: QuestionType.trueFalse,
            prompt: "C dilinde dizi isimleri ifadeler içinde kullanıldığında dizinin ilk elemanının bellek adresine (pointer) dönüşür (decay).",
            explanation: "Doğrudur, 'arr' ifadesi '&arr[0]' adresi ile eşdeğerdir.",
            isTrue: true,
          ),
          Question(
            id: "c_unit_7_l7_q17",
            type: QuestionType.trueFalse,
            prompt: "Stack belleğinde oluşturulan yerel değişkenler fonksiyon sonlandığında da bellekte kalmaya devam eder ve serbest bırakılması için free() gerekir.",
            explanation: "Yanlıştır! Stack bellek fonksiyon bitiminde otomatik temizlenir; free() sadece heap (malloc) için geçerlidir.",
            isTrue: false,
          ),
          Question(
            id: "c_unit_7_l7_q18",
            type: QuestionType.matching,
            prompt: "C bellek kavramlarını doğru açıklamalarıyla eşleştirin.",
            explanation: "C'de bellek güvenliği doğrudan yazılımcının sorumluluğundadır.",
            matchingPairs: [MatchingPair(left: "malloc", right: "Heap üzerinde başlatılmamış bellek tahsisi"), MatchingPair(left: "free", right: "Dinamik belleği sisteme iade etme"), MatchingPair(left: "Valgrind", right: "Bellek sızıntılarını tespit eden analiz aracı")],
          ),
        ],
      ),
      Lesson(
        id: "c_unit_7_l8",
        title: "7. Ünite Structs, Unions & Padding Sınavı",
        description: "Veri modelleme ve bellek hizalama sınavı",
        xpReward: 50,
        gemReward: 25,
        isUnitExam: true,
        questions: [
          Question(
            id: "c_unit_7_l8_q1",
            type: QuestionType.conceptCard,
            conceptTitle: "7. Ünite Structs, Unions & Padding Sınavı - Hap Bilgi",
            rule: "C dilinde işaretçiler (pointers) doğrudan bellek adreslerini saklar. '&' operatörü bir değişkenin adresini alırken, '*' (dereference) o adresteki veriye erişir veya değiştirir.",
            codeExample: r'''#include <stdio.h>
#include <stdlib.h>

int main() {
    int x = 100;
    int *ptr = &x;
    
    printf("x Degeri: %d\n", *ptr);
    printf("x Bellek Adresi: %p\n", (void*)ptr);
    return 0;
}''',
            devTip: "malloc ile tahsis edilen her bayt bellek için mutlaka bir free() çağrısı yapılmalıdır, aksi halde Memory Leak oluşur.",
            iconEmoji: "⚡",
          ),
          Question(
            id: "c_unit_7_l8_q2",
            type: QuestionType.multipleChoice,
            prompt: "C dilinde bir değişkenin bellekteki adresini elde etmek için hangi operatör kullanılır?",
            codeSnippet: r'''int x = 10;
int *ptr = ___x;''',
            options: ["& (Address-of)", "* (Dereference)", "% (Mod)", "\$ (Value)"],
            correctIndex: 0,
            explanation: "'&' operatörü bir değişkenin RAM üzerindeki başlangıç adresini döner.",
          ),
          Question(
            id: "c_unit_7_l8_q3",
            type: QuestionType.multipleChoice,
            prompt: "Bir işaretçinin (pointer) işaret ettiği bellek adresindeki veriye erişmek veya onu değiştirmek için hangi işlem yapılır?",
            codeSnippet: r'''int x = 5;
int *p = &x;
___p = 20; // x artik 20 olur''',
            options: ["* (Dereference)", "&", "->", "."],
            correctIndex: 0,
            explanation: "'*p' dereferencing yaparak işaretçinin tuttuğu adresteki asıl değere erişir.",
          ),
          Question(
            id: "c_unit_7_l8_q4",
            type: QuestionType.multipleChoice,
            prompt: "Heap bellekte dinamik olarak bayt cinsinden bellek tahsis etmek için hangi standart kütüphane fonksiyonu kullanılır?",
            codeSnippet: r'''int *arr = (int*)___(10 * sizeof(int));''',
            options: ["malloc", "alloc", "new", "heap_get"],
            correctIndex: 0,
            explanation: "'malloc(size_t size)' heap bölgesinde istenen bayt kadar bellek ayırır ve void* işaretçi döner.",
          ),
          Question(
            id: "c_unit_7_l8_q5",
            type: QuestionType.multipleChoice,
            prompt: "malloc veya calloc ile tahsis edilen dinamik belleğin sisteme iade edilmesi için hangi fonksiyon çağrılmalıdır?",
            codeSnippet: r'''int *buf = malloc(1024);
// ... kullanim ...
___(buf);''',
            options: ["free", "delete", "release", "dispose"],
            correctIndex: 0,
            explanation: "'free(ptr)' heap bellekte ayrılan alanı serbest bırakır. Çağrılmazsa 'Memory Leak' oluşur.",
          ),
          Question(
            id: "c_unit_7_l8_q6",
            type: QuestionType.multipleChoice,
            prompt: "Tahsis ettiği belleği otomatik olarak sıfırlarla (0 baytları) dolduran dinamik bellek fonksiyonu hangisidir?",
            codeSnippet: r'''int *p = ___(100, sizeof(int));''',
            options: ["calloc", "malloc", "realloc", "zalloc"],
            correctIndex: 0,
            explanation: "'calloc(num, size)' eleman sayısı ve eleman boyutu alır, ayrılan tüm bellek hücrelerini 0 ile başlatır.",
          ),
          Question(
            id: "c_unit_7_l8_q7",
            type: QuestionType.multipleChoice,
            prompt: "Daha önce ayrılmış dinamik bir bellek bloğunun boyutunu veri kaybı olmadan büyütmek veya küçültmek için ne kullanılır?",
            codeSnippet: r'''ptr = ___(ptr, new_size);''',
            options: ["realloc", "resize", "remalloc", "expand"],
            correctIndex: 0,
            explanation: "'realloc' mevcut bloğu genişletir veya yeni bir konuma taşıyarak eski veriyi kopyalar.",
          ),
          Question(
            id: "c_unit_7_l8_q8",
            type: QuestionType.multipleChoice,
            prompt: "C programlama dilinde GCC derleme sürecinin doğru sırası aşağıdakilerden hangisidir?",
            options: ["Preprocessor -> Compiler -> Assembler -> Linker", "Compiler -> Preprocessor -> Linker -> Assembler", "Assembler -> Compiler -> Linker -> Preprocessor", "Linker -> Assembler -> Compiler -> Preprocessor"],
            correctIndex: 0,
            explanation: "Önce makrolar ve headerlar çözülür (cpp), C kodu Assembly'ye derlenir (cc1), makine koduna çevrilir (as), kütüphaneler bağlanır (ld).",
          ),
          Question(
            id: "c_unit_7_l8_q9",
            type: QuestionType.multipleChoice,
            prompt: "64-bit modern bir mimaride standart bir işaretçi (pointer - int*, char*, void*) değişkeni bellekte kaç bayt yer kaplar?",
            codeSnippet: r'''printf("%zu", sizeof(int*));''',
            options: ["8 bayt", "4 bayt", "2 bayt", "16 bayt"],
            correctIndex: 0,
            explanation: "64-bit mimarilerde bellek adresleri 64 bit yani tam 8 bayttır. İşaretçinin tipi ne olursa olsun adres boyutu 8 bayttır.",
          ),
          Question(
            id: "c_unit_7_l8_q10",
            type: QuestionType.multipleChoice,
            prompt: "Bir struct içindeki bir işaretçi elemana erişirken '.' yerine hangi pratik operatör kullanılır?",
            codeSnippet: r'''struct User *u = getUser();
u___name = "Ahmet";''',
            options: ["-> (Ok operatörü)", ".", "::", "=>"],
            correctIndex: 0,
            explanation: "'u->name', '(*u).name' yazımının daha okunaklı ve standart kısayoludur.",
          ),
          Question(
            id: "c_unit_7_l8_q11",
            type: QuestionType.multipleChoice,
            prompt: "Herhangi bir veri tipine ait bellek adresini tutabilen jenerik (tip bağımsız) işaretçi tipi hangisidir?",
            codeSnippet: r'''___ generic_ptr = &x;''',
            options: ["void*", "any*", "object*", "generic*"],
            correctIndex: 0,
            explanation: "'void*' tipi belirsiz jenerik bir işaretçidir; doğrudan dereference edilemez, cast edilmesi gerekir.",
          ),
          Question(
            id: "c_unit_7_l8_q12",
            type: QuestionType.multipleChoice,
            prompt: "Serbest bırakılmış (free edilmiş) bir işaretçiyi kullanmaya devam etme hatasına ne ad verilir?",
            codeSnippet: r'''free(ptr);
printf("%d", *ptr); // HATA!''',
            options: ["Dangling Pointer (Askıda Kalan İşaretçi)", "Stack Overflow", "Memory Leak", "Deadlock"],
            correctIndex: 0,
            explanation: "free edildikten sonra hala o adresi göstermeye devam eden işaretçiye dangling pointer denir; 'ptr = NULL' yapılarak önlenir.",
          ),
          Question(
            id: "c_unit_7_l8_q13",
            type: QuestionType.fillInTheBlank,
            prompt: "Geçersiz veya henüz atanmamış bir işaretçiye güvenli başlangıç değeri olarak _____ atanmalıdır.",
            explanation: "İşaretçilere NULL atamak tanımsız belleğe erişimi ve segmentation fault hatalarını engellemeye yardımcı olur.",
            blankOptions: ["NULL", "0xFF", "void", "NaN"],
            correctBlankAnswer: "NULL",
          ),
          Question(
            id: "c_unit_7_l8_q14",
            type: QuestionType.fillInTheBlank,
            prompt: "Bir veri tipinin bellekte kaç bayt yer kapladığını öğrenmek için derleme zamanı operatörü olan _____ kullanılır.",
            explanation: "sizeof(tip) veya sizeof(degisken) bayt cinsinden bellek boyutunu size_t olarak döner.",
            blankOptions: ["sizeof", "lengthof", "bytesize", "countof"],
            correctBlankAnswer: "sizeof",
          ),
          Question(
            id: "c_unit_7_l8_q15",
            type: QuestionType.fillInTheBlank,
            prompt: "Açılmış bir dosya işaretçisini işletim sistemine geri iade etmek için _____ fonksiyonu çağrılır.",
            explanation: "fclose(FILE *stream) dosya tamponlarını diske yazar ve kaynakları kapatır.",
            blankOptions: ["fclose", "close", "file_exit", "dispose"],
            correctBlankAnswer: "fclose",
          ),
          Question(
            id: "c_unit_7_l8_q16",
            type: QuestionType.trueFalse,
            prompt: "C dilinde dizi isimleri ifadeler içinde kullanıldığında dizinin ilk elemanının bellek adresine (pointer) dönüşür (decay).",
            explanation: "Doğrudur, 'arr' ifadesi '&arr[0]' adresi ile eşdeğerdir.",
            isTrue: true,
          ),
          Question(
            id: "c_unit_7_l8_q17",
            type: QuestionType.trueFalse,
            prompt: "Stack belleğinde oluşturulan yerel değişkenler fonksiyon sonlandığında da bellekte kalmaya devam eder ve serbest bırakılması için free() gerekir.",
            explanation: "Yanlıştır! Stack bellek fonksiyon bitiminde otomatik temizlenir; free() sadece heap (malloc) için geçerlidir.",
            isTrue: false,
          ),
          Question(
            id: "c_unit_7_l8_q18",
            type: QuestionType.matching,
            prompt: "C bellek kavramlarını doğru açıklamalarıyla eşleştirin.",
            explanation: "C'de bellek güvenliği doğrudan yazılımcının sorumluluğundadır.",
            matchingPairs: [MatchingPair(left: "malloc", right: "Heap üzerinde başlatılmamış bellek tahsisi"), MatchingPair(left: "free", right: "Dinamik belleği sisteme iade etme"), MatchingPair(left: "Valgrind", right: "Bellek sızıntılarını tespit eden analiz aracı")],
          ),
        ],
      ),
    ],
  ),
  LearningUnit(
    id: "c_unit_8",
    unitNumber: 8,
    title: "Düşük Seviye, Bitwise, Dosya I/O & Header Guards",
    language: CodeLanguage.c,
    category: "Bitwise & Dosya",
    colorHex: 0xFFEC4899,
    cheatSheetTitle: "C Bitwise & Dosya Hile Kağıdı",
    cheatSheetContent: r'''flags |= (1 << 3);  // 3. biti 1 yap
flags &= ~(1 << 3); // 3. biti 0 yap
FILE *f = fopen('d.bin', 'rb');
fread(buf, 1, sz, f); fclose(f);''',
    lessons: [
      Lesson(
        id: "c_unit_8_l1",
        title: "Bit Düzeyi Operatörler: &, |, ^, ~, <<, >>",
        description: "İkili sistemde bit manipulation işlemleri",
        xpReward: 35,
        gemReward: 12,
        isUnitExam: false,
        questions: [
          Question(
            id: "c_unit_8_l1_q1",
            type: QuestionType.conceptCard,
            conceptTitle: "Bit Düzeyi Operatörler: &, |, ^, ~, <<, >> - Hap Bilgi",
            rule: "C dilinde işaretçiler (pointers) doğrudan bellek adreslerini saklar. '&' operatörü bir değişkenin adresini alırken, '*' (dereference) o adresteki veriye erişir veya değiştirir.",
            codeExample: r'''#include <stdio.h>
#include <stdlib.h>

int main() {
    int x = 100;
    int *ptr = &x;
    
    printf("x Degeri: %d\n", *ptr);
    printf("x Bellek Adresi: %p\n", (void*)ptr);
    return 0;
}''',
            devTip: "malloc ile tahsis edilen her bayt bellek için mutlaka bir free() çağrısı yapılmalıdır, aksi halde Memory Leak oluşur.",
            iconEmoji: "⚡",
          ),
          Question(
            id: "c_unit_8_l1_q2",
            type: QuestionType.multipleChoice,
            prompt: "Heap bellekte dinamik olarak bayt cinsinden bellek tahsis etmek için hangi standart kütüphane fonksiyonu kullanılır?",
            codeSnippet: r'''int *arr = (int*)___(10 * sizeof(int));''',
            options: ["malloc", "alloc", "new", "heap_get"],
            correctIndex: 0,
            explanation: "'malloc(size_t size)' heap bölgesinde istenen bayt kadar bellek ayırır ve void* işaretçi döner.",
          ),
          Question(
            id: "c_unit_8_l1_q3",
            type: QuestionType.multipleChoice,
            prompt: "malloc veya calloc ile tahsis edilen dinamik belleğin sisteme iade edilmesi için hangi fonksiyon çağrılmalıdır?",
            codeSnippet: r'''int *buf = malloc(1024);
// ... kullanim ...
___(buf);''',
            options: ["free", "delete", "release", "dispose"],
            correctIndex: 0,
            explanation: "'free(ptr)' heap bellekte ayrılan alanı serbest bırakır. Çağrılmazsa 'Memory Leak' oluşur.",
          ),
          Question(
            id: "c_unit_8_l1_q4",
            type: QuestionType.multipleChoice,
            prompt: "Tahsis ettiği belleği otomatik olarak sıfırlarla (0 baytları) dolduran dinamik bellek fonksiyonu hangisidir?",
            codeSnippet: r'''int *p = ___(100, sizeof(int));''',
            options: ["calloc", "malloc", "realloc", "zalloc"],
            correctIndex: 0,
            explanation: "'calloc(num, size)' eleman sayısı ve eleman boyutu alır, ayrılan tüm bellek hücrelerini 0 ile başlatır.",
          ),
          Question(
            id: "c_unit_8_l1_q5",
            type: QuestionType.multipleChoice,
            prompt: "Daha önce ayrılmış dinamik bir bellek bloğunun boyutunu veri kaybı olmadan büyütmek veya küçültmek için ne kullanılır?",
            codeSnippet: r'''ptr = ___(ptr, new_size);''',
            options: ["realloc", "resize", "remalloc", "expand"],
            correctIndex: 0,
            explanation: "'realloc' mevcut bloğu genişletir veya yeni bir konuma taşıyarak eski veriyi kopyalar.",
          ),
          Question(
            id: "c_unit_8_l1_q6",
            type: QuestionType.multipleChoice,
            prompt: "C programlama dilinde GCC derleme sürecinin doğru sırası aşağıdakilerden hangisidir?",
            options: ["Preprocessor -> Compiler -> Assembler -> Linker", "Compiler -> Preprocessor -> Linker -> Assembler", "Assembler -> Compiler -> Linker -> Preprocessor", "Linker -> Assembler -> Compiler -> Preprocessor"],
            correctIndex: 0,
            explanation: "Önce makrolar ve headerlar çözülür (cpp), C kodu Assembly'ye derlenir (cc1), makine koduna çevrilir (as), kütüphaneler bağlanır (ld).",
          ),
          Question(
            id: "c_unit_8_l1_q7",
            type: QuestionType.multipleChoice,
            prompt: "64-bit modern bir mimaride standart bir işaretçi (pointer - int*, char*, void*) değişkeni bellekte kaç bayt yer kaplar?",
            codeSnippet: r'''printf("%zu", sizeof(int*));''',
            options: ["8 bayt", "4 bayt", "2 bayt", "16 bayt"],
            correctIndex: 0,
            explanation: "64-bit mimarilerde bellek adresleri 64 bit yani tam 8 bayttır. İşaretçinin tipi ne olursa olsun adres boyutu 8 bayttır.",
          ),
          Question(
            id: "c_unit_8_l1_q8",
            type: QuestionType.multipleChoice,
            prompt: "Bir struct içindeki bir işaretçi elemana erişirken '.' yerine hangi pratik operatör kullanılır?",
            codeSnippet: r'''struct User *u = getUser();
u___name = "Ahmet";''',
            options: ["-> (Ok operatörü)", ".", "::", "=>"],
            correctIndex: 0,
            explanation: "'u->name', '(*u).name' yazımının daha okunaklı ve standart kısayoludur.",
          ),
          Question(
            id: "c_unit_8_l1_q9",
            type: QuestionType.multipleChoice,
            prompt: "Herhangi bir veri tipine ait bellek adresini tutabilen jenerik (tip bağımsız) işaretçi tipi hangisidir?",
            codeSnippet: r'''___ generic_ptr = &x;''',
            options: ["void*", "any*", "object*", "generic*"],
            correctIndex: 0,
            explanation: "'void*' tipi belirsiz jenerik bir işaretçidir; doğrudan dereference edilemez, cast edilmesi gerekir.",
          ),
          Question(
            id: "c_unit_8_l1_q10",
            type: QuestionType.multipleChoice,
            prompt: "Serbest bırakılmış (free edilmiş) bir işaretçiyi kullanmaya devam etme hatasına ne ad verilir?",
            codeSnippet: r'''free(ptr);
printf("%d", *ptr); // HATA!''',
            options: ["Dangling Pointer (Askıda Kalan İşaretçi)", "Stack Overflow", "Memory Leak", "Deadlock"],
            correctIndex: 0,
            explanation: "free edildikten sonra hala o adresi göstermeye devam eden işaretçiye dangling pointer denir; 'ptr = NULL' yapılarak önlenir.",
          ),
          Question(
            id: "c_unit_8_l1_q11",
            type: QuestionType.multipleChoice,
            prompt: "C programlarında bellek sızıntılarını (memory leak) ve geçersiz bellek erişimlerini tespit etmek için en popüler Linux aracı hangisidir?",
            codeSnippet: r'''$ ___ --leak-check=full ./program''',
            options: ["valgrind", "gdb", "perf", "strace"],
            correctIndex: 0,
            explanation: "Valgrind (özellikle memcheck aracı) C/C++ programlarında bellek yönetim hatalarını ayrıntılı raporlar.",
          ),
          Question(
            id: "c_unit_8_l1_q12",
            type: QuestionType.multipleChoice,
            prompt: "Aşağıdaki bit düzeyinde (bitwise) operatörlerden hangisi bitleri 1 basamak sola kaydırarak 2 ile çarpmayı sağlar?",
            codeSnippet: r'''int x = 5;
int y = x ___ 1; // y = 10 olur''',
            options: ["<<", ">>", "&", "|"],
            correctIndex: 0,
            explanation: "Sola kaydırma (<< n) operatörü sayının değerini 2^n ile çarpar.",
          ),
          Question(
            id: "c_unit_8_l1_q13",
            type: QuestionType.fillInTheBlank,
            prompt: "Geçersiz veya henüz atanmamış bir işaretçiye güvenli başlangıç değeri olarak _____ atanmalıdır.",
            explanation: "İşaretçilere NULL atamak tanımsız belleğe erişimi ve segmentation fault hatalarını engellemeye yardımcı olur.",
            blankOptions: ["NULL", "0xFF", "void", "NaN"],
            correctBlankAnswer: "NULL",
          ),
          Question(
            id: "c_unit_8_l1_q14",
            type: QuestionType.fillInTheBlank,
            prompt: "Bir veri tipinin bellekte kaç bayt yer kapladığını öğrenmek için derleme zamanı operatörü olan _____ kullanılır.",
            explanation: "sizeof(tip) veya sizeof(degisken) bayt cinsinden bellek boyutunu size_t olarak döner.",
            blankOptions: ["sizeof", "lengthof", "bytesize", "countof"],
            correctBlankAnswer: "sizeof",
          ),
          Question(
            id: "c_unit_8_l1_q15",
            type: QuestionType.fillInTheBlank,
            prompt: "Açılmış bir dosya işaretçisini işletim sistemine geri iade etmek için _____ fonksiyonu çağrılır.",
            explanation: "fclose(FILE *stream) dosya tamponlarını diske yazar ve kaynakları kapatır.",
            blankOptions: ["fclose", "close", "file_exit", "dispose"],
            correctBlankAnswer: "fclose",
          ),
          Question(
            id: "c_unit_8_l1_q16",
            type: QuestionType.trueFalse,
            prompt: "C dilinde dizi isimleri ifadeler içinde kullanıldığında dizinin ilk elemanının bellek adresine (pointer) dönüşür (decay).",
            explanation: "Doğrudur, 'arr' ifadesi '&arr[0]' adresi ile eşdeğerdir.",
            isTrue: true,
          ),
          Question(
            id: "c_unit_8_l1_q17",
            type: QuestionType.trueFalse,
            prompt: "Stack belleğinde oluşturulan yerel değişkenler fonksiyon sonlandığında da bellekte kalmaya devam eder ve serbest bırakılması için free() gerekir.",
            explanation: "Yanlıştır! Stack bellek fonksiyon bitiminde otomatik temizlenir; free() sadece heap (malloc) için geçerlidir.",
            isTrue: false,
          ),
          Question(
            id: "c_unit_8_l1_q18",
            type: QuestionType.matching,
            prompt: "C bellek kavramlarını doğru açıklamalarıyla eşleştirin.",
            explanation: "C'de bellek güvenliği doğrudan yazılımcının sorumluluğundadır.",
            matchingPairs: [MatchingPair(left: "malloc", right: "Heap üzerinde başlatılmamış bellek tahsisi"), MatchingPair(left: "free", right: "Dinamik belleği sisteme iade etme"), MatchingPair(left: "Valgrind", right: "Bellek sızıntılarını tespit eden analiz aracı")],
          ),
        ],
      ),
      Lesson(
        id: "c_unit_8_l2",
        title: "Bit Maskeleme: Biti Açma (Set), Kapama (Clear), Tersleme",
        description: "Bayrak (flags) yönetiminde bit manipülasyonu",
        xpReward: 35,
        gemReward: 12,
        isUnitExam: false,
        questions: [
          Question(
            id: "c_unit_8_l2_q1",
            type: QuestionType.conceptCard,
            conceptTitle: "Bit Maskeleme: Biti Açma (Set), Kapama (Clear), Tersleme - Hap Bilgi",
            rule: "C dilinde işaretçiler (pointers) doğrudan bellek adreslerini saklar. '&' operatörü bir değişkenin adresini alırken, '*' (dereference) o adresteki veriye erişir veya değiştirir.",
            codeExample: r'''#include <stdio.h>
#include <stdlib.h>

int main() {
    int x = 100;
    int *ptr = &x;
    
    printf("x Degeri: %d\n", *ptr);
    printf("x Bellek Adresi: %p\n", (void*)ptr);
    return 0;
}''',
            devTip: "malloc ile tahsis edilen her bayt bellek için mutlaka bir free() çağrısı yapılmalıdır, aksi halde Memory Leak oluşur.",
            iconEmoji: "⚡",
          ),
          Question(
            id: "c_unit_8_l2_q2",
            type: QuestionType.multipleChoice,
            prompt: "Tahsis ettiği belleği otomatik olarak sıfırlarla (0 baytları) dolduran dinamik bellek fonksiyonu hangisidir?",
            codeSnippet: r'''int *p = ___(100, sizeof(int));''',
            options: ["calloc", "malloc", "realloc", "zalloc"],
            correctIndex: 0,
            explanation: "'calloc(num, size)' eleman sayısı ve eleman boyutu alır, ayrılan tüm bellek hücrelerini 0 ile başlatır.",
          ),
          Question(
            id: "c_unit_8_l2_q3",
            type: QuestionType.multipleChoice,
            prompt: "Daha önce ayrılmış dinamik bir bellek bloğunun boyutunu veri kaybı olmadan büyütmek veya küçültmek için ne kullanılır?",
            codeSnippet: r'''ptr = ___(ptr, new_size);''',
            options: ["realloc", "resize", "remalloc", "expand"],
            correctIndex: 0,
            explanation: "'realloc' mevcut bloğu genişletir veya yeni bir konuma taşıyarak eski veriyi kopyalar.",
          ),
          Question(
            id: "c_unit_8_l2_q4",
            type: QuestionType.multipleChoice,
            prompt: "C programlama dilinde GCC derleme sürecinin doğru sırası aşağıdakilerden hangisidir?",
            options: ["Preprocessor -> Compiler -> Assembler -> Linker", "Compiler -> Preprocessor -> Linker -> Assembler", "Assembler -> Compiler -> Linker -> Preprocessor", "Linker -> Assembler -> Compiler -> Preprocessor"],
            correctIndex: 0,
            explanation: "Önce makrolar ve headerlar çözülür (cpp), C kodu Assembly'ye derlenir (cc1), makine koduna çevrilir (as), kütüphaneler bağlanır (ld).",
          ),
          Question(
            id: "c_unit_8_l2_q5",
            type: QuestionType.multipleChoice,
            prompt: "64-bit modern bir mimaride standart bir işaretçi (pointer - int*, char*, void*) değişkeni bellekte kaç bayt yer kaplar?",
            codeSnippet: r'''printf("%zu", sizeof(int*));''',
            options: ["8 bayt", "4 bayt", "2 bayt", "16 bayt"],
            correctIndex: 0,
            explanation: "64-bit mimarilerde bellek adresleri 64 bit yani tam 8 bayttır. İşaretçinin tipi ne olursa olsun adres boyutu 8 bayttır.",
          ),
          Question(
            id: "c_unit_8_l2_q6",
            type: QuestionType.multipleChoice,
            prompt: "Bir struct içindeki bir işaretçi elemana erişirken '.' yerine hangi pratik operatör kullanılır?",
            codeSnippet: r'''struct User *u = getUser();
u___name = "Ahmet";''',
            options: ["-> (Ok operatörü)", ".", "::", "=>"],
            correctIndex: 0,
            explanation: "'u->name', '(*u).name' yazımının daha okunaklı ve standart kısayoludur.",
          ),
          Question(
            id: "c_unit_8_l2_q7",
            type: QuestionType.multipleChoice,
            prompt: "Herhangi bir veri tipine ait bellek adresini tutabilen jenerik (tip bağımsız) işaretçi tipi hangisidir?",
            codeSnippet: r'''___ generic_ptr = &x;''',
            options: ["void*", "any*", "object*", "generic*"],
            correctIndex: 0,
            explanation: "'void*' tipi belirsiz jenerik bir işaretçidir; doğrudan dereference edilemez, cast edilmesi gerekir.",
          ),
          Question(
            id: "c_unit_8_l2_q8",
            type: QuestionType.multipleChoice,
            prompt: "Serbest bırakılmış (free edilmiş) bir işaretçiyi kullanmaya devam etme hatasına ne ad verilir?",
            codeSnippet: r'''free(ptr);
printf("%d", *ptr); // HATA!''',
            options: ["Dangling Pointer (Askıda Kalan İşaretçi)", "Stack Overflow", "Memory Leak", "Deadlock"],
            correctIndex: 0,
            explanation: "free edildikten sonra hala o adresi göstermeye devam eden işaretçiye dangling pointer denir; 'ptr = NULL' yapılarak önlenir.",
          ),
          Question(
            id: "c_unit_8_l2_q9",
            type: QuestionType.multipleChoice,
            prompt: "C programlarında bellek sızıntılarını (memory leak) ve geçersiz bellek erişimlerini tespit etmek için en popüler Linux aracı hangisidir?",
            codeSnippet: r'''$ ___ --leak-check=full ./program''',
            options: ["valgrind", "gdb", "perf", "strace"],
            correctIndex: 0,
            explanation: "Valgrind (özellikle memcheck aracı) C/C++ programlarında bellek yönetim hatalarını ayrıntılı raporlar.",
          ),
          Question(
            id: "c_unit_8_l2_q10",
            type: QuestionType.multipleChoice,
            prompt: "Aşağıdaki bit düzeyinde (bitwise) operatörlerden hangisi bitleri 1 basamak sola kaydırarak 2 ile çarpmayı sağlar?",
            codeSnippet: r'''int x = 5;
int y = x ___ 1; // y = 10 olur''',
            options: ["<<", ">>", "&", "|"],
            correctIndex: 0,
            explanation: "Sola kaydırma (<< n) operatörü sayının değerini 2^n ile çarpar.",
          ),
          Question(
            id: "c_unit_8_l2_q11",
            type: QuestionType.multipleChoice,
            prompt: "C'de dosya açmak ve bir dosya işaretçisi (FILE*) elde etmek için hangi standart fonksiyon kullanılır?",
            codeSnippet: r'''FILE *f = ___("data.txt", "r");''',
            options: ["fopen", "open", "file_open", "create_file"],
            correctIndex: 0,
            explanation: "'fopen(dosya_adi, mod)' dosyayı belirtilen modda (r, w, a, rb, wb) açar.",
          ),
          Question(
            id: "c_unit_8_l2_q12",
            type: QuestionType.multipleChoice,
            prompt: "Bir header dosyasının birden fazla kez derlemeye dahil edilmesini (redefinition) önlemek için ne kullanılır?",
            codeSnippet: r'''#ifndef MY_HEADER_H
#define MY_HEADER_H
// ...
#endif''',
            options: ["Header Guards (#ifndef / #define)", "namespace", "pragma private", "module"],
            correctIndex: 0,
            explanation: "Header guards veya '#pragma once' başlık dosyalarının mükerrer include edilmesini engeller.",
          ),
          Question(
            id: "c_unit_8_l2_q13",
            type: QuestionType.fillInTheBlank,
            prompt: "Geçersiz veya henüz atanmamış bir işaretçiye güvenli başlangıç değeri olarak _____ atanmalıdır.",
            explanation: "İşaretçilere NULL atamak tanımsız belleğe erişimi ve segmentation fault hatalarını engellemeye yardımcı olur.",
            blankOptions: ["NULL", "0xFF", "void", "NaN"],
            correctBlankAnswer: "NULL",
          ),
          Question(
            id: "c_unit_8_l2_q14",
            type: QuestionType.fillInTheBlank,
            prompt: "Bir veri tipinin bellekte kaç bayt yer kapladığını öğrenmek için derleme zamanı operatörü olan _____ kullanılır.",
            explanation: "sizeof(tip) veya sizeof(degisken) bayt cinsinden bellek boyutunu size_t olarak döner.",
            blankOptions: ["sizeof", "lengthof", "bytesize", "countof"],
            correctBlankAnswer: "sizeof",
          ),
          Question(
            id: "c_unit_8_l2_q15",
            type: QuestionType.fillInTheBlank,
            prompt: "Açılmış bir dosya işaretçisini işletim sistemine geri iade etmek için _____ fonksiyonu çağrılır.",
            explanation: "fclose(FILE *stream) dosya tamponlarını diske yazar ve kaynakları kapatır.",
            blankOptions: ["fclose", "close", "file_exit", "dispose"],
            correctBlankAnswer: "fclose",
          ),
          Question(
            id: "c_unit_8_l2_q16",
            type: QuestionType.trueFalse,
            prompt: "C dilinde dizi isimleri ifadeler içinde kullanıldığında dizinin ilk elemanının bellek adresine (pointer) dönüşür (decay).",
            explanation: "Doğrudur, 'arr' ifadesi '&arr[0]' adresi ile eşdeğerdir.",
            isTrue: true,
          ),
          Question(
            id: "c_unit_8_l2_q17",
            type: QuestionType.trueFalse,
            prompt: "Stack belleğinde oluşturulan yerel değişkenler fonksiyon sonlandığında da bellekte kalmaya devam eder ve serbest bırakılması için free() gerekir.",
            explanation: "Yanlıştır! Stack bellek fonksiyon bitiminde otomatik temizlenir; free() sadece heap (malloc) için geçerlidir.",
            isTrue: false,
          ),
          Question(
            id: "c_unit_8_l2_q18",
            type: QuestionType.matching,
            prompt: "C bellek kavramlarını doğru açıklamalarıyla eşleştirin.",
            explanation: "C'de bellek güvenliği doğrudan yazılımcının sorumluluğundadır.",
            matchingPairs: [MatchingPair(left: "malloc", right: "Heap üzerinde başlatılmamış bellek tahsisi"), MatchingPair(left: "free", right: "Dinamik belleği sisteme iade etme"), MatchingPair(left: "Valgrind", right: "Bellek sızıntılarını tespit eden analiz aracı")],
          ),
        ],
      ),
      Lesson(
        id: "c_unit_8_l3",
        title: "Bit Fields: Struct İçinde Biti Sınırlandırma",
        description: "int field : 3 ile bayt tasarrufu yapma",
        xpReward: 35,
        gemReward: 12,
        isUnitExam: false,
        questions: [
          Question(
            id: "c_unit_8_l3_q1",
            type: QuestionType.conceptCard,
            conceptTitle: "Bit Fields: Struct İçinde Biti Sınırlandırma - Hap Bilgi",
            rule: "C dilinde işaretçiler (pointers) doğrudan bellek adreslerini saklar. '&' operatörü bir değişkenin adresini alırken, '*' (dereference) o adresteki veriye erişir veya değiştirir.",
            codeExample: r'''#include <stdio.h>
#include <stdlib.h>

int main() {
    int x = 100;
    int *ptr = &x;
    
    printf("x Degeri: %d\n", *ptr);
    printf("x Bellek Adresi: %p\n", (void*)ptr);
    return 0;
}''',
            devTip: "malloc ile tahsis edilen her bayt bellek için mutlaka bir free() çağrısı yapılmalıdır, aksi halde Memory Leak oluşur.",
            iconEmoji: "⚡",
          ),
          Question(
            id: "c_unit_8_l3_q2",
            type: QuestionType.multipleChoice,
            prompt: "C programlama dilinde GCC derleme sürecinin doğru sırası aşağıdakilerden hangisidir?",
            options: ["Preprocessor -> Compiler -> Assembler -> Linker", "Compiler -> Preprocessor -> Linker -> Assembler", "Assembler -> Compiler -> Linker -> Preprocessor", "Linker -> Assembler -> Compiler -> Preprocessor"],
            correctIndex: 0,
            explanation: "Önce makrolar ve headerlar çözülür (cpp), C kodu Assembly'ye derlenir (cc1), makine koduna çevrilir (as), kütüphaneler bağlanır (ld).",
          ),
          Question(
            id: "c_unit_8_l3_q3",
            type: QuestionType.multipleChoice,
            prompt: "64-bit modern bir mimaride standart bir işaretçi (pointer - int*, char*, void*) değişkeni bellekte kaç bayt yer kaplar?",
            codeSnippet: r'''printf("%zu", sizeof(int*));''',
            options: ["8 bayt", "4 bayt", "2 bayt", "16 bayt"],
            correctIndex: 0,
            explanation: "64-bit mimarilerde bellek adresleri 64 bit yani tam 8 bayttır. İşaretçinin tipi ne olursa olsun adres boyutu 8 bayttır.",
          ),
          Question(
            id: "c_unit_8_l3_q4",
            type: QuestionType.multipleChoice,
            prompt: "Bir struct içindeki bir işaretçi elemana erişirken '.' yerine hangi pratik operatör kullanılır?",
            codeSnippet: r'''struct User *u = getUser();
u___name = "Ahmet";''',
            options: ["-> (Ok operatörü)", ".", "::", "=>"],
            correctIndex: 0,
            explanation: "'u->name', '(*u).name' yazımının daha okunaklı ve standart kısayoludur.",
          ),
          Question(
            id: "c_unit_8_l3_q5",
            type: QuestionType.multipleChoice,
            prompt: "Herhangi bir veri tipine ait bellek adresini tutabilen jenerik (tip bağımsız) işaretçi tipi hangisidir?",
            codeSnippet: r'''___ generic_ptr = &x;''',
            options: ["void*", "any*", "object*", "generic*"],
            correctIndex: 0,
            explanation: "'void*' tipi belirsiz jenerik bir işaretçidir; doğrudan dereference edilemez, cast edilmesi gerekir.",
          ),
          Question(
            id: "c_unit_8_l3_q6",
            type: QuestionType.multipleChoice,
            prompt: "Serbest bırakılmış (free edilmiş) bir işaretçiyi kullanmaya devam etme hatasına ne ad verilir?",
            codeSnippet: r'''free(ptr);
printf("%d", *ptr); // HATA!''',
            options: ["Dangling Pointer (Askıda Kalan İşaretçi)", "Stack Overflow", "Memory Leak", "Deadlock"],
            correctIndex: 0,
            explanation: "free edildikten sonra hala o adresi göstermeye devam eden işaretçiye dangling pointer denir; 'ptr = NULL' yapılarak önlenir.",
          ),
          Question(
            id: "c_unit_8_l3_q7",
            type: QuestionType.multipleChoice,
            prompt: "C programlarında bellek sızıntılarını (memory leak) ve geçersiz bellek erişimlerini tespit etmek için en popüler Linux aracı hangisidir?",
            codeSnippet: r'''$ ___ --leak-check=full ./program''',
            options: ["valgrind", "gdb", "perf", "strace"],
            correctIndex: 0,
            explanation: "Valgrind (özellikle memcheck aracı) C/C++ programlarında bellek yönetim hatalarını ayrıntılı raporlar.",
          ),
          Question(
            id: "c_unit_8_l3_q8",
            type: QuestionType.multipleChoice,
            prompt: "Aşağıdaki bit düzeyinde (bitwise) operatörlerden hangisi bitleri 1 basamak sola kaydırarak 2 ile çarpmayı sağlar?",
            codeSnippet: r'''int x = 5;
int y = x ___ 1; // y = 10 olur''',
            options: ["<<", ">>", "&", "|"],
            correctIndex: 0,
            explanation: "Sola kaydırma (<< n) operatörü sayının değerini 2^n ile çarpar.",
          ),
          Question(
            id: "c_unit_8_l3_q9",
            type: QuestionType.multipleChoice,
            prompt: "C'de dosya açmak ve bir dosya işaretçisi (FILE*) elde etmek için hangi standart fonksiyon kullanılır?",
            codeSnippet: r'''FILE *f = ___("data.txt", "r");''',
            options: ["fopen", "open", "file_open", "create_file"],
            correctIndex: 0,
            explanation: "'fopen(dosya_adi, mod)' dosyayı belirtilen modda (r, w, a, rb, wb) açar.",
          ),
          Question(
            id: "c_unit_8_l3_q10",
            type: QuestionType.multipleChoice,
            prompt: "Bir header dosyasının birden fazla kez derlemeye dahil edilmesini (redefinition) önlemek için ne kullanılır?",
            codeSnippet: r'''#ifndef MY_HEADER_H
#define MY_HEADER_H
// ...
#endif''',
            options: ["Header Guards (#ifndef / #define)", "namespace", "pragma private", "module"],
            correctIndex: 0,
            explanation: "Header guards veya '#pragma once' başlık dosyalarının mükerrer include edilmesini engeller.",
          ),
          Question(
            id: "c_unit_8_l3_q11",
            type: QuestionType.multipleChoice,
            prompt: "Tüm üyelerinin bellekte AYNI başlangıç adresini paylaştığı ve en büyük üyesi kadar yer kaplayan yapı hangisidir?",
            codeSnippet: r'''___ Data {
    int i;
    float f;
    char str[20];
};''',
            options: ["union", "struct", "class", "shared"],
            correctIndex: 0,
            explanation: "'union' içindeki tüm elemanlar aynı bellek alanını ortaklaşa kullanır; aynı anda sadece biri geçerli değer tutar.",
          ),
          Question(
            id: "c_unit_8_l3_q12",
            type: QuestionType.multipleChoice,
            prompt: "C dilinde bir değişkenin bellekteki adresini elde etmek için hangi operatör kullanılır?",
            codeSnippet: r'''int x = 10;
int *ptr = ___x;''',
            options: ["& (Address-of)", "* (Dereference)", "% (Mod)", "\$ (Value)"],
            correctIndex: 0,
            explanation: "'&' operatörü bir değişkenin RAM üzerindeki başlangıç adresini döner.",
          ),
          Question(
            id: "c_unit_8_l3_q13",
            type: QuestionType.fillInTheBlank,
            prompt: "Geçersiz veya henüz atanmamış bir işaretçiye güvenli başlangıç değeri olarak _____ atanmalıdır.",
            explanation: "İşaretçilere NULL atamak tanımsız belleğe erişimi ve segmentation fault hatalarını engellemeye yardımcı olur.",
            blankOptions: ["NULL", "0xFF", "void", "NaN"],
            correctBlankAnswer: "NULL",
          ),
          Question(
            id: "c_unit_8_l3_q14",
            type: QuestionType.fillInTheBlank,
            prompt: "Bir veri tipinin bellekte kaç bayt yer kapladığını öğrenmek için derleme zamanı operatörü olan _____ kullanılır.",
            explanation: "sizeof(tip) veya sizeof(degisken) bayt cinsinden bellek boyutunu size_t olarak döner.",
            blankOptions: ["sizeof", "lengthof", "bytesize", "countof"],
            correctBlankAnswer: "sizeof",
          ),
          Question(
            id: "c_unit_8_l3_q15",
            type: QuestionType.fillInTheBlank,
            prompt: "Açılmış bir dosya işaretçisini işletim sistemine geri iade etmek için _____ fonksiyonu çağrılır.",
            explanation: "fclose(FILE *stream) dosya tamponlarını diske yazar ve kaynakları kapatır.",
            blankOptions: ["fclose", "close", "file_exit", "dispose"],
            correctBlankAnswer: "fclose",
          ),
          Question(
            id: "c_unit_8_l3_q16",
            type: QuestionType.trueFalse,
            prompt: "C dilinde dizi isimleri ifadeler içinde kullanıldığında dizinin ilk elemanının bellek adresine (pointer) dönüşür (decay).",
            explanation: "Doğrudur, 'arr' ifadesi '&arr[0]' adresi ile eşdeğerdir.",
            isTrue: true,
          ),
          Question(
            id: "c_unit_8_l3_q17",
            type: QuestionType.trueFalse,
            prompt: "Stack belleğinde oluşturulan yerel değişkenler fonksiyon sonlandığında da bellekte kalmaya devam eder ve serbest bırakılması için free() gerekir.",
            explanation: "Yanlıştır! Stack bellek fonksiyon bitiminde otomatik temizlenir; free() sadece heap (malloc) için geçerlidir.",
            isTrue: false,
          ),
          Question(
            id: "c_unit_8_l3_q18",
            type: QuestionType.matching,
            prompt: "C bellek kavramlarını doğru açıklamalarıyla eşleştirin.",
            explanation: "C'de bellek güvenliği doğrudan yazılımcının sorumluluğundadır.",
            matchingPairs: [MatchingPair(left: "malloc", right: "Heap üzerinde başlatılmamış bellek tahsisi"), MatchingPair(left: "free", right: "Dinamik belleği sisteme iade etme"), MatchingPair(left: "Valgrind", right: "Bellek sızıntılarını tespit eden analiz aracı")],
          ),
        ],
      ),
      Lesson(
        id: "c_unit_8_l4",
        title: "Dosya İşlemleri: fopen(), fclose() & Modlar (r, w, a, rb)",
        description: "Dosya işaretçisi (FILE*) yönetimi",
        xpReward: 35,
        gemReward: 12,
        isUnitExam: false,
        questions: [
          Question(
            id: "c_unit_8_l4_q1",
            type: QuestionType.conceptCard,
            conceptTitle: "Dosya İşlemleri: fopen(), fclose() & Modlar (r, w, a, rb) - Hap Bilgi",
            rule: "C dilinde işaretçiler (pointers) doğrudan bellek adreslerini saklar. '&' operatörü bir değişkenin adresini alırken, '*' (dereference) o adresteki veriye erişir veya değiştirir.",
            codeExample: r'''#include <stdio.h>
#include <stdlib.h>

int main() {
    int x = 100;
    int *ptr = &x;
    
    printf("x Degeri: %d\n", *ptr);
    printf("x Bellek Adresi: %p\n", (void*)ptr);
    return 0;
}''',
            devTip: "malloc ile tahsis edilen her bayt bellek için mutlaka bir free() çağrısı yapılmalıdır, aksi halde Memory Leak oluşur.",
            iconEmoji: "⚡",
          ),
          Question(
            id: "c_unit_8_l4_q2",
            type: QuestionType.multipleChoice,
            prompt: "Bir struct içindeki bir işaretçi elemana erişirken '.' yerine hangi pratik operatör kullanılır?",
            codeSnippet: r'''struct User *u = getUser();
u___name = "Ahmet";''',
            options: ["-> (Ok operatörü)", ".", "::", "=>"],
            correctIndex: 0,
            explanation: "'u->name', '(*u).name' yazımının daha okunaklı ve standart kısayoludur.",
          ),
          Question(
            id: "c_unit_8_l4_q3",
            type: QuestionType.multipleChoice,
            prompt: "Herhangi bir veri tipine ait bellek adresini tutabilen jenerik (tip bağımsız) işaretçi tipi hangisidir?",
            codeSnippet: r'''___ generic_ptr = &x;''',
            options: ["void*", "any*", "object*", "generic*"],
            correctIndex: 0,
            explanation: "'void*' tipi belirsiz jenerik bir işaretçidir; doğrudan dereference edilemez, cast edilmesi gerekir.",
          ),
          Question(
            id: "c_unit_8_l4_q4",
            type: QuestionType.multipleChoice,
            prompt: "Serbest bırakılmış (free edilmiş) bir işaretçiyi kullanmaya devam etme hatasına ne ad verilir?",
            codeSnippet: r'''free(ptr);
printf("%d", *ptr); // HATA!''',
            options: ["Dangling Pointer (Askıda Kalan İşaretçi)", "Stack Overflow", "Memory Leak", "Deadlock"],
            correctIndex: 0,
            explanation: "free edildikten sonra hala o adresi göstermeye devam eden işaretçiye dangling pointer denir; 'ptr = NULL' yapılarak önlenir.",
          ),
          Question(
            id: "c_unit_8_l4_q5",
            type: QuestionType.multipleChoice,
            prompt: "C programlarında bellek sızıntılarını (memory leak) ve geçersiz bellek erişimlerini tespit etmek için en popüler Linux aracı hangisidir?",
            codeSnippet: r'''$ ___ --leak-check=full ./program''',
            options: ["valgrind", "gdb", "perf", "strace"],
            correctIndex: 0,
            explanation: "Valgrind (özellikle memcheck aracı) C/C++ programlarında bellek yönetim hatalarını ayrıntılı raporlar.",
          ),
          Question(
            id: "c_unit_8_l4_q6",
            type: QuestionType.multipleChoice,
            prompt: "Aşağıdaki bit düzeyinde (bitwise) operatörlerden hangisi bitleri 1 basamak sola kaydırarak 2 ile çarpmayı sağlar?",
            codeSnippet: r'''int x = 5;
int y = x ___ 1; // y = 10 olur''',
            options: ["<<", ">>", "&", "|"],
            correctIndex: 0,
            explanation: "Sola kaydırma (<< n) operatörü sayının değerini 2^n ile çarpar.",
          ),
          Question(
            id: "c_unit_8_l4_q7",
            type: QuestionType.multipleChoice,
            prompt: "C'de dosya açmak ve bir dosya işaretçisi (FILE*) elde etmek için hangi standart fonksiyon kullanılır?",
            codeSnippet: r'''FILE *f = ___("data.txt", "r");''',
            options: ["fopen", "open", "file_open", "create_file"],
            correctIndex: 0,
            explanation: "'fopen(dosya_adi, mod)' dosyayı belirtilen modda (r, w, a, rb, wb) açar.",
          ),
          Question(
            id: "c_unit_8_l4_q8",
            type: QuestionType.multipleChoice,
            prompt: "Bir header dosyasının birden fazla kez derlemeye dahil edilmesini (redefinition) önlemek için ne kullanılır?",
            codeSnippet: r'''#ifndef MY_HEADER_H
#define MY_HEADER_H
// ...
#endif''',
            options: ["Header Guards (#ifndef / #define)", "namespace", "pragma private", "module"],
            correctIndex: 0,
            explanation: "Header guards veya '#pragma once' başlık dosyalarının mükerrer include edilmesini engeller.",
          ),
          Question(
            id: "c_unit_8_l4_q9",
            type: QuestionType.multipleChoice,
            prompt: "Tüm üyelerinin bellekte AYNI başlangıç adresini paylaştığı ve en büyük üyesi kadar yer kaplayan yapı hangisidir?",
            codeSnippet: r'''___ Data {
    int i;
    float f;
    char str[20];
};''',
            options: ["union", "struct", "class", "shared"],
            correctIndex: 0,
            explanation: "'union' içindeki tüm elemanlar aynı bellek alanını ortaklaşa kullanır; aynı anda sadece biri geçerli değer tutar.",
          ),
          Question(
            id: "c_unit_8_l4_q10",
            type: QuestionType.multipleChoice,
            prompt: "C dilinde bir değişkenin bellekteki adresini elde etmek için hangi operatör kullanılır?",
            codeSnippet: r'''int x = 10;
int *ptr = ___x;''',
            options: ["& (Address-of)", "* (Dereference)", "% (Mod)", "\$ (Value)"],
            correctIndex: 0,
            explanation: "'&' operatörü bir değişkenin RAM üzerindeki başlangıç adresini döner.",
          ),
          Question(
            id: "c_unit_8_l4_q11",
            type: QuestionType.multipleChoice,
            prompt: "Bir işaretçinin (pointer) işaret ettiği bellek adresindeki veriye erişmek veya onu değiştirmek için hangi işlem yapılır?",
            codeSnippet: r'''int x = 5;
int *p = &x;
___p = 20; // x artik 20 olur''',
            options: ["* (Dereference)", "&", "->", "."],
            correctIndex: 0,
            explanation: "'*p' dereferencing yaparak işaretçinin tuttuğu adresteki asıl değere erişir.",
          ),
          Question(
            id: "c_unit_8_l4_q12",
            type: QuestionType.multipleChoice,
            prompt: "Heap bellekte dinamik olarak bayt cinsinden bellek tahsis etmek için hangi standart kütüphane fonksiyonu kullanılır?",
            codeSnippet: r'''int *arr = (int*)___(10 * sizeof(int));''',
            options: ["malloc", "alloc", "new", "heap_get"],
            correctIndex: 0,
            explanation: "'malloc(size_t size)' heap bölgesinde istenen bayt kadar bellek ayırır ve void* işaretçi döner.",
          ),
          Question(
            id: "c_unit_8_l4_q13",
            type: QuestionType.fillInTheBlank,
            prompt: "Geçersiz veya henüz atanmamış bir işaretçiye güvenli başlangıç değeri olarak _____ atanmalıdır.",
            explanation: "İşaretçilere NULL atamak tanımsız belleğe erişimi ve segmentation fault hatalarını engellemeye yardımcı olur.",
            blankOptions: ["NULL", "0xFF", "void", "NaN"],
            correctBlankAnswer: "NULL",
          ),
          Question(
            id: "c_unit_8_l4_q14",
            type: QuestionType.fillInTheBlank,
            prompt: "Bir veri tipinin bellekte kaç bayt yer kapladığını öğrenmek için derleme zamanı operatörü olan _____ kullanılır.",
            explanation: "sizeof(tip) veya sizeof(degisken) bayt cinsinden bellek boyutunu size_t olarak döner.",
            blankOptions: ["sizeof", "lengthof", "bytesize", "countof"],
            correctBlankAnswer: "sizeof",
          ),
          Question(
            id: "c_unit_8_l4_q15",
            type: QuestionType.fillInTheBlank,
            prompt: "Açılmış bir dosya işaretçisini işletim sistemine geri iade etmek için _____ fonksiyonu çağrılır.",
            explanation: "fclose(FILE *stream) dosya tamponlarını diske yazar ve kaynakları kapatır.",
            blankOptions: ["fclose", "close", "file_exit", "dispose"],
            correctBlankAnswer: "fclose",
          ),
          Question(
            id: "c_unit_8_l4_q16",
            type: QuestionType.trueFalse,
            prompt: "C dilinde dizi isimleri ifadeler içinde kullanıldığında dizinin ilk elemanının bellek adresine (pointer) dönüşür (decay).",
            explanation: "Doğrudur, 'arr' ifadesi '&arr[0]' adresi ile eşdeğerdir.",
            isTrue: true,
          ),
          Question(
            id: "c_unit_8_l4_q17",
            type: QuestionType.trueFalse,
            prompt: "Stack belleğinde oluşturulan yerel değişkenler fonksiyon sonlandığında da bellekte kalmaya devam eder ve serbest bırakılması için free() gerekir.",
            explanation: "Yanlıştır! Stack bellek fonksiyon bitiminde otomatik temizlenir; free() sadece heap (malloc) için geçerlidir.",
            isTrue: false,
          ),
          Question(
            id: "c_unit_8_l4_q18",
            type: QuestionType.matching,
            prompt: "C bellek kavramlarını doğru açıklamalarıyla eşleştirin.",
            explanation: "C'de bellek güvenliği doğrudan yazılımcının sorumluluğundadır.",
            matchingPairs: [MatchingPair(left: "malloc", right: "Heap üzerinde başlatılmamış bellek tahsisi"), MatchingPair(left: "free", right: "Dinamik belleği sisteme iade etme"), MatchingPair(left: "Valgrind", right: "Bellek sızıntılarını tespit eden analiz aracı")],
          ),
        ],
      ),
      Lesson(
        id: "c_unit_8_l5",
        title: "İkili Dosya Okuma/Yazma: fread() & fwrite()",
        description: "Structları doğrudan diske yazıp okuma",
        xpReward: 35,
        gemReward: 12,
        isUnitExam: false,
        questions: [
          Question(
            id: "c_unit_8_l5_q1",
            type: QuestionType.conceptCard,
            conceptTitle: "İkili Dosya Okuma/Yazma: fread() & fwrite() - Hap Bilgi",
            rule: "C dilinde işaretçiler (pointers) doğrudan bellek adreslerini saklar. '&' operatörü bir değişkenin adresini alırken, '*' (dereference) o adresteki veriye erişir veya değiştirir.",
            codeExample: r'''#include <stdio.h>
#include <stdlib.h>

int main() {
    int x = 100;
    int *ptr = &x;
    
    printf("x Degeri: %d\n", *ptr);
    printf("x Bellek Adresi: %p\n", (void*)ptr);
    return 0;
}''',
            devTip: "malloc ile tahsis edilen her bayt bellek için mutlaka bir free() çağrısı yapılmalıdır, aksi halde Memory Leak oluşur.",
            iconEmoji: "⚡",
          ),
          Question(
            id: "c_unit_8_l5_q2",
            type: QuestionType.multipleChoice,
            prompt: "Serbest bırakılmış (free edilmiş) bir işaretçiyi kullanmaya devam etme hatasına ne ad verilir?",
            codeSnippet: r'''free(ptr);
printf("%d", *ptr); // HATA!''',
            options: ["Dangling Pointer (Askıda Kalan İşaretçi)", "Stack Overflow", "Memory Leak", "Deadlock"],
            correctIndex: 0,
            explanation: "free edildikten sonra hala o adresi göstermeye devam eden işaretçiye dangling pointer denir; 'ptr = NULL' yapılarak önlenir.",
          ),
          Question(
            id: "c_unit_8_l5_q3",
            type: QuestionType.multipleChoice,
            prompt: "C programlarında bellek sızıntılarını (memory leak) ve geçersiz bellek erişimlerini tespit etmek için en popüler Linux aracı hangisidir?",
            codeSnippet: r'''$ ___ --leak-check=full ./program''',
            options: ["valgrind", "gdb", "perf", "strace"],
            correctIndex: 0,
            explanation: "Valgrind (özellikle memcheck aracı) C/C++ programlarında bellek yönetim hatalarını ayrıntılı raporlar.",
          ),
          Question(
            id: "c_unit_8_l5_q4",
            type: QuestionType.multipleChoice,
            prompt: "Aşağıdaki bit düzeyinde (bitwise) operatörlerden hangisi bitleri 1 basamak sola kaydırarak 2 ile çarpmayı sağlar?",
            codeSnippet: r'''int x = 5;
int y = x ___ 1; // y = 10 olur''',
            options: ["<<", ">>", "&", "|"],
            correctIndex: 0,
            explanation: "Sola kaydırma (<< n) operatörü sayının değerini 2^n ile çarpar.",
          ),
          Question(
            id: "c_unit_8_l5_q5",
            type: QuestionType.multipleChoice,
            prompt: "C'de dosya açmak ve bir dosya işaretçisi (FILE*) elde etmek için hangi standart fonksiyon kullanılır?",
            codeSnippet: r'''FILE *f = ___("data.txt", "r");''',
            options: ["fopen", "open", "file_open", "create_file"],
            correctIndex: 0,
            explanation: "'fopen(dosya_adi, mod)' dosyayı belirtilen modda (r, w, a, rb, wb) açar.",
          ),
          Question(
            id: "c_unit_8_l5_q6",
            type: QuestionType.multipleChoice,
            prompt: "Bir header dosyasının birden fazla kez derlemeye dahil edilmesini (redefinition) önlemek için ne kullanılır?",
            codeSnippet: r'''#ifndef MY_HEADER_H
#define MY_HEADER_H
// ...
#endif''',
            options: ["Header Guards (#ifndef / #define)", "namespace", "pragma private", "module"],
            correctIndex: 0,
            explanation: "Header guards veya '#pragma once' başlık dosyalarının mükerrer include edilmesini engeller.",
          ),
          Question(
            id: "c_unit_8_l5_q7",
            type: QuestionType.multipleChoice,
            prompt: "Tüm üyelerinin bellekte AYNI başlangıç adresini paylaştığı ve en büyük üyesi kadar yer kaplayan yapı hangisidir?",
            codeSnippet: r'''___ Data {
    int i;
    float f;
    char str[20];
};''',
            options: ["union", "struct", "class", "shared"],
            correctIndex: 0,
            explanation: "'union' içindeki tüm elemanlar aynı bellek alanını ortaklaşa kullanır; aynı anda sadece biri geçerli değer tutar.",
          ),
          Question(
            id: "c_unit_8_l5_q8",
            type: QuestionType.multipleChoice,
            prompt: "C dilinde bir değişkenin bellekteki adresini elde etmek için hangi operatör kullanılır?",
            codeSnippet: r'''int x = 10;
int *ptr = ___x;''',
            options: ["& (Address-of)", "* (Dereference)", "% (Mod)", "\$ (Value)"],
            correctIndex: 0,
            explanation: "'&' operatörü bir değişkenin RAM üzerindeki başlangıç adresini döner.",
          ),
          Question(
            id: "c_unit_8_l5_q9",
            type: QuestionType.multipleChoice,
            prompt: "Bir işaretçinin (pointer) işaret ettiği bellek adresindeki veriye erişmek veya onu değiştirmek için hangi işlem yapılır?",
            codeSnippet: r'''int x = 5;
int *p = &x;
___p = 20; // x artik 20 olur''',
            options: ["* (Dereference)", "&", "->", "."],
            correctIndex: 0,
            explanation: "'*p' dereferencing yaparak işaretçinin tuttuğu adresteki asıl değere erişir.",
          ),
          Question(
            id: "c_unit_8_l5_q10",
            type: QuestionType.multipleChoice,
            prompt: "Heap bellekte dinamik olarak bayt cinsinden bellek tahsis etmek için hangi standart kütüphane fonksiyonu kullanılır?",
            codeSnippet: r'''int *arr = (int*)___(10 * sizeof(int));''',
            options: ["malloc", "alloc", "new", "heap_get"],
            correctIndex: 0,
            explanation: "'malloc(size_t size)' heap bölgesinde istenen bayt kadar bellek ayırır ve void* işaretçi döner.",
          ),
          Question(
            id: "c_unit_8_l5_q11",
            type: QuestionType.multipleChoice,
            prompt: "malloc veya calloc ile tahsis edilen dinamik belleğin sisteme iade edilmesi için hangi fonksiyon çağrılmalıdır?",
            codeSnippet: r'''int *buf = malloc(1024);
// ... kullanim ...
___(buf);''',
            options: ["free", "delete", "release", "dispose"],
            correctIndex: 0,
            explanation: "'free(ptr)' heap bellekte ayrılan alanı serbest bırakır. Çağrılmazsa 'Memory Leak' oluşur.",
          ),
          Question(
            id: "c_unit_8_l5_q12",
            type: QuestionType.multipleChoice,
            prompt: "Tahsis ettiği belleği otomatik olarak sıfırlarla (0 baytları) dolduran dinamik bellek fonksiyonu hangisidir?",
            codeSnippet: r'''int *p = ___(100, sizeof(int));''',
            options: ["calloc", "malloc", "realloc", "zalloc"],
            correctIndex: 0,
            explanation: "'calloc(num, size)' eleman sayısı ve eleman boyutu alır, ayrılan tüm bellek hücrelerini 0 ile başlatır.",
          ),
          Question(
            id: "c_unit_8_l5_q13",
            type: QuestionType.fillInTheBlank,
            prompt: "Geçersiz veya henüz atanmamış bir işaretçiye güvenli başlangıç değeri olarak _____ atanmalıdır.",
            explanation: "İşaretçilere NULL atamak tanımsız belleğe erişimi ve segmentation fault hatalarını engellemeye yardımcı olur.",
            blankOptions: ["NULL", "0xFF", "void", "NaN"],
            correctBlankAnswer: "NULL",
          ),
          Question(
            id: "c_unit_8_l5_q14",
            type: QuestionType.fillInTheBlank,
            prompt: "Bir veri tipinin bellekte kaç bayt yer kapladığını öğrenmek için derleme zamanı operatörü olan _____ kullanılır.",
            explanation: "sizeof(tip) veya sizeof(degisken) bayt cinsinden bellek boyutunu size_t olarak döner.",
            blankOptions: ["sizeof", "lengthof", "bytesize", "countof"],
            correctBlankAnswer: "sizeof",
          ),
          Question(
            id: "c_unit_8_l5_q15",
            type: QuestionType.fillInTheBlank,
            prompt: "Açılmış bir dosya işaretçisini işletim sistemine geri iade etmek için _____ fonksiyonu çağrılır.",
            explanation: "fclose(FILE *stream) dosya tamponlarını diske yazar ve kaynakları kapatır.",
            blankOptions: ["fclose", "close", "file_exit", "dispose"],
            correctBlankAnswer: "fclose",
          ),
          Question(
            id: "c_unit_8_l5_q16",
            type: QuestionType.trueFalse,
            prompt: "C dilinde dizi isimleri ifadeler içinde kullanıldığında dizinin ilk elemanının bellek adresine (pointer) dönüşür (decay).",
            explanation: "Doğrudur, 'arr' ifadesi '&arr[0]' adresi ile eşdeğerdir.",
            isTrue: true,
          ),
          Question(
            id: "c_unit_8_l5_q17",
            type: QuestionType.trueFalse,
            prompt: "Stack belleğinde oluşturulan yerel değişkenler fonksiyon sonlandığında da bellekte kalmaya devam eder ve serbest bırakılması için free() gerekir.",
            explanation: "Yanlıştır! Stack bellek fonksiyon bitiminde otomatik temizlenir; free() sadece heap (malloc) için geçerlidir.",
            isTrue: false,
          ),
          Question(
            id: "c_unit_8_l5_q18",
            type: QuestionType.matching,
            prompt: "C bellek kavramlarını doğru açıklamalarıyla eşleştirin.",
            explanation: "C'de bellek güvenliği doğrudan yazılımcının sorumluluğundadır.",
            matchingPairs: [MatchingPair(left: "malloc", right: "Heap üzerinde başlatılmamış bellek tahsisi"), MatchingPair(left: "free", right: "Dinamik belleği sisteme iade etme"), MatchingPair(left: "Valgrind", right: "Bellek sızıntılarını tespit eden analiz aracı")],
          ),
        ],
      ),
      Lesson(
        id: "c_unit_8_l6",
        title: "Önişlemci: #define, Makrolar & Header Guards",
        description: "#ifndef, #define koruyucuları ve yan etkiler",
        xpReward: 35,
        gemReward: 12,
        isUnitExam: false,
        questions: [
          Question(
            id: "c_unit_8_l6_q1",
            type: QuestionType.conceptCard,
            conceptTitle: "Önişlemci: #define, Makrolar & Header Guards - Hap Bilgi",
            rule: "C dilinde işaretçiler (pointers) doğrudan bellek adreslerini saklar. '&' operatörü bir değişkenin adresini alırken, '*' (dereference) o adresteki veriye erişir veya değiştirir.",
            codeExample: r'''#include <stdio.h>
#include <stdlib.h>

int main() {
    int x = 100;
    int *ptr = &x;
    
    printf("x Degeri: %d\n", *ptr);
    printf("x Bellek Adresi: %p\n", (void*)ptr);
    return 0;
}''',
            devTip: "malloc ile tahsis edilen her bayt bellek için mutlaka bir free() çağrısı yapılmalıdır, aksi halde Memory Leak oluşur.",
            iconEmoji: "⚡",
          ),
          Question(
            id: "c_unit_8_l6_q2",
            type: QuestionType.multipleChoice,
            prompt: "Aşağıdaki bit düzeyinde (bitwise) operatörlerden hangisi bitleri 1 basamak sola kaydırarak 2 ile çarpmayı sağlar?",
            codeSnippet: r'''int x = 5;
int y = x ___ 1; // y = 10 olur''',
            options: ["<<", ">>", "&", "|"],
            correctIndex: 0,
            explanation: "Sola kaydırma (<< n) operatörü sayının değerini 2^n ile çarpar.",
          ),
          Question(
            id: "c_unit_8_l6_q3",
            type: QuestionType.multipleChoice,
            prompt: "C'de dosya açmak ve bir dosya işaretçisi (FILE*) elde etmek için hangi standart fonksiyon kullanılır?",
            codeSnippet: r'''FILE *f = ___("data.txt", "r");''',
            options: ["fopen", "open", "file_open", "create_file"],
            correctIndex: 0,
            explanation: "'fopen(dosya_adi, mod)' dosyayı belirtilen modda (r, w, a, rb, wb) açar.",
          ),
          Question(
            id: "c_unit_8_l6_q4",
            type: QuestionType.multipleChoice,
            prompt: "Bir header dosyasının birden fazla kez derlemeye dahil edilmesini (redefinition) önlemek için ne kullanılır?",
            codeSnippet: r'''#ifndef MY_HEADER_H
#define MY_HEADER_H
// ...
#endif''',
            options: ["Header Guards (#ifndef / #define)", "namespace", "pragma private", "module"],
            correctIndex: 0,
            explanation: "Header guards veya '#pragma once' başlık dosyalarının mükerrer include edilmesini engeller.",
          ),
          Question(
            id: "c_unit_8_l6_q5",
            type: QuestionType.multipleChoice,
            prompt: "Tüm üyelerinin bellekte AYNI başlangıç adresini paylaştığı ve en büyük üyesi kadar yer kaplayan yapı hangisidir?",
            codeSnippet: r'''___ Data {
    int i;
    float f;
    char str[20];
};''',
            options: ["union", "struct", "class", "shared"],
            correctIndex: 0,
            explanation: "'union' içindeki tüm elemanlar aynı bellek alanını ortaklaşa kullanır; aynı anda sadece biri geçerli değer tutar.",
          ),
          Question(
            id: "c_unit_8_l6_q6",
            type: QuestionType.multipleChoice,
            prompt: "C dilinde bir değişkenin bellekteki adresini elde etmek için hangi operatör kullanılır?",
            codeSnippet: r'''int x = 10;
int *ptr = ___x;''',
            options: ["& (Address-of)", "* (Dereference)", "% (Mod)", "\$ (Value)"],
            correctIndex: 0,
            explanation: "'&' operatörü bir değişkenin RAM üzerindeki başlangıç adresini döner.",
          ),
          Question(
            id: "c_unit_8_l6_q7",
            type: QuestionType.multipleChoice,
            prompt: "Bir işaretçinin (pointer) işaret ettiği bellek adresindeki veriye erişmek veya onu değiştirmek için hangi işlem yapılır?",
            codeSnippet: r'''int x = 5;
int *p = &x;
___p = 20; // x artik 20 olur''',
            options: ["* (Dereference)", "&", "->", "."],
            correctIndex: 0,
            explanation: "'*p' dereferencing yaparak işaretçinin tuttuğu adresteki asıl değere erişir.",
          ),
          Question(
            id: "c_unit_8_l6_q8",
            type: QuestionType.multipleChoice,
            prompt: "Heap bellekte dinamik olarak bayt cinsinden bellek tahsis etmek için hangi standart kütüphane fonksiyonu kullanılır?",
            codeSnippet: r'''int *arr = (int*)___(10 * sizeof(int));''',
            options: ["malloc", "alloc", "new", "heap_get"],
            correctIndex: 0,
            explanation: "'malloc(size_t size)' heap bölgesinde istenen bayt kadar bellek ayırır ve void* işaretçi döner.",
          ),
          Question(
            id: "c_unit_8_l6_q9",
            type: QuestionType.multipleChoice,
            prompt: "malloc veya calloc ile tahsis edilen dinamik belleğin sisteme iade edilmesi için hangi fonksiyon çağrılmalıdır?",
            codeSnippet: r'''int *buf = malloc(1024);
// ... kullanim ...
___(buf);''',
            options: ["free", "delete", "release", "dispose"],
            correctIndex: 0,
            explanation: "'free(ptr)' heap bellekte ayrılan alanı serbest bırakır. Çağrılmazsa 'Memory Leak' oluşur.",
          ),
          Question(
            id: "c_unit_8_l6_q10",
            type: QuestionType.multipleChoice,
            prompt: "Tahsis ettiği belleği otomatik olarak sıfırlarla (0 baytları) dolduran dinamik bellek fonksiyonu hangisidir?",
            codeSnippet: r'''int *p = ___(100, sizeof(int));''',
            options: ["calloc", "malloc", "realloc", "zalloc"],
            correctIndex: 0,
            explanation: "'calloc(num, size)' eleman sayısı ve eleman boyutu alır, ayrılan tüm bellek hücrelerini 0 ile başlatır.",
          ),
          Question(
            id: "c_unit_8_l6_q11",
            type: QuestionType.multipleChoice,
            prompt: "Daha önce ayrılmış dinamik bir bellek bloğunun boyutunu veri kaybı olmadan büyütmek veya küçültmek için ne kullanılır?",
            codeSnippet: r'''ptr = ___(ptr, new_size);''',
            options: ["realloc", "resize", "remalloc", "expand"],
            correctIndex: 0,
            explanation: "'realloc' mevcut bloğu genişletir veya yeni bir konuma taşıyarak eski veriyi kopyalar.",
          ),
          Question(
            id: "c_unit_8_l6_q12",
            type: QuestionType.multipleChoice,
            prompt: "C programlama dilinde GCC derleme sürecinin doğru sırası aşağıdakilerden hangisidir?",
            options: ["Preprocessor -> Compiler -> Assembler -> Linker", "Compiler -> Preprocessor -> Linker -> Assembler", "Assembler -> Compiler -> Linker -> Preprocessor", "Linker -> Assembler -> Compiler -> Preprocessor"],
            correctIndex: 0,
            explanation: "Önce makrolar ve headerlar çözülür (cpp), C kodu Assembly'ye derlenir (cc1), makine koduna çevrilir (as), kütüphaneler bağlanır (ld).",
          ),
          Question(
            id: "c_unit_8_l6_q13",
            type: QuestionType.fillInTheBlank,
            prompt: "Geçersiz veya henüz atanmamış bir işaretçiye güvenli başlangıç değeri olarak _____ atanmalıdır.",
            explanation: "İşaretçilere NULL atamak tanımsız belleğe erişimi ve segmentation fault hatalarını engellemeye yardımcı olur.",
            blankOptions: ["NULL", "0xFF", "void", "NaN"],
            correctBlankAnswer: "NULL",
          ),
          Question(
            id: "c_unit_8_l6_q14",
            type: QuestionType.fillInTheBlank,
            prompt: "Bir veri tipinin bellekte kaç bayt yer kapladığını öğrenmek için derleme zamanı operatörü olan _____ kullanılır.",
            explanation: "sizeof(tip) veya sizeof(degisken) bayt cinsinden bellek boyutunu size_t olarak döner.",
            blankOptions: ["sizeof", "lengthof", "bytesize", "countof"],
            correctBlankAnswer: "sizeof",
          ),
          Question(
            id: "c_unit_8_l6_q15",
            type: QuestionType.fillInTheBlank,
            prompt: "Açılmış bir dosya işaretçisini işletim sistemine geri iade etmek için _____ fonksiyonu çağrılır.",
            explanation: "fclose(FILE *stream) dosya tamponlarını diske yazar ve kaynakları kapatır.",
            blankOptions: ["fclose", "close", "file_exit", "dispose"],
            correctBlankAnswer: "fclose",
          ),
          Question(
            id: "c_unit_8_l6_q16",
            type: QuestionType.trueFalse,
            prompt: "C dilinde dizi isimleri ifadeler içinde kullanıldığında dizinin ilk elemanının bellek adresine (pointer) dönüşür (decay).",
            explanation: "Doğrudur, 'arr' ifadesi '&arr[0]' adresi ile eşdeğerdir.",
            isTrue: true,
          ),
          Question(
            id: "c_unit_8_l6_q17",
            type: QuestionType.trueFalse,
            prompt: "Stack belleğinde oluşturulan yerel değişkenler fonksiyon sonlandığında da bellekte kalmaya devam eder ve serbest bırakılması için free() gerekir.",
            explanation: "Yanlıştır! Stack bellek fonksiyon bitiminde otomatik temizlenir; free() sadece heap (malloc) için geçerlidir.",
            isTrue: false,
          ),
          Question(
            id: "c_unit_8_l6_q18",
            type: QuestionType.matching,
            prompt: "C bellek kavramlarını doğru açıklamalarıyla eşleştirin.",
            explanation: "C'de bellek güvenliği doğrudan yazılımcının sorumluluğundadır.",
            matchingPairs: [MatchingPair(left: "malloc", right: "Heap üzerinde başlatılmamış bellek tahsisi"), MatchingPair(left: "free", right: "Dinamik belleği sisteme iade etme"), MatchingPair(left: "Valgrind", right: "Bellek sızıntılarını tespit eden analiz aracı")],
          ),
        ],
      ),
      Lesson(
        id: "c_unit_8_l7",
        title: "Fonksiyon İşaretçileri (Function Pointers)",
        description: "Metot referanslarını parametre geçirme ve qsort()",
        xpReward: 35,
        gemReward: 12,
        isUnitExam: false,
        questions: [
          Question(
            id: "c_unit_8_l7_q1",
            type: QuestionType.conceptCard,
            conceptTitle: "Fonksiyon İşaretçileri (Function Pointers) - Hap Bilgi",
            rule: "C dilinde işaretçiler (pointers) doğrudan bellek adreslerini saklar. '&' operatörü bir değişkenin adresini alırken, '*' (dereference) o adresteki veriye erişir veya değiştirir.",
            codeExample: r'''#include <stdio.h>
#include <stdlib.h>

int main() {
    int x = 100;
    int *ptr = &x;
    
    printf("x Degeri: %d\n", *ptr);
    printf("x Bellek Adresi: %p\n", (void*)ptr);
    return 0;
}''',
            devTip: "malloc ile tahsis edilen her bayt bellek için mutlaka bir free() çağrısı yapılmalıdır, aksi halde Memory Leak oluşur.",
            iconEmoji: "⚡",
          ),
          Question(
            id: "c_unit_8_l7_q2",
            type: QuestionType.multipleChoice,
            prompt: "Bir header dosyasının birden fazla kez derlemeye dahil edilmesini (redefinition) önlemek için ne kullanılır?",
            codeSnippet: r'''#ifndef MY_HEADER_H
#define MY_HEADER_H
// ...
#endif''',
            options: ["Header Guards (#ifndef / #define)", "namespace", "pragma private", "module"],
            correctIndex: 0,
            explanation: "Header guards veya '#pragma once' başlık dosyalarının mükerrer include edilmesini engeller.",
          ),
          Question(
            id: "c_unit_8_l7_q3",
            type: QuestionType.multipleChoice,
            prompt: "Tüm üyelerinin bellekte AYNI başlangıç adresini paylaştığı ve en büyük üyesi kadar yer kaplayan yapı hangisidir?",
            codeSnippet: r'''___ Data {
    int i;
    float f;
    char str[20];
};''',
            options: ["union", "struct", "class", "shared"],
            correctIndex: 0,
            explanation: "'union' içindeki tüm elemanlar aynı bellek alanını ortaklaşa kullanır; aynı anda sadece biri geçerli değer tutar.",
          ),
          Question(
            id: "c_unit_8_l7_q4",
            type: QuestionType.multipleChoice,
            prompt: "C dilinde bir değişkenin bellekteki adresini elde etmek için hangi operatör kullanılır?",
            codeSnippet: r'''int x = 10;
int *ptr = ___x;''',
            options: ["& (Address-of)", "* (Dereference)", "% (Mod)", "\$ (Value)"],
            correctIndex: 0,
            explanation: "'&' operatörü bir değişkenin RAM üzerindeki başlangıç adresini döner.",
          ),
          Question(
            id: "c_unit_8_l7_q5",
            type: QuestionType.multipleChoice,
            prompt: "Bir işaretçinin (pointer) işaret ettiği bellek adresindeki veriye erişmek veya onu değiştirmek için hangi işlem yapılır?",
            codeSnippet: r'''int x = 5;
int *p = &x;
___p = 20; // x artik 20 olur''',
            options: ["* (Dereference)", "&", "->", "."],
            correctIndex: 0,
            explanation: "'*p' dereferencing yaparak işaretçinin tuttuğu adresteki asıl değere erişir.",
          ),
          Question(
            id: "c_unit_8_l7_q6",
            type: QuestionType.multipleChoice,
            prompt: "Heap bellekte dinamik olarak bayt cinsinden bellek tahsis etmek için hangi standart kütüphane fonksiyonu kullanılır?",
            codeSnippet: r'''int *arr = (int*)___(10 * sizeof(int));''',
            options: ["malloc", "alloc", "new", "heap_get"],
            correctIndex: 0,
            explanation: "'malloc(size_t size)' heap bölgesinde istenen bayt kadar bellek ayırır ve void* işaretçi döner.",
          ),
          Question(
            id: "c_unit_8_l7_q7",
            type: QuestionType.multipleChoice,
            prompt: "malloc veya calloc ile tahsis edilen dinamik belleğin sisteme iade edilmesi için hangi fonksiyon çağrılmalıdır?",
            codeSnippet: r'''int *buf = malloc(1024);
// ... kullanim ...
___(buf);''',
            options: ["free", "delete", "release", "dispose"],
            correctIndex: 0,
            explanation: "'free(ptr)' heap bellekte ayrılan alanı serbest bırakır. Çağrılmazsa 'Memory Leak' oluşur.",
          ),
          Question(
            id: "c_unit_8_l7_q8",
            type: QuestionType.multipleChoice,
            prompt: "Tahsis ettiği belleği otomatik olarak sıfırlarla (0 baytları) dolduran dinamik bellek fonksiyonu hangisidir?",
            codeSnippet: r'''int *p = ___(100, sizeof(int));''',
            options: ["calloc", "malloc", "realloc", "zalloc"],
            correctIndex: 0,
            explanation: "'calloc(num, size)' eleman sayısı ve eleman boyutu alır, ayrılan tüm bellek hücrelerini 0 ile başlatır.",
          ),
          Question(
            id: "c_unit_8_l7_q9",
            type: QuestionType.multipleChoice,
            prompt: "Daha önce ayrılmış dinamik bir bellek bloğunun boyutunu veri kaybı olmadan büyütmek veya küçültmek için ne kullanılır?",
            codeSnippet: r'''ptr = ___(ptr, new_size);''',
            options: ["realloc", "resize", "remalloc", "expand"],
            correctIndex: 0,
            explanation: "'realloc' mevcut bloğu genişletir veya yeni bir konuma taşıyarak eski veriyi kopyalar.",
          ),
          Question(
            id: "c_unit_8_l7_q10",
            type: QuestionType.multipleChoice,
            prompt: "C programlama dilinde GCC derleme sürecinin doğru sırası aşağıdakilerden hangisidir?",
            options: ["Preprocessor -> Compiler -> Assembler -> Linker", "Compiler -> Preprocessor -> Linker -> Assembler", "Assembler -> Compiler -> Linker -> Preprocessor", "Linker -> Assembler -> Compiler -> Preprocessor"],
            correctIndex: 0,
            explanation: "Önce makrolar ve headerlar çözülür (cpp), C kodu Assembly'ye derlenir (cc1), makine koduna çevrilir (as), kütüphaneler bağlanır (ld).",
          ),
          Question(
            id: "c_unit_8_l7_q11",
            type: QuestionType.multipleChoice,
            prompt: "64-bit modern bir mimaride standart bir işaretçi (pointer - int*, char*, void*) değişkeni bellekte kaç bayt yer kaplar?",
            codeSnippet: r'''printf("%zu", sizeof(int*));''',
            options: ["8 bayt", "4 bayt", "2 bayt", "16 bayt"],
            correctIndex: 0,
            explanation: "64-bit mimarilerde bellek adresleri 64 bit yani tam 8 bayttır. İşaretçinin tipi ne olursa olsun adres boyutu 8 bayttır.",
          ),
          Question(
            id: "c_unit_8_l7_q12",
            type: QuestionType.multipleChoice,
            prompt: "Bir struct içindeki bir işaretçi elemana erişirken '.' yerine hangi pratik operatör kullanılır?",
            codeSnippet: r'''struct User *u = getUser();
u___name = "Ahmet";''',
            options: ["-> (Ok operatörü)", ".", "::", "=>"],
            correctIndex: 0,
            explanation: "'u->name', '(*u).name' yazımının daha okunaklı ve standart kısayoludur.",
          ),
          Question(
            id: "c_unit_8_l7_q13",
            type: QuestionType.fillInTheBlank,
            prompt: "Geçersiz veya henüz atanmamış bir işaretçiye güvenli başlangıç değeri olarak _____ atanmalıdır.",
            explanation: "İşaretçilere NULL atamak tanımsız belleğe erişimi ve segmentation fault hatalarını engellemeye yardımcı olur.",
            blankOptions: ["NULL", "0xFF", "void", "NaN"],
            correctBlankAnswer: "NULL",
          ),
          Question(
            id: "c_unit_8_l7_q14",
            type: QuestionType.fillInTheBlank,
            prompt: "Bir veri tipinin bellekte kaç bayt yer kapladığını öğrenmek için derleme zamanı operatörü olan _____ kullanılır.",
            explanation: "sizeof(tip) veya sizeof(degisken) bayt cinsinden bellek boyutunu size_t olarak döner.",
            blankOptions: ["sizeof", "lengthof", "bytesize", "countof"],
            correctBlankAnswer: "sizeof",
          ),
          Question(
            id: "c_unit_8_l7_q15",
            type: QuestionType.fillInTheBlank,
            prompt: "Açılmış bir dosya işaretçisini işletim sistemine geri iade etmek için _____ fonksiyonu çağrılır.",
            explanation: "fclose(FILE *stream) dosya tamponlarını diske yazar ve kaynakları kapatır.",
            blankOptions: ["fclose", "close", "file_exit", "dispose"],
            correctBlankAnswer: "fclose",
          ),
          Question(
            id: "c_unit_8_l7_q16",
            type: QuestionType.trueFalse,
            prompt: "C dilinde dizi isimleri ifadeler içinde kullanıldığında dizinin ilk elemanının bellek adresine (pointer) dönüşür (decay).",
            explanation: "Doğrudur, 'arr' ifadesi '&arr[0]' adresi ile eşdeğerdir.",
            isTrue: true,
          ),
          Question(
            id: "c_unit_8_l7_q17",
            type: QuestionType.trueFalse,
            prompt: "Stack belleğinde oluşturulan yerel değişkenler fonksiyon sonlandığında da bellekte kalmaya devam eder ve serbest bırakılması için free() gerekir.",
            explanation: "Yanlıştır! Stack bellek fonksiyon bitiminde otomatik temizlenir; free() sadece heap (malloc) için geçerlidir.",
            isTrue: false,
          ),
          Question(
            id: "c_unit_8_l7_q18",
            type: QuestionType.matching,
            prompt: "C bellek kavramlarını doğru açıklamalarıyla eşleştirin.",
            explanation: "C'de bellek güvenliği doğrudan yazılımcının sorumluluğundadır.",
            matchingPairs: [MatchingPair(left: "malloc", right: "Heap üzerinde başlatılmamış bellek tahsisi"), MatchingPair(left: "free", right: "Dinamik belleği sisteme iade etme"), MatchingPair(left: "Valgrind", right: "Bellek sızıntılarını tespit eden analiz aracı")],
          ),
        ],
      ),
      Lesson(
        id: "c_unit_8_l8",
        title: "8. Ünite C Dili Ustalık & Sistem Programlama Sınavı",
        description: "Kıdemli C yazılımcısı değerlendirme sınavı",
        xpReward: 50,
        gemReward: 25,
        isUnitExam: true,
        questions: [
          Question(
            id: "c_unit_8_l8_q1",
            type: QuestionType.conceptCard,
            conceptTitle: "8. Ünite C Dili Ustalık & Sistem Programlama Sınavı - Hap Bilgi",
            rule: "C dilinde işaretçiler (pointers) doğrudan bellek adreslerini saklar. '&' operatörü bir değişkenin adresini alırken, '*' (dereference) o adresteki veriye erişir veya değiştirir.",
            codeExample: r'''#include <stdio.h>
#include <stdlib.h>

int main() {
    int x = 100;
    int *ptr = &x;
    
    printf("x Degeri: %d\n", *ptr);
    printf("x Bellek Adresi: %p\n", (void*)ptr);
    return 0;
}''',
            devTip: "malloc ile tahsis edilen her bayt bellek için mutlaka bir free() çağrısı yapılmalıdır, aksi halde Memory Leak oluşur.",
            iconEmoji: "⚡",
          ),
          Question(
            id: "c_unit_8_l8_q2",
            type: QuestionType.multipleChoice,
            prompt: "C dilinde bir değişkenin bellekteki adresini elde etmek için hangi operatör kullanılır?",
            codeSnippet: r'''int x = 10;
int *ptr = ___x;''',
            options: ["& (Address-of)", "* (Dereference)", "% (Mod)", "\$ (Value)"],
            correctIndex: 0,
            explanation: "'&' operatörü bir değişkenin RAM üzerindeki başlangıç adresini döner.",
          ),
          Question(
            id: "c_unit_8_l8_q3",
            type: QuestionType.multipleChoice,
            prompt: "Bir işaretçinin (pointer) işaret ettiği bellek adresindeki veriye erişmek veya onu değiştirmek için hangi işlem yapılır?",
            codeSnippet: r'''int x = 5;
int *p = &x;
___p = 20; // x artik 20 olur''',
            options: ["* (Dereference)", "&", "->", "."],
            correctIndex: 0,
            explanation: "'*p' dereferencing yaparak işaretçinin tuttuğu adresteki asıl değere erişir.",
          ),
          Question(
            id: "c_unit_8_l8_q4",
            type: QuestionType.multipleChoice,
            prompt: "Heap bellekte dinamik olarak bayt cinsinden bellek tahsis etmek için hangi standart kütüphane fonksiyonu kullanılır?",
            codeSnippet: r'''int *arr = (int*)___(10 * sizeof(int));''',
            options: ["malloc", "alloc", "new", "heap_get"],
            correctIndex: 0,
            explanation: "'malloc(size_t size)' heap bölgesinde istenen bayt kadar bellek ayırır ve void* işaretçi döner.",
          ),
          Question(
            id: "c_unit_8_l8_q5",
            type: QuestionType.multipleChoice,
            prompt: "malloc veya calloc ile tahsis edilen dinamik belleğin sisteme iade edilmesi için hangi fonksiyon çağrılmalıdır?",
            codeSnippet: r'''int *buf = malloc(1024);
// ... kullanim ...
___(buf);''',
            options: ["free", "delete", "release", "dispose"],
            correctIndex: 0,
            explanation: "'free(ptr)' heap bellekte ayrılan alanı serbest bırakır. Çağrılmazsa 'Memory Leak' oluşur.",
          ),
          Question(
            id: "c_unit_8_l8_q6",
            type: QuestionType.multipleChoice,
            prompt: "Tahsis ettiği belleği otomatik olarak sıfırlarla (0 baytları) dolduran dinamik bellek fonksiyonu hangisidir?",
            codeSnippet: r'''int *p = ___(100, sizeof(int));''',
            options: ["calloc", "malloc", "realloc", "zalloc"],
            correctIndex: 0,
            explanation: "'calloc(num, size)' eleman sayısı ve eleman boyutu alır, ayrılan tüm bellek hücrelerini 0 ile başlatır.",
          ),
          Question(
            id: "c_unit_8_l8_q7",
            type: QuestionType.multipleChoice,
            prompt: "Daha önce ayrılmış dinamik bir bellek bloğunun boyutunu veri kaybı olmadan büyütmek veya küçültmek için ne kullanılır?",
            codeSnippet: r'''ptr = ___(ptr, new_size);''',
            options: ["realloc", "resize", "remalloc", "expand"],
            correctIndex: 0,
            explanation: "'realloc' mevcut bloğu genişletir veya yeni bir konuma taşıyarak eski veriyi kopyalar.",
          ),
          Question(
            id: "c_unit_8_l8_q8",
            type: QuestionType.multipleChoice,
            prompt: "C programlama dilinde GCC derleme sürecinin doğru sırası aşağıdakilerden hangisidir?",
            options: ["Preprocessor -> Compiler -> Assembler -> Linker", "Compiler -> Preprocessor -> Linker -> Assembler", "Assembler -> Compiler -> Linker -> Preprocessor", "Linker -> Assembler -> Compiler -> Preprocessor"],
            correctIndex: 0,
            explanation: "Önce makrolar ve headerlar çözülür (cpp), C kodu Assembly'ye derlenir (cc1), makine koduna çevrilir (as), kütüphaneler bağlanır (ld).",
          ),
          Question(
            id: "c_unit_8_l8_q9",
            type: QuestionType.multipleChoice,
            prompt: "64-bit modern bir mimaride standart bir işaretçi (pointer - int*, char*, void*) değişkeni bellekte kaç bayt yer kaplar?",
            codeSnippet: r'''printf("%zu", sizeof(int*));''',
            options: ["8 bayt", "4 bayt", "2 bayt", "16 bayt"],
            correctIndex: 0,
            explanation: "64-bit mimarilerde bellek adresleri 64 bit yani tam 8 bayttır. İşaretçinin tipi ne olursa olsun adres boyutu 8 bayttır.",
          ),
          Question(
            id: "c_unit_8_l8_q10",
            type: QuestionType.multipleChoice,
            prompt: "Bir struct içindeki bir işaretçi elemana erişirken '.' yerine hangi pratik operatör kullanılır?",
            codeSnippet: r'''struct User *u = getUser();
u___name = "Ahmet";''',
            options: ["-> (Ok operatörü)", ".", "::", "=>"],
            correctIndex: 0,
            explanation: "'u->name', '(*u).name' yazımının daha okunaklı ve standart kısayoludur.",
          ),
          Question(
            id: "c_unit_8_l8_q11",
            type: QuestionType.multipleChoice,
            prompt: "Herhangi bir veri tipine ait bellek adresini tutabilen jenerik (tip bağımsız) işaretçi tipi hangisidir?",
            codeSnippet: r'''___ generic_ptr = &x;''',
            options: ["void*", "any*", "object*", "generic*"],
            correctIndex: 0,
            explanation: "'void*' tipi belirsiz jenerik bir işaretçidir; doğrudan dereference edilemez, cast edilmesi gerekir.",
          ),
          Question(
            id: "c_unit_8_l8_q12",
            type: QuestionType.multipleChoice,
            prompt: "Serbest bırakılmış (free edilmiş) bir işaretçiyi kullanmaya devam etme hatasına ne ad verilir?",
            codeSnippet: r'''free(ptr);
printf("%d", *ptr); // HATA!''',
            options: ["Dangling Pointer (Askıda Kalan İşaretçi)", "Stack Overflow", "Memory Leak", "Deadlock"],
            correctIndex: 0,
            explanation: "free edildikten sonra hala o adresi göstermeye devam eden işaretçiye dangling pointer denir; 'ptr = NULL' yapılarak önlenir.",
          ),
          Question(
            id: "c_unit_8_l8_q13",
            type: QuestionType.fillInTheBlank,
            prompt: "Geçersiz veya henüz atanmamış bir işaretçiye güvenli başlangıç değeri olarak _____ atanmalıdır.",
            explanation: "İşaretçilere NULL atamak tanımsız belleğe erişimi ve segmentation fault hatalarını engellemeye yardımcı olur.",
            blankOptions: ["NULL", "0xFF", "void", "NaN"],
            correctBlankAnswer: "NULL",
          ),
          Question(
            id: "c_unit_8_l8_q14",
            type: QuestionType.fillInTheBlank,
            prompt: "Bir veri tipinin bellekte kaç bayt yer kapladığını öğrenmek için derleme zamanı operatörü olan _____ kullanılır.",
            explanation: "sizeof(tip) veya sizeof(degisken) bayt cinsinden bellek boyutunu size_t olarak döner.",
            blankOptions: ["sizeof", "lengthof", "bytesize", "countof"],
            correctBlankAnswer: "sizeof",
          ),
          Question(
            id: "c_unit_8_l8_q15",
            type: QuestionType.fillInTheBlank,
            prompt: "Açılmış bir dosya işaretçisini işletim sistemine geri iade etmek için _____ fonksiyonu çağrılır.",
            explanation: "fclose(FILE *stream) dosya tamponlarını diske yazar ve kaynakları kapatır.",
            blankOptions: ["fclose", "close", "file_exit", "dispose"],
            correctBlankAnswer: "fclose",
          ),
          Question(
            id: "c_unit_8_l8_q16",
            type: QuestionType.trueFalse,
            prompt: "C dilinde dizi isimleri ifadeler içinde kullanıldığında dizinin ilk elemanının bellek adresine (pointer) dönüşür (decay).",
            explanation: "Doğrudur, 'arr' ifadesi '&arr[0]' adresi ile eşdeğerdir.",
            isTrue: true,
          ),
          Question(
            id: "c_unit_8_l8_q17",
            type: QuestionType.trueFalse,
            prompt: "Stack belleğinde oluşturulan yerel değişkenler fonksiyon sonlandığında da bellekte kalmaya devam eder ve serbest bırakılması için free() gerekir.",
            explanation: "Yanlıştır! Stack bellek fonksiyon bitiminde otomatik temizlenir; free() sadece heap (malloc) için geçerlidir.",
            isTrue: false,
          ),
          Question(
            id: "c_unit_8_l8_q18",
            type: QuestionType.matching,
            prompt: "C bellek kavramlarını doğru açıklamalarıyla eşleştirin.",
            explanation: "C'de bellek güvenliği doğrudan yazılımcının sorumluluğundadır.",
            matchingPairs: [MatchingPair(left: "malloc", right: "Heap üzerinde başlatılmamış bellek tahsisi"), MatchingPair(left: "free", right: "Dinamik belleği sisteme iade etme"), MatchingPair(left: "Valgrind", right: "Bellek sızıntılarını tespit eden analiz aracı")],
          ),
        ],
      ),
    ],
  ),];
