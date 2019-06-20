Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CEB8B4D97D
	for <lists+linux-rtc@lfdr.de>; Thu, 20 Jun 2019 20:37:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726067AbfFTShp (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 20 Jun 2019 14:37:45 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:42923 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726130AbfFTShp (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 20 Jun 2019 14:37:45 -0400
X-Originating-IP: 90.65.161.137
Received: from localhost (lfbn-1-1545-137.w90-65.abo.wanadoo.fr [90.65.161.137])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 54605240009;
        Thu, 20 Jun 2019 18:37:42 +0000 (UTC)
Date:   Thu, 20 Jun 2019 20:37:42 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Chen-Yu Tsai <wens@kernel.org>
Cc:     Maxime Ripard <maxime.ripard@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Vincent Donnefort <vdonnefort@gmail.com>,
        linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 2/3] rtc: pcf8563: Clear event flags and disable
 interrupts before requesting irq
Message-ID: <20190620183742.GD23549@piout.net>
References: <20190604042337.26129-1-wens@kernel.org>
 <20190604042337.26129-3-wens@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190604042337.26129-3-wens@kernel.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 04/06/2019 12:23:36+0800, Chen-Yu Tsai wrote:
> From: Chen-Yu Tsai <wens@csie.org>
> 
> Besides the alarm, the PCF8563 also has a timer triggered interrupt.
> In cases where the previous system left the timer and interrupts on,
> or somehow the bits got enabled, the interrupt would keep triggering
> as the kernel doesn't know about it.
> 
> Clear both the alarm and timer event flags, and disable the interrupts,
> before requesting the interrupt line.
> 
> Fixes: ede3e9d47cca ("drivers/rtc/rtc-pcf8563.c: add alarm support")
> Fixes: a45d528aab8b ("rtc: pcf8563: clear expired alarm at boot time")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  drivers/rtc/rtc-pcf8563.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
