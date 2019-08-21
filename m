Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 743D9977DE
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Aug 2019 13:24:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726371AbfHULYQ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 21 Aug 2019 07:24:16 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:35453 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726227AbfHULYQ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 21 Aug 2019 07:24:16 -0400
Received: from localhost (lfbn-1-1545-137.w90-65.abo.wanadoo.fr [90.65.161.137])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id D8EAC100005;
        Wed, 21 Aug 2019 11:24:13 +0000 (UTC)
Date:   Wed, 21 Aug 2019 13:24:13 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Mark Brown <broonie@kernel.org>
Cc:     Li Yang <leoyang.li@nxp.com>, nandor.han@vaisala.com,
        Biwen Li <biwen.li@nxp.com>, a.zummo@towertech.it,
        linux-rtc@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
Subject: Re: [v2] rtc: pcf85363/pcf85263: fix error that failed to run
 hwclock -w
Message-ID: <20190821112413.GA27031@piout.net>
References: <20190816024636.34738-1-biwen.li@nxp.com>
 <20190816080417.GB3545@piout.net>
 <CADRPPNRkqbWzGEvUJyi0Qff3oS6biO0v7BTrK1Jiz9AMnOYF=Q@mail.gmail.com>
 <20190816162825.GE3545@piout.net>
 <CADRPPNQwcGrVXLm8eHbXKmyecMhT6Mt9rNGnspJA1+MnV4K8oQ@mail.gmail.com>
 <20190820182224.GI4738@sirena.co.uk>
 <CADRPPNQ__XRW74e+Dq0BEjJq-onVi2dmb7qKrn2Lt_xr50VCCw@mail.gmail.com>
 <20190821112142.GD5128@sirena.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190821112142.GD5128@sirena.co.uk>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 21/08/2019 12:21:42+0100, Mark Brown wrote:
> On Tue, Aug 20, 2019 at 01:33:14PM -0500, Li Yang wrote:
> 
> > Some of the RTC hardware has the capability of address wrapping which
> > means if you access a continuous address range across a certain
> > boundary(could be the boundary of a regmap region) the hardware
> > actually wrap the access to a lower address.  But the address
> > violation check of regmap rejects such access.  According to
> > Alexcandre, the address wrapping is essential to the functionality of
> 
> It's *essential*?  Will innovation never cease?
> 

To be clear, for some RTCs, its is the only way to accurately set the
time.



-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
