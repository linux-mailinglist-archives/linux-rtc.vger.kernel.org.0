Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEBCD33D317
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Mar 2021 12:33:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232014AbhCPLdS (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 16 Mar 2021 07:33:18 -0400
Received: from mga04.intel.com ([192.55.52.120]:22557 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229800AbhCPLdJ (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 16 Mar 2021 07:33:09 -0400
IronPort-SDR: DjQD9wofQTQli23pTm4szS1nFzcPyrRgKXaz2iTOgB7ajDQh5A5x//TGldK/V6rdp9m3mG6QSj
 ifjc4/ioW42Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9924"; a="186864486"
X-IronPort-AV: E=Sophos;i="5.81,251,1610438400"; 
   d="scan'208";a="186864486"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2021 04:33:07 -0700
IronPort-SDR: +FLr21BqECxarTkirLegY7xaD2nLrpkv8qvXUaLrakO45urtbEY25Oi2AJtcMUNWltaCQXFKdz
 6J8EZnh9KRFA==
X-IronPort-AV: E=Sophos;i="5.81,251,1610438400"; 
   d="scan'208";a="388436171"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2021 04:33:04 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1lM7wb-00CwHo-PI; Tue, 16 Mar 2021 13:33:01 +0200
Date:   Tue, 16 Mar 2021 13:33:01 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Claudius Heine <ch@denx.de>
Cc:     johannes hahn <johannes-hahn@siemens.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        werner zeh <werner.zeh@siemens.com>,
        henning schild <henning.schild@siemens.com>,
        martin mantel <martin.mantel@siemens.com>,
        val krutov <val.krutov@erd.epson.com>
Subject: Re: [PATCH v3 1/1] rtc: rx6110: add ACPI bindings to I2C
Message-ID: <YFCXbT7AL7DAvO0i@smile.fi.intel.com>
References: <AM0PR10MB25801B7DCB6C1856B5D4F2C09FE10@AM0PR10MB2580.EURPRD10.PROD.OUTLOOK.COM>
 <20210316100805.2630481-2-ch@denx.de>
 <YFCW3Kx9MPm0MT8H@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YFCW3Kx9MPm0MT8H@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, Mar 16, 2021 at 01:30:36PM +0200, Andy Shevchenko wrote:
> On Tue, Mar 16, 2021 at 11:08:05AM +0100, Claudius Heine wrote:
> > From: Johannes Hahn <johannes-hahn@siemens.com>
> > 
> > This allows the RX6110 driver to be automatically assigned to the right
> > device on the I2C bus.
> 
> Thanks for all effort!
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> after addressing the below comments.
> 
> > Signed-off-by: Johannes Hahn <johannes-hahn@siemens.com>
> > Signed-off-by: Claudius Heine <ch@denx.de>
> 
> > Signed-off-by: Henning Schild <henning.schild@siemens.com>
> 
> I think this is somehow confusing. Either you need to add Co-developed-by of
> the corresponding people, or remove SoB (because of From line), i.o.w seems
> like Co-dB tag is needed for Johannes or you and something should be done with
> Henning's SoB.

Since Johannes' name is in the From, then it seems okay for you (either you a
co-developer, than a Co-dB tag, or a submitter, than it's okay to have no Co-dB
tag).


-- 
With Best Regards,
Andy Shevchenko


