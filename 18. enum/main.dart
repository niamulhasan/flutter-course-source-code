enum LoadingState { loading, failed, succeed, error }

void main() {
  LoadingState currentState = LoadingState.succeed;

  if (currentState == LoadingState.loading) {
    print("Data is loading");
  }
  if (currentState == LoadingState.succeed) {
    print("Successfuly loaded data");
  }
  if (currentState == LoadingState.error) {
    print("Error loading data");
  }
  if (currentState == LoadingState.failed) {
    print("Failed Loading data");
  }
}
