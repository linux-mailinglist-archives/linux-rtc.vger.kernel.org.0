Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AABE26912F0
	for <lists+linux-rtc@lfdr.de>; Thu,  9 Feb 2023 23:03:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229460AbjBIWDh (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 9 Feb 2023 17:03:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbjBIWDh (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 9 Feb 2023 17:03:37 -0500
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8F273C3D
        for <linux-rtc@vger.kernel.org>; Thu,  9 Feb 2023 14:03:35 -0800 (PST)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id E49611C0002;
        Thu,  9 Feb 2023 22:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1675980214;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=lIy7F6Cz5oDqCkQWg3yI/8qprQfKzezbkgd9yS0ip6I=;
        b=GXasOIjYO66OV+va+fEef2nOkCUkwAg9/S7Hkn3zOsU36h9untQ56VYFwTZqPZHVK2qxO8
        rmDYuNZ9YbnfRgi3wr/wiNYZTNOxuOyVdGCGiL5zutYk8dMTXWJBeevhTcC58oWdmSMhmr
        3LSzu03NfqRPEDGa5a8Udf0e/Rluy0IDshi05pPkKAnGC4oCfP4lZLF6YzxUDeT/AhrUlC
        sqQxu4Q8ebakTSOc4n2Tr2CwwHrtd0Q3eVjIPz1pbK2rB+rVnniDs7yn0yJRThJ90DeEuN
        R2hfAq5vEY10BrnBr/h2Y8BIMiFCeT3t3EcKnJ7fvIV/dkglyvFjzIFKMjfvjg==
Date:   Thu, 9 Feb 2023 23:03:32 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Marc Kleine-Budde <mkl@pengutronix.de>
Cc:     Sascha Hauer <s.hauer@pengutronix.de>, linux-rtc@vger.kernel.org,
        kernel@pengutronix.de, Alessandro Zummo <a.zummo@towertech.it>
Subject: Re: [PATCH RESEND 0/2] rtc: rv8803 patches
Message-ID: <Y+VttJ+l56OZ5yr+@mail.local>
References: <20221123095527.2771434-1-s.hauer@pengutronix.de>
 <20230131081955.ke2larva6ftm5v4j@pengutronix.de>
 <Y9kCzCvGopu8+RCb@mail.local>
 <20230206151824.rb32y2jojtcdz5wp@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230206151824.rb32y2jojtcdz5wp@pengutronix.de>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 06/02/2023 16:18:24+0100, Marc Kleine-Budde wrote:
> On 31.01.2023 13:00:12, Alexandre Belloni wrote:
> > On 31/01/2023 09:19:55+0100, Marc Kleine-Budde wrote:
> > > Hello Alexandre,
> > > 
> > > On 23.11.2022 10:55:25, Sascha Hauer wrote:
> > > > This series has the remainder of
> > > > https://lore.kernel.org/all/20220426071056.1187235-1-s.hauer@pengutronix.de/
> > > > which was partly applied.
> > > > 
> > > > Alexandre,
> > > > 
> > > > Last time this series was send you asked if this series fixes a problem
> > > > we've really seen to which Ahmad answered:
> > > > 
> > > > > The kernel message
> > > > > 
> > > > >   rtc rtc0: invalid alarm value: 2020-3-27 7:82:0
> > > > > 
> > > > > listed in the commit message is something I actually ran into. There
> > > > > was no v2f set then. The customer has also variously observed bit flips
> > > > > independently of v2f: During EMC testing, electrostatic discharge at developer
> > > > > desks and even in the field: Suspected causes were lightning strikes in the
> > > > > vicinity and the switching of larger inductive loads.
> > > > > They're very paranoid of logging invalid timestamps, so we'll keep the patch
> > > > > anyhow at our side, but I think it is generally useful as well: If we can't
> > > > > set an invalid alarm time by normal means, but read back an invalid time,
> > > > > something may have corrupted other memory, so treating it as a v2f is sensible.
> > > > 
> > > > There was no answer to this. I would be glad if you could take this
> > > > series. I would understand though if you say that this problem is too
> > > > esoteric to fix it upstream, we would keep the patches locally then.
> > > > Please just say so, it would help me to get the problem from my desk
> > > > ;)
> > > 
> > > Can someone take this patch series? If not, what can we do to get these
> > > changes upstream?
> > 
> > I'm going to take it but this may silently break existing users with a
> > niche use case.
> > Also, this check will only happen at boot time so I'm not sure there is
> > a huge benefit, unless your customer reboots the platform often.
> 
> Thanks Alexandre, is this patch already on an immutable branch?

It is not, I just pushed it to rtc-next now.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
