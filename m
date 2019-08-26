Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DFE6E9CD0E
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Aug 2019 12:10:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729563AbfHZKKV (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 26 Aug 2019 06:10:21 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:36013 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727578AbfHZKKV (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 26 Aug 2019 06:10:21 -0400
X-Originating-IP: 86.207.98.53
Received: from localhost (aclermont-ferrand-651-1-259-53.w86-207.abo.wanadoo.fr [86.207.98.53])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id ADB9B1BF20B;
        Mon, 26 Aug 2019 10:10:18 +0000 (UTC)
Date:   Mon, 26 Aug 2019 12:10:18 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Biwen Li <biwen.li@nxp.com>
Cc:     Trent Piepho <tpiepho@impinj.com>, Leo Li <leoyang.li@nxp.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [EXT] Re: [1/3] rtc/fsl: support flextimer for lx2160a
Message-ID: <20190826101018.GC21713@piout.net>
References: <20190823095740.12280-1-biwen.li@nxp.com>
 <1566579388.5029.8.camel@impinj.com>
 <DB7PR04MB4490B7AD75C6EE49F5208F738FA10@DB7PR04MB4490.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB7PR04MB4490B7AD75C6EE49F5208F738FA10@DB7PR04MB4490.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 26/08/2019 03:37:43+0000, Biwen Li wrote:
> > 
> > On Fri, 2019-08-23 at 17:57 +0800, Biwen Li wrote:
> > > The patch supports flextimer for lx2160a
> > >
> > > Signed-off-by: Biwen Li <biwen.li@nxp.com>
> > > ---
> > >  drivers/rtc/rtc-fsl-ftm-alarm.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/drivers/rtc/rtc-fsl-ftm-alarm.c b/drivers/rtc/rtc-fsl-
> > > ftm-alarm.c index 4f7259c2d6a3..2b81525f6db8 100644
> > > --- a/drivers/rtc/rtc-fsl-ftm-alarm.c
> > > +++ b/drivers/rtc/rtc-fsl-ftm-alarm.c
> > > @@ -313,6 +313,7 @@ static const struct of_device_id ftm_rtc_match[] =
> > > {
> > >       { .compatible = "fsl,ls1088a-ftm-alarm", },
> > >       { .compatible = "fsl,ls208xa-ftm-alarm", },
> > >       { .compatible = "fsl,ls1028a-ftm-alarm", },
> > > +     { .compatible = "fsl,lx2160a-ftm-alarm", },
> > >       { },
> > >  };
> > >
> > 
> > Since there's no data associated with each compatible, it doesn't seem like
> > there's any need to add a new one.
> > 
> > What's normally done is add two compatibles in the dts, the base version and
> > the specific version, e.g.:
> > 
> > +               rcpm: rcpm@1e34040 {
> > +                       compatible = "fsl,lx2160a-rcpm",
> > + "fsl,qoriq-cpm-2.1+";
> > 
> > Or in this case, compatible = "fsl,lx2160a-ftm-alarm", "fsl,ls1088a-ftm-alarm";
> > 
> > Then there's no need to add to the driver list.
> Yes, it will be work. But it will be confusing. Is ls1088a same with lx2160a? No.

Well, if you are sure it is the exact same IP that is used, then you
should only use one compatible. We usually use the name of the first SoC
that had the IP. Is it confusing anyone? Probably not because this will
be in a dtsi that nobody will read.

Note that adding so many compatbile will increase the boot time of your
platform and this is annoying many NXP customers of the i.mx line.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
