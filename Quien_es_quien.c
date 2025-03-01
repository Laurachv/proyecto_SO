#include <mysql.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>

int main(int argc, char **argv) {
    MYSQL *conn;
    int err;
    MYSQL_RES *resultado;
    MYSQL_ROW row;
    int puntuacion;
    char id_jugador[10];
    char consulta[80];

    conn = mysql_init(NULL);
    if (conn == NULL) {
        printf("Error al crear la conexión: %u %s\n", mysql_errno(conn), mysql_error(conn));
        exit(1);
    }

    conn = mysql_real_connect(conn, "localhost", "root", "mysql", "Quien_es_quien", 0, NULL, 0);
    if (conn == NULL) {
        printf("Error al inicializar la conexión: %u %s\n", mysql_errno(conn), mysql_error(conn));
        exit(1);
    }

    err = mysql_query(conn, "SELECT * FROM Partidas");
    if (err != 0) {
        printf("Error al consultar datos de la base %u %s\n", mysql_errno(conn), mysql_error(conn));
        exit(1);
    }

    resultado = mysql_store_result(conn);
    row = mysql_fetch_row(resultado);
    if (row == NULL)
        printf("No se han obtenido datos en la consulta\n");
    else
        while (row != NULL) {
            puntuacion = atoi(row[4]);
            printf("ID_partida: %s, ID_jugador: %s, Victorias: %s, Derrotas: %s, Puntuacion: %d\n", row[0], row[1], row[2], row[3], puntuacion);
            row = mysql_fetch_row(resultado);
        }

    printf("Dame el ID del jugador que quieres buscar\n");
    scanf("%s", id_jugador);

    strcpy(consulta, "SELECT nombre FROM Jugadores WHERE ID_jugador = '");
    strcat(consulta, id_jugador);
    strcat(consulta, "'");

    err = mysql_query(conn, consulta);
    if (err != 0) {
        printf("Error al consultar datos de la base %u %s\n", mysql_errno(conn), mysql_error(conn));
        exit(1);
    }

    resultado = mysql_store_result(conn);
    row = mysql_fetch_row(resultado);
    if (row == NULL)
        printf("No se han obtenido datos en la consulta\n");
    else
        printf("Nombre del jugador: %s\n", row[0]);

    mysql_close(conn);
    exit(0);
}