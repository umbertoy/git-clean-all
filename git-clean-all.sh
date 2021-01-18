git_clean_repository() {
	git_folder="$@"
	cd "$git_folder"
	if [ -d ".git" ]; then
		git clean -dfx
	else
		iterate_folder
	fi
}

iterate_folder() {
	for folder in $1*; do
		if [ -d "$folder" ]; then
			(git_clean_repository $folder)
		fi
	done
}

for f in */; do
	if [ -d "$f" ]; then
		echo "Antes de la limpieza"
		du -shc $f
		iterate_folder $f
		echo "Despues de la limpieza"
		du -shc $f
	fi
done
