Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB0AE15A7CE
	for <lists+linux-rtc@lfdr.de>; Wed, 12 Feb 2020 12:24:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725821AbgBLLYy (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 12 Feb 2020 06:24:54 -0500
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:43021 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725874AbgBLLYy (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 12 Feb 2020 06:24:54 -0500
X-Originating-IP: 90.65.102.129
Received: from localhost (lfbn-lyo-1-1670-129.w90-65.abo.wanadoo.fr [90.65.102.129])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 36B06E000B;
        Wed, 12 Feb 2020 11:24:52 +0000 (UTC)
Date:   Wed, 12 Feb 2020 12:24:51 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Christoph Hellwig <hch@lst.de>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: sh: Restore devm_ioremap() alignment
Message-ID: <20200212112451.GD3326@piout.net>
References: <20200212084836.9511-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200212084836.9511-1-geert+renesas@glider.be>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 12/02/2020 09:48:36+0100, Geert Uytterhoeven wrote:
> The alignment of the continuation of the devm_ioremap() call in
> sh_rtc_probe() was broken.  Join the lines, as all parameters can fit on
> a single line.
> 
> Fixes: 4bdc0d676a643140 ("remove ioremap_nocache and devm_ioremap_nocache")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/rtc/rtc-sh.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
