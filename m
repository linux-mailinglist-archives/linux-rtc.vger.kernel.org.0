Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E796F190A47
	for <lists+linux-rtc@lfdr.de>; Tue, 24 Mar 2020 11:09:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727124AbgCXKJ6 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-rtc@lfdr.de>); Tue, 24 Mar 2020 06:09:58 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:58831 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726944AbgCXKJ6 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 24 Mar 2020 06:09:58 -0400
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id BA66024000B;
        Tue, 24 Mar 2020 10:09:55 +0000 (UTC)
Date:   Tue, 24 Mar 2020 11:09:55 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, od@zcrc.me,
        linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] rtc: jz4740: Add support for JZ4760 SoC
Message-ID: <20200324100955.GJ5504@piout.net>
References: <20200311182318.22154-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20200311182318.22154-1-paul@crapouillou.net>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 11/03/2020 19:23:16+0100, Paul Cercueil wrote:
> The WENR feature (set a magic value to enable RTC registers read-write)
> first appeared on the JZ4760; the JZ4780 came much later.
> 
> Since it would be dangerous to specify a newer SoC's compatible string as
> the fallback of an older SoC's compatible string, we add support for the
> "ingenic,jz4760-rtc" compatible string in the driver.
> 
> This will permit to support the JZ4770 by having:
> compatible = "ingenic,jz4770-rtc", "ingenic,jz4760-rtc";
> 
> Instead of doing:
> compatible = "ingenic,jz4770-rtc", "ingenic,jz4780-rtc";
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  drivers/rtc/rtc-jz4740.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
