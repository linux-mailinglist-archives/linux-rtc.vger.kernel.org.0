Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE2AC11BDBA
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Dec 2019 21:17:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726568AbfLKURS (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 11 Dec 2019 15:17:18 -0500
Received: from relay12.mail.gandi.net ([217.70.178.232]:51335 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726411AbfLKURR (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 11 Dec 2019 15:17:17 -0500
Received: from localhost (unknown [195.39.63.77])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id C366C200008;
        Wed, 11 Dec 2019 20:17:14 +0000 (UTC)
Date:   Wed, 11 Dec 2019 21:17:09 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
        a.zummo@towertech.it, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        stefan@agner.ch, b.galvani@gmail.com, phh@phh.me,
        letux-kernel@openphoenux.org
Subject: Re: [PATCH v3 6/6] rtc: rtc-rc5t619: add ricoh rc5t619 RTC driver
Message-ID: <20191211201709.GD1463890@piout.net>
References: <20191129212045.18325-1-andreas@kemnade.info>
 <20191129212045.18325-7-andreas@kemnade.info>
 <20191202093935.GA909634@piout.net>
 <20191211203321.3635b0c4@kemnade.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191211203321.3635b0c4@kemnade.info>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 11/12/2019 20:33:21+0100, Andreas Kemnade wrote:
> Hi,
> 
> On Mon, 2 Dec 2019 10:39:35 +0100
> Alexandre Belloni <alexandre.belloni@bootlin.com> wrote:
> 
> > On 29/11/2019 22:20:45+0100, Andreas Kemnade wrote:
> > > Add an RTC driver for the RTC device on Ricoh MFD rc5t619,
> > > which is implemented as a variant of rn5t618.
> > >
> will capitalize chip names in the commit text as requested for the other 
> patches by Lee.
>  
> > > rtc-range output:
> > > Testing 2000-02-28 23:59:59.
> > > OK
> > > 
> > > Testing 2038-01-19 03:14:07.
> > > OK
> > > 
> > > Testing 2069-12-31 23:59:59.
> > > OK
> > > 
> > > Testing 2099-12-31 23:59:59.
> > > KO RTC_RD_TIME returned 22 (line 138)
> > > 
> > > Testing 2100-02-28 23:59:59.
> > > KO RTC_SET_TIME returned 34 (line 122)
> > > 
> > > Testing 2106-02-07 06:28:15.
> > > KO RTC_SET_TIME returned 34 (line 122)
> > > 
> > > Testing 2262-04-11 23:47:16.
> > > KO RTC_SET_TIME returned 34 (line 122)
> > > 
> > > Signed-off-by: Andreas Kemnade <andreas@kemnade.info>  
> > Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> >
> I will remove
> static int rc5t619_rtc_alarm_is_enabled(struct device *dev,  uint8_t *enabled)
> 
> since it is unused now so gcc emits a warning, which I have overlooked.
> I hope your Acked-by still counts for that.
> 

Sure, you can keep it.

While at it, the subject should be:

rtc: rc5t619: add ricoh rc5t619 RTC driver

If you want, you can capitalize the second rc5t619 but not the first
one.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
