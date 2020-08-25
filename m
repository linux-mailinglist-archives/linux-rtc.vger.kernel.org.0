Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FEF4251C55
	for <lists+linux-rtc@lfdr.de>; Tue, 25 Aug 2020 17:32:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726351AbgHYPcy (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 25 Aug 2020 11:32:54 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:35061 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726294AbgHYPcw (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 25 Aug 2020 11:32:52 -0400
X-Originating-IP: 90.66.108.79
Received: from localhost (lfbn-lyo-1-1932-79.w90-66.abo.wanadoo.fr [90.66.108.79])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id CD3641C0012;
        Tue, 25 Aug 2020 15:32:48 +0000 (UTC)
Date:   Tue, 25 Aug 2020 17:32:48 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Bastian Krause <bst@pengutronix.de>
Cc:     linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
        Arnaud Ebalard <arno@natisbad.org>,
        Rob Herring <robh+dt@kernel.org>, kernel@pengutronix.de
Subject: Re: [PATCH 2/3] dt-bindings: rtc: add chargeable flag for rx8130
Message-ID: <20200825153248.GH2389103@piout.net>
References: <20200415163701.21989-1-bst@pengutronix.de>
 <20200415163701.21989-2-bst@pengutronix.de>
 <20200415185609.GP34509@piout.net>
 <3d1ecd35-fe37-02e7-74d8-3f37c2197173@pengutronix.de>
 <a492b6a0-b41c-a088-3ba1-f1448a074b34@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a492b6a0-b41c-a088-3ba1-f1448a074b34@pengutronix.de>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

On 24/08/2020 15:32:22+0200, Bastian Krause wrote:
> On 8/24/20 1:31 PM, Bastian Krause wrote:
> > 
> > On 4/15/20 8:56 PM, Alexandre Belloni wrote:
> >> On 15/04/2020 18:37:00+0200, Bastian Krause wrote:
> >>> Signed-off-by: Bastian Krause <bst@pengutronix.de>
> >>> ---
> >>>  Documentation/devicetree/bindings/rtc/rtc-ds1307.txt | 3 +++
> >>>  1 file changed, 3 insertions(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/rtc/rtc-ds1307.txt b/Documentation/devicetree/bindings/rtc/rtc-ds1307.txt
> >>> index 66f0a31ae9ce..987a0c9e0cd7 100644
> >>> --- a/Documentation/devicetree/bindings/rtc/rtc-ds1307.txt
> >>> +++ b/Documentation/devicetree/bindings/rtc/rtc-ds1307.txt
> >>> @@ -34,6 +34,9 @@ Optional properties:
> >>>  - trickle-diode-disable : ds1339, ds1340 and ds 1388 only
> >>>  	Do not use internal trickle charger diode
> >>>  	Should be given if internal trickle charger diode should be disabled
> >>> +- aux-voltage-chargeable: rx8130 only
> >>> +	Epsons's rx8130 supports a backup battery/supercap.
> >>> +	This flag tells	whether the battery/supercap is chargeable or not.
> >>>  
> >>
> >> I think we should make that a generic property and this should supersede
> >> trickle-diode-disable which is a bit wonky as I would prefer the default
> >> to be disabled instead of enabled with the current semantics.
> > 
> > Alright, I think I know how to transform the RTC drivers.
> > 
> > One question about the DTs though:
> > 
> > This means we should remove "trickle-diode-disable" from all upstream
> > DTs and add "aux-voltage-chargeable" to all upstream DTs that use a RTC
> > compatible whose driver care in their probe function for
> > "trickle-diode-disable", right?
> 
> Sorry, forget that.
> 
> Here's the situation:
> 
> Currently there is a switch to explicitly disable charging, so the
> default is to charge. We cannot introduce another boolean switch to turn
> that the other way around, because that would change the default and
> break backwards compatibility.
> 
> The only way I can think of is to introduce "aux-voltage-chargeable" not
> as a boolean switch but as an integer, without any default. If this
> property is not available, the drivers should simply do what they did
> prior to this change (look for the legacy trickle-diode-disable, use the
> default they used before).
> 
> Are you okay with that?
> 

I agree boolean should be avoided in RTC drivers because we need a way
to express "don't change this value".

> Some more context:
> 
> I originally tried to add a chargeable flag for rx8130. Prior to this
> patch, there was no need to set "trickle-diode-disable" for this,
> because the driver did not pass the chargeable flag to the RTC. With the
> patch the default would have been to charge as long as
> "trickle-diode-disable" is not there. So there's a change in behavior.
> 

Yes, IIRC, my point was simply to move the documentation for
aux-voltage-chargeable to the generice rtc binding documentation,
Documentation/devicetree/bindings/rtc/rtc.yaml

For now, you sould keep support for trickle-diode-disable but it has to be
superseded by aux-voltage-chargeable if present. Is that more clear?


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
