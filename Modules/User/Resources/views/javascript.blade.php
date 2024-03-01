<script>
    var table = 'table_user';
    var form = 'form_user';
    var fields = [
        'id',
        'nama',
        'username',
        'email',
        'password',
        // 'photo',
        'is_active',
        'role',
    ];

    $(() => {
        $("#photo").change(function() {
            readURL(this);
        });

        $('#role').select2({
            dropdownParent: $('.viewForm')
        });

        loadBlock();
        initTable();
        onCombobox();
    })

    showForm = () => {
        $('.viewForm').modal('show')
        $('#password').val('').attr('placeholder', 'Password');

    }

    initTable = () => {
        var table = $('#table_user').DataTable({
            processing: true,
            serverSide: true,
            searchAble: true,
            searching: true,
            paging: true,
            "bDestroy": true,
            ajax: "{{ route('user/table') }}",
            columns: [{
                    "data": null,
                    "sortable": false,
                    render: function(data, type, row, meta) {
                        return meta.row + meta.settings._iDisplayStart + 1
                    }
                },
                {
                    data: 'nama',
                    name: 'nama',
                    render: function(data, type, full, meta) {
                        var image = '';
                        if (full.photo) {
                            image += `<?= asset('storage/uploads/user/`+full.photo+`') ?>`
                        } else {
                            image += `<?= asset('assets/noImage.jpg') ?>`
                        }

                        return `
                            <div>
                                <div class="col-12">
                                    <img src="${image}" class="rounded-3" style="width: 50px;" alt="Avatar" />
                                </div>
                                <div class="col-12">
                                    <span>${full.nama?full.nama:''}</span>
                                </div>
                            </div>
                            `;
                    }
                },
                {
                    data: 'username',
                    name: 'username',
                    render: function(data, type, full, meta) {
                        return `<span>${full.username?full.username:''}</span>`;
                    }
                },
                {
                    data: 'email',
                    name: 'email',
                    render: function(data, type, full, meta) {
                        return `<span>${full.email?full.email:''}</span>`;
                    }
                },
                {
                    data: 'is_active',
                    name: 'is_active',
                    render: function(data, type, full, meta) {
                        var status = '';
                        if (full.is_active == 1) {
                            status += `<span class="badge bg-success">Active</span>`;
                        } else {
                            status += `<span class="badge bg-danger">Non Active</span>`;
                        }
                        return status;
                    }
                },
                {
                    data: 'action',
                    name: 'action',
                    orderable: false,
                    searchable: false
                },
            ]
        });
        unblock()
    }

    onSave = () => {
        var formData = new FormData($(`[name="${form}"]`)[0]);

        var id_user = $('#id').val();
        var urlSave = "";

        if (id_user == '' || id_user == null) {
            urlSave += "{{ route('user/store') }}";
        } else {
            urlSave += "{{ route('user/update') }}";
        }

        saConfirm({
            message: 'Apakah anda yakin untuk mengubah data?',
            callback: function(res) {
                if (res) {
                    $.ajax({
                        headers: {
                            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                        },
                        url: urlSave,
                        method: 'post',
                        data: formData,
                        processData: false,
                        contentType: false,
                        success: function(res) {
                            // JSON.parse(res);
                            location.reload()

                            $('.viewForm').modal('hide');
                            onReset();
                            saMessage({
                                success: res['success'],
                                title: res['title'],
                                message: res['message'],
                                callback:function(){
                                    initTable();
                                }
                            })
                        }
                    })
                }

            }
        })
    }

    onEdit = (el) => {
        var id = $(el).data('id');
        $.ajax({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            url: "{{ route('user/edit') }}",
            data: {
                id: id
            },
            method: 'post',
            success: function(data) {
                showForm()

                var img = data[0]['photo'];

                if (img) {
                    $('#photoPreview').attr('src',
                        `{{ Storage::disk('local')->url('public/uploads/user/${img}') }}`);
                }

                $.each(fields, function(i, v) {
                    $('#' + v).val(data[0][v]).change()
                })

                $('#password').val('').attr('placeholder',
                    'Kosongkan jika ingin mengubah password');

                if (data[0]['is_active'] == 1) {
                    $('#is_active').prop('checked', true)
                } else {
                    $('#is_active').prop('checked', false)
                }
            }
        })
    }

    onDelete = (el) => {
        var id = $(el).data('id');
        saConfirm({
            message: 'Apakah anda yakin untuk menghapus data?',
            callback: function(res) {
                if (res) {
                    $.ajax({
                        headers: {
                            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                        },
                        url: "{{ route('user/destroy') }}",
                        data: {
                            id: id
                        },
                        method: 'post',

                        success: function(res) {
                            saMessage({
                                success: res['success'],
                                title: res['title'],
                                message: res['message']
                            })
                            initTable();

                        }
                    })
                }
            }
        });

    }


    onReset = () => {
        $.each(fields, function(i, v) {
            $('#' + v).val('').change()
        })
        $('#is_active').prop('checked', false);
        removePP()
    }

    readURL = (input) => {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function(e) {
                $('#photoPreview').attr('src', e.target.result).fadeIn('slow');
            }
            reader.readAsDataURL(input.files[0]);
        }
    }

    removePP = () => {
        $('#photoPreview').attr('src', '').fadeIn('slow');
        $('#photo').val('');
    }

    onCombobox = (el) => {
        loadBlock()
        $.ajax({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            url: "{{ route('role/combobox') }}",
            method: 'post',
            success: function(data) {
                
                $.each(data, (i, v)=>{
                    $('#role').append(`
                        <option value="${v['id']}">${v['nama']}</option>
                    `);
                })
                unblock()
            }
        })

    }
</script>
