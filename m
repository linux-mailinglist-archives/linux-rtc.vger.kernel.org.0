Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AC2633D524
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Mar 2021 14:47:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229707AbhCPNqo (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 16 Mar 2021 09:46:44 -0400
Received: from mga02.intel.com ([134.134.136.20]:29714 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229622AbhCPNq2 (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 16 Mar 2021 09:46:28 -0400
IronPort-SDR: j/A9zVAiG0/eWGhphrsHFssp0rpxneWYSOltF13emBkCAywqFp5h6nyqk0KBEPLdECak462UMB
 nPKvOl7GU5JQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9924"; a="176390304"
X-IronPort-AV: E=Sophos;i="5.81,251,1610438400"; 
   d="scan'208";a="176390304"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2021 06:46:27 -0700
IronPort-SDR: RwuFoNRYinpobRJAsQFRDh3AQU3TvAAWAisBI6/B8rZ13aHdK5t+od5VkM58O8Tdm2cBTu7QK2
 i0zFxRx8DQOw==
X-IronPort-AV: E=Sophos;i="5.81,251,1610438400"; 
   d="scan'208";a="439152743"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2021 06:46:24 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1lMA1e-00CyW2-5G; Tue, 16 Mar 2021 15:46:22 +0200
Date:   Tue, 16 Mar 2021 15:46:22 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Henning Schild <henning.schild@siemens.com>
Cc:     Claudius Heine <ch@denx.de>,
        johannes hahn <johannes-hahn@siemens.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        werner zeh <werner.zeh@siemens.com>,
        martin mantel <martin.mantel@siemens.com>,
        val krutov <val.krutov@erd.epson.com>
Subject: Re: [PATCH v3 1/1] rtc: rx6110: add ACPI bindings to I2C
Message-ID: <YFC2rnje4KLtjfFQ@smile.fi.intel.com>
References: <AM0PR10MB25801B7DCB6C1856B5D4F2C09FE10@AM0PR10MB2580.EURPRD10.PROD.OUTLOOK.COM>
 <20210316100805.2630481-2-ch@denx.de>
 <YFCW3Kx9MPm0MT8H@smile.fi.intel.com>
 <20210316125251.64484b3a@md1za8fc.ad001.siemens.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210316125251.64484b3a@md1za8fc.ad001.siemens.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, Mar 16, 2021 at 12:52:51PM +0100, Henning Schild wrote:
> Am Tue, 16 Mar 2021 13:30:36 +0200
> schrieb Andy Shevchenko <andriy.shevchenko@intel.com>:
> 
> > On Tue, Mar 16, 2021 at 11:08:05AM +0100, Claudius Heine wrote:
> > > From: Johannes Hahn <johannes-hahn@siemens.com>
> > > 
> > > This allows the RX6110 driver to be automatically assigned to the
> > > right device on the I2C bus.  
> > 
> > Thanks for all effort!
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> > after addressing the below comments.
> > 
> > > Signed-off-by: Johannes Hahn <johannes-hahn@siemens.com>
> > > Signed-off-by: Claudius Heine <ch@denx.de>  
> > 
> > > Signed-off-by: Henning Schild <henning.schild@siemens.com>  
> 
> Claudius, just remove that. I guess just add yours and mention authors
> in the code if they should receive some recognition.

> > > +#ifdef CONFIG_ACPI
> > > +static const struct acpi_device_id rx6110_i2c_acpi_match[] = {
> > > +	{ "SECC6110", },

> > > +	{ },

Missed one thing, remove comma here. Terminator lines do not need a comma (and
it's theoretically may confuse people or scripts while adding a new record to
the array).

> > > +};
> > > +MODULE_DEVICE_TABLE(acpi, rx6110_i2c_acpi_match);
> > > +#endif

-- 
With Best Regards,
Andy Shevchenko


