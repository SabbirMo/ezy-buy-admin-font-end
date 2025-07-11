#!/bin/bash

# Script to create the directory structure and files for a new feature in a Flutter project using Riverpod and Clean Architecture.
# Run this script in the root directory of your Flutter project with this command:
#
# chmod +x clean_architecture.sh && ./clean_architecture.sh
#
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

echo ""
echo -e "${YELLOW}Welcome to the Riverpod Clean Architecture creation script!${NC}"
echo ""

while [[ -z "$feature_name" ]]; do
    read -p "Enter your feature name (in snake_case): " feature_name
    if [[ -z "$feature_name" ]]; then
        echo -e "${RED}Feature name cannot be empty. Please try again.${NC}"
    elif [[ ! "$feature_name" =~ ^[a-z]+(_[a-z]+)*$ ]]; then
        echo -e "${RED}Feature name must be in snake_case format. Please try again.${NC}"
        feature_name=""
    fi
done

read -p "Would you like to write the basic code structure in each file? (Y/n): " write_code
write_code=${write_code:-y}

# Base directory
base_dir="lib/src/features/$feature_name"

if [[ -d "$base_dir" ]]; then
    echo -e "${RED}Feature '$feature_name' already exists. Choose a different name or delete the existing one.${NC}"
    exit 1
fi

# Create directories
mkdir -p "$base_dir/data/models"
mkdir -p "$base_dir/data/data_sources"
mkdir -p "$base_dir/data/repositories"
mkdir -p "$base_dir/domain/entities"
mkdir -p "$base_dir/domain/repositories"
mkdir -p "$base_dir/domain/use_cases"
mkdir -p "$base_dir/presentation/providers"
mkdir -p "$base_dir/presentation/views/components"

# Define file paths with feature name as filename
file_paths=(
    "$base_dir/data/models/${feature_name}_model.dart"
    "$base_dir/data/data_sources/${feature_name}_local_data_source.dart"
    "$base_dir/data/data_sources/${feature_name}_remote_data_source.dart"
    "$base_dir/data/repositories/${feature_name}_repository_impl.dart"
    "$base_dir/domain/entities/${feature_name}_entity.dart"
    "$base_dir/domain/repositories/${feature_name}_repository.dart"
    "$base_dir/domain/use_cases/${feature_name}_use_case.dart"
    "$base_dir/presentation/providers/${feature_name}_provider.dart"
    "$base_dir/presentation/views/${feature_name}_view.dart"
)

# Convert snake_case to PascalCase
to_pascal_case() {
    IFS='_' read -ra words <<< "$1"
    for i in "${!words[@]}"; do
        words[$i]=$(echo "${words[$i]:0:1}" | tr 'a-z' 'A-Z')${words[$i]:1}
    done
    echo "${words[*]}" | tr -d ' '
}

pascal_case_feature_name=$(to_pascal_case "$feature_name")

# File contents
file_contents=(
    "import '../../domain/entities/${feature_name}_entity.dart';\n\nclass ${pascal_case_feature_name}Model extends ${pascal_case_feature_name}Entity {}"
    "abstract class ${pascal_case_feature_name}LocalDataSource {}\n\nclass ${pascal_case_feature_name}LocalDataSourceImpl implements ${pascal_case_feature_name}LocalDataSource {\n  ${pascal_case_feature_name}LocalDataSourceImpl();\n}"
    "abstract class ${pascal_case_feature_name}RemoteDataSource {}\n\nclass ${pascal_case_feature_name}RemoteDataSourceImpl implements ${pascal_case_feature_name}RemoteDataSource {\n  ${pascal_case_feature_name}RemoteDataSourceImpl();\n}"
    "import '../../domain/repositories/${feature_name}_repository.dart';\nimport '../data_sources/${feature_name}_local_data_source.dart';\nimport '../data_sources/${feature_name}_remote_data_source.dart';\n\nclass ${pascal_case_feature_name}RepositoryImpl implements ${pascal_case_feature_name}Repository {\n  final ${pascal_case_feature_name}LocalDataSource _localDataSource;\n  final ${pascal_case_feature_name}RemoteDataSource _remoteDataSource;\n\n  ${pascal_case_feature_name}RepositoryImpl(this._localDataSource, this._remoteDataSource);\n}"
    "class ${pascal_case_feature_name}Entity {}"
    "abstract class ${pascal_case_feature_name}Repository {}"
    "import '../repositories/${feature_name}_repository.dart';\n\nclass ${pascal_case_feature_name}UseCase {\n  final ${pascal_case_feature_name}Repository _repository;\n\n  ${pascal_case_feature_name}UseCase(this._repository);\n}"
    "import 'package:flutter_riverpod/flutter_riverpod.dart';\n\ntypedef ${pascal_case_feature_name}Notifier = NotifierProvider<${pascal_case_feature_name}Provider, void>;\n\nfinal ${feature_name}_provider = ${pascal_case_feature_name}Notifier(${pascal_case_feature_name}Provider.new);\n\nclass ${pascal_case_feature_name}Provider extends Notifier<void> {\n  @override\n  void build() {}\n}"
    "import 'package:flutter/material.dart';\nimport 'package:flutter_riverpod/flutter_riverpod.dart';\n\nclass ${pascal_case_feature_name}View extends ConsumerWidget {\n  const ${pascal_case_feature_name}View({super.key});\n\n  @override\n  Widget build(BuildContext context, WidgetRef ref) {\n    return Scaffold(\n      appBar: AppBar(\n        title: const Text('${pascal_case_feature_name}'),\n      ),\n      body: Center(\n        child: Text('${pascal_case_feature_name}'),\n      ),\n    );\n  }\n}"
)

# Create files and write content
for i in "${!file_paths[@]}"; do
    file_path="${file_paths[$i]}"
    file_content="${file_contents[$i]}"

    mkdir -p "$(dirname "$file_path")"
    touch "$file_path"

    if [[ "$write_code" =~ ^[Yy]$ ]]; then
        echo -e "$file_content" > "$file_path"
    fi

    echo "Created: $file_path"
done

echo -e "${GREEN}Feature '$feature_name' structure created successfully!${NC}"
