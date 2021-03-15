Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C893E33C8C1
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Mar 2021 22:49:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231667AbhCOVtW (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 15 Mar 2021 17:49:22 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:44839 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233382AbhCOVtK (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 15 Mar 2021 17:49:10 -0400
X-Originating-IP: 90.65.108.55
Received: from localhost (lfbn-lyo-1-1676-55.w90-65.abo.wanadoo.fr [90.65.108.55])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id B4301C0004;
        Mon, 15 Mar 2021 21:49:08 +0000 (UTC)
Date:   Mon, 15 Mar 2021 22:49:08 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc:     Chris Wilson <chris@chris-wilson.co.uk>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Xiaofei Tan <tanxiaofei@huawei.com>,
        Alessandro Zummo <a.zummo@towertech.it>
Subject: Re: [PATCH] rtc: cmos: Disable irq around direct invocation of
 cmos_interrupt()
Message-ID: <YE/WVGaqJafUFbaC@piout.net>
References: <20210305122140.28774-1-chris@chris-wilson.co.uk>
 <YEIx2MetiHDXdrcL@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YEIx2MetiHDXdrcL@intel.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 05/03/2021 15:27:52+0200, Ville Syrjälä wrote:
> > which breaks S3-resume on fi-kbl-soraka presumably as that's slow enough
> > to trigger the alarm during the suspend.
> > 
> > Fixes: 6950d046eb6e ("rtc: cmos: Replace spin_lock_irqsave with spin_lock in hard IRQ")
> 
> Sigh. I wish people would at least try to check the code/history
> before doing these blind "cleanups" :(
>

Sorry I didn't catch that when applying. I'm usually more wary when
getting those kind of cleanups.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
