Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8649761932D
	for <lists+linux-rtc@lfdr.de>; Fri,  4 Nov 2022 10:11:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231217AbiKDJLp (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 4 Nov 2022 05:11:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229756AbiKDJLm (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 4 Nov 2022 05:11:42 -0400
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACB01B41
        for <linux-rtc@vger.kernel.org>; Fri,  4 Nov 2022 02:11:40 -0700 (PDT)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 6025E240008;
        Fri,  4 Nov 2022 09:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1667553099;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=AYBQ/wVGgG0FVlbWFYE296sk3oKWiIDGgsA4YKgiTKw=;
        b=lv5hw58JH8MQLXMN5pGrvnxwulZieADo3mzROXAEboVrVsoC9jEzxnN1hYFxceE1cXSUSL
        ZgJvFiEa7jrNpGGIaUEt993/lVgUDhCo8CL/XiDqPc6TgCpdx1lWV9Nqv/NLdrSGjb4a2u
        uSlbQD8Gjwnk3C5mHY/meJqG/VtZK1HLdQbQVtGEejbO/slUHuhudK0nJREdiILo82HMYL
        BgpIMUDveLtkGRmhP+G+zy4EdKvg1o+CVDLR+PDJ0XHp0A4NMFfGFALUsl/w+wMqRiD+mt
        pM2v79ESN3X3ppfptJUIubM45kSUdeLjrAWgvqZVLtwA+FpOLgsN9V9hE9ggqA==
Date:   Fri, 4 Nov 2022 10:11:37 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Francesco Dolcini <francesco@dolcini.it>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org,
        Stefan Eichenberger <stefan.eichenberger@toradex.com>,
        Trent Piepho <tpiepho@impinj.com>,
        Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [PATCH v1] rtc: snvs: Allow a time difference on clock register
 read
Message-ID: <Y2TXSfl4IbYM2dkB@mail.local>
References: <20221103111309.211915-1-francesco@dolcini.it>
 <Y2RAQbuUWVdolxXz@mail.local>
 <Y2TPFf+oc60DEvJt@francesco-nb.int.toradex.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2TPFf+oc60DEvJt@francesco-nb.int.toradex.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 04/11/2022 09:36:37+0100, Francesco Dolcini wrote:
> On Thu, Nov 03, 2022 at 11:27:13PM +0100, Alexandre Belloni wrote:
> > On 03/11/2022 12:13:09+0100, Francesco Dolcini wrote:
> > > From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> > > 
> > > On an iMX6ULL the following message appears when a wakealarm is set:
> > > 
> > > echo 0 > /sys/class/rtc/rtc1/wakealarm
> > > rtc rtc1: Timeout trying to get valid LPSRT Counter read
> > > 
> > > This does not always happen but is reproducible quite often (7 out of 10
> > > times). The problem appears because the iMX6ULL is not able to read the
> > > registers within one 32kHz clock cycle which is the base clock of the
> > > RTC. Therefore, this patch allows a difference of up to 320 cycles
> > > (10ms). 10ms was chosen to be big enough even on systems with less cpu
> > > power (e.g. iMX6ULL). According to the reference manual a difference is
> > > fine:
> > > - If the two consecutive reads are similar, the value is correct.
> > > The values have to be similar, not equal.
> > > 
> > > Fixes: cd7f3a249dbe ("rtc: snvs: Add timeouts to avoid kernel lockups")
> > > Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > > Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> > > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > > ---
> > >  drivers/rtc/rtc-snvs.c | 16 ++++++++++++++--
> > >  1 file changed, 14 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/rtc/rtc-snvs.c b/drivers/rtc/rtc-snvs.c
> > > index bd929b0e7d7d..f9bbcb83ba04 100644
> > > --- a/drivers/rtc/rtc-snvs.c
> > > +++ b/drivers/rtc/rtc-snvs.c
> > > @@ -32,6 +32,14 @@
> > >  #define SNVS_LPPGDR_INIT	0x41736166
> > >  #define CNTR_TO_SECS_SH		15
> > >  
> > > +/* The maximum RTC clock cycles that are allowed to pass between two
> > > + * consecutive clock counter register reads. If the values are corrupted a
> > > + * bigger difference is expected. The RTC frequency is 32kHz. With 320 cycles
> > > + * we end at 10ms which should be enough for most cases. If it once takes
> > > + * longer than expected we do a retry.
> > > + */
> > > +#define MAX_RTC_READ_DIFF_CYCLES	320
> > > +
> > >  struct snvs_rtc_data {
> > >  	struct rtc_device *rtc;
> > >  	struct regmap *regmap;
> > > @@ -56,6 +64,7 @@ static u64 rtc_read_lpsrt(struct snvs_rtc_data *data)
> > >  static u32 rtc_read_lp_counter(struct snvs_rtc_data *data)
> > >  {
> > >  	u64 read1, read2;
> > > +	s64 diff;
> > >  	unsigned int timeout = 100;
> > >  
> > >  	/* As expected, the registers might update between the read of the LSB
> > > @@ -66,7 +75,8 @@ static u32 rtc_read_lp_counter(struct snvs_rtc_data *data)
> > >  	do {
> > >  		read2 = read1;
> > >  		read1 = rtc_read_lpsrt(data);
> > > -	} while (read1 != read2 && --timeout);
> > > +		diff = read1 - read2;
> > > +	} while ((abs(diff) > MAX_RTC_READ_DIFF_CYCLES) && --timeout);
> > 
> > Why are you using abs() here? I would expect read2 to be strictly equal
> > or greater than read1. If this is not the case, then you certainly have
> > an issue.
> 
> You meant read1 >= read2 ? read1 is the most recent reading.
> 
> abs() was there to handle a theoretical counter overflow, from what I
> can understand it is a 47-bit counter (seconds). Thinking at it once
> more probably it does not make much sense :-).
> 
> What about:
> 
> while ((diff < 0) || (diff > MAX_RTC_READ_DIFF_CYCLES)) && --timeout)
> 

This looks good

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
