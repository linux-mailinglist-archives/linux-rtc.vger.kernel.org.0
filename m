Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C21656192EA
	for <lists+linux-rtc@lfdr.de>; Fri,  4 Nov 2022 09:45:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229950AbiKDIpN (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 4 Nov 2022 04:45:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229600AbiKDIpM (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 4 Nov 2022 04:45:12 -0400
Received: from smtp-out-04.comm2000.it (smtp-out-04.comm2000.it [212.97.32.67])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C4D4DA8
        for <linux-rtc@vger.kernel.org>; Fri,  4 Nov 2022 01:45:10 -0700 (PDT)
Received: from francesco-nb.int.toradex.com (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: francesco@dolcini.it)
        by smtp-out-04.comm2000.it (Postfix) with ESMTPSA id 5323BBC4718;
        Fri,  4 Nov 2022 09:45:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailserver.it;
        s=mailsrv; t=1667551508;
        bh=8jL0kxwXPbjR+V4sP+1MsPocAUGgx4j9CcQjXBm1M3o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To;
        b=iUX0/vR0+K9zuigH3lGnYiohog7uOkS2jyC4/XdVkH3W40sRRGuNAwLZNOwBWHUGG
         0Yg4BQ7Klv36MoPAP1L/R4jNeeSaZPApPz+mju/Py67UcoJTWaYMOuh6BG2zTZg8Tc
         96eBRyKoRzMTKGpbpsSZeMp852P/t0rVgUJOaZa5MQMAwSxzuLfGVYl2IXYqI9xAJu
         z5I7+91MuIgD9venCHKGOyibH9NhWoJ5N2Vy2Ud0krDSy6/88/1Hhp74dYAur6xFMx
         4LTg7Mknemc7+J9R0HBnpS2o1uhF641FlGkQjEa3gzBBVYwnFusKhjisZNExC2ZiYk
         k78T4NRPoFyFA==
Date:   Fri, 4 Nov 2022 09:45:01 +0100
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
Message-ID: <Y2TRDdCc+kl/J3DO@francesco-nb.int.toradex.com>
References: <20221103111309.211915-1-francesco@dolcini.it>
 <Y2RAbLzvNJDRocgZ@mail.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2RAbLzvNJDRocgZ@mail.local>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, Nov 03, 2022 at 11:27:56PM +0100, Alexandre Belloni wrote:
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
> 
> Also, your SoB needs to match the sender address.

I'll fix it.

However there is something that I do not fully understand and I thought
it was not strictly required when forwarding patches like I just did.

How do you handle the very common case in which the patch author is the
corporate email address, but the email sender is a private one?

Normally you have:
 - sender me@personal.example.com
 - first line of the email From: me@company.example.com
 - SoB: me@company.example.com

with that the email sender does not match the last sob, but this is very
common, see for example https://lore.kernel.org/all/20220705085825.21255-1-max.oss.09@gmail.com/

Should we have an additional
 - sob me@personal.example.com

Therefore having 2 sob by the same individual, but with 2 different email
addresses?

Francesco

