/**
 * @file velocity_filter.cpp
 * @author Fujii Naomichi
 * @copyright (c) 2021 Fujii Naomichi
 * SPDX-License-Identifier: MIT
 */

#include <math.h>

#include "simple_velocity_filter.hpp"
#include "board.hpp"

using namespace Eigen;

/// 車輪速度の標準偏差 [m/s]
static constexpr float SIGMA_VELOCITY_X = 0.01f;

/// 車輪速度の標準偏差 [m/s]
static constexpr float SIGMA_VELOCITY_Y = 0.01f;

/// 車輪速度の標準偏差 [m/s]
static constexpr float SIGMA_VELOCITY_OMEGA = 0.001f;

/// 加速度センサーの標準偏差 [m/s^2]
static constexpr float SIGMA_ACCELEROMETER = 0.001f;

/// ジャイロセンサーの標準偏差 [rad/s]
static constexpr float SIGMA_GYROSCOPE = 0.005f;

void SimpleVelocityFilter::reset(void) {
    _x.setZero();
    _p.setZero();
}

void SimpleVelocityFilter::update(const Eigen::Vector3f& accel, const Eigen::Vector3f& gyro, const Eigen::Vector3f& vel_wheel) {
    // 定数の定義
    constexpr float DT = 1.0f / IMU_OUTPUT_RATE;
    constexpr float q_acc = powf(SIGMA_ACCELEROMETER, 2) * DT;
    constexpr float q_gyro = powf(SIGMA_GYROSCOPE, 2) * DT;
    constexpr float r_x = powf(SIGMA_VELOCITY_X, 2) * DT;
    constexpr float r_y = powf(SIGMA_VELOCITY_Y, 2) * DT;
    constexpr float r_omega = powf(SIGMA_VELOCITY_OMEGA, 2) * DT;

    static const Matrix3f I = Eigen::Matrix3f::Identity();

    Matrix3f Q(3,3);
    Q(0,0) = q_acc;
    Q(1,1) = q_acc;
    Q(2,2) = q_gyro;

    Matrix3f R(3,3);
    R(0,0) = r_x;
    R(1,1) = r_y;
    R(2,2) = r_omega;

    // 状態予測
    Vector3f x_hat;
    x_hat(0) = _x(0) + accel.x()*DT;
    x_hat(1) = _x(1) + accel.y()*DT;
    x_hat(2) = _x(2) + gyro.z()*DT;

    // 誤差共分散予測
    Matrix3f p_hat;
    p_hat = _p + Q;

    // カルマンゲインの計算
    Matrix3f K;
    K = p_hat * (p_hat + R).inverse();

    // 状態更新
    _x = x_hat + K * (vel_wheel - x_hat);

    // 誤差共分散更新
    _p = (I - K) * p_hat;

}
