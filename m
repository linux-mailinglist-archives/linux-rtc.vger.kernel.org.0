Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 930C02B4A4C
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Nov 2020 17:07:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731681AbgKPQHI (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 16 Nov 2020 11:07:08 -0500
Received: from mga05.intel.com ([192.55.52.43]:51557 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731679AbgKPQHH (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 16 Nov 2020 11:07:07 -0500
IronPort-SDR: ezxLIDrI/T5g/EouNTaVyCS0C7AvqK+3SusOEUCsNzccTjzwK7+U9pLIr/DirkruZyUMkFX1W9
 dTLlPKgkngkQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9807"; a="255479093"
X-IronPort-AV: E=Sophos;i="5.77,483,1596524400"; 
   d="scan'208";a="255479093"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2020 08:07:04 -0800
IronPort-SDR: JGfEfNL+C3Clpyfm46g4KDNe1XzwvHA/E1Ua5W/N+tXZ/oPeAsICfQNhOqalHvCXiKMfdiE2gn
 V2XBHDyc0nnw==
X-IronPort-AV: E=Sophos;i="5.77,483,1596524400"; 
   d="scan'208";a="533463212"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2020 08:07:02 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1keh2y-0076Iy-NC; Mon, 16 Nov 2020 18:08:04 +0200
Date:   Mon, 16 Nov 2020 18:08:04 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Henning Schild <henning.schild@siemens.com>
Cc:     Claudius Heine <ch@denx.de>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Johannes Hahn <johannes-hahn@siemens.com>,
        "Zeh, Werner" <werner.zeh@siemens.com>
Subject: Re: [PATCH v2 2/3] rtc: rx6110: add ACPI bindings to I2C
Message-ID: <20201116160804.GB4077@smile.fi.intel.com>
References: <20201112130734.331094-1-ch@denx.de>
 <20201112130734.331094-3-ch@denx.de>
 <20201116144631.GB1689012@smile.fi.intel.com>
 <20201116163024.74c767b6@md1za8fc.ad001.siemens.net>
 <20201116160509.GA4077@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201116160509.GA4077@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, Nov 16, 2020 at 06:05:09PM +0200, Andy Shevchenko wrote:
> On Mon, Nov 16, 2020 at 04:30:24PM +0100, Henning Schild wrote:
> > Am Mon, 16 Nov 2020 16:46:31 +0200
> > schrieb Andy Shevchenko <andriy.shevchenko@intel.com>:
> > 
> > > On Thu, Nov 12, 2020 at 02:07:33PM +0100, Claudius Heine wrote:
> > > > From: Johannes Hahn <johannes-hahn@siemens.com>
> > > > 
> > > > This allows the RX6110 driver to be automatically assigned to the
> > > > right device on the I2C bus.  
> > > 
> > > Before adding new ACPI ID, can you provide an evidence (either from
> > > vendor of the component, or a real snapshot of DSDT from device on
> > > market) that this is real ID?
> > > 
> > > Before that happens, NAK.
> > > 
> > > P.S. Seems to me that this is kinda cargo cult patch because proposed
> > > ID is against ACPI and PNP registry and ACPI specification.
> > 
> > In fact we pushed it in coreboot and Linux at the same time.
> > 
> > https://review.coreboot.org/c/coreboot/+/47235
> > 
> > That is the evidence. But in case this is wrong we can probably still
> > change coreboot, even though the patches have been merged there already.
> 
> Yes, first of all you must follow ACPI and PNP registry. You may use your
> Google vendor ID for that (IIRC you have two of them). Ideally you need to
> convince Seiko Epson to do the right thing.

JFYI: According to the registry [1] they have their own vendor ID

SEIKO EPSON CORPORATION	SEC	11/29/1996

[1]: https://www.uefi.org/pnp_id_list

> > Maybe you can go into detail where you see the violations and maybe
> > even suggest fixes that come to mind.
> 
> Please, read ACPI specification. In particular chapters 6.1.2 "_CID
> (Compatible ID)", 6.1.5 "_HID (Hardware ID)". The latter clarifies
> the rules used to define an ID. Note, chapter 6.1.2 uses in particular
> "A valid HID value".
> 
> I hope you are using as latest as possible ACPICA compiler (or at least
> the one which follows the latest changes in it).

-- 
With Best Regards,
Andy Shevchenko


