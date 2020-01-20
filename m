Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0887614280C
	for <lists+linux-rtc@lfdr.de>; Mon, 20 Jan 2020 11:17:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726130AbgATKRS (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 20 Jan 2020 05:17:18 -0500
Received: from mga14.intel.com ([192.55.52.115]:37462 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726125AbgATKRS (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 20 Jan 2020 05:17:18 -0500
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 20 Jan 2020 02:17:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,341,1574150400"; 
   d="scan'208";a="227015778"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003.jf.intel.com with ESMTP; 20 Jan 2020 02:17:13 -0800
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1itU7O-0000Dw-8J; Mon, 20 Jan 2020 12:17:14 +0200
Date:   Mon, 20 Jan 2020 12:17:14 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org,
        "Guilherme G . Piccoli" <gpiccoli@canonical.com>,
        linux-kernel@vger.kernel.org,
        Cezary Rojewski <cezary.rojewski@intel.com>,
        Liam Girdwood <liam.r.girdwood@linux.intel.com>,
        Jie Yang <yang.jie@linux.intel.com>,
        Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org
Subject: Re: [PATCH v1 7/8] ASoC: Intel: Switch DMI table match to a test of
 variable
Message-ID: <20200120101714.GG32742@smile.fi.intel.com>
References: <20200117175626.56358-1-andriy.shevchenko@linux.intel.com>
 <20200117175626.56358-7-andriy.shevchenko@linux.intel.com>
 <c92e0395-0a08-a400-eb48-0aa05e52cf30@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c92e0395-0a08-a400-eb48-0aa05e52cf30@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, Jan 17, 2020 at 01:10:55PM -0600, Pierre-Louis Bossart wrote:
> On 1/17/20 11:56 AM, Andy Shevchenko wrote:
> > Since we have a common x86 quirk that provides an exported variable,
> > use it instead of local DMI table match.
> > 
> > Cc: Cezary Rojewski <cezary.rojewski@intel.com>
> > Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> > Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>
> > Cc: Jie Yang <yang.jie@linux.intel.com>
> > Cc: Mark Brown <broonie@kernel.org>
> > Cc: alsa-devel@alsa-project.org
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Thanks Andy.
> 
> Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Thank you. Though I think I'll re-do this a bit, i.e.
 - convert the cht_quirk() to oneliner that is using ternary operator
 - convert also codec driver to use variable instead of DMI match

> 
> > ---
> >   .../intel/common/soc-acpi-intel-cht-match.c   | 28 ++-----------------
> >   1 file changed, 3 insertions(+), 25 deletions(-)
> > 
> > diff --git a/sound/soc/intel/common/soc-acpi-intel-cht-match.c b/sound/soc/intel/common/soc-acpi-intel-cht-match.c
> > index d0fb43c2b9f6..833d2e130e6e 100644
> > --- a/sound/soc/intel/common/soc-acpi-intel-cht-match.c
> > +++ b/sound/soc/intel/common/soc-acpi-intel-cht-match.c
> > @@ -5,31 +5,11 @@
> >    * Copyright (c) 2017, Intel Corporation.
> >    */
> > -#include <linux/dmi.h>
> > +#include <linux/platform_data/x86/machine.h>
> > +
> >   #include <sound/soc-acpi.h>
> >   #include <sound/soc-acpi-intel-match.h>
> > -static unsigned long cht_machine_id;
> > -
> > -#define CHT_SURFACE_MACH 1
> > -
> > -static int cht_surface_quirk_cb(const struct dmi_system_id *id)
> > -{
> > -	cht_machine_id = CHT_SURFACE_MACH;
> > -	return 1;
> > -}
> > -
> > -static const struct dmi_system_id cht_table[] = {
> > -	{
> > -		.callback = cht_surface_quirk_cb,
> > -		.matches = {
> > -			DMI_MATCH(DMI_SYS_VENDOR, "Microsoft Corporation"),
> > -			DMI_MATCH(DMI_PRODUCT_NAME, "Surface 3"),
> > -		},
> > -	},
> > -	{ }
> > -};
> > -
> >   static struct snd_soc_acpi_mach cht_surface_mach = {
> >   	.id = "10EC5640",
> >   	.drv_name = "cht-bsw-rt5645",
> > @@ -43,9 +23,7 @@ static struct snd_soc_acpi_mach *cht_quirk(void *arg)
> >   {
> >   	struct snd_soc_acpi_mach *mach = arg;
> > -	dmi_check_system(cht_table);
> > -
> > -	if (cht_machine_id == CHT_SURFACE_MACH)
> > +	if (x86_microsoft_surface_3_machine)
> >   		return &cht_surface_mach;
> >   	else
> >   		return mach;
> > 

-- 
With Best Regards,
Andy Shevchenko


