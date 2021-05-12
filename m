Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25F9D37CE2D
	for <lists+linux-rtc@lfdr.de>; Wed, 12 May 2021 19:17:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238462AbhELRDf (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 12 May 2021 13:03:35 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:40279 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233495AbhELQz5 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 12 May 2021 12:55:57 -0400
Received: from localhost (lfbn-lyo-1-1676-55.w90-65.abo.wanadoo.fr [90.65.108.55])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 6487B24000C;
        Wed, 12 May 2021 16:54:42 +0000 (UTC)
Date:   Wed, 12 May 2021 18:54:42 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Edmundo Carmona Antoranz <eantoranz@gmail.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        cw00.choi@samsung.com, b.zolnierkie@samsung.com,
        a.zummo@towertech.it, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] rtc: max77686: Remove some dead code
Message-ID: <YJwIUm/UPsIwVkaA@piout.net>
References: <a6b23ee8d3ea78f62d3fda0b53aa273718f14c6d.1620452523.git.christophe.jaillet@wanadoo.fr>
 <CAOc6etaUPtJqoH9DBDE72nDW7s7iEZHnaJRpKx9zFow02WOZig@mail.gmail.com>
 <9f34ebcd-0c17-cd7f-eb08-52c6c3dc7b03@wanadoo.fr>
 <CAOc6etYwTvVPnoB3BQfuQEikvsCwSs9AqBWnLFrs9zQ0pJGp1A@mail.gmail.com>
 <YJhO0cEqpbJAdv7s@piout.net>
 <219efcc7-ca05-a7d1-5943-d34a42f0d49f@canonical.com>
 <YJv+mMRcOuTJxLuk@piout.net>
 <9b48e433-4e0b-7334-028d-d700e0cdbff0@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9b48e433-4e0b-7334-028d-d700e0cdbff0@canonical.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 12/05/2021 12:24:26-0400, Krzysztof Kozlowski wrote:
> On 12/05/2021 12:13, Alexandre Belloni wrote:
> > On 10/05/2021 08:20:52-0400, Krzysztof Kozlowski wrote:
> >> On 09/05/2021 17:06, Alexandre Belloni wrote:
> >>> On 08/05/2021 18:06:03-0600, Edmundo Carmona Antoranz wrote:
> >>>> On Sat, May 8, 2021 at 10:59 AM Christophe JAILLET
> >>>> <christophe.jaillet@wanadoo.fr> wrote:
> >>>>>
> >>>>>>
> >>>>>> Following the recent conversations, I think it might make sense to do
> >>>>>> dev_err(&pdev->dev, "Failed to register RTC device: %pe\n", info->rtc_dev);
> >>>>>>
> >>>>>> Is that right?
> >>>>>>
> >>>>>
> >>>>> Yes, it is right, but it should be done in another patch.
> >>>>>
> >>>>> Would you like to give it a try?
> >>>>>
> >>>> Sure, I'll have the patch ready to send it when I see yours on next.
> >>>
> >>> Does it make sense to print anything at all? Who would use the output?
> >>> Is anyone actually going to read it?
> >>
> >> If the RTC core does not print the message, it should be
> >> dev_err_probe().  However the first is recently preferred - RTC core
> >> should do it for all drivers.  I find such error messages useful - helps
> >> easily spotting regressions via dmesg -l err.
> >>
> > 
> > The only error path that will not print a message by default (it is
> > dev_dbg) is when rtc-ops is NULL which I don't expect would regress
> > anyway.
> 
> Then the message in the driver is useless and could be removed.
> 
> > A better way to remove the dead code would be to switch to
> > devm_rtc_allocate_device/devm_rtc_register_device. And even better would
> > be to take that opportunity to set range_min and range_max ;)
> > 
> 
> The driver already uses devm_rtc_device_register() so I think I don't
> follow that part.

devm_rtc_device_register is different from devm_rtc_register_device.

> 
> Best regards,
> Krzysztof

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
