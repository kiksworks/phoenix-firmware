#pragma once

#include <stdint.h>

/**
 * 共有メモリーの構造を定義する構造体 (最大1024バイト)
 */
struct SharedMemory_t {
    /**
     * エラーフラグのビットマップ
     * この値を0xFFFFFFFFにセットするとエラーの解除が試みられる
     */
    uint32_t ErrorFlags;

    /**
     * フォルトフラグのビットマップ
     */
    uint32_t FaultFlags;

    /**
     * 先頭のチェックサム
     * HeadChecksumとTailChecksumが等しいときにのみParametersは有効として扱われる
     * ROS2の命名規則に則りROS2で使うフィールド名は小文字になっている
     */
    uint32_t HeadChecksum;

    /**
     * JetsonからNios IIへ制御パラメータを伝達する構造体
     */
    struct Parameters_t {
        /**
         * フレーム番号。更新するたびに1ずつ増やす
         */
        uint32_t FrameNumber;

        /**
         * 車輪の速度[m/s]
         */
        float wheel_speed[4];

        /**
         * ドリブルパワー (-1.0 ～ 1.0)
         */
        float dribble_power;

        /**
         * チェックサムを計算する
         * この関数はParameters_tが4の倍数バイトの大きさであることを前提にしている
         */
        uint32_t CalculateChecksum(void) const {
            auto p = reinterpret_cast<const uint32_t*>(this);
            int count = sizeof(Parameters_t) / sizeof(uint32_t);
            uint32_t result = 0xA5A5A5A5;
            while (0 <= --count) {
                result += *p++;
            }
            return result;
        }
    } Parameters;

    /**
     * 末尾のチェックサム
     * HeadChecksumとTailChecksumが等しいときにのみParametersは有効として扱われる
     */
    uint32_t TailChecksum;
};
