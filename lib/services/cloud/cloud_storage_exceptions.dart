class CloudStorageException implements Exception {
  const CloudStorageException();
}

// Creating Notes Exception
class CouldNotCreateNotesException extends CloudStorageException {}

// Fetching All Notes Exception
class CouldNotGetAllNotesException extends CloudStorageException {}

// Updating Notes Exception
class ClouldNotUpdateNotesException extends CloudStorageException {}

// Deleting Notes Exception
class ClouldNotDeleteNotesException extends CloudStorageException {}
