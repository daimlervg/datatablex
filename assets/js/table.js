import $ from 'jquery';
import dt from 'datatables.net';

export default function() {
  $(document).ready(() => {
    $('[data-datatable-server]').dataTable({
      lengthChange: false,
      serverSide: true,
      ajax: 'datatables/zips',
      columns: [
        { data: "zip_code" },
        { data: "city" },
        { data: "state" },
      ]
    });
  })
}
