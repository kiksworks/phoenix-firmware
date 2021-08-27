#pragma once

#include <math.h> // math.h内のfmaxf,fminfを後でカスタム命令版に置き換えるため最初にincludeする
#include <system.h>
#include "board.hpp"
#include "data_holder.hpp"
#include <Eigen/Core>
#include "filter/gravity_filter.hpp"
#include "filter/velocity_filter.hpp"
#include "filter/torque_observer.hpp"

/**
 * 車輪制御を行う
 */
class WheelController {
public:
    /**
     * @brief 初期化を行う
     */
    static void initialize(void) {
        stopControl();
    }

    /**
     * @brief モーター制御を開始する
     */
    static void startControl(void);

    /**
     * @brief モーター制御を終了し、モーターを脱力する
     */
    static void stopControl(void);

    /**
     * @brief 指令値を更新する
     * @param new_parameters new_parameters 共有メモリーのParametersが更新されたときにtrueを指定する
     * @param sensor_only trueのときセンサーデータの更新のみ行う
     */
    static void update(bool new_parameters, bool sensor_only);

    /**
     * @brief 重力フィルタへアクセスする
     * @return 重力フィルタ
     */
    static const GravityFilter& gravityFilter(void) {
        return _gravity_filter;
    }

    /**
     * @brief 速度フィルタへアクセスする
     * @return 速度フィルタ 
     */
    static const VelocityFilter& velocityFilter(void) { 
        return _velocity_filter;
    }

    /**
     * @brief 車体加速度の推定値を取得する
     * @return 車体加速度 X, Y, Z [m/s^2]
     */
    static const Eigen::Vector3f& bodyAcceleration(void) {
        return _gravity_filter.acceleration();
    }

    /**
     * @brief 車体速度の推定値を取得する
     * @return 車体速度 X [m/s], Y [m/s], ω [rad/s]
     */
    static const Eigen::Vector3f& bodyVelocity(void) {
        return _velocity_filter.bodyVelocity();
    }

    /**
     * @brief 車体のトルクの推定値を取得する
     * @return トルク [Nm]
     */
    static float absBodyTorque(void) {
        return _torque_observer.absTorque();
    }

    static float omegaWeight(void) {
        return _omega_weight;
    }

    static Eigen::Vector4f referenceAccelerationUnlimited(void) {
        return _ref_body_accel_unlimit;
    }

    static Eigen::Vector4f referenceAcceleration(void) {
        return _ref_body_accel;
    }

private:
    /**
     * 制御情報をクリアする
     */
    static void initializeState(void);

    /**
     * レジスタを初期化する
     */
    static void initializeRegisters(void);

    /**
     * @brief 車体角速度の推定重みを計算する。
     * 重みの計算結果は_omega_weightに格納される。
     * @param ref_body_omega 車体角速度の指令値 [rad/s]
     * @param odom_body_omega エンコーダのみから求めた車体角速度 [rad/s]
     */
    static void calculateOmegaWeight(float ref_body_omega, float odom_body_omega);

    /**
     * @brief 加速度を制限する。
     * 加速度は_ref_body_accel_unlimitから入力し、_ref_body_accelと_ref_wheel_currentへ出力する。
     * @param max_accel X,Y方向への最大加速度 [m/s^2]
     */
    static void limitAcceleration(float max_accel);
    
    /// IMUの加速度から重力を分離するフィルタ
    static GravityFilter _gravity_filter;

    /// IMUとエンコーダから車体速度を求めるカルマンフィルタ
    static VelocityFilter _velocity_filter;

    /// モーターが車体の回転に与えるトルクを推定する駆動力オブザーバ
    static TorqueObserver _torque_observer;

    /// 車体角速度の推定重み
    /// 0ならIMUのみ、1なら車輪速度からのみ求める
    static float _omega_weight;

    /// 前回の制御ループでの車体速度誤差
    static Eigen::Vector4f _last_body_velocity_error;

    /// 車体加速度の指令値(制限前の値)
    static Eigen::Vector4f _ref_body_accel_unlimit;

    /// 車体加速度の指令値(制限後の値)
    static Eigen::Vector4f _ref_body_accel;

    /// 電流制御の指令値 [A]
    static Eigen::Vector4f _ref_wheel_current;

    /// モーターの発生させた回生エネルギー (負の値をとる)
    static Eigen::Vector4f _regeneration_energy;
};
