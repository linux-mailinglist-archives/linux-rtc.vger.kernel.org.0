Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05D301497D8
	for <lists+linux-rtc@lfdr.de>; Sat, 25 Jan 2020 21:50:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727306AbgAYUus (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 25 Jan 2020 15:50:48 -0500
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:41613 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727278AbgAYUus (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 25 Jan 2020 15:50:48 -0500
X-Originating-IP: 90.65.92.102
Received: from localhost (lfbn-lyo-1-1913-102.w90-65.abo.wanadoo.fr [90.65.92.102])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id B2DFC1BF204;
        Sat, 25 Jan 2020 20:50:45 +0000 (UTC)
Date:   Sat, 25 Jan 2020 21:50:45 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-rtc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] rtc: tps6586x: Use IRQ_NOAUTOEN flag
Message-ID: <20200125205045.GA2952@piout.net>
References: <20200106015615.12602-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200106015615.12602-1-digetx@gmail.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 06/01/2020 04:56:15+0300, Dmitry Osipenko wrote:
> The IRQ_NOAUTOEN flag tells interrupt core that interrupt shall not be
> auto-enabled at the time of requesting interrupt. This is a minor clean-up
> change that doesn't fix any problems.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/rtc/rtc-tps6586x.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
