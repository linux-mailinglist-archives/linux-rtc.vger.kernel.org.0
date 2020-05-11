Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC2391CDD5C
	for <lists+linux-rtc@lfdr.de>; Mon, 11 May 2020 16:37:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729463AbgEKOhn (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 11 May 2020 10:37:43 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:33197 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725993AbgEKOhn (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 11 May 2020 10:37:43 -0400
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 8AFFD240016;
        Mon, 11 May 2020 14:37:40 +0000 (UTC)
Date:   Mon, 11 May 2020 16:37:40 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, od@zcrc.me,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] rtc: ingenic: Only support probing from devicetree
Message-ID: <20200511143740.GU34497@piout.net>
References: <20200505221336.222313-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200505221336.222313-1-paul@crapouillou.net>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 06/05/2020 00:13:30+0200, Paul Cercueil wrote:
> With the recent work on supporting Device Tree on Ingenic SoCs, no
> driver ever probes from platform code anymore, so we can clean a bit
> this driver by removing the non-devicetree paths.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  drivers/rtc/Kconfig      |  1 +
>  drivers/rtc/rtc-jz4740.c | 20 +++-----------------
>  2 files changed, 4 insertions(+), 17 deletions(-)
> 

All applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
