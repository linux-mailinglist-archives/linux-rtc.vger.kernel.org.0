Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6D3812359F
	for <lists+linux-rtc@lfdr.de>; Tue, 17 Dec 2019 20:27:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727655AbfLQT1C (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 17 Dec 2019 14:27:02 -0500
Received: from mail.andi.de1.cc ([85.214.55.253]:38926 "EHLO mail.andi.de1.cc"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726723AbfLQT1B (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 17 Dec 2019 14:27:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=juDIEOky79kDuq2dM/DLErf1rbGtF+b0wwD31rJ1yOU=; b=UrqjMgCt2lcEJusuM6qDBf22bp
        45MrISVbkKqVw7LJ+6mEZvg2rqKRQ/LADFrT/Z3hzHIecxtvuH8+hs44715puJbxpniLmQuGF/RCu
        L6Ki+fRitAiFCrLlGk9Va2PX8V80QApRkhMGuhBIW3NrzVmfXBlDeBHhokULOcqVTFCk=;
Received: from p200300ccff162b001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff16:2b00:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1ihIUY-0004BI-Tx; Tue, 17 Dec 2019 20:26:47 +0100
Date:   Tue, 17 Dec 2019 20:26:45 +0100
From:   Andreas Kemnade <andreas@kemnade.info>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
        mark.rutland@arm.com, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stefan@agner.ch, b.galvani@gmail.com,
        robh+dt@kernel.org, phh@phh.me, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v4 4/5] mfd: rn5t618: add more subdevices
Message-ID: <20191217202645.362ea7d0@aktux>
In-Reply-To: <20191217122526.7da85553@kemnade.info>
References: <20191211215409.32764-1-andreas@kemnade.info>
        <20191211215409.32764-5-andreas@kemnade.info>
        <20191216153106.GK2369@dell>
        <20191216170000.022a4c31@kemnade.info>
        <20191217080146.GE18955@dell>
        <20191217122526.7da85553@kemnade.info>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Score: -1.0 (-)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, 17 Dec 2019 12:25:26 +0100
Andreas Kemnade <andreas@kemnade.info> wrote:

> On Tue, 17 Dec 2019 08:01:46 +0000
> Lee Jones <lee.jones@linaro.org> wrote:
> 
> > On Mon, 16 Dec 2019, Andreas Kemnade wrote:
> >   
> > > On Mon, 16 Dec 2019 15:31:06 +0000
> > > Lee Jones <lee.jones@linaro.org> wrote:
> > >     
> > > > On Wed, 11 Dec 2019, Andreas Kemnade wrote:
> > > >     
> > > > > The RC5T619 has a RTC which is missing in the
> > > > > RN5T618. Add it as subdevice to prepare for their implementation
> > > > > 
> > > > > Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> > > > > ---
> > > > > Changes in v3:
> > > > > - alignment cleanup
> > > > >  drivers/mfd/rn5t618.c | 16 ++++++++++++++--
> > > > >  1 file changed, 14 insertions(+), 2 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/mfd/rn5t618.c b/drivers/mfd/rn5t618.c
> > > > > index d78eb29b94a4..18d56a732b20 100644
> > > > > --- a/drivers/mfd/rn5t618.c
> > > > > +++ b/drivers/mfd/rn5t618.c
> > > > > @@ -22,6 +22,12 @@ static const struct mfd_cell rn5t618_cells[] = {
> > > > >  	{ .name = "rn5t618-wdt" },
> > > > >  };
> > > > >  
> > > > > +static const struct mfd_cell rc5t619_cells[] = {
> > > > > +	{ .name = "rn5t618-regulator" },
> > > > > +	{ .name = "rc5t619-rtc" },
> > > > > +	{ .name = "rn5t618-wdt" },
> > > > > +};
> > > > > +
> > > > >  static bool rn5t618_volatile_reg(struct device *dev, unsigned int reg)
> > > > >  {
> > > > >  	switch (reg) {
> > > > > @@ -173,8 +179,14 @@ static int rn5t618_i2c_probe(struct i2c_client *i2c,
> > > > >  		return ret;
> > > > >  	}
> > > > >  
> > > > > -	ret = devm_mfd_add_devices(&i2c->dev, -1, rn5t618_cells,
> > > > > -				   ARRAY_SIZE(rn5t618_cells), NULL, 0, NULL);
> > > > > +	if (priv->variant == RC5T619)
> > > > > +		ret = devm_mfd_add_devices(&i2c->dev, -1, rc5t619_cells,      
> > > > 
> > > > Ref: The "-1", please use this as an opportunity to use the defines.
> > > >     
> BTW: of course I can clean that up.
> 
> > > > > +					   ARRAY_SIZE(rc5t619_cells),
> > > > > +					   NULL, 0, NULL);
> > > > > +	else      
> > > > 
> > > > Are you sure it's not possible for 'variant' to be an unsupported
> > > > device?
> > > >     
> > > Well, does it change the behavior for devices other than the rc5t619?
> > > I do not think so. If the mfd driver is bound to unsupported devices,
> > > rn5t618_of_match is wrong.    
> > 
> > Right, and can you catch that?
> >   
> Well, maybe we don't get each other. RC5T619 has an RTC.
> If I understand the code right, priv->variant is set to RC5T619.
> if there is compatible = "ricoh,rc5t619" in the device tree.
> So in that and only in that case I have an extended subdevice list,
> which includes the RTC subdevice instead of only regulator and wdt.
> For everything else I do not touch it.
> 
Hmm, if the driver might be probed without device tree node,
there is:
   of_id = of_match_device(rn5t618_of_match, &i2c->dev);
        if (!of_id) {
                dev_err(&i2c->dev, "Failed to find matching DT ID\n");
                return -EINVAL;
        }

so nothing will be registered at all. So the only reasons I see the
driver might be bound to unsupported devices could be:
- a bug in of_match_device() 
- nonsense in rn5t618_of_match (I think that are well-thought entries)

Regards,
Andreas
