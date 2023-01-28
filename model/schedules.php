<?php
require_once 'database-config.php';

function fetchUsers()
{
    $query = "SELECT * FROM schedule, manager
              WHERE schedule.mgr_id = manager.mgr_id";

    try {
        $conn = oci_connect(USERNAME, PASSWORD, CONNECTION_STRING);
        $stid = oci_parse($conn, $query);
        oci_execute($stid);

        $html = "";

        while (($row = oci_fetch_assoc($stid)) != false) {
            $html .= '
            <tr>
                <td>' . $row['SCH_ID'] . '</td>
                <td>' . $row['DEPARTURE'] . '</td>
                <td>' . $row['DESTINATION'] . '</td>
                <td>' . $row['DEPARTURE_TIME'] . '</td>
                <td>' . $row['ARRIVAL_TIME'] . '</td>
                <td>' . $row['COST'] . '</td>
                <td>' . $row['MGR_NAME'] . '</td>
            </tr>';
        }
        echo $html;
    } catch (Exception $ex) {
        header("Location: ../view/database-error.php");
        die();
    }
}
