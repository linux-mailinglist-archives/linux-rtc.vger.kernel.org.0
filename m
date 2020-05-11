Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15F041CDD1F
	for <lists+linux-rtc@lfdr.de>; Mon, 11 May 2020 16:28:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728683AbgEKO2G (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 11 May 2020 10:28:06 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:32495 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725993AbgEKO2G (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 11 May 2020 10:28:06 -0400
X-Originating-IP: 86.202.105.35
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id E5271240014;
        Mon, 11 May 2020 14:27:59 +0000 (UTC)
Date:   Mon, 11 May 2020 16:27:59 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] rtc: max77686: Use single-byte writes on MAX77620
Message-ID: <20200511142759.GS34497@piout.net>
References: <20200417170825.2551367-1-thierry.reding@gmail.com>
 <20200417170825.2551367-3-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200417170825.2551367-3-thierry.reding@gmail.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 17/04/2020 19:08:25+0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The MAX77620 doesn't support bulk writes, so make sure the regmap code
> breaks bulk writes into multiple single-byte writes.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/rtc/rtc-max77686.c | 22 ++++++++++++++++------
>  1 file changed, 16 insertions(+), 6 deletions(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
