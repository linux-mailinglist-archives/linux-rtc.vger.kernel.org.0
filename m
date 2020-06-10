Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2B191F5784
	for <lists+linux-rtc@lfdr.de>; Wed, 10 Jun 2020 17:16:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728266AbgFJPQW (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 10 Jun 2020 11:16:22 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:31157 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726979AbgFJPQW (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 10 Jun 2020 11:16:22 -0400
X-Originating-IP: 86.202.110.81
Received: from localhost (lfbn-lyo-1-15-81.w86-202.abo.wanadoo.fr [86.202.110.81])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 01A2324000F;
        Wed, 10 Jun 2020 15:16:19 +0000 (UTC)
Date:   Wed, 10 Jun 2020 17:16:19 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     "Kevin P. Fleming" <kevin+linux@km6g.us>
Cc:     Rob Herring <robh@kernel.org>, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>
Subject: Re: [PATCH] rtc: abx80x: Add support for autocalibration filter
 capacitor
Message-ID: <20200610151619.GW3720@piout.net>
References: <20200530123222.361104-1-kevin+linux@km6g.us>
 <20200609221401.GA1492918@bogus>
 <CAE+UdorjD+2GORj3M6abgqTb8QnRZNFiyCX9PJAJc09xUBACqA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE+UdorjD+2GORj3M6abgqTb8QnRZNFiyCX9PJAJc09xUBACqA@mail.gmail.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

On 09/06/2020 18:23:48-0400, Kevin P. Fleming wrote:
> On Tue, Jun 9, 2020 at 6:14 PM Rob Herring <robh@kernel.org> wrote:
> > > ---
> > >  .../bindings/rtc/abracon,abx80x.txt           |  6 ++++
> > >  drivers/rtc/rtc-abx80x.c                      | 34 +++++++++++++++++++
> > >  2 files changed, 40 insertions(+)
> >
> > Binding should be a separate patch?
> 
> Indeed, it was re-sent with the patches separated.
> 
> > > +All of the devices can have a 47pf capacitor attached to increase the
> > > +autocalibration accuracy of their RC oscillators. To enable usage of the
> > > +capacitor the following property has to be defined:
> > > +
> > > + - "abracon,autocal-filter"
> >
> > Can't the standard 'quartz-load-femtofarads' property be used here? You
> > might not need to know the value, but presence of the property can
> > enable the feature.
> 
> On these devices the capacitor is connected to the RC oscillator, not
> the crystal oscillator, so this property is controlling a different
> function. I'm certainly open to suggestions for different names for
> the property if that is desired.

I agree that this is something different, quartz-load-femtofarads is
about asking the RTC to put the correct load depending on the crystal
populated on the board. Here, you want to indicate the presence or
absence of a filter capacitor.

When working with RTCs, there is one issue though: boolean properties
are not working well because there is no way to express the 3 different
conditions:
 1/ the capacitor is present, set the register
 2/ the capacitor is absent, clear the register
 3/ the device tree didn't have this property until not and the register
   may have been set or cleared using another mean, don't touch it.

As your patch is written, it only handles 1 and 3 which is probably the
safest option but then we will never have a way to clear it from the
driver. I'd say that this is not an issue but it is also something we
will never be able to change without breaking some setups.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
