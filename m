Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B92C6F8214
	for <lists+linux-rtc@lfdr.de>; Fri,  5 May 2023 13:31:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231634AbjEELbw (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 5 May 2023 07:31:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231744AbjEELbv (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 5 May 2023 07:31:51 -0400
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B17ACF2
        for <linux-rtc@vger.kernel.org>; Fri,  5 May 2023 04:31:49 -0700 (PDT)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 086E7240012;
        Fri,  5 May 2023 11:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1683286308;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=NffZQWuckCG77Xp/zKqPn00BHHj5mEDr3UweS2YEfIw=;
        b=CI/QCHRgmeQKCvH5kEq1G7NuKLWSxvxNMEDPN0E81kfjoy8B+KBnwX2xt2ixNKggTL7zy1
        owxMxCKXVgxO+Tgy8KQKyti+Wi7jXonvv3GC1qSYdeZCDbagV40R8HjdLtxUbQQb7rMnvs
        tMTpmFi8Sf5ORZSx+Qy4GXpJjtH9SBqMTdBtR75BzWewjkQBHri6xNWR5OZtCxiQMq3k+9
        C+QJSbbYZNfZythlQVfDkR5lKRXcfGA3P2ubvVLyDOSPvjOEV5GbONwHzeLoV1JulWRbm5
        K4YECLVsm6qa/kf0iKNbIIRnNOlmaN8XhLme2PlvcFxNEUE1YJL0rDz1lB86Zg==
Date:   Fri, 5 May 2023 13:31:47 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Johannes Kirchmair <johannes.kirchmair@sigmatek.at>
Cc:     "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
Subject: Re: [PATCH] disable clkout for rv3028 by default
Message-ID: <20230505113147f5967bca@mail.local>
References: <20230504083217.2371933-1-johannes.kirchmair@sigmatek.at>
 <202305040912507451f5a2@mail.local>
 <VE1PR08MB490947C09283BAFF269E26BD92729@VE1PR08MB4909.eurprd08.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <VE1PR08MB490947C09283BAFF269E26BD92729@VE1PR08MB4909.eurprd08.prod.outlook.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 05/05/2023 10:31:38+0000, Johannes Kirchmair wrote:
> Hello Alex,
> 
> > -----Original Message-----
> > From: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > Sent: Donnerstag, 4. Mai 2023 11:13
> > To: Johannes Kirchmair <johannes.kirchmair@sigmatek.at>
> > Cc: linux-rtc@vger.kernel.org
> > Subject: Re: [PATCH] disable clkout for rv3028 by default
> > 
> > CAUTION: External E-Mail !
> > 
> > On 04/05/2023 10:32:17+0200, Johannes Kirchmair wrote:
> > > The rv3028 chip is kind of strange.
> > > The chip has two inputs one for the buffer battery
> > > (V_backup) and one for the main power supply (V_dd).
> > > By default a clk out of the chip is enabled, drawing a big amount of
> > > current, draining the buffer battery of our board in 3 days.
> > > There is a mode that would shut down the clk out if powered from
> > > V_backup, but that would have to be configured as well. In our
> > > application the battery is connected via V_dd. So disabling the clk by
> > > default is the way to go for us.
> > >
> > 
> > You can't do that, this introduces a glitch in the clock output and will
> > break existing users. The clock should be disabled automatically by the
> > CCF when there are no users. Is your kernel built without
> > CONFIG_COMMON_CLK
> Now I am a little confused.
> I tested on an x86 board where the clock was not disabled by the kernel. 
> Than I tested on an arm imx8 board where it was disabled by default.
> 
> In both cases I used an 5.15 kernel.
> 
> Difference between x86 and arm is, that in x86 we probe from user space after boot process and on the arm board the rtc is probed while booting. 
> 
> Do you know at what point the clock is disabled? Is it part of registering the clock?
> 

This is clk_disable_unused which is a late_initcall_sync()

> Best regards Johannes
> 
> > 
> > > Signed-off-by: Johannes Kirchmair <johannes.kirchmair@sigmatek.at>
> > > ---
> > >  drivers/rtc/rtc-rv3028.c | 12 +++++++++++-
> > >  1 file changed, 11 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/rtc/rtc-rv3028.c b/drivers/rtc/rtc-rv3028.c
> > > index 12c807306893..9e2aaa7a533e 100644
> > > --- a/drivers/rtc/rtc-rv3028.c
> > > +++ b/drivers/rtc/rtc-rv3028.c
> > > @@ -787,7 +787,7 @@ static const struct regmap_config regmap_config = {
> > >  static int rv3028_probe(struct i2c_client *client)
> > >  {
> > >       struct rv3028_data *rv3028;
> > > -     int ret, status;
> > > +     int ret, status, buf;
> > >       u32 ohms;
> > >       struct nvmem_config nvmem_cfg = {
> > >               .name = "rv3028_nvram",
> > > @@ -826,6 +826,16 @@ static int rv3028_probe(struct i2c_client *client)
> > >       if (status & RV3028_STATUS_AF)
> > >               dev_warn(&client->dev, "An alarm may have been missed.\n");
> > >
> > > +     ret = regmap_read(rv3028->regmap, RV3028_CLKOUT, &buf);
> > > +     if (ret < 0)
> > > +             return ret;
> > > +
> > > +     if (buf != RV3028_CLKOUT_FD_MASK) {
> > > +             ret = rv3028_update_cfg(rv3028, RV3028_CLKOUT, 0xff,
> > RV3028_CLKOUT_FD_MASK); // disable clk out
> > > +             if (ret < 0)
> > > +                     return ret;
> > > +     }
> > > +
> > >       rv3028->rtc = devm_rtc_allocate_device(&client->dev);
> > >       if (IS_ERR(rv3028->rtc))
> > >               return PTR_ERR(rv3028->rtc);
> > > --
> > > 2.25.1
> > >
> > 
> > --
> > Alexandre Belloni, co-owner and COO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
