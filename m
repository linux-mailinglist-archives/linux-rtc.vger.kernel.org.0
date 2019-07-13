Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65C1467BD8
	for <lists+linux-rtc@lfdr.de>; Sat, 13 Jul 2019 21:43:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727943AbfGMTnq (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 13 Jul 2019 15:43:46 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:45085 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727936AbfGMTnq (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 13 Jul 2019 15:43:46 -0400
X-Originating-IP: 90.65.161.137
Received: from localhost (lfbn-1-1545-137.w90-65.abo.wanadoo.fr [90.65.161.137])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id A612E1BF206;
        Sat, 13 Jul 2019 19:43:43 +0000 (UTC)
Date:   Sat, 13 Jul 2019 21:43:43 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Hariprasad Kelam <hariprasad.kelam@gmail.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        patches@opensource.cirrus.com, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers: rtc: rtc-wm831x: Add IRQF_ONESHOT flag
Message-ID: <20190713194343.GB4732@piout.net>
References: <20190711175615.GA13651@hari-Inspiron-1545>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190711175615.GA13651@hari-Inspiron-1545>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 11/07/2019 23:26:15+0530, Hariprasad Kelam wrote:
> fix below issue reported by coccicheck
> drivers//rtc/rtc-wm831x.c:436:7-32: ERROR: Threaded IRQ with no primary
> handler requested without IRQF_ONESHOT
> 
> Signed-off-by: Hariprasad Kelam <hariprasad.kelam@gmail.com>
> ---
>  drivers/rtc/rtc-wm831x.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
