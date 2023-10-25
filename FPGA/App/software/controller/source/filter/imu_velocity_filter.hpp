#pragma once

#include <Eigen/Core>

/**
 * @brief IMUの測定値から車体速度を推定する
 */
class ImuVelocityFilter {
private:
    /// 速度のデータ
    Eigen::Vector3f _vel;
public:
    /**
     * @brief 内部状態をリセットする
     */
    void reset(void){
    	_vel.setZero();
    }

    /**
     * @brief フィルタに新たな入力を与えて出力を更新する
     * @param accel 加速度センサーの測定値
     * @param gyro ジャイロスコープの測定値
     */
    void update(const Eigen::Vector3f& accel, const Eigen::Vector3f& gyro){
        // 定数の定義
        constexpr float dt = 1.0f / IMU_OUTPUT_RATE;
    	_vel(0) += accel.x()*dt;
    	_vel(1) += accel.y()*dt;
    	_vel(2) += gyro.z()*dt;
    };

    /**
     * @brief 車体速度の推定値を取得する
     * @return 車体速度 X [m/s], Y [m/s], ω [rad/s]
     */
    Eigen::Vector3f bodyVelocity(void) const {
        return {_vel(0), _vel(1), _vel(2)};
    }
};
