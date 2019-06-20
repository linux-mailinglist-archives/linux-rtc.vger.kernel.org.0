Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E65C4D96D
	for <lists+linux-rtc@lfdr.de>; Thu, 20 Jun 2019 20:36:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726591AbfFTSgN (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 20 Jun 2019 14:36:13 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:49019 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726323AbfFTSgN (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 20 Jun 2019 14:36:13 -0400
X-Originating-IP: 90.65.161.137
Received: from localhost (lfbn-1-1545-137.w90-65.abo.wanadoo.fr [90.65.161.137])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 59E5E240005;
        Thu, 20 Jun 2019 18:36:04 +0000 (UTC)
Date:   Thu, 20 Jun 2019 20:36:04 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Chen-Yu Tsai <wens@kernel.org>
Cc:     Maxime Ripard <maxime.ripard@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Vincent Donnefort <vdonnefort@gmail.com>,
        linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 1/3] rtc: pcf8563: Fix interrupt trigger method
Message-ID: <20190620183604.GC23549@piout.net>
References: <20190604042337.26129-1-wens@kernel.org>
 <20190604042337.26129-2-wens@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190604042337.26129-2-wens@kernel.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 04/06/2019 12:23:35+0800, Chen-Yu Tsai wrote:
> From: Chen-Yu Tsai <wens@csie.org>
> 
> The PCF8563 datasheet says the interrupt line is active low and stays
> active until the events are cleared, i.e. a level trigger interrupt.
> 
> Fix the flags used to request the interrupt.
> 
> Fixes: ede3e9d47cca ("drivers/rtc/rtc-pcf8563.c: add alarm support")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
> 
> Not sure if this would cause issues for other platforms. Ideally we'd
> take the flags from the device tree, but it seems not all platforms
> support this.
> 
> ---
>  drivers/rtc/rtc-pcf8563.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
