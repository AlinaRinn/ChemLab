extends Spatial

# Common form signals
export(bool) var flow
var finished
var audiopos = 0.0
#var
#var
#var
#var
#var
#var

func _ready():
	G.connect("waterflow", self, "waterflow")
	#con
	#con
	#con
	#con
	
func waterflow(active, _level):
	if active and !finished:
		$AnimationPlayer.play("Filling")
		$AudioStreamPlayer3D.play(audiopos)
	else:
		$AnimationPlayer.stop(false)
		audiopos = $AudioStreamPlayer3D.get_playback_position()
		$AudioStreamPlayer3D.stop()

func _on_AnimationPlayer_animation_finished(_anim_name):
	finished = true
	G.exchanger_full = true

# Модель теплообмена:
# 1 - горячий поток, 2 - холодный; Процесс - нагревание потока (2) 
# V1, V2 – объёмные скорости движения; 
# p1, p2 - плотности; 
# Сp1, Сp2 - удельные теплоёмкости;
# Т1, T2 - температуры жидкостей (1), (2) (начальные);
# Т3 – температура окружающего воздуха; 
# d1, d2 – средние диаметры труб, равные полусуммам наружных и внутренних диаметров труб; 
# L – длина труб; 
# x – текущая координата длины трубы; 
# lambda1, lambda2 – теплопроводность материала трубы медь - 390, стекло - 1;
# alpha11, alpha12, alpha22 – коэффициенты теплоотдачи между потоками жидкостей и поверхностями (наружными и внутренними) стенок; 
# alpha23 – коэффициент теплоотдачи от наружной поверхности трубы к окружающему аппарат воздуху; 
# dT1, dT2 – дифференциалы изменения температур жидкостей на дифференциале dx длины труб аппарата.
# расчет
# отдача 15 % КПД 85 %
# ∆T1 = 95 - 40 = 55 ℃
# ∆T2 = 88 - 24 = 64 ℃  
# ∆T3 = 0
# ∆Tб = 64 
# ∆Tм = 55
# ∆Tср = (∆Tм + ∆Tб) / 2 = 59,5 от горячего к холодному


## Расчет теплообменника с интерфейсом к данным
#func exchange(L, x, n, T1, T2, T3, V1, V2, d1, d2, lambda, alpha11, alpha12, alpha22, alpha23, dT1, dT2):
#	var deltaX: float = (L - x) / (n - 1) # размер шагов расчета: (длина трубы - начальная точка) / (количество точек - 1). Пример: (1000 - 250) / (4 - 1) = 250: 250, 500, 750, 1000 
#	var z: float = x / L # для dZ
#	var p1: float = (((T1 - 20) / (100 - 20)) * (958.4 - 1000)) + 1000 # приближение плотности для воды + todo взять среднее для расчета, тк меняется в ходе расчета
#	var p2: float = (((T2 - 20) / (100 - 20)) * (958.4 - 1000)) + 1000
#	var Cp1: float = 4200 # приближение теплоемкости (TODO уточнить)
#	var Cp2: float = 4200 
#	water_heat_exchange()
#
## Расчет температуры в точке
##                        1   1   1   1   1    1    1   1   1   1   1   1  1  1        1        1    1    1    1    0    0
#func point_heat_exchange(V1, V2, p1, p2, Cp1, Cp2, T1, T2, T3, d1, d2, L, x, lambda1, lambda2, F12, F23, K12, K23, dT1, dT2):
#	var z = x / L # безразмерная координата длины трубы
#
#	# Параметры системы
#	var K12 = 100.0
#	var F12 = 2.0
#	var U1 = 1.0
#	var rho1 = 1.0
#	var Cp1 = 1.0
#
#	var K23 = 80.0
#	var F23 = 1.5
#	var U2 = 1.0
#	var rho2 = 1.0
#	var Cp2 = 1.0
#
#	var C1 = K12 * F12 / (U1 * rho1 * Cp1)
#	var C2 = K12 * F12 / (U2 * rho2 * Cp2)
#	var C3 = K23 * F23 / (U2 * rho2 * Cp2)
#
#	for i in n:
#		# k1
#		var k1_T1 = -C1 * (T1 - T2)
#		var k1_T2 = C2 * (T1 - T2) - C3 * (T2 - T3)
#
#		# k2
#		var T1_k2 = T1 + h * k1_T1 / 2.0
#		var T2_k2 = T2 + h * k1_T2 / 2.0
#		var k2_T1 = -C1 * (T1_k2 - T2_k2)
#		var k2_T2 = C2 * (T1_k2 - T2_k2) - C3 * (T2_k2 - T3)
#
#		# k3
#		var T1_k3 = T1 + h * k2_T1 / 2.0
#		var T2_k3 = T2 + h * k2_T2 / 2.0
#		var k3_T1 = -C1 * (T1_k3 - T2_k3)
#		var k3_T2 = C2 * (T1_k3 - T2_k3) - C3 * (T2_k3 - T3)
#
#		# k4
#		var T1_k4 = T1 + h * k3_T1
#		var T2_k4 = T2 + h * k3_T2
#		var k4_T1 = -C1 * (T1_k4 - T2_k4)
#		var k4_T2 = C2 * (T1_k4 - T2_k4) - C3 * (T2_k4 - T3)
#
#		# Обновляем T1 и T2
#		T1 += h * (k1_T1 + 2.0 * k2_T1 + 2.0 * k3_T1 + k4_T1) / 6.0
#		T2 += h * (k1_T2 + 2.0 * k2_T2 + 2.0 * k3_T2 + k4_T2) / 6.0
#		z += h
#
#		print("z = %.2f, T1 = %.4f, T2 = %.4f" % [z, T1, T2])
#
#func RK4()
