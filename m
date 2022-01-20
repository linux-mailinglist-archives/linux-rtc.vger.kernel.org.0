Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20CBE49547E
	for <lists+linux-rtc@lfdr.de>; Thu, 20 Jan 2022 19:58:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377350AbiATS40 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 20 Jan 2022 13:56:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233413AbiATS4Z (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 20 Jan 2022 13:56:25 -0500
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63EE7C061574
        for <linux-rtc@vger.kernel.org>; Thu, 20 Jan 2022 10:56:25 -0800 (PST)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 28DB3FF804;
        Thu, 20 Jan 2022 18:56:23 +0000 (UTC)
Date:   Thu, 20 Jan 2022 19:56:22 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     "Limonciello, Mario" <mario.limonciello@amd.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>, Jinke Fan <fanjinke@hygon.cn>,
        Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
        Raul E Rangel <rrangel@chromium.org>
Subject: Re: [PATCH] rtc: Fix the AltCentury for AMD platforms
Message-ID: <YemwVn65H2yotmfd@piout.net>
References: <20220111225750.1699-1-mario.limonciello@amd.com>
 <dd1b3f97-316e-09ac-05de-43fb1320c5b0@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dd1b3f97-316e-09ac-05de-43fb1320c5b0@amd.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 20/01/2022 12:27:39-0600, Limonciello, Mario wrote:
> On 1/11/2022 16:57, Mario Limonciello wrote:
> > Setting the century forward has been failing on AMD platforms.
> > There was a previous attempt at fixing this for family 0x17 as part of
> > commit 7ad295d5196a ("rtc: Fix the AltCentury value on AMD/Hygon
> > platform") but this was later reverted due to some problems reported
> > that appeared to stem from an FW bug on a family 0x17 desktop system.
> > 
> > The same comments mentioned in the previous commit continue to apply
> > to the newer platforms as well.
> > 
> > ```
> > MC146818 driver use function mc146818_set_time() to set register
> > RTC_FREQ_SELECT(RTC_REG_A)'s bit4-bit6 field which means divider stage
> > reset value on Intel platform to 0x7.
> > 
> > While AMD/Hygon RTC_REG_A(0Ah)'s bit4 is defined as DV0 [Reference]:
> > DV0 = 0 selects Bank 0, DV0 = 1 selects Bank 1. Bit5-bit6 is defined
> > as reserved.
> > 
> > DV0 is set to 1, it will select Bank 1, which will disable AltCentury
> > register(0x32) access. As UEFI pass acpi_gbl_FADT.century 0x32
> > (AltCentury), the CMOS write will be failed on code:
> > CMOS_WRITE(century, acpi_gbl_FADT.century).
> > 
> > Correct RTC_REG_A bank select bit(DV0) to 0 on AMD/Hygon CPUs, it will
> > enable AltCentury(0x32) register writing and finally setup century as
> > expected.
> > ```
> > 
> > However in closer examination the change previously submitted was also
> > modifying bits 5 & 6 which are declared reserved in the AMD documentation.
> > So instead modify just the DV0 bank selection bit.
> > 
> > Being cognizant that there was a failure reported before, split the code
> > change out to a static function that can also be used for exclusions if
> > any regressions such as Mikhail's pop up again.
> > 
> > Cc: Jinke Fan <fanjinke@hygon.cn>
> > Cc: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
> > Link: https://lore.kernel.org/all/CABXGCsMLob0DC25JS8wwAYydnDoHBSoMh2_YLPfqm3TTvDE-Zw@mail.gmail.com/
> > Link: https://www.amd.com/system/files/TechDocs/51192_Bolton_FCH_RRG.pdf
> > Signed-off-by: Raul E Rangel <rrangel@chromium.org>
> > Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> > ---
> >   drivers/rtc/rtc-mc146818-lib.c | 16 +++++++++++++++-
> >   include/linux/mc146818rtc.h    |  2 ++
> >   2 files changed, 17 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/rtc/rtc-mc146818-lib.c b/drivers/rtc/rtc-mc146818-lib.c
> > index dcfaf09946ee..3c8be2136703 100644
> > --- a/drivers/rtc/rtc-mc146818-lib.c
> > +++ b/drivers/rtc/rtc-mc146818-lib.c
> > @@ -120,6 +120,17 @@ unsigned int mc146818_get_time(struct rtc_time *time)
> >   }
> >   EXPORT_SYMBOL_GPL(mc146818_get_time);
> > +/* AMD systems don't allow access to AltCentury with DV1 */
> > +static bool apply_amd_register_a_behavior(void)
> > +{
> > +#ifdef CONFIG_X86
> > +	if (boot_cpu_data.x86_vendor == X86_VENDOR_AMD ||
> > +	    boot_cpu_data.x86_vendor == X86_VENDOR_HYGON)
> > +		return true;
> > +#endif
> > +	return false;
> > +}
> > +
> >   /* Set the current date and time in the real time clock. */
> >   int mc146818_set_time(struct rtc_time *time)
> >   {
> > @@ -191,7 +202,10 @@ int mc146818_set_time(struct rtc_time *time)
> >   	save_control = CMOS_READ(RTC_CONTROL);
> >   	CMOS_WRITE((save_control|RTC_SET), RTC_CONTROL);
> >   	save_freq_select = CMOS_READ(RTC_FREQ_SELECT);
> > -	CMOS_WRITE((save_freq_select|RTC_DIV_RESET2), RTC_FREQ_SELECT);
> > +	if (apply_amd_register_a_behavior())
> > +		CMOS_WRITE((save_freq_select & ~RTC_AMD_BANK_SELECT), RTC_FREQ_SELECT);
> > +	else
> > +		CMOS_WRITE((save_freq_select|RTC_DIV_RESET2), RTC_FREQ_SELECT);
> >   #ifdef CONFIG_MACH_DECSTATION
> >   	CMOS_WRITE(real_yrs, RTC_DEC_YEAR);
> > diff --git a/include/linux/mc146818rtc.h b/include/linux/mc146818rtc.h
> > index 0661af17a758..1e0205811394 100644
> > --- a/include/linux/mc146818rtc.h
> > +++ b/include/linux/mc146818rtc.h
> > @@ -86,6 +86,8 @@ struct cmos_rtc_board_info {
> >      /* 2 values for divider stage reset, others for "testing purposes only" */
> >   #  define RTC_DIV_RESET1	0x60
> >   #  define RTC_DIV_RESET2	0x70
> > +   /* In AMD BKDG bit 5 and 6 are reserved, bit 4 is for select dv0 bank */
> > +#  define RTC_AMD_BANK_SELECT	0x10
> >     /* Periodic intr. / Square wave rate select. 0=none, 1=32.8kHz,... 15=2Hz */
> >   # define RTC_RATE_SELECT 	0x0F
> 
> Hi Alexandre, Alessandro,
> 
> Friendly ping on this request.
> 

This was sent too close from the merge window to be applied.

> Also if it wasn't made clear in my commit message or by analyzing this code
> change, I do believe that at least part of the reason for the previous
> regression was because of mucking with reserved bits.  This patch is much
> more conservative.
> 
> In my testing I found similar behaviors from the old regression on a more
> modern platform when those bits were being touched.
> 
> Mikhail,
> 
> As you flagged the previous regression, would appreciate if you're able to
> test the new patch (although of course many things in your situation have
> changed now).
> 
> Thanks.
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
