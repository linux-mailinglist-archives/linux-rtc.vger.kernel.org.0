Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF60D26B188
	for <lists+linux-rtc@lfdr.de>; Wed, 16 Sep 2020 00:31:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727593AbgIOWbq (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 15 Sep 2020 18:31:46 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:48507 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727618AbgIOQRS (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 15 Sep 2020 12:17:18 -0400
X-Originating-IP: 90.65.88.165
Received: from localhost (lfbn-lyo-1-1908-165.w90-65.abo.wanadoo.fr [90.65.88.165])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 876D8FF80D;
        Tue, 15 Sep 2020 16:16:26 +0000 (UTC)
Date:   Tue, 15 Sep 2020 18:16:26 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     "Kevin P. Fleming" <kevin+linux@km6g.us>
Cc:     Rob Herring <robh@kernel.org>, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>
Subject: Re: [PATCH 1/3 v3] dt-bindings: abx80x: Add autocal-filter property
Message-ID: <20200915161626.GF9675@piout.net>
References: <20200615105113.57770-1-kevin+linux@km6g.us>
 <20200713183906.GA510880@bogus>
 <CAE+UdorYGJrxjcBY8KtoUtpsEmWFkv4DsWtcdhCt9dcfDyCVHg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE+UdorYGJrxjcBY8KtoUtpsEmWFkv4DsWtcdhCt9dcfDyCVHg@mail.gmail.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Kevin,

nitpick, the subject prefix should be dt-bindings: prefix: abx80x:

On 13/07/2020 18:05:34-0400, Kevin P. Fleming wrote:
> On Mon, Jul 13, 2020 at 2:39 PM Rob Herring <robh@kernel.org> wrote:
> >
> > On Mon, Jun 15, 2020 at 06:51:11AM -0400, Kevin P. Fleming wrote:
> > > Add a property to allow control of the autocalibration filter
> > > capacitor.
> > >
> > > Signed-off-by: Kevin P. Fleming <kevin+linux@km6g.us>
> > > Cc: Alessandro Zummo <a.zummo@towertech.it>
> > > Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > > Cc: Rob Herring <robh+dt@kernel.org>
> > > To: linux-rtc@vger.kernel.org
> > > To: devicetree@vger.kernel.org
> > > ---
> > > v3: corrected whitespace
> > >  Documentation/devicetree/bindings/rtc/abracon,abx80x.txt | 8 ++++++++
> > >  1 file changed, 8 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/rtc/abracon,abx80x.txt b/Documentation/devicetree/bindings/rtc/abracon,abx80x.txt
> > > index 2405e35a1bc0f..1b606e33d1a83 100644
> > > --- a/Documentation/devicetree/bindings/rtc/abracon,abx80x.txt
> > > +++ b/Documentation/devicetree/bindings/rtc/abracon,abx80x.txt
> > > @@ -29,3 +29,11 @@ and valid to enable charging:
> > >   - "abracon,tc-diode": should be "standard" (0.6V) or "schottky" (0.3V)
> > >   - "abracon,tc-resistor": should be <0>, <3>, <6> or <11>. 0 disables the output
> > >                            resistor, the other values are in kOhm.
> > > +
> > > +All of the devices can have a 47pf capacitor attached to increase the
> > > +autocalibration accuracy of their RC oscillators. To enable or disable usage
> > > +of the capacitor the following property can be defined:
> > > +
> > > + - "abracon,autocal-filter": should be <0> or <1>. 0 indicates that there
> > > +                             is no capacitor attached, 1 indicates that there
> > > +                             is a capacitor attached.
> >
> > What does not present mean? If you don't have a defined meaning (such
> > as maintain the default/bootloader initialized setting), then make this
> > boolean.
> 
> That is the intended meaning (leave the current setting unmodified). I
> can add that to the documentation so it is clear.

Can you do that and send v4 please?

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
