import 'package:dartz/dartz.dart';
import 'package:tdd/data/failure.dart';
import 'package:tdd/domain/entities/product_entities.dart';
import 'package:tdd/domain/repositories/product_repository.dart';

class ProductUsecase {
  final ProductRepository productRepository;

  ProductUsecase({required this.productRepository});

  Future<Either<Failure, List<Product>>> execute() {
    return productRepository.getAllProduct();
  }
}


// Definisikan entitas Tugas
class Task {
  final String id;
  String title;
  bool isCompleted;

  Task({required this.id, required this.title, this.isCompleted = false});
}

// Definisikan repositori untuk mengelola daftar tugas
class TaskRepository {
  final List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  void addTask(Task task) {
    _tasks.add(task);
  }

  void updateTask(Task updatedTask) {
    final taskIndex = _tasks.indexWhere((task) => task.id == updatedTask.id);
    if (taskIndex != -1) {
      _tasks[taskIndex] = updatedTask;
    }
  }

  void deleteTask(Task task) {
    _tasks.removeWhere((t) => t.id == task.id);
  }
}

// Definisikan Use Case "Mengelola Tugas"
class ManageTasksUseCase {
  final TaskRepository repository;

  ManageTasksUseCase({required this.repository});

  void addTask(Task newTask) {
    // Validasi tugas (misalnya, pastikan judul tidak kosong)
    if (newTask.title.isNotEmpty) {
      // Tambahkan tugas ke repositori
      repository.addTask(newTask);
    } else {
      // Penanganan kesalahan jika validasi gagal
      throw Exception("Judul tugas tidak boleh kosong.");
    }
  }

  void updateTask(Task updatedTask) {
    // Validasi tugas (misalnya, pastikan judul tidak kosong)
    if (updatedTask.title.isNotEmpty) {
      // Perbarui tugas dalam repositori
      repository.updateTask(updatedTask);
    } else {
      // Penanganan kesalahan jika validasi gagal
      throw Exception("Judul tugas tidak boleh kosong.");
    }
  }

  void deleteTask(Task task) {
    // Hapus tugas dari repositori
    repository.deleteTask(task);
  }
}

void main() {
  final taskRepository = TaskRepository();
  final manageTasksUseCase = ManageTasksUseCase(repository: taskRepository);

  // Tambahkan tugas baru
  final newTask = Task(id: '1', title: 'Mengerjakan Proyek Flutter');
  try {
    manageTasksUseCase.addTask(newTask);
    print('Tugas berhasil ditambahkan.');
  } catch (e) {
    print('Gagal menambahkan tugas: $e');
  }

  // Perbarui tugas yang ada
  final taskToUpdate = taskRepository.tasks.first;
  taskToUpdate.title = 'Mengedit Tugas';
  try {
    manageTasksUseCase.updateTask(taskToUpdate);
    print('Tugas berhasil diperbarui.');
  } catch (e) {
    print('Gagal memperbarui tugas: $e');
  }

  // Hapus tugas
  final taskToDelete = taskRepository.tasks.first;
  manageTasksUseCase.deleteTask(taskToDelete);
  print('Tugas berhasil dihapus.');

  // Cetak daftar tugas dari repositori setelah tugas-tugas ditambahkan, diperbarui, dan dihapus
  print('Daftar Tugas:');
  for (final task in taskRepository.tasks) {
    print('${task.title} (Selesai: ${task.isCompleted})');
  }
}

