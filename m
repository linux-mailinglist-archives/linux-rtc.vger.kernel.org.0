Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C09BA35AE7B
	for <lists+linux-rtc@lfdr.de>; Sat, 10 Apr 2021 16:48:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234587AbhDJOsz (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 10 Apr 2021 10:48:55 -0400
Received: from mga17.intel.com ([192.55.52.151]:65199 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234392AbhDJOsy (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Sat, 10 Apr 2021 10:48:54 -0400
IronPort-SDR: CBeyzvuF8RjPoDaVEhu1HAiXO7sw11Z/0FaRJ9L2VpISwq6sCOHq+GSQCY9SKzR3ZFT6RrJgg8
 ez18fnmljSww==
X-IronPort-AV: E=McAfee;i="6000,8403,9950"; a="174023925"
X-IronPort-AV: E=Sophos;i="5.82,212,1613462400"; 
   d="scan'208";a="174023925"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2021 07:48:32 -0700
IronPort-SDR: /K0zYiG79dyb0W27hbgX9JJzhV7Dme9RiX8eF9yEmMPh2qk40XaXvo+imdoPtdSDpTqTjqXG/+
 lcyFGsAMNxhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,212,1613462400"; 
   d="scan'208";a="520621770"
Received: from lkp-server01.sh.intel.com (HELO 69d8fcc516b7) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 10 Apr 2021 07:48:29 -0700
Received: from kbuild by 69d8fcc516b7 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lVEuS-000ITS-S4; Sat, 10 Apr 2021 14:48:28 +0000
Date:   Sat, 10 Apr 2021 22:47:56 +0800
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
Subject: Re: [PATCH V2 3/4] dt-bindings: mfd: Convert pm8xxx bindings to yaml
Message-ID: <202104102224.0snQfjaj-lkp@intel.com>
References: <1617976766-7852-4-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1617976766-7852-4-git-send-email-skakit@codeaurora.org>
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
   arch/arm/boot/dts/qcom-apq8064-cm-qs600.dt.yaml: power-controller@2099000: '#power-domain-cells' is a required property
   	From schema: Documentation/devicetree/bindings/power/power-domain.yaml
   arch/arm/boot/dts/qcom-apq8064-cm-qs600.dt.yaml: power-controller@20a9000: '#power-domain-cells' is a required property
   	From schema: Documentation/devicetree/bindings/power/power-domain.yaml
   arch/arm/boot/dts/qcom-apq8064-cm-qs600.dt.yaml: power-controller@20b9000: '#power-domain-cells' is a required property
   	From schema: Documentation/devicetree/bindings/power/power-domain.yaml
   arch/arm/boot/dts/qcom-apq8064-cm-qs600.dt.yaml: sps-sic-non-secure@12100000: compatible: 'anyOf' conditional failed, one must be fixed:
   	['syscon'] is too short
   	'syscon' is not one of ['allwinner,sun8i-a83t-system-controller', 'allwinner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller', 'allwinner,sun50i-a64-system-controller', 'hisilicon,dsa-subctrl', 'hisilicon,hi6220-sramctrl', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl', 'microchip,sparx5-cpu-syscon', 'mstar,msc313-pmsleep', 'rockchip,px30-qos', 'rockchip,rk3066-qos', 'rockchip,rk3288-qos', 'rockchip,rk3399-qos', 'samsung,exynos3-sysreg', 'samsung,exynos4-sysreg', 'samsung,exynos5-sysreg', 'samsung,exynos5433-sysreg']
   	From schema: Documentation/devicetree/bindings/mfd/syscon.yaml
>> arch/arm/boot/dts/qcom-apq8064-cm-qs600.dt.yaml: pmic@1: 'mpps@50' does not match any of the regexes: 'pinctrl-[0-9]+', 'rtc@[0-9a-f]+$'
   	From schema: Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
   Unknown file referenced: [Errno 2] No such file or directory: '/usr/local/lib/python3.9/dist-packages/dtschema/schemas/rtc/qcom-pm8xxx-rtc.yaml'
--
   arch/arm/boot/dts/qcom-apq8064-ifc6410.dt.yaml: power-controller@2099000: '#power-domain-cells' is a required property
   	From schema: Documentation/devicetree/bindings/power/power-domain.yaml
   arch/arm/boot/dts/qcom-apq8064-ifc6410.dt.yaml: power-controller@20a9000: '#power-domain-cells' is a required property
   	From schema: Documentation/devicetree/bindings/power/power-domain.yaml
   arch/arm/boot/dts/qcom-apq8064-ifc6410.dt.yaml: power-controller@20b9000: '#power-domain-cells' is a required property
   	From schema: Documentation/devicetree/bindings/power/power-domain.yaml
   arch/arm/boot/dts/qcom-apq8064-ifc6410.dt.yaml: sps-sic-non-secure@12100000: compatible: 'anyOf' conditional failed, one must be fixed:
   	['syscon'] is too short
   	'syscon' is not one of ['allwinner,sun8i-a83t-system-controller', 'allwinner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller', 'allwinner,sun50i-a64-system-controller', 'hisilicon,dsa-subctrl', 'hisilicon,hi6220-sramctrl', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl', 'microchip,sparx5-cpu-syscon', 'mstar,msc313-pmsleep', 'rockchip,px30-qos', 'rockchip,rk3066-qos', 'rockchip,rk3288-qos', 'rockchip,rk3399-qos', 'samsung,exynos3-sysreg', 'samsung,exynos4-sysreg', 'samsung,exynos5-sysreg', 'samsung,exynos5433-sysreg']
   	From schema: Documentation/devicetree/bindings/mfd/syscon.yaml
>> arch/arm/boot/dts/qcom-apq8064-ifc6410.dt.yaml: pmic@1: 'mpps@50' does not match any of the regexes: 'pinctrl-[0-9]+', 'rtc@[0-9a-f]+$'
   	From schema: Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
   Unknown file referenced: [Errno 2] No such file or directory: '/usr/local/lib/python3.9/dist-packages/dtschema/schemas/rtc/qcom-pm8xxx-rtc.yaml'
--
   arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dt.yaml: power-controller@2099000: '#power-domain-cells' is a required property
   	From schema: Documentation/devicetree/bindings/power/power-domain.yaml
   arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dt.yaml: power-controller@20a9000: '#power-domain-cells' is a required property
   	From schema: Documentation/devicetree/bindings/power/power-domain.yaml
   arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dt.yaml: power-controller@20b9000: '#power-domain-cells' is a required property
   	From schema: Documentation/devicetree/bindings/power/power-domain.yaml
   arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dt.yaml: sps-sic-non-secure@12100000: compatible: 'anyOf' conditional failed, one must be fixed:
   	['syscon'] is too short
   	'syscon' is not one of ['allwinner,sun8i-a83t-system-controller', 'allwinner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller', 'allwinner,sun50i-a64-system-controller', 'hisilicon,dsa-subctrl', 'hisilicon,hi6220-sramctrl', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl', 'microchip,sparx5-cpu-syscon', 'mstar,msc313-pmsleep', 'rockchip,px30-qos', 'rockchip,rk3066-qos', 'rockchip,rk3288-qos', 'rockchip,rk3399-qos', 'samsung,exynos3-sysreg', 'samsung,exynos4-sysreg', 'samsung,exynos5-sysreg', 'samsung,exynos5433-sysreg']
   	From schema: Documentation/devicetree/bindings/mfd/syscon.yaml
>> arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dt.yaml: pmic@1: 'mpps@50' does not match any of the regexes: 'pinctrl-[0-9]+', 'rtc@[0-9a-f]+$'
   	From schema: Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
   Unknown file referenced: [Errno 2] No such file or directory: '/usr/local/lib/python3.9/dist-packages/dtschema/schemas/rtc/qcom-pm8xxx-rtc.yaml'
--
   arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dt.yaml: power-controller@2099000: '#power-domain-cells' is a required property
   	From schema: Documentation/devicetree/bindings/power/power-domain.yaml
   arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dt.yaml: power-controller@20a9000: '#power-domain-cells' is a required property
   	From schema: Documentation/devicetree/bindings/power/power-domain.yaml
   arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dt.yaml: power-controller@20b9000: '#power-domain-cells' is a required property
   	From schema: Documentation/devicetree/bindings/power/power-domain.yaml
   arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dt.yaml: sps-sic-non-secure@12100000: compatible: 'anyOf' conditional failed, one must be fixed:
   	['syscon'] is too short
   	'syscon' is not one of ['allwinner,sun8i-a83t-system-controller', 'allwinner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller', 'allwinner,sun50i-a64-system-controller', 'hisilicon,dsa-subctrl', 'hisilicon,hi6220-sramctrl', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl', 'microchip,sparx5-cpu-syscon', 'mstar,msc313-pmsleep', 'rockchip,px30-qos', 'rockchip,rk3066-qos', 'rockchip,rk3288-qos', 'rockchip,rk3399-qos', 'samsung,exynos3-sysreg', 'samsung,exynos4-sysreg', 'samsung,exynos5-sysreg', 'samsung,exynos5433-sysreg']
   	From schema: Documentation/devicetree/bindings/mfd/syscon.yaml
>> arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dt.yaml: pmic@1: 'mpps@50' does not match any of the regexes: 'pinctrl-[0-9]+', 'rtc@[0-9a-f]+$'
   	From schema: Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
   Unknown file referenced: [Errno 2] No such file or directory: '/usr/local/lib/python3.9/dist-packages/dtschema/schemas/rtc/qcom-pm8xxx-rtc.yaml'

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
