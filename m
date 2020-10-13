Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D23328D077
	for <lists+linux-rtc@lfdr.de>; Tue, 13 Oct 2020 16:42:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726395AbgJMOmM (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 13 Oct 2020 10:42:12 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:44343 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725970AbgJMOmM (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 13 Oct 2020 10:42:12 -0400
X-Originating-IP: 90.65.88.165
Received: from localhost (lfbn-lyo-1-1908-165.w90-65.abo.wanadoo.fr [90.65.88.165])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 2171FC0017;
        Tue, 13 Oct 2020 14:42:10 +0000 (UTC)
Date:   Tue, 13 Oct 2020 16:42:09 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        devicetree@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: rtc: add trickle-voltage-millivolt
Message-ID: <20201013144209.GW2804081@piout.net>
References: <20201007220506.360469-1-alexandre.belloni@bootlin.com>
 <20201013133855.GA3382613@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201013133855.GA3382613@bogus>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 13/10/2020 08:38:55-0500, Rob Herring wrote:
> On Thu, Oct 08, 2020 at 12:05:04AM +0200, Alexandre Belloni wrote:
> > Some RTCs have a trickle charge that is able to output different voltages
> > depending on the type of the connected auxiliary power (battery, supercap,
> > ...). Add a property allowing to specify the necessary voltage.
> > 
> > Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > ---
> > 
> > Changes in v2:
> >  - use millivolt suffix instead of mV
> 
> Try again...

Sorry, the change was wrongly squashed in patch 2/3, I've sent v3.

> 
> > 
> >  Documentation/devicetree/bindings/rtc/rtc.yaml | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/rtc/rtc.yaml b/Documentation/devicetree/bindings/rtc/rtc.yaml
> > index ee237b2ed66a..93f04d5e5307 100644
> > --- a/Documentation/devicetree/bindings/rtc/rtc.yaml
> > +++ b/Documentation/devicetree/bindings/rtc/rtc.yaml
> > @@ -42,6 +42,13 @@ properties:
> >        Selected resistor for trickle charger. Should be given
> >        if trickle charger should be enabled.
> >  
> > +  trickle-voltage-mV:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      Selected voltage for trickle charger. Should be given
> > +      if trickle charger should be enabled and the trickle voltage is different
> > +      from the RTC main power supply.
> > +
> >    wakeup-source:
> >      $ref: /schemas/types.yaml#/definitions/flag
> >      description:
> > -- 
> > 2.26.2
> > 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
