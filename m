Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4AB8276B1D
	for <lists+linux-rtc@lfdr.de>; Thu, 24 Sep 2020 09:47:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727180AbgIXHrT (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 24 Sep 2020 03:47:19 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:37665 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727120AbgIXHrT (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 24 Sep 2020 03:47:19 -0400
X-Greylist: delayed 79346 seconds by postgrey-1.27 at vger.kernel.org; Thu, 24 Sep 2020 03:47:18 EDT
X-Originating-IP: 90.65.88.165
Received: from localhost (lfbn-lyo-1-1908-165.w90-65.abo.wanadoo.fr [90.65.88.165])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 29F031C000F;
        Thu, 24 Sep 2020 07:47:15 +0000 (UTC)
Date:   Thu, 24 Sep 2020 09:47:15 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Qiang Zhao <qiang.zhao@nxp.com>,
        Bruno Thomsen <bruno.thomsen@gmail.com>
Cc:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [Patch v2 1/3] dt-bindings: rtc: pcf2127: Add bindings for
 nxp,pcf2127
Message-ID: <20200924074715.GT9675@piout.net>
References: <20200921054821.26071-1-qiang.zhao@nxp.com>
 <20200923094449.GP9675@piout.net>
 <DB8PR04MB67635518BE38EEF5292C8D0991390@DB8PR04MB6763.eurprd04.prod.outlook.com>
 <20200924070456.rovgp6n5q25s53vc@pengutronix.de>
 <VE1PR04MB6768783CAE7CA611365661AF91390@VE1PR04MB6768.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <VE1PR04MB6768783CAE7CA611365661AF91390@VE1PR04MB6768.eurprd04.prod.outlook.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

On 24/09/2020 07:23:18+0000, Qiang Zhao wrote:
> > > Yes, you are right, There is not a fundamental solution.
> > > However it somewhat avoid this situation at least.
> > >
> > > And if without this issue,
> > > is it correct to register a rtc device as watchdog no matter it is used as
> > watchdog on the board?
> > > Every time Linux are booted up, watchdog device should be configured to the
> > right one manually.
> > > So the patch are useful, even though it is not for the issue.
> > >
> > > What should we do to really resolve this issue?
> > 
> > I still think we need a kernel solution here. I would expect that most assembled
> > pcf2127 chips are unable to act as a watchdog (i.e. don't have the RST output
> > connected to something that resets the machine).
> > 
> > So my favoured solution would be a positive property like:
> > 
> > 	has-watchdog;
> > 
> > or something similar. In my eyes this is definitely something we want to specify
> > in the device tree because it is a relevant hardware property.
> > I consider it a bug to give a watchdog device to userspace that isn't functional.
> > 
> > Best regards
> > Uwe
>  
> I strongly agree with you! It should be positive property.
> However, we couldn't identify which board are using pcf2127 as watchdog,
> So we are unable to modify the boards' dts to correct (watchdog or not) in this patchset.
> 
> I noticed that only LS series platforms and imx6 have pcf2127 node, as far as I know, the LS platforms don't use it as watchdog,
> But I am not sure about imx6
> 

I don't think there is any user upstream and it is recent engouh that we
can probably make that a positive property.

Bruno, is it ok for you? you are the only know user of the feature.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
