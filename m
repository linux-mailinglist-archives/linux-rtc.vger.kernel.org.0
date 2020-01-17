Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDEE1141172
	for <lists+linux-rtc@lfdr.de>; Fri, 17 Jan 2020 20:11:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727519AbgAQTLA (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 17 Jan 2020 14:11:00 -0500
Received: from mga12.intel.com ([192.55.52.136]:37633 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726761AbgAQTK7 (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Fri, 17 Jan 2020 14:10:59 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 17 Jan 2020 11:10:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,331,1574150400"; 
   d="scan'208";a="263269243"
Received: from rakeshmi-mobl.gar.corp.intel.com (HELO [10.252.131.157]) ([10.252.131.157])
  by fmsmga001.fm.intel.com with ESMTP; 17 Jan 2020 11:10:56 -0800
Subject: Re: [PATCH v1 7/8] ASoC: Intel: Switch DMI table match to a test of
 variable
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org,
        "Guilherme G . Piccoli" <gpiccoli@canonical.com>,
        linux-kernel@vger.kernel.org
Cc:     Cezary Rojewski <cezary.rojewski@intel.com>,
        Liam Girdwood <liam.r.girdwood@linux.intel.com>,
        Jie Yang <yang.jie@linux.intel.com>,
        Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org
References: <20200117175626.56358-1-andriy.shevchenko@linux.intel.com>
 <20200117175626.56358-7-andriy.shevchenko@linux.intel.com>
From:   Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <c92e0395-0a08-a400-eb48-0aa05e52cf30@linux.intel.com>
Date:   Fri, 17 Jan 2020 13:10:55 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200117175626.56358-7-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org



On 1/17/20 11:56 AM, Andy Shevchenko wrote:
> Since we have a common x86 quirk that provides an exported variable,
> use it instead of local DMI table match.
> 
> Cc: Cezary Rojewski <cezary.rojewski@intel.com>
> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>
> Cc: Jie Yang <yang.jie@linux.intel.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: alsa-devel@alsa-project.org
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thanks Andy.

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>   .../intel/common/soc-acpi-intel-cht-match.c   | 28 ++-----------------
>   1 file changed, 3 insertions(+), 25 deletions(-)
> 
> diff --git a/sound/soc/intel/common/soc-acpi-intel-cht-match.c b/sound/soc/intel/common/soc-acpi-intel-cht-match.c
> index d0fb43c2b9f6..833d2e130e6e 100644
> --- a/sound/soc/intel/common/soc-acpi-intel-cht-match.c
> +++ b/sound/soc/intel/common/soc-acpi-intel-cht-match.c
> @@ -5,31 +5,11 @@
>    * Copyright (c) 2017, Intel Corporation.
>    */
>   
> -#include <linux/dmi.h>
> +#include <linux/platform_data/x86/machine.h>
> +
>   #include <sound/soc-acpi.h>
>   #include <sound/soc-acpi-intel-match.h>
>   
> -static unsigned long cht_machine_id;
> -
> -#define CHT_SURFACE_MACH 1
> -
> -static int cht_surface_quirk_cb(const struct dmi_system_id *id)
> -{
> -	cht_machine_id = CHT_SURFACE_MACH;
> -	return 1;
> -}
> -
> -static const struct dmi_system_id cht_table[] = {
> -	{
> -		.callback = cht_surface_quirk_cb,
> -		.matches = {
> -			DMI_MATCH(DMI_SYS_VENDOR, "Microsoft Corporation"),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "Surface 3"),
> -		},
> -	},
> -	{ }
> -};
> -
>   static struct snd_soc_acpi_mach cht_surface_mach = {
>   	.id = "10EC5640",
>   	.drv_name = "cht-bsw-rt5645",
> @@ -43,9 +23,7 @@ static struct snd_soc_acpi_mach *cht_quirk(void *arg)
>   {
>   	struct snd_soc_acpi_mach *mach = arg;
>   
> -	dmi_check_system(cht_table);
> -
> -	if (cht_machine_id == CHT_SURFACE_MACH)
> +	if (x86_microsoft_surface_3_machine)
>   		return &cht_surface_mach;
>   	else
>   		return mach;
> 
