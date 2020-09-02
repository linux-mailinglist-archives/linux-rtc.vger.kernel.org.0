Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9528525B456
	for <lists+linux-rtc@lfdr.de>; Wed,  2 Sep 2020 21:18:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728181AbgIBTSl (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 2 Sep 2020 15:18:41 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:45801 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726567AbgIBTSj (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 2 Sep 2020 15:18:39 -0400
X-Originating-IP: 90.66.108.79
Received: from localhost (lfbn-lyo-1-1932-79.w90-66.abo.wanadoo.fr [90.66.108.79])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 187FA1C0002;
        Wed,  2 Sep 2020 19:18:36 +0000 (UTC)
Date:   Wed, 2 Sep 2020 21:18:36 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Bastian Krause <bst@pengutronix.de>
Cc:     linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
        Arnaud Ebalard <arno@natisbad.org>,
        Rob Herring <robh+dt@kernel.org>, kernel@pengutronix.de
Subject: Re: [PATCH 2/3] dt-bindings: rtc: add chargeable flag for rx8130
Message-ID: <20200902191836.GP3204668@piout.net>
References: <20200415163701.21989-1-bst@pengutronix.de>
 <20200415163701.21989-2-bst@pengutronix.de>
 <20200415185609.GP34509@piout.net>
 <3d1ecd35-fe37-02e7-74d8-3f37c2197173@pengutronix.de>
 <a492b6a0-b41c-a088-3ba1-f1448a074b34@pengutronix.de>
 <20200825153248.GH2389103@piout.net>
 <98fa7181-3ebe-d7c3-cfac-fee841c81e15@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <98fa7181-3ebe-d7c3-cfac-fee841c81e15@pengutronix.de>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 26/08/2020 10:13:04+0200, Bastian Krause wrote:
> >> Are you okay with that?
> >>
> > 
> > I agree boolean should be avoided in RTC drivers because we need a way
> > to express "don't change this value".
> 
> Alright.
> 
> >> Some more context:
> >>
> >> I originally tried to add a chargeable flag for rx8130. Prior to this
> >> patch, there was no need to set "trickle-diode-disable" for this,
> >> because the driver did not pass the chargeable flag to the RTC. With the
> >> patch the default would have been to charge as long as
> >> "trickle-diode-disable" is not there. So there's a change in behavior.
> >>
> > 
> > Yes, IIRC, my point was simply to move the documentation for
> > aux-voltage-chargeable to the generice rtc binding documentation,
> > Documentation/devicetree/bindings/rtc/rtc.yaml
> > 
> > For now, you sould keep support for trickle-diode-disable but it has to be
> > superseded by aux-voltage-chargeable if present. Is that more clear?
> 
> Yes, thanks for the clarification.
> 
> Should I set the deprecated flag for trickle-diode-disable in the
> dt-binding yaml?
> 

That's a good idea, yes.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
