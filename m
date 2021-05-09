Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD0E6377894
	for <lists+linux-rtc@lfdr.de>; Sun,  9 May 2021 23:06:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229867AbhEIVHc (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 9 May 2021 17:07:32 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:55437 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229840AbhEIVHb (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 9 May 2021 17:07:31 -0400
X-Originating-IP: 90.65.108.55
Received: from localhost (lfbn-lyo-1-1676-55.w90-65.abo.wanadoo.fr [90.65.108.55])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 1863D1BF207;
        Sun,  9 May 2021 21:06:26 +0000 (UTC)
Date:   Sun, 9 May 2021 23:06:25 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Edmundo Carmona Antoranz <eantoranz@gmail.com>
Cc:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        cw00.choi@samsung.com, krzysztof.kozlowski@canonical.com,
        b.zolnierkie@samsung.com, a.zummo@towertech.it,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] rtc: max77686: Remove some dead code
Message-ID: <YJhO0cEqpbJAdv7s@piout.net>
References: <a6b23ee8d3ea78f62d3fda0b53aa273718f14c6d.1620452523.git.christophe.jaillet@wanadoo.fr>
 <CAOc6etaUPtJqoH9DBDE72nDW7s7iEZHnaJRpKx9zFow02WOZig@mail.gmail.com>
 <9f34ebcd-0c17-cd7f-eb08-52c6c3dc7b03@wanadoo.fr>
 <CAOc6etYwTvVPnoB3BQfuQEikvsCwSs9AqBWnLFrs9zQ0pJGp1A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOc6etYwTvVPnoB3BQfuQEikvsCwSs9AqBWnLFrs9zQ0pJGp1A@mail.gmail.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 08/05/2021 18:06:03-0600, Edmundo Carmona Antoranz wrote:
> On Sat, May 8, 2021 at 10:59 AM Christophe JAILLET
> <christophe.jaillet@wanadoo.fr> wrote:
> >
> > >
> > > Following the recent conversations, I think it might make sense to do
> > > dev_err(&pdev->dev, "Failed to register RTC device: %pe\n", info->rtc_dev);
> > >
> > > Is that right?
> > >
> >
> > Yes, it is right, but it should be done in another patch.
> >
> > Would you like to give it a try?
> >
> Sure, I'll have the patch ready to send it when I see yours on next.

Does it make sense to print anything at all? Who would use the output?
Is anyone actually going to read it?


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
