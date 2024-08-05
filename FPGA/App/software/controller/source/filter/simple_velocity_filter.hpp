/**
 * @file velocity_filter.hpp
 * @author Fujii Naomichi
 * @copyright (c) 2021 Fujii Naomichi
 * SPDX-License-Identifier: MIT
 */

#pragma once

#include <Eigen/Core>
#include <Eigen/LU>

/**
 * @brief IMUの測定値とオドメトリから車体速度を推定する
 */
class SimpleVelocityFilter {

public:
    /**
     * @brief 内部状態をリセットする
     */
    void reset(void);

    /**
     * @brief フィルタに新たな入力を与えて出力を更新する
     * @param accel 加速度センサーの測定値
     * @param gyro ジャイロスコープの測定値
     * @param vel_wheel 車輪からの車体速度観測値
     */
    void update(const Eigen::Vector3f& accel, const Eigen::Vector3f& gyro, const Eigen::Vector3f& vel_wheel);

    /**
     * @brief 車体速度の推定値を取得する
     * @return 車体速度 X [m/s], Y [m/s], ω [rad/s]
     */
    Eigen::Vector3f bodyVelocity(void) const {
        return {_x(0), _x(1), _x(2)};
    }

    /// 状態変数の最尤値
    Eigen::Vector3f _x;

    /// 共分散
    Eigen::Matrix3f _p;
};
