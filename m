Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACF4737EE67
	for <lists+linux-rtc@lfdr.de>; Thu, 13 May 2021 00:58:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232342AbhELVmu (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 12 May 2021 17:42:50 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:42257 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346282AbhELVYG (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 12 May 2021 17:24:06 -0400
X-Originating-IP: 90.65.108.55
Received: from localhost (lfbn-lyo-1-1676-55.w90-65.abo.wanadoo.fr [90.65.108.55])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 24ABAFF803;
        Wed, 12 May 2021 21:22:38 +0000 (UTC)
Date:   Wed, 12 May 2021 23:22:37 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Edmundo Carmona Antoranz <eantoranz@gmail.com>,
        cw00.choi@samsung.com, b.zolnierkie@samsung.com,
        a.zummo@towertech.it, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] rtc: max77686: Remove some dead code
Message-ID: <YJxHHWvzppGHUbCW@piout.net>
References: <a6b23ee8d3ea78f62d3fda0b53aa273718f14c6d.1620452523.git.christophe.jaillet@wanadoo.fr>
 <CAOc6etaUPtJqoH9DBDE72nDW7s7iEZHnaJRpKx9zFow02WOZig@mail.gmail.com>
 <9f34ebcd-0c17-cd7f-eb08-52c6c3dc7b03@wanadoo.fr>
 <CAOc6etYwTvVPnoB3BQfuQEikvsCwSs9AqBWnLFrs9zQ0pJGp1A@mail.gmail.com>
 <YJhO0cEqpbJAdv7s@piout.net>
 <219efcc7-ca05-a7d1-5943-d34a42f0d49f@canonical.com>
 <YJv+mMRcOuTJxLuk@piout.net>
 <9535976d-1029-3668-4be4-c09068ccf84c@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9535976d-1029-3668-4be4-c09068ccf84c@wanadoo.fr>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 12/05/2021 22:02:17+0200, Christophe JAILLET wrote:
> > The only error path that will not print a message by default (it is
> > dev_dbg) is when rtc-ops is NULL which I don't expect would regress
> > anyway.
> > 
> > A better way to remove the dead code would be to switch to
> > devm_rtc_allocate_device/devm_rtc_register_device.
> 
> I don't follow you here.
> Isn't devm_rtc_device_register = devm_rtc_allocate_device +
> devm_rtc_register_device?
> 
> What would be the benefit for switch to the latter?
> 

The immediate benefit is that this solve a possible but very unlikely
race condition around the character device removal when probe ultimately
fails. The other benefit is that I won't have to do it later to handle
the modern features.

> 
> > And even better would
> > be to take that opportunity to set range_min and range_max ;)
> 
> Maybe, but this goes beyond my knowledge.
> I'll let someone else propose a patch for it.
> 
> CJ
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
