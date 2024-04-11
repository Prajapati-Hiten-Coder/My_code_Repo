import 'package:flutter/material.dart';
void main()
{
  runApp(const Profilepage());
}
class Profilepage extends StatelessWidget
{
  const Profilepage({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(),
      home: const profilepage(),
    );
  }
}
class profilepage extends StatelessWidget {
  const profilepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          color: Colors.black12,
          padding: EdgeInsets.only(left: 130.0),
          height: 200,
          child:const Row(
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: NetworkImage('data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBwgHBgkIBwgKCgkLDRYPDQwMDRsUFRAWIB0iIiAdHx8kKDQsJCYxJx8fLT0tMTU3Ojo6Iys/RD84QzQ5OjcBCgoKDQwNGg8PGjclHyU3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3N//AABEIAJQAnwMBIgACEQEDEQH/xAAbAAEBAQEBAQEBAAAAAAAAAAAABQYBBAcDAv/EADYQAAIBAgMDCAoBBQAAAAAAAAABAgMEBQYRITFBEjVRYXFykbEiMkJSgaGywdHhIxMUJILw/8QAGQEBAQADAQAAAAAAAAAAAAAAAAMBAgQF/8QAIBEBAAICAQUBAQAAAAAAAAAAAAECAzEyBBESIUEiUf/aAAwDAQACEQMRAD8A3AAPdeaAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHJzjTg5zkoxW1tvQDoIV5mSjTk42lN1Wvak9I/sm1MwYhPdOnDu0199SsYLy1m0Q14MjTzFfwa5f9KouiUNPLQq2OYbeu1C4i6M3xb1j48DFsN6+5gi8Ssg4mnuevQdJtgAAAAAAAAAAAAAAAH81Jxpwc5tRhFatvgY3F8UqYhVcVrG3T9CPT1srZqu3To07WD0c/Sl2LcvHyMydfT4/XlKd7e+0AAOpMGgAFfA8Wna1FQuJN28nsb9j9GtTTS08T529xrsuXbuLD+nN6zovk69K4fj4HH1GOI/UKUt8VgAcygAAAAAAAAAAAAAxuY5uWLVE9qjGMV4fsmlPMtPkYtN8JxjJdfD7Ew9HFwhCdgAKMAAAFvKk2rytDXZKnrp2MiFzKkG7utU02Rp6a9r/AESzcJbV21AAPPXAAGAAAAAAAAAAAQs02bqUKd3Baulsn3Xx/wC6TMH0OUVOMoSScZJpp8THYxhVSwqOdNOVu90vd6mdXT5IiPGU71+poAOtMAABmvy5ZytcPUqi0nWfKa6Fw/PxJOB4RK4nG4uouNBPWMX7b/Bqzj6jJE/mFaV+yAA5m4AAAAAAAAAAAAAHJRUouMkmnsafE6AIt7l23qtytpOhJ+zviTKmXL5P0JUZdfKa+xrJSjH1pJdrPzd1QW+vTX+6K1y3jTXxqzNLLd5J/wAlShBdrf2KllgFrbtTq/zzW7lbl8CkrmhLZGvTb6po/SMlL1ZRfY9TFst7bIrDvVwABNsAAAAAAAAAAAAAB5b3ELWyX+RU0lwilq2S8bxt0ZStrN61FsnU93qXWZqcpTk5Tk5Sb1bb2svjwTb3Omk3/i7dZlqybVrQjFe9U2vwJlfE76v69zU06Ivkr5HkQOquKldQnMzLspSk9ZTlJ9b1OabACnZhzQ/qMpw9ScovqehwBl7KGKX1H1Lmpp0SfKXzKVtmWpF6XdGMl71PY/AgjQnbFS24ImY03Vlf217HW3qqTW+L2SXwPUfPIylCSlCTjJbmtjRpsExr+4lG2u2lVeyE9yl1PrOXJgmvuFIv32ugAg3AAAAAA8eL3MrTDq1WGyemkX0N7D2ErMvNU+/HzNqR3tEE6ZDft8wAem5wAAAAAAAAAABtTTW9PVAAbvDbh3VhQrS9aUdvatj+aPST8v8AM9t2S+plA8u0dpl0RoABgAAAJWZeap96PmVSVmXmqfej5m2PnDE6ZDgBwB6aAAAAAAAAAAAAe4B7gNpl/me27H9TKBPy/wAz23Y/qZQPMvyleNAANWQAACVmXmqfej5nQbU5QxOmP4AA9RAABgAAAAAAAAA9wAG0y/zPbdj+plAA8y/KV40AA1Zf/9k='),
              ),
          ],
      ),
        ),
     );
  }
}
