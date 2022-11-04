Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 340716192DD
	for <lists+linux-rtc@lfdr.de>; Fri,  4 Nov 2022 09:37:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231534AbiKDIg7 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 4 Nov 2022 04:36:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231384AbiKDIgv (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 4 Nov 2022 04:36:51 -0400
Received: from smtp-out-07.comm2000.it (smtp-out-07.comm2000.it [212.97.32.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EC7426574
        for <linux-rtc@vger.kernel.org>; Fri,  4 Nov 2022 01:36:46 -0700 (PDT)
Received: from francesco-nb.int.toradex.com (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: francesco@dolcini.it)
        by smtp-out-07.comm2000.it (Postfix) with ESMTPSA id 5855A3C45D6;
        Fri,  4 Nov 2022 09:36:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailserver.it;
        s=mailsrv; t=1667551004;
        bh=8dla8vXLUd58a4CY/aNaYeKTAXuVeLbT6WD3WpXE5z4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To;
        b=qnA2Gyuh7IRG6gZB7XUVIg6S2i6pNpcIBsCHPbcI2s2QllsEHYQbJpkRUsmcjBnjL
         tbz4Bb1emcKp7YoGRWN/52CW1kTWvKfGbnNKBNLRMOKTCK2nU8pCzHOVBvhSPYoS7v
         z1n/ndguFJF1l1wvNXHEuklES1ZXk2Nv2EJuJk6yIrRAt84/lgGoZ9MSuJaiqqiCop
         ClnLVDs702zrufaSZvovMqi/vXMWu9I1284a5YZIFKxZWLsc59y0LukLPiUo+hVyz/
         daW/Hus9Zp2EPWaN8zxq24HczckRbndcKEMMKpu9I/Xh8UY6Q61bcRUdMoChrXvmLh
         xYI8rd1jGavSA==
Date:   Fri, 4 Nov 2022 09:36:37 +0100
From:   Francesco Dolcini <francesco@dolcini.it>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Francesco Dolcini <francesco@dolcini.it>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org,
        Stefan Eichenberger <stefan.eichenberger@toradex.com>,
        Trent Piepho <tpiepho@impinj.com>,
        Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [PATCH v1] rtc: snvs: Allow a time difference on clock register
 read
Message-ID: <Y2TPFf+oc60DEvJt@francesco-nb.int.toradex.com>
References: <20221103111309.211915-1-francesco@dolcini.it>
 <Y2RAQbuUWVdolxXz@mail.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2RAQbuUWVdolxXz@mail.local>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, Nov 03, 2022 at 11:27:13PM +0100, Alexandre Belloni wrote:
> On 03/11/2022 12:13:09+0100, Francesco Dolcini wrote:
> > From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> > 
> > On an iMX6ULL the following message appears when a wakealarm is set:
> > 
> > echo 0 > /sys/class/rtc/rtc1/wakealarm
> > rtc rtc1: Timeout trying to get valid LPSRT Counter read
> > 
> > This does not always happen but is reproducible quite often (7 out of 10
> > times). The problem appears because the iMX6ULL is not able to read the
> > registers within one 32kHz clock cycle which is the base clock of the
> > RTC. Therefore, this patch allows a difference of up to 320 cycles
> > (10ms). 10ms was chosen to be big enough even on systems with less cpu
> > power (e.g. iMX6ULL). According to the reference manual a difference is
> > fine:
> > - If the two consecutive reads are similar, the value is correct.
> > The values have to be similar, not equal.
> > 
> > Fixes: cd7f3a249dbe ("rtc: snvs: Add timeouts to avoid kernel lockups")
> > Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > ---
> >  drivers/rtc/rtc-snvs.c | 16 ++++++++++++++--
> >  1 file changed, 14 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/rtc/rtc-snvs.c b/drivers/rtc/rtc-snvs.c
> > index bd929b0e7d7d..f9bbcb83ba04 100644
> > --- a/drivers/rtc/rtc-snvs.c
> > +++ b/drivers/rtc/rtc-snvs.c
> > @@ -32,6 +32,14 @@
> >  #define SNVS_LPPGDR_INIT	0x41736166
> >  #define CNTR_TO_SECS_SH		15
> >  
> > +/* The maximum RTC clock cycles that are allowed to pass between two
> > + * consecutive clock counter register reads. If the values are corrupted a
> > + * bigger difference is expected. The RTC frequency is 32kHz. With 320 cycles
> > + * we end at 10ms which should be enough for most cases. If it once takes
> > + * longer than expected we do a retry.
> > + */
> > +#define MAX_RTC_READ_DIFF_CYCLES	320
> > +
> >  struct snvs_rtc_data {
> >  	struct rtc_device *rtc;
> >  	struct regmap *regmap;
> > @@ -56,6 +64,7 @@ static u64 rtc_read_lpsrt(struct snvs_rtc_data *data)
> >  static u32 rtc_read_lp_counter(struct snvs_rtc_data *data)
> >  {
> >  	u64 read1, read2;
> > +	s64 diff;
> >  	unsigned int timeout = 100;
> >  
> >  	/* As expected, the registers might update between the read of the LSB
> > @@ -66,7 +75,8 @@ static u32 rtc_read_lp_counter(struct snvs_rtc_data *data)
> >  	do {
> >  		read2 = read1;
> >  		read1 = rtc_read_lpsrt(data);
> > -	} while (read1 != read2 && --timeout);
> > +		diff = read1 - read2;
> > +	} while ((abs(diff) > MAX_RTC_READ_DIFF_CYCLES) && --timeout);
> 
> Why are you using abs() here? I would expect read2 to be strictly equal
> or greater than read1. If this is not the case, then you certainly have
> an issue.

You meant read1 >= read2 ? read1 is the most recent reading.

abs() was there to handle a theoretical counter overflow, from what I
can understand it is a 47-bit counter (seconds). Thinking at it once
more probably it does not make much sense :-).

What about:

while ((diff < 0) || (diff > MAX_RTC_READ_DIFF_CYCLES)) && --timeout)

?

Francesco
