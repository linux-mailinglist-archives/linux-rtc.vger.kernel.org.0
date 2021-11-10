Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF7F944C2ED
	for <lists+linux-rtc@lfdr.de>; Wed, 10 Nov 2021 15:27:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231791AbhKJOab (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 10 Nov 2021 09:30:31 -0500
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:43257 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231731AbhKJOaa (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 10 Nov 2021 09:30:30 -0500
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id DFAB81C0008;
        Wed, 10 Nov 2021 14:27:41 +0000 (UTC)
Date:   Wed, 10 Nov 2021 15:27:41 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Camel Guo <camelg@axis.com>
Cc:     Camel Guo <Camel.Guo@axis.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        kernel <kernel@axis.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rtc: rs5c372: Add RTC_VL_READ, RTC_VL_CLR ioctls
Message-ID: <YYvW3T3wM/Qn5jSw@piout.net>
References: <20211110115455.18699-1-camel.guo@axis.com>
 <YYvPCehWWVE5mKTy@piout.net>
 <2303e635-dbd0-1730-cc6f-84021eb37223@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2303e635-dbd0-1730-cc6f-84021eb37223@axis.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 10/11/2021 15:03:49+0100, Camel Guo wrote:
> > On 10/11/2021 12:54:54+0100, Camel Guo wrote:
> > > From: Camel Guo <camelg@axis.com>
> > > +     switch (cmd) {
> > > +     case RTC_VL_READ:
> > > +             flags = 0;
> > > +
> > > +             switch (rs5c->type) {
> > > +             case rtc_r2025sd:
> > > +             case rtc_r2221tl:
> > > +                     if ((rs5c->type == rtc_r2025sd && !(ctrl2 & R2x2x_CTRL2_XSTP)) ||
> > > +                             (rs5c->type == rtc_r2221tl &&  (ctrl2 & R2x2x_CTRL2_XSTP))) {
> > > +                             flags |= RTC_VL_DATA_INVALID;
> > > +                     }
> > > +                     if (ctrl2 & R2x2x_CTRL2_VDET)
> > > +                             flags |= RTC_VL_ACCURACY_LOW;
> > 
> > Shouldn't that be RTC_VL_BACKUP_LOW?
> 
> Some drivers (e.g: rv3029_ioctl and rv8803_ioctl) use RTC_VL_ACCURACY_LOW,
> but some other drivers (e.g: abx80x_ioctl, pcf2127_rtc_ioctl and
> pcf8523_rtc_ioctl) use RTC_VL_BACKUP_LOW instead. Is there any guideline or
> document telling the differences between them?
> 

RTC_VL_BACKUP_LOW: The backup voltage is low
RTC_VL_ACCURACY_LOW: the primary or backup voltage is low, temperature
compensation (or similar) has stopped

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
