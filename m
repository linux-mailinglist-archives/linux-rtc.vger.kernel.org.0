Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E758235B444
	for <lists+linux-rtc@lfdr.de>; Sun, 11 Apr 2021 14:36:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235127AbhDKMgb (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 11 Apr 2021 08:36:31 -0400
Received: from mga09.intel.com ([134.134.136.24]:53725 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229804AbhDKMga (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Sun, 11 Apr 2021 08:36:30 -0400
IronPort-SDR: hkLt4vvrj7LF6WN6tt7AcuyDa69n3qfoC6yL4lRAGpMvUZ4DTa0ogadiBMuwq2Cbwttd4NDVek
 zTnWKWhORMVA==
X-IronPort-AV: E=McAfee;i="6000,8403,9950"; a="194135315"
X-IronPort-AV: E=Sophos;i="5.82,214,1613462400"; 
   d="scan'208";a="194135315"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2021 05:36:11 -0700
IronPort-SDR: 4yV7ScpjmTDdbwkvYdbdw3iL8b7Z2czR1TcNoX88LCjrOBcXtQj6GO59Z2xATfsCa3FuAK6T7t
 gRonSt4xb8aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,214,1613462400"; 
   d="scan'208";a="381232453"
Received: from lkp-server01.sh.intel.com (HELO 69d8fcc516b7) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 11 Apr 2021 05:36:07 -0700
Received: from kbuild by 69d8fcc516b7 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lVZJu-000J00-GB; Sun, 11 Apr 2021 12:36:06 +0000
Date:   Sun, 11 Apr 2021 20:35:20 +0800
From:   kernel test robot <lkp@intel.com>
To:     satya priya <skakit@codeaurora.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     kbuild-all@lists.01.org, Lee Jones <lee.jones@linaro.org>,
        linux-rtc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH V2 4/4] dt-bindings: rtc: qcom-pm8xxx-rtc: Add qcom
 pm8xxx rtc bindings
Message-ID: <202104112046.PVknakDF-lkp@intel.com>
References: <1617976766-7852-5-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1617976766-7852-5-git-send-email-skakit@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi satya,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on abelloni/rtc-next]
[also build test WARNING on lee-mfd/for-mfd-next robh/for-next v5.12-rc6 next-20210409]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/satya-priya/Add-RTC-support-for-PMIC-PMK8350/20210409-220149
base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0
reproduce: make ARCH=arm dtbs_check

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


dtcheck warnings: (new ones prefixed by >>)
   	arch/arm/boot/dts/qcom-apq8060-dragonboard.dt.yaml: timer@2000000: clock-frequency: 'oneOf' conditional failed, one must be fixed:
   		[[27000000], [32768]] is too long
   		missing size tag in [[27000000], [32768]]
   		[27000000] is too short
   		[32768] is too short
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/clock/clock.yaml
   arch/arm/boot/dts/qcom-apq8060-dragonboard.dt.yaml: clock-controller@900000: '#power-domain-cells' is a required property
   	From schema: Documentation/devicetree/bindings/clock/qcom,gcc.yaml
   arch/arm/boot/dts/qcom-apq8060-dragonboard.dt.yaml: ak8975@c: 'vid-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/iio/magnetometer/asahi-kasei,ak8975.yaml
>> arch/arm/boot/dts/qcom-apq8060-dragonboard.dt.yaml: pmic@0: 'gpio@150', 'keypad@148', 'led@131', 'led@132', 'led@133', 'led@48', 'mpps@50', 'pwrkey@1c', 'vibrator@4a', 'xoadc@197' do not match any of the regexes: 'pinctrl-[0-9]+', 'rtc@[0-9a-f]+$'
   	From schema: Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
   arch/arm/boot/dts/qcom-apq8060-dragonboard.dt.yaml: gpio@150: ethernet-gpios: {'phandle': [[23]], 'pinconf': {'pins': ['gpio7'], 'function': ['normal'], 'input-enable': True, 'bias-disable': True, 'power-source': [[2]]}} is not of type 'array'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/gpio/gpio-consumer.yaml
   arch/arm/boot/dts/qcom-apq8060-dragonboard.dt.yaml: gpio@150: bmp085-gpios: {'phandle': [[17]], 'pinconf': {'pins': ['gpio16'], 'function': ['normal'], 'input-enable': True, 'bias-disable': True, 'power-source': [[2]]}} is not of type 'array'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/gpio/gpio-consumer.yaml
   arch/arm/boot/dts/qcom-apq8060-dragonboard.dt.yaml: gpio@150: mpu3050-gpios: {'phandle': [[18]], 'pinconf': {'pins': ['gpio17'], 'function': ['normal'], 'input-enable': True, 'bias-disable': True, 'power-source': [[2]]}} is not of type 'array'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/gpio/gpio-consumer.yaml
   arch/arm/boot/dts/qcom-apq8060-dragonboard.dt.yaml: gpio@150: sdcc3-gpios: {'phandle': [[35]], 'pinconf': {'pins': ['gpio22'], 'function': ['normal'], 'input-enable': True, 'bias-disable': True, 'power-source': [[2]]}} is not of type 'array'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/gpio/gpio-consumer.yaml
   arch/arm/boot/dts/qcom-apq8060-dragonboard.dt.yaml: gpio@150: sdcc5-gpios: {'phandle': [[37]], 'pinconf': {'pins': ['gpio26'], 'function': ['normal'], 'input-enable': True, 'bias-pull-up': True, 'qcom,pull-up-strength': [[0]], 'power-source': [[2]]}} is not of type 'array'
--
   arch/arm/boot/dts/qcom-apq8064-cm-qs600.dt.yaml: power-controller@20a9000: '#power-domain-cells' is a required property
   	From schema: Documentation/devicetree/bindings/power/power-domain.yaml
   arch/arm/boot/dts/qcom-apq8064-cm-qs600.dt.yaml: power-controller@20b9000: '#power-domain-cells' is a required property
   	From schema: Documentation/devicetree/bindings/power/power-domain.yaml
   arch/arm/boot/dts/qcom-apq8064-cm-qs600.dt.yaml: sps-sic-non-secure@12100000: compatible: 'anyOf' conditional failed, one must be fixed:
   	['syscon'] is too short
   	'syscon' is not one of ['allwinner,sun8i-a83t-system-controller', 'allwinner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller', 'allwinner,sun50i-a64-system-controller', 'hisilicon,dsa-subctrl', 'hisilicon,hi6220-sramctrl', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl', 'microchip,sparx5-cpu-syscon', 'mstar,msc313-pmsleep', 'rockchip,px30-qos', 'rockchip,rk3066-qos', 'rockchip,rk3288-qos', 'rockchip,rk3399-qos', 'samsung,exynos3-sysreg', 'samsung,exynos4-sysreg', 'samsung,exynos5-sysreg', 'samsung,exynos5433-sysreg']
   	From schema: Documentation/devicetree/bindings/mfd/syscon.yaml
   arch/arm/boot/dts/qcom-apq8064-cm-qs600.dt.yaml: pmic@1: 'mpps@50' does not match any of the regexes: 'pinctrl-[0-9]+', 'rtc@[0-9a-f]+$'
   	From schema: Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
>> arch/arm/boot/dts/qcom-apq8064-cm-qs600.dt.yaml: pmic@0: 'gpio@150', 'mpps@50', 'pwrkey@1c', 'xoadc@197' do not match any of the regexes: 'pinctrl-[0-9]+', 'rtc@[0-9a-f]+$'
   	From schema: Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
   arch/arm/boot/dts/qcom-apq8064-cm-qs600.dt.yaml: gpio@150: wlan-gpios: {'phandle': [[104]], 'pios': {'pins': ['gpio43'], 'function': ['normal'], 'bias-disable': True, 'power-source': [[2]]}} is not of type 'array'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/gpio/gpio-consumer.yaml
   arch/arm/boot/dts/qcom-apq8064-cm-qs600.dt.yaml: xoadc@197: 'adc-channel@00', 'adc-channel@01', 'adc-channel@02', 'adc-channel@04', 'adc-channel@08', 'adc-channel@09', 'adc-channel@0a', 'adc-channel@0b', 'adc-channel@0c', 'adc-channel@0d', 'adc-channel@0e', 'adc-channel@0f' do not match any of the regexes: '^(adc-channel@)[0-9a-f]$', 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/iio/adc/qcom,pm8018-adc.yaml
   arch/arm/boot/dts/qcom-apq8064-cm-qs600.dt.yaml: xoadc@197: 'adc-channel@c' is a required property
   	From schema: Documentation/devicetree/bindings/iio/adc/qcom,pm8018-adc.yaml
   arch/arm/boot/dts/qcom-apq8064-cm-qs600.dt.yaml: xoadc@197: 'adc-channel@d' is a required property
   	From schema: Documentation/devicetree/bindings/iio/adc/qcom,pm8018-adc.yaml
   arch/arm/boot/dts/qcom-apq8064-cm-qs600.dt.yaml: xoadc@197: 'adc-channel@f' is a required property
--
   arch/arm/boot/dts/qcom-apq8064-ifc6410.dt.yaml: power-controller@20a9000: '#power-domain-cells' is a required property
   	From schema: Documentation/devicetree/bindings/power/power-domain.yaml
   arch/arm/boot/dts/qcom-apq8064-ifc6410.dt.yaml: power-controller@20b9000: '#power-domain-cells' is a required property
   	From schema: Documentation/devicetree/bindings/power/power-domain.yaml
   arch/arm/boot/dts/qcom-apq8064-ifc6410.dt.yaml: sps-sic-non-secure@12100000: compatible: 'anyOf' conditional failed, one must be fixed:
   	['syscon'] is too short
   	'syscon' is not one of ['allwinner,sun8i-a83t-system-controller', 'allwinner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller', 'allwinner,sun50i-a64-system-controller', 'hisilicon,dsa-subctrl', 'hisilicon,hi6220-sramctrl', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl', 'microchip,sparx5-cpu-syscon', 'mstar,msc313-pmsleep', 'rockchip,px30-qos', 'rockchip,rk3066-qos', 'rockchip,rk3288-qos', 'rockchip,rk3399-qos', 'samsung,exynos3-sysreg', 'samsung,exynos4-sysreg', 'samsung,exynos5-sysreg', 'samsung,exynos5433-sysreg']
   	From schema: Documentation/devicetree/bindings/mfd/syscon.yaml
   arch/arm/boot/dts/qcom-apq8064-ifc6410.dt.yaml: pmic@1: 'mpps@50' does not match any of the regexes: 'pinctrl-[0-9]+', 'rtc@[0-9a-f]+$'
   	From schema: Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
>> arch/arm/boot/dts/qcom-apq8064-ifc6410.dt.yaml: pmic@0: 'gpio@150', 'mpps@50', 'pwrkey@1c', 'xoadc@197' do not match any of the regexes: 'pinctrl-[0-9]+', 'rtc@[0-9a-f]+$'
   	From schema: Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
   arch/arm/boot/dts/qcom-apq8064-ifc6410.dt.yaml: gpio@150: wlan-gpios: {'phandle': [[111]], 'pios': {'pins': ['gpio43'], 'function': ['normal'], 'bias-disable': True, 'power-source': [[2]]}} is not of type 'array'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/gpio/gpio-consumer.yaml
   arch/arm/boot/dts/qcom-apq8064-ifc6410.dt.yaml: xoadc@197: 'adc-channel@00', 'adc-channel@01', 'adc-channel@02', 'adc-channel@04', 'adc-channel@08', 'adc-channel@09', 'adc-channel@0a', 'adc-channel@0b', 'adc-channel@0c', 'adc-channel@0d', 'adc-channel@0e', 'adc-channel@0f' do not match any of the regexes: '^(adc-channel@)[0-9a-f]$', 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/iio/adc/qcom,pm8018-adc.yaml
   arch/arm/boot/dts/qcom-apq8064-ifc6410.dt.yaml: xoadc@197: 'adc-channel@c' is a required property
   	From schema: Documentation/devicetree/bindings/iio/adc/qcom,pm8018-adc.yaml
   arch/arm/boot/dts/qcom-apq8064-ifc6410.dt.yaml: xoadc@197: 'adc-channel@d' is a required property
   	From schema: Documentation/devicetree/bindings/iio/adc/qcom,pm8018-adc.yaml
   arch/arm/boot/dts/qcom-apq8064-ifc6410.dt.yaml: xoadc@197: 'adc-channel@f' is a required property
--
   arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dt.yaml: power-controller@20a9000: '#power-domain-cells' is a required property
   	From schema: Documentation/devicetree/bindings/power/power-domain.yaml
   arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dt.yaml: power-controller@20b9000: '#power-domain-cells' is a required property
   	From schema: Documentation/devicetree/bindings/power/power-domain.yaml
   arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dt.yaml: sps-sic-non-secure@12100000: compatible: 'anyOf' conditional failed, one must be fixed:
   	['syscon'] is too short
   	'syscon' is not one of ['allwinner,sun8i-a83t-system-controller', 'allwinner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller', 'allwinner,sun50i-a64-system-controller', 'hisilicon,dsa-subctrl', 'hisilicon,hi6220-sramctrl', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl', 'microchip,sparx5-cpu-syscon', 'mstar,msc313-pmsleep', 'rockchip,px30-qos', 'rockchip,rk3066-qos', 'rockchip,rk3288-qos', 'rockchip,rk3399-qos', 'samsung,exynos3-sysreg', 'samsung,exynos4-sysreg', 'samsung,exynos5-sysreg', 'samsung,exynos5433-sysreg']
   	From schema: Documentation/devicetree/bindings/mfd/syscon.yaml
   arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dt.yaml: pmic@1: 'mpps@50' does not match any of the regexes: 'pinctrl-[0-9]+', 'rtc@[0-9a-f]+$'
   	From schema: Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
>> arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dt.yaml: pmic@0: 'gpio@150', 'mpps@50', 'pwrkey@1c', 'xoadc@197' do not match any of the regexes: 'pinctrl-[0-9]+', 'rtc@[0-9a-f]+$'
   	From schema: Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
   arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dt.yaml: xoadc@197: 'adc-channel@00', 'adc-channel@01', 'adc-channel@02', 'adc-channel@04', 'adc-channel@08', 'adc-channel@09', 'adc-channel@0a', 'adc-channel@0b', 'adc-channel@0c', 'adc-channel@0d', 'adc-channel@0e', 'adc-channel@0f' do not match any of the regexes: '^(adc-channel@)[0-9a-f]$', 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/iio/adc/qcom,pm8018-adc.yaml
   arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dt.yaml: xoadc@197: 'adc-channel@c' is a required property
   	From schema: Documentation/devicetree/bindings/iio/adc/qcom,pm8018-adc.yaml
   arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dt.yaml: xoadc@197: 'adc-channel@d' is a required property
   	From schema: Documentation/devicetree/bindings/iio/adc/qcom,pm8018-adc.yaml
   arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dt.yaml: xoadc@197: 'adc-channel@f' is a required property
   	From schema: Documentation/devicetree/bindings/iio/adc/qcom,pm8018-adc.yaml
   arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dt.yaml: qfprom@700000: $nodename:0: 'qfprom@700000' does not match '^(eeprom|efuse|nvram)(@.*|-[0-9a-f])*$'
--
   arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dt.yaml: power-controller@20a9000: '#power-domain-cells' is a required property
   	From schema: Documentation/devicetree/bindings/power/power-domain.yaml
   arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dt.yaml: power-controller@20b9000: '#power-domain-cells' is a required property
   	From schema: Documentation/devicetree/bindings/power/power-domain.yaml
   arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dt.yaml: sps-sic-non-secure@12100000: compatible: 'anyOf' conditional failed, one must be fixed:
   	['syscon'] is too short
   	'syscon' is not one of ['allwinner,sun8i-a83t-system-controller', 'allwinner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller', 'allwinner,sun50i-a64-system-controller', 'hisilicon,dsa-subctrl', 'hisilicon,hi6220-sramctrl', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl', 'microchip,sparx5-cpu-syscon', 'mstar,msc313-pmsleep', 'rockchip,px30-qos', 'rockchip,rk3066-qos', 'rockchip,rk3288-qos', 'rockchip,rk3399-qos', 'samsung,exynos3-sysreg', 'samsung,exynos4-sysreg', 'samsung,exynos5-sysreg', 'samsung,exynos5433-sysreg']
   	From schema: Documentation/devicetree/bindings/mfd/syscon.yaml
   arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dt.yaml: pmic@1: 'mpps@50' does not match any of the regexes: 'pinctrl-[0-9]+', 'rtc@[0-9a-f]+$'
   	From schema: Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
>> arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dt.yaml: pmic@0: 'gpio@150', 'mpps@50', 'pwrkey@1c', 'xoadc@197' do not match any of the regexes: 'pinctrl-[0-9]+', 'rtc@[0-9a-f]+$'
   	From schema: Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
   arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dt.yaml: xoadc@197: 'adc-channel@00', 'adc-channel@01', 'adc-channel@02', 'adc-channel@04', 'adc-channel@08', 'adc-channel@09', 'adc-channel@0a', 'adc-channel@0b', 'adc-channel@0c', 'adc-channel@0d', 'adc-channel@0e', 'adc-channel@0f' do not match any of the regexes: '^(adc-channel@)[0-9a-f]$', 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/iio/adc/qcom,pm8018-adc.yaml
   arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dt.yaml: xoadc@197: 'adc-channel@c' is a required property
   	From schema: Documentation/devicetree/bindings/iio/adc/qcom,pm8018-adc.yaml
   arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dt.yaml: xoadc@197: 'adc-channel@d' is a required property
   	From schema: Documentation/devicetree/bindings/iio/adc/qcom,pm8018-adc.yaml
   arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dt.yaml: xoadc@197: 'adc-channel@f' is a required property
   	From schema: Documentation/devicetree/bindings/iio/adc/qcom,pm8018-adc.yaml
   arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dt.yaml: qfprom@700000: $nodename:0: 'qfprom@700000' does not match '^(eeprom|efuse|nvram)(@.*|-[0-9a-f])*$'
--
   	'syscon' is not one of ['allwinner,sun8i-a83t-system-controller', 'allwinner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller', 'allwinner,sun50i-a64-system-controller', 'hisilicon,dsa-subctrl', 'hisilicon,hi6220-sramctrl', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl', 'microchip,sparx5-cpu-syscon', 'mstar,msc313-pmsleep', 'rockchip,px30-qos', 'rockchip,rk3066-qos', 'rockchip,rk3288-qos', 'rockchip,rk3399-qos', 'samsung,exynos3-sysreg', 'samsung,exynos4-sysreg', 'samsung,exynos5-sysreg', 'samsung,exynos5433-sysreg']
   	From schema: Documentation/devicetree/bindings/mfd/syscon.yaml
   arch/arm/boot/dts/qcom-apq8074-dragonboard.dt.yaml: tcsr-mutex: 'reg' is a required property
   	From schema: Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml
   arch/arm/boot/dts/qcom-apq8074-dragonboard.dt.yaml: tcsr-mutex: 'syscon' does not match any of the regexes: 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml
   arch/arm/boot/dts/qcom-apq8074-dragonboard.dt.yaml: memory@fc428000: 'device_type' is a required property
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/memory.yaml
   arch/arm/boot/dts/qcom-apq8074-dragonboard.dt.yaml: spmi@fc4cf000: reg: [[4232900608, 4096], [4232884224, 4096], [4232880128, 4096]] is too long
   	From schema: Documentation/devicetree/bindings/spmi/spmi.yaml
>> arch/arm/boot/dts/qcom-apq8074-dragonboard.dt.yaml: rtc@6000: reg: [[24576], [24832]] is too long
   	From schema: Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
>> arch/arm/boot/dts/qcom-apq8074-dragonboard.dt.yaml: rtc@6000: 'reg-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
   arch/arm/boot/dts/qcom-apq8074-dragonboard.dt.yaml: vadc@3100: 'bat_temp', 'die_temp', 'ref_1250v', 'ref_625mv', 'ref_gnd', 'ref_vdd', 'vbat_sns' do not match any of the regexes: '^.*@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.yaml
   arch/arm/boot/dts/qcom-apq8074-dragonboard.dt.yaml: iadc@3600: compatible:0: 'qcom,spmi-iadc' was expected
   	From schema: Documentation/devicetree/bindings/iio/adc/qcom,spmi-iadc.yaml
   arch/arm/boot/dts/qcom-apq8074-dragonboard.dt.yaml: iadc@3600: compatible: ['qcom,pm8941-iadc', 'qcom,spmi-iadc'] is too long
   	From schema: Documentation/devicetree/bindings/iio/adc/qcom,spmi-iadc.yaml
   arch/arm/boot/dts/qcom-apq8074-dragonboard.dt.yaml: iadc@3600: compatible: Additional items are not allowed ('qcom,spmi-iadc' was unexpected)
   	From schema: Documentation/devicetree/bindings/iio/adc/qcom,spmi-iadc.yaml
   arch/arm/boot/dts/qcom-apq8074-dragonboard.dt.yaml: regulators: '5vs1', '5vs2' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
--
   	'syscon' is not one of ['allwinner,sun8i-a83t-system-controller', 'allwinner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller', 'allwinner,sun50i-a64-system-controller', 'hisilicon,dsa-subctrl', 'hisilicon,hi6220-sramctrl', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl', 'microchip,sparx5-cpu-syscon', 'mstar,msc313-pmsleep', 'rockchip,px30-qos', 'rockchip,rk3066-qos', 'rockchip,rk3288-qos', 'rockchip,rk3399-qos', 'samsung,exynos3-sysreg', 'samsung,exynos4-sysreg', 'samsung,exynos5-sysreg', 'samsung,exynos5433-sysreg']
   	From schema: Documentation/devicetree/bindings/mfd/syscon.yaml
   arch/arm/boot/dts/qcom-apq8084-ifc6540.dt.yaml: hwlock: 'reg' is a required property
   	From schema: Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml
   arch/arm/boot/dts/qcom-apq8084-ifc6540.dt.yaml: hwlock: 'syscon' does not match any of the regexes: 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml
   arch/arm/boot/dts/qcom-apq8084-ifc6540.dt.yaml: memory@fc428000: 'device_type' is a required property
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/memory.yaml
   arch/arm/boot/dts/qcom-apq8084-ifc6540.dt.yaml: spmi@fc4cf000: reg: [[4232900608, 4096], [4232884224, 4096], [4232880128, 4096]] is too long
   	From schema: Documentation/devicetree/bindings/spmi/spmi.yaml
>> arch/arm/boot/dts/qcom-apq8084-ifc6540.dt.yaml: rtc@6000: reg: [[24576], [24832]] is too long
   	From schema: Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
>> arch/arm/boot/dts/qcom-apq8084-ifc6540.dt.yaml: rtc@6000: 'reg-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
   arch/arm/boot/dts/qcom-apq8084-ifc6540.dt.yaml: vadc@3100: 'die_temp', 'ref_1250v', 'ref_625mv', 'ref_buf_625mv', 'ref_gnd', 'ref_vdd' do not match any of the regexes: '^.*@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.yaml
   arch/arm/boot/dts/qcom-apq8084-ifc6540.dt.yaml: rpm_requests: 'pma8084-regulators' does not match any of the regexes: 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
   arch/arm/boot/dts/qcom-apq8084-ifc6540.dt.yaml: pma8084-regulators: '5vs1' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/dt-core.yaml
--
   	'syscon' is not one of ['allwinner,sun8i-a83t-system-controller', 'allwinner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller', 'allwinner,sun50i-a64-system-controller', 'hisilicon,dsa-subctrl', 'hisilicon,hi6220-sramctrl', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl', 'microchip,sparx5-cpu-syscon', 'mstar,msc313-pmsleep', 'rockchip,px30-qos', 'rockchip,rk3066-qos', 'rockchip,rk3288-qos', 'rockchip,rk3399-qos', 'samsung,exynos3-sysreg', 'samsung,exynos4-sysreg', 'samsung,exynos5-sysreg', 'samsung,exynos5433-sysreg']
   	From schema: Documentation/devicetree/bindings/mfd/syscon.yaml
   arch/arm/boot/dts/qcom-apq8084-mtp.dt.yaml: hwlock: 'reg' is a required property
   	From schema: Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml
   arch/arm/boot/dts/qcom-apq8084-mtp.dt.yaml: hwlock: 'syscon' does not match any of the regexes: 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml
   arch/arm/boot/dts/qcom-apq8084-mtp.dt.yaml: memory@fc428000: 'device_type' is a required property
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/memory.yaml
   arch/arm/boot/dts/qcom-apq8084-mtp.dt.yaml: spmi@fc4cf000: reg: [[4232900608, 4096], [4232884224, 4096], [4232880128, 4096]] is too long
   	From schema: Documentation/devicetree/bindings/spmi/spmi.yaml
>> arch/arm/boot/dts/qcom-apq8084-mtp.dt.yaml: rtc@6000: reg: [[24576], [24832]] is too long
   	From schema: Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
>> arch/arm/boot/dts/qcom-apq8084-mtp.dt.yaml: rtc@6000: 'reg-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
   arch/arm/boot/dts/qcom-apq8084-mtp.dt.yaml: vadc@3100: 'die_temp', 'ref_1250v', 'ref_625mv', 'ref_buf_625mv', 'ref_gnd', 'ref_vdd' do not match any of the regexes: '^.*@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.yaml
   arch/arm/boot/dts/qcom-apq8084-mtp.dt.yaml: rpm_requests: 'pma8084-regulators' does not match any of the regexes: 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
   arch/arm/boot/dts/qcom-apq8084-mtp.dt.yaml: pma8084-regulators: '5vs1' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/dt-core.yaml
--
   arch/arm/boot/dts/qcom-msm8660-surf.dt.yaml: timer@2000000: clock-frequency: 'oneOf' conditional failed, one must be fixed:
   	[[27000000], [32768]] is too long
   	arch/arm/boot/dts/qcom-msm8660-surf.dt.yaml: timer@2000000: clock-frequency: 'oneOf' conditional failed, one must be fixed:
   		[[27000000], [32768]] is too long
   		missing size tag in [[27000000], [32768]]
   		[27000000] is too short
   		[32768] is too short
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/clock/clock.yaml
   arch/arm/boot/dts/qcom-msm8660-surf.dt.yaml: clock-controller@900000: '#power-domain-cells' is a required property
   	From schema: Documentation/devicetree/bindings/clock/qcom,gcc.yaml
>> arch/arm/boot/dts/qcom-msm8660-surf.dt.yaml: pmic@0: 'gpio@150', 'keypad@148', 'mpps@50', 'pwrkey@1c', 'vibrator@4a', 'xoadc@197' do not match any of the regexes: 'pinctrl-[0-9]+', 'rtc@[0-9a-f]+$'
   	From schema: Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
   arch/arm/boot/dts/qcom-msm8660-surf.dt.yaml: clock-controller@2082000: compatible: 'anyOf' conditional failed, one must be fixed:
   	['syscon'] is too short
   	'syscon' is not one of ['allwinner,sun8i-a83t-system-controller', 'allwinner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller', 'allwinner,sun50i-a64-system-controller', 'hisilicon,dsa-subctrl', 'hisilicon,hi6220-sramctrl', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl', 'microchip,sparx5-cpu-syscon', 'mstar,msc313-pmsleep', 'rockchip,px30-qos', 'rockchip,rk3066-qos', 'rockchip,rk3288-qos', 'rockchip,rk3399-qos', 'samsung,exynos3-sysreg', 'samsung,exynos4-sysreg', 'samsung,exynos5-sysreg', 'samsung,exynos5433-sysreg']
   	From schema: Documentation/devicetree/bindings/mfd/syscon.yaml
   arch/arm/boot/dts/qcom-msm8660-surf.dt.yaml: amba: $nodename:0: 'amba' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/simple-bus.yaml
   arch/arm/boot/dts/qcom-msm8660-surf.dt.yaml: sdcc@12400000: $nodename:0: 'sdcc@12400000' does not match '^mmc(@.*)?$'
   	From schema: Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
   arch/arm/boot/dts/qcom-msm8660-surf.dt.yaml: sdcc@12140000: $nodename:0: 'sdcc@12140000' does not match '^mmc(@.*)?$'
--
   		[32768] is too short
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/clock/clock.yaml
   arch/arm/boot/dts/qcom-msm8960-cdp.dt.yaml: clock-controller@900000: '#power-domain-cells' is a required property
   	From schema: Documentation/devicetree/bindings/clock/qcom,gcc.yaml
   arch/arm/boot/dts/qcom-msm8960-cdp.dt.yaml: clock-controller@4000000: '#power-domain-cells' is a required property
   	From schema: Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
   arch/arm/boot/dts/qcom-msm8960-cdp.dt.yaml: clock-controller@2011000: compatible: 'anyOf' conditional failed, one must be fixed:
   	['syscon'] is too short
   	'syscon' is not one of ['allwinner,sun8i-a83t-system-controller', 'allwinner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller', 'allwinner,sun50i-a64-system-controller', 'hisilicon,dsa-subctrl', 'hisilicon,hi6220-sramctrl', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl', 'microchip,sparx5-cpu-syscon', 'mstar,msc313-pmsleep', 'rockchip,px30-qos', 'rockchip,rk3066-qos', 'rockchip,rk3288-qos', 'rockchip,rk3399-qos', 'samsung,exynos3-sysreg', 'samsung,exynos4-sysreg', 'samsung,exynos5-sysreg', 'samsung,exynos5433-sysreg']
   	From schema: Documentation/devicetree/bindings/mfd/syscon.yaml
>> arch/arm/boot/dts/qcom-msm8960-cdp.dt.yaml: pmic@0: 'keypad@148', 'pwrkey@1c' do not match any of the regexes: 'pinctrl-[0-9]+', 'rtc@[0-9a-f]+$'
   	From schema: Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
   arch/arm/boot/dts/qcom-msm8960-cdp.dt.yaml: amba: $nodename:0: 'amba' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/simple-bus.yaml
   arch/arm/boot/dts/qcom-msm8960-cdp.dt.yaml: sdcc@12400000: $nodename:0: 'sdcc@12400000' does not match '^mmc(@.*)?$'
   	From schema: Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
   arch/arm/boot/dts/qcom-msm8960-cdp.dt.yaml: sdcc@12180000: $nodename:0: 'sdcc@12180000' does not match '^mmc(@.*)?$'
   	From schema: Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
   arch/arm/boot/dts/qcom-msm8960-cdp.dt.yaml: regulators: $nodename:0: 'regulators' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/simple-bus.yaml
   arch/arm/boot/dts/qcom-msm8960-cdp.dt.yaml: regulators: gpio-regulator@91: 'anyOf' conditional failed, one must be fixed:
--
   	'syscon' is not one of ['allwinner,sun8i-a83t-system-controller', 'allwinner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller', 'allwinner,sun50i-a64-system-controller', 'hisilicon,dsa-subctrl', 'hisilicon,hi6220-sramctrl', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl', 'microchip,sparx5-cpu-syscon', 'mstar,msc313-pmsleep', 'rockchip,px30-qos', 'rockchip,rk3066-qos', 'rockchip,rk3288-qos', 'rockchip,rk3399-qos', 'samsung,exynos3-sysreg', 'samsung,exynos4-sysreg', 'samsung,exynos5-sysreg', 'samsung,exynos5433-sysreg']
   	From schema: Documentation/devicetree/bindings/mfd/syscon.yaml
   arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dt.yaml: tcsr-mutex: 'reg' is a required property
   	From schema: Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml
   arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dt.yaml: tcsr-mutex: 'syscon' does not match any of the regexes: 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml
   arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dt.yaml: memory@fc428000: 'device_type' is a required property
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/memory.yaml
   arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dt.yaml: spmi@fc4cf000: reg: [[4232900608, 4096], [4232884224, 4096], [4232880128, 4096]] is too long
   	From schema: Documentation/devicetree/bindings/spmi/spmi.yaml
>> arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dt.yaml: rtc@6000: reg: [[24576], [24832]] is too long
   	From schema: Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
>> arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dt.yaml: rtc@6000: 'reg-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
   arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dt.yaml: vadc@3100: 'bat_temp', 'die_temp', 'ref_1250v', 'ref_625mv', 'ref_gnd', 'ref_vdd', 'vbat_sns' do not match any of the regexes: '^.*@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.yaml
   arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dt.yaml: iadc@3600: compatible:0: 'qcom,spmi-iadc' was expected
   	From schema: Documentation/devicetree/bindings/iio/adc/qcom,spmi-iadc.yaml
   arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dt.yaml: iadc@3600: compatible: ['qcom,pm8941-iadc', 'qcom,spmi-iadc'] is too long
   	From schema: Documentation/devicetree/bindings/iio/adc/qcom,spmi-iadc.yaml
   arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dt.yaml: iadc@3600: compatible: Additional items are not allowed ('qcom,spmi-iadc' was unexpected)
   	From schema: Documentation/devicetree/bindings/iio/adc/qcom,spmi-iadc.yaml
   arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dt.yaml: regulators: '5vs1', '5vs2' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
--
   arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dt.yaml: tcsr-mutex: 'syscon' does not match any of the regexes: 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml
   arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dt.yaml: memory@fc428000: 'device_type' is a required property
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/memory.yaml
   arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dt.yaml: mpu6515@68: i2c-gate: False schema does not allow {'#address-cells': [[1]], '#size-cells': [[0]], 'ak8963@f': {'compatible': ['asahi-kasei,ak8963'], 'reg': [[15]], 'gpios': [[29, 67, 0]], 'vid-supply': [[68]], 'vdd-supply': [[67]]}, 'bmp280@76': {'compatible': ['bosch,bmp280'], 'reg': [[118]], 'vdda-supply': [[68]], 'vddd-supply': [[67]]}}
   	From schema: Documentation/devicetree/bindings/iio/imu/invensense,mpu6050.yaml
   arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dt.yaml: ak8963@f: 'vid-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/iio/magnetometer/asahi-kasei,ak8975.yaml
   arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dt.yaml: spmi@fc4cf000: reg: [[4232900608, 4096], [4232884224, 4096], [4232880128, 4096]] is too long
   	From schema: Documentation/devicetree/bindings/spmi/spmi.yaml
>> arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dt.yaml: rtc@6000: reg: [[24576], [24832]] is too long
   	From schema: Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
>> arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dt.yaml: rtc@6000: 'reg-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
   arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dt.yaml: otg: $nodename:0: 'otg' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/gpio/gpio-hog.yaml
   arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dt.yaml: vadc@3100: 'bat_temp', 'die_temp', 'ref_1250v', 'ref_625mv', 'ref_gnd', 'ref_vdd', 'vbat_sns' do not match any of the regexes: '^.*@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.yaml
   arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dt.yaml: iadc@3600: compatible:0: 'qcom,spmi-iadc' was expected
   	From schema: Documentation/devicetree/bindings/iio/adc/qcom,spmi-iadc.yaml
   arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dt.yaml: iadc@3600: compatible: ['qcom,pm8941-iadc', 'qcom,spmi-iadc'] is too long
   	From schema: Documentation/devicetree/bindings/iio/adc/qcom,spmi-iadc.yaml
   arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dt.yaml: iadc@3600: compatible: Additional items are not allowed ('qcom,spmi-iadc' was unexpected)
--
   	'syscon' is not one of ['allwinner,sun8i-a83t-system-controller', 'allwinner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller', 'allwinner,sun50i-a64-system-controller', 'hisilicon,dsa-subctrl', 'hisilicon,hi6220-sramctrl', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl', 'microchip,sparx5-cpu-syscon', 'mstar,msc313-pmsleep', 'rockchip,px30-qos', 'rockchip,rk3066-qos', 'rockchip,rk3288-qos', 'rockchip,rk3399-qos', 'samsung,exynos3-sysreg', 'samsung,exynos4-sysreg', 'samsung,exynos5-sysreg', 'samsung,exynos5433-sysreg']
   	From schema: Documentation/devicetree/bindings/mfd/syscon.yaml
   arch/arm/boot/dts/qcom-msm8974-samsung-klte.dt.yaml: tcsr-mutex: 'reg' is a required property
   	From schema: Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml
   arch/arm/boot/dts/qcom-msm8974-samsung-klte.dt.yaml: tcsr-mutex: 'syscon' does not match any of the regexes: 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml
   arch/arm/boot/dts/qcom-msm8974-samsung-klte.dt.yaml: memory@fc428000: 'device_type' is a required property
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/memory.yaml
   arch/arm/boot/dts/qcom-msm8974-samsung-klte.dt.yaml: spmi@fc4cf000: reg: [[4232900608, 4096], [4232884224, 4096], [4232880128, 4096]] is too long
   	From schema: Documentation/devicetree/bindings/spmi/spmi.yaml
>> arch/arm/boot/dts/qcom-msm8974-samsung-klte.dt.yaml: rtc@6000: reg: [[24576], [24832]] is too long
   	From schema: Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
>> arch/arm/boot/dts/qcom-msm8974-samsung-klte.dt.yaml: rtc@6000: 'reg-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
   arch/arm/boot/dts/qcom-msm8974-samsung-klte.dt.yaml: vadc@3100: 'die_temp', 'ref_1250v', 'ref_625mv', 'ref_buf_625mv', 'ref_gnd', 'ref_vdd' do not match any of the regexes: '^.*@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.yaml
   arch/arm/boot/dts/qcom-msm8974-samsung-klte.dt.yaml: ocmem@fdd00000: 'ranges' is a required property
   	From schema: Documentation/devicetree/bindings/sram/qcom,ocmem.yaml
   arch/arm/boot/dts/qcom-msm8974-samsung-klte.dt.yaml: rpm_requests: 'clock-controller', 'pm8841-regulators', 'pm8941-regulators', 'pma8084-regulators' do not match any of the regexes: 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
   arch/arm/boot/dts/qcom-msm8974-samsung-klte.dt.yaml: pma8084-regulators: '5vs1' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/dt-core.yaml
   arch/arm/boot/dts/qcom-msm8974-samsung-klte.dt.yaml: touchkey@20: linux,keycodes:0:0: 580 is greater than the maximum of 255
--
   	'syscon' is not one of ['allwinner,sun8i-a83t-system-controller', 'allwinner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller', 'allwinner,sun50i-a64-system-controller', 'hisilicon,dsa-subctrl', 'hisilicon,hi6220-sramctrl', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl', 'microchip,sparx5-cpu-syscon', 'mstar,msc313-pmsleep', 'rockchip,px30-qos', 'rockchip,rk3066-qos', 'rockchip,rk3288-qos', 'rockchip,rk3399-qos', 'samsung,exynos3-sysreg', 'samsung,exynos4-sysreg', 'samsung,exynos5-sysreg', 'samsung,exynos5433-sysreg']
   	From schema: Documentation/devicetree/bindings/mfd/syscon.yaml
   arch/arm/boot/dts/qcom-msm8974-sony-xperia-amami.dt.yaml: tcsr-mutex: 'reg' is a required property
   	From schema: Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml
   arch/arm/boot/dts/qcom-msm8974-sony-xperia-amami.dt.yaml: tcsr-mutex: 'syscon' does not match any of the regexes: 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml
   arch/arm/boot/dts/qcom-msm8974-sony-xperia-amami.dt.yaml: memory@fc428000: 'device_type' is a required property
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/memory.yaml
   arch/arm/boot/dts/qcom-msm8974-sony-xperia-amami.dt.yaml: spmi@fc4cf000: reg: [[4232900608, 4096], [4232884224, 4096], [4232880128, 4096]] is too long
   	From schema: Documentation/devicetree/bindings/spmi/spmi.yaml
>> arch/arm/boot/dts/qcom-msm8974-sony-xperia-amami.dt.yaml: rtc@6000: reg: [[24576], [24832]] is too long
   	From schema: Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
>> arch/arm/boot/dts/qcom-msm8974-sony-xperia-amami.dt.yaml: rtc@6000: 'reg-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
   arch/arm/boot/dts/qcom-msm8974-sony-xperia-amami.dt.yaml: vadc@3100: 'bat_temp', 'die_temp', 'ref_1250v', 'ref_625mv', 'ref_gnd', 'ref_vdd', 'vbat_sns' do not match any of the regexes: '^.*@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.yaml
   arch/arm/boot/dts/qcom-msm8974-sony-xperia-amami.dt.yaml: iadc@3600: compatible:0: 'qcom,spmi-iadc' was expected
   	From schema: Documentation/devicetree/bindings/iio/adc/qcom,spmi-iadc.yaml
   arch/arm/boot/dts/qcom-msm8974-sony-xperia-amami.dt.yaml: iadc@3600: compatible: ['qcom,pm8941-iadc', 'qcom,spmi-iadc'] is too long
   	From schema: Documentation/devicetree/bindings/iio/adc/qcom,spmi-iadc.yaml
   arch/arm/boot/dts/qcom-msm8974-sony-xperia-amami.dt.yaml: iadc@3600: compatible: Additional items are not allowed ('qcom,spmi-iadc' was unexpected)
   	From schema: Documentation/devicetree/bindings/iio/adc/qcom,spmi-iadc.yaml
   arch/arm/boot/dts/qcom-msm8974-sony-xperia-amami.dt.yaml: regulators: '5vs1', '5vs2' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
--
   	'syscon' is not one of ['allwinner,sun8i-a83t-system-controller', 'allwinner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller', 'allwinner,sun50i-a64-system-controller', 'hisilicon,dsa-subctrl', 'hisilicon,hi6220-sramctrl', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl', 'microchip,sparx5-cpu-syscon', 'mstar,msc313-pmsleep', 'rockchip,px30-qos', 'rockchip,rk3066-qos', 'rockchip,rk3288-qos', 'rockchip,rk3399-qos', 'samsung,exynos3-sysreg', 'samsung,exynos4-sysreg', 'samsung,exynos5-sysreg', 'samsung,exynos5433-sysreg']
   	From schema: Documentation/devicetree/bindings/mfd/syscon.yaml
   arch/arm/boot/dts/qcom-msm8974-sony-xperia-castor.dt.yaml: tcsr-mutex: 'reg' is a required property
   	From schema: Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml
   arch/arm/boot/dts/qcom-msm8974-sony-xperia-castor.dt.yaml: tcsr-mutex: 'syscon' does not match any of the regexes: 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml
   arch/arm/boot/dts/qcom-msm8974-sony-xperia-castor.dt.yaml: memory@fc428000: 'device_type' is a required property
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/memory.yaml
   arch/arm/boot/dts/qcom-msm8974-sony-xperia-castor.dt.yaml: spmi@fc4cf000: reg: [[4232900608, 4096], [4232884224, 4096], [4232880128, 4096]] is too long
   	From schema: Documentation/devicetree/bindings/spmi/spmi.yaml
>> arch/arm/boot/dts/qcom-msm8974-sony-xperia-castor.dt.yaml: rtc@6000: reg: [[24576], [24832]] is too long
   	From schema: Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
>> arch/arm/boot/dts/qcom-msm8974-sony-xperia-castor.dt.yaml: rtc@6000: 'reg-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
   arch/arm/boot/dts/qcom-msm8974-sony-xperia-castor.dt.yaml: vadc@3100: 'bat_temp', 'die_temp', 'ref_1250v', 'ref_625mv', 'ref_gnd', 'ref_vdd', 'vbat_sns' do not match any of the regexes: '^.*@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.yaml
   arch/arm/boot/dts/qcom-msm8974-sony-xperia-castor.dt.yaml: iadc@3600: compatible:0: 'qcom,spmi-iadc' was expected
   	From schema: Documentation/devicetree/bindings/iio/adc/qcom,spmi-iadc.yaml
   arch/arm/boot/dts/qcom-msm8974-sony-xperia-castor.dt.yaml: iadc@3600: compatible: ['qcom,pm8941-iadc', 'qcom,spmi-iadc'] is too long
   	From schema: Documentation/devicetree/bindings/iio/adc/qcom,spmi-iadc.yaml
   arch/arm/boot/dts/qcom-msm8974-sony-xperia-castor.dt.yaml: iadc@3600: compatible: Additional items are not allowed ('qcom,spmi-iadc' was unexpected)
   	From schema: Documentation/devicetree/bindings/iio/adc/qcom,spmi-iadc.yaml
   arch/arm/boot/dts/qcom-msm8974-sony-xperia-castor.dt.yaml: regulators: '5vs1', '5vs2' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
--
   	'syscon' is not one of ['allwinner,sun8i-a83t-system-controller', 'allwinner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller', 'allwinner,sun50i-a64-system-controller', 'hisilicon,dsa-subctrl', 'hisilicon,hi6220-sramctrl', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl', 'microchip,sparx5-cpu-syscon', 'mstar,msc313-pmsleep', 'rockchip,px30-qos', 'rockchip,rk3066-qos', 'rockchip,rk3288-qos', 'rockchip,rk3399-qos', 'samsung,exynos3-sysreg', 'samsung,exynos4-sysreg', 'samsung,exynos5-sysreg', 'samsung,exynos5433-sysreg']
   	From schema: Documentation/devicetree/bindings/mfd/syscon.yaml
   arch/arm/boot/dts/qcom-msm8974-sony-xperia-honami.dt.yaml: tcsr-mutex: 'reg' is a required property
   	From schema: Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml
   arch/arm/boot/dts/qcom-msm8974-sony-xperia-honami.dt.yaml: tcsr-mutex: 'syscon' does not match any of the regexes: 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml
   arch/arm/boot/dts/qcom-msm8974-sony-xperia-honami.dt.yaml: memory@fc428000: 'device_type' is a required property
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/memory.yaml
   arch/arm/boot/dts/qcom-msm8974-sony-xperia-honami.dt.yaml: spmi@fc4cf000: reg: [[4232900608, 4096], [4232884224, 4096], [4232880128, 4096]] is too long
   	From schema: Documentation/devicetree/bindings/spmi/spmi.yaml
>> arch/arm/boot/dts/qcom-msm8974-sony-xperia-honami.dt.yaml: rtc@6000: reg: [[24576], [24832]] is too long
   	From schema: Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
>> arch/arm/boot/dts/qcom-msm8974-sony-xperia-honami.dt.yaml: rtc@6000: 'reg-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
   arch/arm/boot/dts/qcom-msm8974-sony-xperia-honami.dt.yaml: vadc@3100: 'bat_temp', 'die_temp', 'ref_1250v', 'ref_625mv', 'ref_gnd', 'ref_vdd', 'vbat_sns' do not match any of the regexes: '^.*@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.yaml
   arch/arm/boot/dts/qcom-msm8974-sony-xperia-honami.dt.yaml: iadc@3600: compatible:0: 'qcom,spmi-iadc' was expected
   	From schema: Documentation/devicetree/bindings/iio/adc/qcom,spmi-iadc.yaml
   arch/arm/boot/dts/qcom-msm8974-sony-xperia-honami.dt.yaml: iadc@3600: compatible: ['qcom,pm8941-iadc', 'qcom,spmi-iadc'] is too long
   	From schema: Documentation/devicetree/bindings/iio/adc/qcom,spmi-iadc.yaml
   arch/arm/boot/dts/qcom-msm8974-sony-xperia-honami.dt.yaml: iadc@3600: compatible: Additional items are not allowed ('qcom,spmi-iadc' was unexpected)
   	From schema: Documentation/devicetree/bindings/iio/adc/qcom,spmi-iadc.yaml
   arch/arm/boot/dts/qcom-msm8974-sony-xperia-honami.dt.yaml: regulators: '5vs1', '5vs2' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
--
   		missing size tag in [[27000000], [32768]]
   		[27000000] is too short
   		[32768] is too short
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/clock/clock.yaml
   arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dt.yaml: clock-controller@900000: '#power-domain-cells' is a required property
   	From schema: Documentation/devicetree/bindings/clock/qcom,gcc.yaml
   arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dt.yaml: clock-controller@2011000: compatible: 'anyOf' conditional failed, one must be fixed:
   	['syscon'] is too short
   	'syscon' is not one of ['allwinner,sun8i-a83t-system-controller', 'allwinner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller', 'allwinner,sun50i-a64-system-controller', 'hisilicon,dsa-subctrl', 'hisilicon,hi6220-sramctrl', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl', 'microchip,sparx5-cpu-syscon', 'mstar,msc313-pmsleep', 'rockchip,px30-qos', 'rockchip,rk3066-qos', 'rockchip,rk3288-qos', 'rockchip,rk3399-qos', 'samsung,exynos3-sysreg', 'samsung,exynos4-sysreg', 'samsung,exynos5-sysreg', 'samsung,exynos5433-sysreg']
   	From schema: Documentation/devicetree/bindings/mfd/syscon.yaml
>> arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dt.yaml: pmic@0: compatible:0: 'qcom,pm8018' is not one of ['qcom,pm8058', 'qcom,pm8821', 'qcom,pm8921']
   	From schema: Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
>> arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dt.yaml: pmic@0: compatible: ['qcom,pm8018', 'qcom,pm8921'] is too long
   	From schema: Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
>> arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dt.yaml: pmic@0: compatible: Additional items are not allowed ('qcom,pm8921' was unexpected)
   	From schema: Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
>> arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dt.yaml: pmic@0: rtc@11d:compatible: ['qcom,pm8018-rtc', 'qcom,pm8921-rtc'] is too long
   	From schema: Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
>> arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dt.yaml: pmic@0: rtc@11d:compatible: Additional items are not allowed ('qcom,pm8921-rtc' was unexpected)
   	From schema: Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
>> arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dt.yaml: pmic@0: 'gpio@150', 'mpp@50', 'pwrkey@1c' do not match any of the regexes: 'pinctrl-[0-9]+', 'rtc@[0-9a-f]+$'
   	From schema: Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
>> arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dt.yaml: rtc@11d: compatible: ['qcom,pm8018-rtc', 'qcom,pm8921-rtc'] is too long
   	From schema: Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
>> arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dt.yaml: rtc@11d: compatible: Additional items are not allowed ('qcom,pm8921-rtc' was unexpected)
   	From schema: Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
   arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dt.yaml: amba: $nodename:0: 'amba' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/simple-bus.yaml
   arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dt.yaml: sdcc@12180000: $nodename:0: 'sdcc@12180000' does not match '^mmc(@.*)?$'
   	From schema: Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
   arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dt.yaml: sdcc@12140000: $nodename:0: 'sdcc@12140000' does not match '^mmc(@.*)?$'
   	From schema: Documentation/devicetree/bindings/mmc/arm,pl18x.yaml

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
