Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70E3252140F
	for <lists+linux-rtc@lfdr.de>; Tue, 10 May 2022 13:40:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241144AbiEJLoc (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 10 May 2022 07:44:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235432AbiEJLoc (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 10 May 2022 07:44:32 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F1B224F236;
        Tue, 10 May 2022 04:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652182835; x=1683718835;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=74nVN44g6jhc4yE1KVvRQKazMRbcecKr4b7N/MpYdwg=;
  b=VS2KOWIyZJatuFGrjwSatv8SHBwrQctuCLaNaNEpF/+ytHF6E8sLSzlw
   yrnWg7CxJEBSgmn90DLO/FHBmHLbTj9vHJnaTrvbnXnCoAP4qQu2Jwcmr
   PgPjhBQnTjQrhOnXrRVvTH9BJ5zU5YpENTTkfdXv+NOOMpe0Z3/XfCB+x
   LXSSgQTgB6Yb00j2NG2HpcS7zIlvTkz2kSTPopbAOH4RVA+5p2w4VPjXI
   FEG6QXn5O7z28c2xiB8vFIBkfUdb8ZdwUnijaI7CZyPhNfnAWXfArrR07
   T5sxBqV88VW7o0/Dc2IPPuNrRtlCEu5UG1NevCFNYimT5ZOPvnKFhpcNL
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="268187183"
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; 
   d="scan'208";a="268187183"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2022 04:40:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; 
   d="scan'208";a="813947570"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 10 May 2022 04:40:30 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1noOE9-000HnA-SO;
        Tue, 10 May 2022 11:40:29 +0000
Date:   Tue, 10 May 2022 19:40:14 +0800
From:   kernel test robot <lkp@intel.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>,
        Michel Pollet <michel.pollet@bp.renesas.com>
Subject: Re: [PATCH v4 2/5] rtc: rzn1: Add new RTC driver
Message-ID: <202205101957.jVrQugEU-lkp@intel.com>
References: <20220509154559.24851-3-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220509154559.24851-3-miquel.raynal@bootlin.com>
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Miquel,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on abelloni/rtc-next]
[also build test ERROR on robh/for-next linus/master v5.18-rc6 next-20220509]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Miquel-Raynal/RZ-N1-RTC-support/20220509-235039
base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20220510/202205101957.jVrQugEU-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 3abb68a626160e019c30a4860e569d7bc75e486a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/c3fe09f9df58326a1b888fce48df245964362348
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Miquel-Raynal/RZ-N1-RTC-support/20220509-235039
        git checkout c3fe09f9df58326a1b888fce48df245964362348
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/kernel/ drivers/rtc/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/rtc/rtc-rzn1.c:23:10: fatal error: 'linux/soc/renesas/r9a06g032-sysctrl.h' file not found
   #include <linux/soc/renesas/r9a06g032-sysctrl.h>
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +23 drivers/rtc/rtc-rzn1.c

  > 23	#include <linux/soc/renesas/r9a06g032-sysctrl.h>
    24	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
