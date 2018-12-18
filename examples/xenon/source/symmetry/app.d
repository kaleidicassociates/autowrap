module symmetry.app;
import symmetry.xenon;
import autowrap.python;
import std.algorithm:map;
import std.array:array;
import std.meta:staticMap,AliasSeq;


mixin(
    wrapAll(
        LibraryName("xenon"),
	Modules(
	modules)
    )
);

/+enum modules = AliasSeq!(
	//"symmetry.xenon",
	//"mir.date",
	"symmetry.exception",
	"symmetry.math.heaviside",
	"symmetry.math.normal",
	"symmetry.xenon.options",
	"symmetry.xenon.calibration",
	//"symmetry.generative",
	//"symmetry.heterogeneous_map",
	"symmetry.xenon.pricing",
	"symmetry.xenon.product.accrual_period",
	"symmetry.xenon.product.fixed_coupon_bond",
	//"symmetry.xenon.product.fixed_coupon_period",
	"symmetry.xenon.product.fra_ois",
	"symmetry.xenon.product.fra",
	"symmetry.xenon.product.future",
	//"symmetry.xenon.product.fx_ndf",
	//"symmetry.xenon.product.fx",
	"symmetry.xenon.product.option",
	"symmetry.xenon.product.option.rates",
	"symmetry.xenon.product.option.rates.swaption_securities",
	"symmetry.xenon.product.option.rates.swaption",
	"symmetry.xenon.product.swap",
	"symmetry.xenon.product.swap.credit_default",
	"symmetry.xenon.product.swap.fx",
	"symmetry.xenon.product.swap.inflation",
	"symmetry.xenon.product.swap.leg",
	"symmetry.xenon.product.swap.payment_period",
	"symmetry.xenon.product.swap.payment",
	"symmetry.xenon.product.swap.template_",
	"symmetry.xenon.product.zero_coupon_bond",
	"symmetry.xenon.product",
	//"symmetry.xenon.curve.decorator",
	//"symmetry.xenon.curve",
	"symmetry.xenon.numeric.comparisons",
	//"symmetry.xenon.numeric.extrapolate",
	//"symmetry.xenon.numeric.interfaces",
	//"symmetry.xenon.numeric.interpolate",
	//"symmetry.xenon.numeric.optimiser",
	//"symmetry.xenon.rates.calculation.all",
	//"symmetry.xenon.rates.provider",
	"symmetry.xenon.temporal",
	/+
	"symmetry.xenon.volatility.bump",
	"symmetry.xenon.volatility.constructor",
	"symmetry.xenon.volatility.cube",
	"symmetry.xenon.volatility.delta_boundary",
	"symmetry.xenon.volatility.divident_curve",
	"symmetry.xenon.volatility.extrapolate.extrapolant.benaim_dodgson_kainth",
	"symmetry.xenon.volatility.extrapolate.extrapolant.shift_lognormal",
	"symmetry.xenon.volatility.extrapolate.extrapolator",
	"symmetry.xenon.volatility.extrapolate.interfaces",
	"symmetry.xenon.volatility.extrapolation",
	"symmetry.xenon.volatility.general_surface",
	"symmetry.xenon.volatility.general_surface.fx",
	"symmetry.xenon.volatility.general_surface.interpolation",
	"symmetry.xenon.volatility.general_surface.sabr",
	"symmetry.xenon.volatility.model_type",
	"symmetry.xenon.volatility.pricer.vanna_volga",
	"symmetry.xenon.volatility.sabr",
	"symmetry.xenon.volatility.smile",
	"symmetry.xenon.volatility.smile.constant",
	"symmetry.xenon.volatility.smile.interpolated",
	"symmetry.xenon.volatility.smile.sabr_calibrator",
	"symmetry.xenon.volatility.smile.sabr",
	+/
	//"symmetry.xenon.volatility.structs",
	/+
	"symmetry.xenon.volatility.surface",
	"symmetry.xenon.volatility.surface.equity",
	"symmetry.xenon.volatility.surface.fx",
	"symmetry.xenon.volatility.surface.impl",
	"symmetry.xenon.volatility.surface.risk",
	+/
);
+/
enum modules = AliasSeq!(
	"symmetry.xenon",
	"symmetry.xenon.options.digital",
	"symmetry.xenon.options.doublebarrier",
	"symmetry.xenon.options.doublebarrierdigital",
	"symmetry.xenon.options.doubletouch",
	"symmetry.xenon.options.dualdigital",
	"symmetry.xenon.options.fxutilities",
	"symmetry.xenon.options.greeks",
	"symmetry.xenon.options.impliedvolatility",
	"symmetry.xenon.options.singlebarrier",
	"symmetry.xenon.options.singlebarrierdigital",
	"symmetry.xenon.options.singletouch",
	"symmetry.xenon.options.skew",
	"symmetry.xenon.options.spread",
	"symmetry.xenon.options.window",
	"symmetry.xenon.calibration",
	"symmetry.xenon.calibration.credit_rates",

	"symmetry.xenon.convention",
	"symmetry.xenon.convention.dependencies",
	"symmetry.xenon.convention.credit_funding",
	"symmetry.xenon.convention.currency_pair",
	"symmetry.xenon.convention.currency",
	"symmetry.xenon.convention.funding",
	"symmetry.xenon.convention.price_index",
	"symmetry.xenon.convention.rate_index.ibor",
	"symmetry.xenon.convention.rate_index.overnight",

	"symmetry.xenon.curve",
	//"symmetry.xenon.curve-decorator", // FAILS
	"symmetry.xenon.curve.decorator.discount_zero_rate_parallel_shift",
	"symmetry.xenon.curve.decorator.inflation",
	"symmetry.xenon.curve.decorator.jump",
	"symmetry.xenon.curve.decorator.turn",
	"symmetry.math.bivariate_normal",
	"symmetry.xenon.numeric.optimiser",
	"symmetry.xenon.surface",
	 //"symmetry.xenon.option-core", //FAILS
	"symmetry.xenon.pricing",
	"symmetry.xenon.product",
	//"symmetry.xenon.rates-calculation",
	"symmetry.xenon.rates.provider",
	"symmetry.xenon.rates.provider.credit",
	"symmetry.xenon.rates.provider.discount_factors",
	"symmetry.xenon.rates.provider.fixing_set",
	"symmetry.xenon.rates.provider.fixings",
	"symmetry.xenon.rates.provider.fx_forward",
	"symmetry.xenon.rates.provider.fx",
	"symmetry.xenon.rates.provider.index_fixings",
	"symmetry.xenon.rates.provider.index",
	"symmetry.xenon.rates.provider.price_index",

	"symmetry.xenon.temporal",
	"symmetry.xenon.volatility.bump",
	//"symmetry.xenon.volatility.extra",
	"mir.date",
	"symmetry.xenon.curve.decorator",
	"symmetry.xenon.curve.decorator.jump",
	"symmetry.xenon.curve.decorator.turn",
	"symmetry.xenon.product.accrual_period",
	"symmetry.algebraic",
	"symmetry.exception",
	//"symmetry.generative",
	"symmetry.heterogeneous_map",
	//"symmetry.integration.common",
	//"symmetry.integration.dcpp",
	//"symmetry.integration.dcpp_test",
	"symmetry.integration.stdcpp",
	"symmetry.math.bivariate_normal",
	"symmetry.math.heaviside",
	"symmetry.math.normal",
	
	"symmetry.xenon.calibration",
	"symmetry.xenon.calibration.constraint",
	"symmetry.xenon.calibration.constraint.curve",
	"symmetry.xenon.calibration.constraint.error",
	"symmetry.xenon.calibration.constraint.fra",
	"symmetry.xenon.calibration.constraint.fra_ois",
	"symmetry.xenon.calibration.constraint.future",
	"symmetry.xenon.calibration.constraint.fx_forward",
	"symmetry.xenon.calibration.constraint.fx_swap",
	"symmetry.xenon.calibration.constraint.overnight_rate",
	"symmetry.xenon.calibration.constraint.swap",
	"symmetry.xenon.calibration.credit_rates",
	 "symmetry.xenon.calibration.inflation_curve", // slow
	"symmetry.xenon.calibration.purpose",
	//"symmetry.xenon.calibration.rates",
	 "symmetry.xenon.calibration.rates_cost",
	 "symmetry.xenon.calibration.rates_curve_definition",
	"symmetry.xenon.convention",
	"symmetry.xenon.convention.wrap",
	"symmetry.xenon.convention.bond.base",
		 "symmetry.xenon.convention.bond.fixed",
		 "symmetry.xenon.convention.bond.zero",
		 "symmetry.xenon.convention.cds",
		 "symmetry.xenon.convention.credit_funding",
		 "symmetry.xenon.convention.currency",
		 "symmetry.xenon.convention.currency_amount",
		 "symmetry.xenon.convention.currency_pair",
		 "symmetry.xenon.convention.dependencies",
	"symmetry.xenon.convention.enums",
		 "symmetry.xenon.convention.fra",
		 "symmetry.xenon.convention.fra_ois",
		 "symmetry.xenon.convention.funding",
		 "symmetry.xenon.convention.future",
		 "symmetry.xenon.convention.fx_rate",
	"symmetry.xenon.convention.initialization",
		 "symmetry.xenon.convention.isda_swap_constraint",
		 "symmetry.xenon.convention.money_market_constraint",
	"symmetry.xenon.convention.multi_currency_amount",
	"symmetry.xenon.convention.name_builder",
		 "symmetry.xenon.convention.price_index", 
		 "symmetry.xenon.convention.rate_index.base",
		 "symmetry.xenon.convention.rate_index.ibor",
		 "symmetry.xenon.convention.rate_index.overnight",
	"symmetry.xenon.convention.rounding",
		 "symmetry.xenon.convention.swap",
		"symmetry.xenon.convention.swaption",
		"symmetry.xenon.convention.zc_inflation_swap",
	"symmetry.xenon.curve",
	"symmetry.xenon.curve.decorator.discount_zero_rate_parallel_shift",
	"symmetry.xenon.curve.decorator.inflation",
//	"symmetry.xenon.curve.decorator.jump_test",
//	"symmetry.xenon.curve.decorator.turn_test",
	//"symmetry.xenon.curve.test",
	"symmetry.xenon.numeric.comparisons",
	"symmetry.xenon.numeric.extrapolate",
	"symmetry.xenon.numeric.extrapolate.exception",
	"symmetry.xenon.numeric.extrapolate.extrapolant",
	"symmetry.xenon.numeric.extrapolate.interfaces",
	"symmetry.xenon.numeric.extrapolate.structs",
	"symmetry.xenon.numeric.integration",
	"symmetry.xenon.numeric.integration_impl",
	"symmetry.xenon.numeric.interfaces",
	"symmetry.xenon.numeric.interpolate",
	"symmetry.xenon.numeric.interpolate.exception",
	"symmetry.xenon.numeric.interpolate.interfaces",
	"symmetry.xenon.numeric.interpolate.interpolant",
	"symmetry.xenon.numeric.interpolate.interpolator",
	//"symmetry.xenon.numeric.interpolate.test",
	"symmetry.xenon.numeric.optimiser",
	"symmetry.xenon.options",
	"symmetry.xenon.options.digital",
	"symmetry.xenon.options.doublebarrier",
	"symmetry.xenon.options.doublebarrierdigital",
	"symmetry.xenon.options.doubletouch",
	"symmetry.xenon.options.dualdigital",
	"symmetry.xenon.options.enums",
	"symmetry.xenon.options.european.base",
	"symmetry.xenon.options.european.doublebarrier",
	"symmetry.xenon.options.european.sabr",
	"symmetry.xenon.options.european.singlebarrier",
	"symmetry.xenon.options.fxutilities",
	"symmetry.xenon.options.greeks",
	"symmetry.xenon.options.impliedvolatility",
	"symmetry.xenon.options.integration",
	"symmetry.xenon.options.integration_fx_utilities",
	"symmetry.xenon.options.quanto.digital",
	"symmetry.xenon.options.quanto.doublebarrierdigital",
	"symmetry.xenon.options.quanto.doubletouch",
	"symmetry.xenon.options.quanto.dualdigital",
	"symmetry.xenon.options.quanto.singlebarrierdigital",
	"symmetry.xenon.options.quanto.singletouch",
	"symmetry.xenon.options.singlebarrier",
	"symmetry.xenon.options.singlebarrierdigital",
	"symmetry.xenon.options.singletouch",
	"symmetry.xenon.options.skew",
	"symmetry.xenon.options.spread",
	"symmetry.xenon.options.swaption_calibration_data",
	"symmetry.xenon.options.window",
	"symmetry.xenon.pricing",
	"symmetry.xenon.pricing.bond",
	"symmetry.xenon.pricing.cds",
	"symmetry.xenon.pricing.fixed_bond",
	"symmetry.xenon.pricing.fixed_bond_payment_period",
	"symmetry.xenon.pricing.fra",
	"symmetry.xenon.pricing.future",
	"symmetry.xenon.pricing.fx",
	"symmetry.xenon.pricing.fx_ndf",
	"symmetry.xenon.pricing.fx_swap", 
	"symmetry.xenon.pricing.notional_payment",

	"symmetry.xenon.pricing.payment_period",
	"symmetry.xenon.pricing.swap",
	"symmetry.xenon.pricing.swap_leg",
	"symmetry.xenon.pricing.var_swap",
	"symmetry.xenon.pricing.zc_inflation_swap",
	"symmetry.xenon.pricing.zero_bond",
	"symmetry.xenon.product",
	"symmetry.xenon.product.wrap",
	"symmetry.xenon.product.fixed_coupon_bond",
	"symmetry.xenon.product.fixed_coupon_period",
	"symmetry.xenon.product.fra",
	"symmetry.xenon.product.fra_ois",
	"symmetry.xenon.product.future",
	"symmetry.xenon.product.fx",
	"symmetry.xenon.product.fx_ndf",
	"symmetry.xenon.product.option",
	"symmetry.xenon.product.option.rates",
	"symmetry.xenon.product.option.rates.swaption",
	"symmetry.xenon.product.option.rates.swaption_securities",
	"symmetry.xenon.product.swap",
	"symmetry.xenon.product.swap.credit_default",
	"symmetry.xenon.product.swap.fx",
	"symmetry.xenon.product.swap.inflation",
	"symmetry.xenon.product.swap.leg",
	"symmetry.xenon.product.swap.payment",
	"symmetry.xenon.product.swap.payment_period",
	"symmetry.xenon.product.swap.template_",
	"symmetry.xenon.product.zero_coupon_bond",
	"symmetry.xenon.rates.calculation",
	"symmetry.xenon.rates.calculation.all",
	"symmetry.xenon.rates.calculation.fixed",
	"symmetry.xenon.rates.calculation.ibor",
	"symmetry.xenon.rates.calculation.ibor_interpolated",
	"symmetry.xenon.rates.calculation.inflation",
	"symmetry.xenon.rates.calculation.overnight_averaged",
	"symmetry.xenon.rates.calculation.overnight_compounded",
	//"symmetry.xenon.rates.calculation.test",
	//"symmetry.xenon.rates.fx_test",
	"symmetry.xenon.rates.provider",
	"symmetry.xenon.rates.provider.credit",
	"symmetry.xenon.rates.provider.discount_factors",
			//"symmetry.xenon.rates.provider.discount_factors_test",
	"symmetry.xenon.rates.provider.fixings",
	"symmetry.xenon.rates.provider.fixing_set",
	"symmetry.xenon.rates.provider.fx",
	"symmetry.xenon.rates.provider.fx_forward",
			//"symmetry.xenon.rates.provider.ibor_test",
	"symmetry.xenon.rates.provider.index",
	"symmetry.xenon.rates.provider.index_fixings",
			//"symmetry.xenon.rates.provider.overnight_test",
	"symmetry.xenon.rates.provider.price_index",
	/+
	"symmetry.xenon.surface",
	"symmetry.xenon.temporal",
	"symmetry.xenon.temporal.adjuster",
	"symmetry.xenon.temporal.business_day_convention",
	"symmetry.xenon.temporal.calendar",
	"symmetry.xenon.temporal.calendar_lookup_data",
	"symmetry.xenon.temporal.day_count",
	"symmetry.xenon.temporal.frequency",
	"symmetry.xenon.temporal.period",
	"symmetry.xenon.temporal.roll_convention",
	/+
	"symmetry.xenon.temporal.schedule",
	//"symmetry.xenon.temporal.schedule_test",
	+/
	"symmetry.xenon.temporal.stub_type",
	"symmetry.xenon.temporal.tenor",
	"symmetry.xenon.temporal.unit",
	"symmetry.xenon.temporal.vol_day_count",
	"symmetry.xenon.temporal.year_month",
	"symmetry.xenon.volatility.bump",
	"symmetry.xenon.volatility.constructor",
		//"symmetry.xenon.volatility.constructor_test",
	"symmetry.xenon.volatility.cube",
	"symmetry.xenon.volatility.delta_boundary",
	"symmetry.xenon.volatility.divident_curve",
	"symmetry.xenon.volatility.extrapolate.extrapolant.benaim_dodgson_kainth",
	"symmetry.xenon.volatility.extrapolate.extrapolant.shift_lognormal",
	"symmetry.xenon.volatility.extrapolate.extrapolator",
	"symmetry.xenon.volatility.extrapolate.interfaces",
	"symmetry.xenon.volatility.extrapolation",
	"symmetry.xenon.volatility.general_surface",
	"symmetry.xenon.volatility.general_surface.fx",
	"symmetry.xenon.volatility.general_surface.interpolation",
	"symmetry.xenon.volatility.general_surface.sabr",
	"symmetry.xenon.volatility.model_type",
	"symmetry.xenon.volatility.pricer.vanna_volga",
	"symmetry.xenon.volatility.sabr",
	"symmetry.xenon.volatility.smile",
	"symmetry.xenon.volatility.smile.constant",
	"symmetry.xenon.volatility.smile.interpolated",
	"symmetry.xenon.volatility.smile.sabr",
	//"symmetry.xenon.volatility.smile.sabr_calibrator",
	//"symmetry.xenon.volatility.smile_test",
	//"symmetry.xenon.volatility.structs",
	//"symmetry.xenon.volatility.surface",
	//"symmetry.xenon.volatility.surface.equity",
	//"symmetry.xenon.volatility.surface.fx",
	//"symmetry.xenon.volatility.surface.impl",
	//"symmetry.xenon.volatility.surface.risk",
	//"symmetry.xenon.volatility.utilities",
	+/
);
