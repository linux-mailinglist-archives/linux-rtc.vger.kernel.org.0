Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82E269780D
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Aug 2019 13:39:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727038AbfHULi7 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 21 Aug 2019 07:38:59 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:55305 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726372AbfHULi7 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 21 Aug 2019 07:38:59 -0400
X-Originating-IP: 90.65.161.137
Received: from localhost (lfbn-1-1545-137.w90-65.abo.wanadoo.fr [90.65.161.137])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 31AF460004;
        Wed, 21 Aug 2019 11:38:57 +0000 (UTC)
Date:   Wed, 21 Aug 2019 13:38:56 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Mark Brown <broonie@kernel.org>
Cc:     Li Yang <leoyang.li@nxp.com>, nandor.han@vaisala.com,
        Biwen Li <biwen.li@nxp.com>, a.zummo@towertech.it,
        linux-rtc@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
Subject: Re: [v2] rtc: pcf85363/pcf85263: fix error that failed to run
 hwclock -w
Message-ID: <20190821113856.GB27031@piout.net>
References: <20190816024636.34738-1-biwen.li@nxp.com>
 <20190816080417.GB3545@piout.net>
 <CADRPPNRkqbWzGEvUJyi0Qff3oS6biO0v7BTrK1Jiz9AMnOYF=Q@mail.gmail.com>
 <20190816162825.GE3545@piout.net>
 <CADRPPNQwcGrVXLm8eHbXKmyecMhT6Mt9rNGnspJA1+MnV4K8oQ@mail.gmail.com>
 <20190820182224.GI4738@sirena.co.uk>
 <CADRPPNQ__XRW74e+Dq0BEjJq-onVi2dmb7qKrn2Lt_xr50VCCw@mail.gmail.com>
 <20190821112142.GD5128@sirena.co.uk>
 <20190821112413.GA27031@piout.net>
 <20190821113029.GE5128@sirena.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190821113029.GE5128@sirena.co.uk>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 21/08/2019 12:30:29+0100, Mark Brown wrote:
> On Wed, Aug 21, 2019 at 01:24:13PM +0200, Alexandre Belloni wrote:
> > On 21/08/2019 12:21:42+0100, Mark Brown wrote:
> > > On Tue, Aug 20, 2019 at 01:33:14PM -0500, Li Yang wrote:
> 
> > > > violation check of regmap rejects such access.  According to
> > > > Alexcandre, the address wrapping is essential to the functionality of
> 
> > > It's *essential*?  Will innovation never cease?
> 
> > To be clear, for some RTCs, its is the only way to accurately set the
> > time.
> 
> What's the mechanism here?  It's a very strange thing to require.

The clock control is on the first register, then you have sec, min,
hour, day, mon, year.

To be able to set the clock accurately, you need to first disable the
clock, then set the time and date and finally reenable the clock in the
first register. This should be done in a single i2c write.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
