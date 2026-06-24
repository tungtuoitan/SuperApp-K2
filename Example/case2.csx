
using System.Threading;

for (int i = 0; i < 10; i++)
{
    ThreadPool.QueueUserWorkItem(_ => Console.WriteLine(i));
}

// Không có Thread.Sleep → main thread xong → process exit ngay
// Một số task chưa kịp chạy bị kill → số dòng in ra không cố định

// Câu hỏi:
// tại sao lúc thì print ra 5 số 10, lúc thì 6 số 10?
// → Vì main thread chạy xong vòng for → process exit → task chưa kịp chạy bị kill.
//   Số task kịp chạy phụ thuộc vào tốc độ OS schedule tại thời điểm đó → không cố định.

// for và task cái nào chạy trước, mình có biết được không?
// → Không biết được. for chỉ đăng ký task vào hàng đợi, OS quyết định khi nào thread pool nhặt lên chạy.
// xxx2