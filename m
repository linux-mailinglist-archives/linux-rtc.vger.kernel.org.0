Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7033833DF74
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Mar 2021 21:46:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232165AbhCPUp7 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 16 Mar 2021 16:45:59 -0400
Received: from mga17.intel.com ([192.55.52.151]:49650 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231916AbhCPUob (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 16 Mar 2021 16:44:31 -0400
IronPort-SDR: zSDrBY1vOnZwuqcMYJkHHtKLDvJdRNpbx9fJl+eIWcycixD2NI3Lm7Sy1QnQTfIOvRH/U6fpic
 2i14SOVGDRnQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9925"; a="169246775"
X-IronPort-AV: E=Sophos;i="5.81,254,1610438400"; 
   d="scan'208";a="169246775"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2021 13:44:27 -0700
IronPort-SDR: 1SKK8UYfs0yG4AQ634nG7+GwP1fusGgEvnmv94dohFPSUe6+1uLGXilYOcN4QmnPDynrg5x6G0
 UlnmrvOyFpYA==
X-IronPort-AV: E=Sophos;i="5.81,254,1610438400"; 
   d="scan'208";a="511502109"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2021 13:44:24 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1lMGY9-00D4TP-MQ; Tue, 16 Mar 2021 22:44:21 +0200
Date:   Tue, 16 Mar 2021 22:44:21 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     kernel test robot <lkp@intel.com>
Cc:     Claudius Heine <ch@denx.de>,
        johannes hahn <johannes-hahn@siemens.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        kbuild-all@lists.01.org, clang-built-linux@googlegroups.com,
        werner zeh <werner.zeh@siemens.com>,
        henning schild <henning.schild@siemens.com>,
        martin mantel <martin.mantel@siemens.com>,
        val krutov <val.krutov@erd.epson.com>
Subject: Re: [PATCH v4] rtc: rx6110: add ACPI bindings to I2C
Message-ID: <YFEYpVwUEygNoPzv@smile.fi.intel.com>
References: <20210316144819.4130622-1-ch@denx.de>
 <202103170225.yRvbPVxM-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202103170225.yRvbPVxM-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, Mar 17, 2021 at 03:04:36AM +0800, kernel test robot wrote:
> Hi Claudius,
> 
> Thank you for the patch! Perhaps something to improve:
> 
> [auto build test WARNING on abelloni/rtc-next]
> [also build test WARNING on v5.12-rc3 next-20210316]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/0day-ci/linux/commits/Claudius-Heine/rtc-rx6110-add-ACPI-bindings-to-I2C/20210316-225026
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
> config: powerpc-randconfig-r006-20210316 (attached as .config)
> compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project 50c7504a93fdb90c26870db8c8ea7add895c7725)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install powerpc cross compiling tool for clang build
>         # apt-get install binutils-powerpc-linux-gnu
>         # https://github.com/0day-ci/linux/commit/ec344b93b1b5f4c2c77ce68b7bde7ec380e356a8
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Claudius-Heine/rtc-rx6110-add-ACPI-bindings-to-I2C/20210316-225026
>         git checkout ec344b93b1b5f4c2c77ce68b7bde7ec380e356a8
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=powerpc 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
> >> drivers/rtc/rtc-rx6110.c:450:36: warning: unused variable 'rx6110_i2c_acpi_match' [-Wunused-const-variable]
>    static const struct acpi_device_id rx6110_i2c_acpi_match[] = {
>                                       ^
>    1 warning generated.

Precisely!

This happens due to ACPI_PTR() presence. Either ACPI_PTR() _and_ ifdeffery or
none of them should be in the code.


-- 
With Best Regards,
Andy Shevchenko


